(define $sc-put-cte (void))
(define $syntax-dispatch (void))
(define identifier? (void))
(define sc-expand (void))
(define datum->syntax-object (void))
(define syntax-object->datum (void))
(define generate-temporaries (void))
(define free-identifier=? (void))
(define bound-identifier=? (void))
(define literal-identifier=? (void))
(define syntax-error (void))
(define $syntax-dispatch (void))
((lambda ()
   ((lambda (%_1355
             %_1354
             %_1353
             %_1352
             %_1351
             %_1350
             %_1349
             %_1348
             %_1347
             %_1346
             %_1345
             %_1344
             %_1343
             %_1342
             %_1341
             %_1340
             %_1339
             %_1338
             %_1337
             %_1336
             %_1335
             %_1334
             %_1333
             %_1332
             %_1331
             %_1330
             %_1329
             %_1328
             %_1327
             %_1326
             %_1325
             %_1324
             %_1323
             %_1322
             %_1321
             %_1320
             %_1319
             %_1318
             %_1317
             %_1316
             %_1315
             %_1314
             %_1313
             %_1312
             %_1311
             %_1310
             %_1309
             %_1308
             %_1307
             %_1306
             %_1305
             %_1304
             %_1303
             %_1302
             %_1301
             %_1300
             %_1299
             %_1298
             %_1297
             %_1296
             %_1295
             %_1294
             %_1293
             %_1292
             %_1291
             %_1290
             %_1289
             %_1288
             %_1287
             %_1286
             %_1285
             %_1284
             %_1283
             %_1282
             %_1281
             %_1280
             %_1279
             %_1278
             %_1277
             %_1276
             %_1275
             %_1274
             %_1273
             %_1272
             %_1271
             %_1266
             %_1265
             %_1264
             %_1263
             %_1262
             %_1257
             %_1219
             %_1218
             %_1217
             %_1216
             %_1215
             %_1214
             %_1213
             %_1212
             %_1211
             %_1210
             %_1209
             %_1208
             %_1207
             %_1206
             %_1205
             %_1173
             %_1172
             %_1171
             %_1170
             %_1164
             %_1163
             %_1162
             %_1161
             %_1160
             %_1159
             %_1158
             %_1157
             %_1156
             %_1155
             %_1154
             %_1144
             %_1143
             %_1142
             %_1141
             %_1140
             %_1139
             %_1131
             %_1116
             %_1115
             %_1114
             %_1113
             %_1112
             %_1111
             %_1099
             %_1098
             %_999
             %_998
             %_997
             %_996
             %_991
             %_990
             %_989
             %_988
             %_951)
      (begin
        (set! %_1355
          (lambda (%_1748)
            (((lambda (%_1749)
                (begin
                  (set! %_1749
                    (lambda (%_1750 %_1751 %_1752)
                      (if (pair? %_1750)
                        (%_1749
                          (cdr %_1750)
                          (cons (%_1293 (car %_1750) %_1752) %_1751)
                          %_1752)
                        (if (%_1164 %_1750)
                          (cons (%_1293 %_1750 %_1752) %_1751)
                          (if (null? %_1750)
                            %_1751
                            (if (%_1112 %_1750)
                              (%_1749
                                (%_1113 %_1750)
                                %_1751
                                (%_1279 %_1752 (%_1114 %_1750)))
                              (if (%_988 %_1750)
                                (%_1749
                                  (annotation-expression %_1750)
                                  %_1751
                                  %_1752)
                                (cons %_1750 %_1751))))))))
                  %_1749))
              #f)
             %_1748
             '()
             '(()))))
        (set! %_1354
          (lambda (%_1753)
            ((lambda (%_1754)
               (if (%_988 %_1754) (gensym) (gensym)))
             (if (%_1112 %_1753) (%_1113 %_1753) %_1753))))
        (set! %_1353
          (lambda (%_1755 %_1756)
            (%_1352
              %_1755
              %_1756
              (lambda (%_1757)
                (if ((lambda (%_1758)
                       (if %_1758
                         %_1758
                         (if (pair? %_1757) (%_988 (car %_1757)) '#f)))
                     (%_988 %_1757))
                  (%_1351 %_1757 '#f)
                  %_1757)))))
        (set! %_1352
          (lambda (%_1759 %_1760 %_1761)
            (if (memq 'top (%_1172 %_1760))
              (%_1761 %_1759)
              (((lambda (%_1762)
                  (begin
                    (set! %_1762
                      (lambda (%_1763)
                        (if (%_1112 %_1763)
                          (%_1352 (%_1113 %_1763) (%_1114 %_1763) %_1761)
                          (if (pair? %_1763)
                            ((lambda (%_1766 %_1767)
                               (if (if (eq? %_1766 (car %_1763))
                                     (eq? %_1767 (cdr %_1763))
                                     '#f)
                                 %_1763
                                 (cons %_1766 %_1767)))
                             (%_1762 (car %_1763))
                             (%_1762 (cdr %_1763)))
                            (if (vector? %_1763)
                              ((lambda (%_1764)
                                 ((lambda (%_1765)
                                    (if (andmap eq? %_1764 %_1765)
                                      %_1763
                                      (list->vector %_1765)))
                                  (map %_1762 %_1764)))
                               (vector->list %_1763))
                              %_1763)))))
                    %_1762))
                #f)
               %_1759))))
        (set! %_1351
          (lambda (%_1768 %_1769)
            (if (pair? %_1768)
              ((lambda (%_1774)
                 (begin
                   (if %_1769
                     (set-annotation-stripped! %_1769 %_1774)
                     (void))
                   (set-car! %_1774 (%_1351 (car %_1768) '#f))
                   (set-cdr! %_1774 (%_1351 (cdr %_1768) '#f))
                   %_1774))
               (cons '#f '#f))
              (if (%_988 %_1768)
                ((lambda (%_1773)
                   (if %_1773
                     %_1773
                     (%_1351 (annotation-expression %_1768) %_1768)))
                 (annotation-stripped %_1768))
                (if (vector? %_1768)
                  ((lambda (%_1770)
                     (begin
                       (if %_1769
                         (set-annotation-stripped! %_1769 %_1770)
                         (void))
                       (((lambda (%_1771)
                           (begin
                             (set! %_1771
                               (lambda (%_1772)
                                 (if (not (< %_1772 '0))
                                   (begin
                                     (vector-set!
                                       %_1770
                                       %_1772
                                       (%_1351 (vector-ref %_1768 %_1772) '#f))
                                     (%_1771 (- %_1772 '1)))
                                   (void))))
                             %_1771))
                         #f)
                        (- (vector-length %_1768) '1))
                       %_1770))
                   (make-vector (vector-length %_1768)))
                  %_1768)))))
        (set! %_1350
          (lambda (%_1775)
            (if (%_1163 %_1775)
              (%_1287
                %_1775
                '#3(syntax-object
                    ...
                    ((top)
                     #4(ribcage ())
                     #4(ribcage ())
                     #4(ribcage #1(x) #1((top)) #1("i"))
                     #4(ribcage
                        (lambda-var-list
                          gen-var
                          strip
                          strip*
                          strip-annotation
                          ellipsis?
                          chi-void
                          chi-local-syntax
                          chi-lambda-clause
                          parse-define-syntax
                          parse-define
                          parse-import
                          parse-module
                          do-import!
                          chi-internal
                          chi-body
                          chi-macro
                          chi-set!
                          chi-application
                          chi-expr
                          chi
                          ct-eval/residualize
                          rt-eval/residualize
                          initial-mode-set
                          update-mode-set
                          do-top-import
                          vfor-each
                          vmap
                          chi-external
                          check-defined-ids
                          check-module-exports
                          extend-store!
                          id-set-diff
                          chi-top-module
                          set-module-binding-val!
                          set-module-binding-imps!
                          set-module-binding-label!
                          set-module-binding-id!
                          set-module-binding-type!
                          module-binding-val
                          module-binding-imps
                          module-binding-label
                          module-binding-id
                          module-binding-type
                          module-binding?
                          make-module-binding
                          make-resolved-interface
                          make-trimmed-interface
                          set-interface-token!
                          set-interface-exports!
                          interface-token
                          interface-exports
                          interface?
                          make-interface
                          flatten-exports
                          chi-top
                          chi-top-expr
                          syntax-type
                          chi-when-list
                          chi-top-sequence
                          chi-sequence
                          source-wrap
                          wrap
                          bound-id-member?
                          invalid-ids-error
                          distinct-bound-ids?
                          valid-bound-ids?
                          bound-id=?
                          literal-id=?
                          free-id=?
                          id-var-name
                          id-var-name-loc
                          id-var-name&marks
                          id-var-name-loc&marks
                          same-marks?
                          join-marks
                          join-wraps
                          smart-append
                          make-trimmed-syntax-object
                          make-binding-wrap
                          lookup-import-binding-name
                          extend-ribcage-subst!
                          extend-ribcage-barrier-help!
                          extend-ribcage-barrier!
                          extend-ribcage!
                          make-empty-ribcage
                          import-token-key
                          import-token?
                          make-import-token
                          barrier-marker
                          new-mark
                          anti-mark
                          the-anti-mark
                          only-top-marked?
                          top-marked?
                          top-wrap
                          empty-wrap
                          set-ribcage-labels!
                          set-ribcage-marks!
                          set-ribcage-symnames!
                          ribcage-labels
                          ribcage-marks
                          ribcage-symnames
                          ribcage?
                          make-ribcage
                          set-indirect-label!
                          get-indirect-label
                          indirect-label?
                          gen-indirect-label
                          gen-labels
                          label?
                          gen-label
                          make-rename
                          rename-marks
                          rename-new
                          rename-old
                          subst-rename?
                          wrap-subst
                          wrap-marks
                          make-wrap
                          id-sym-name&marks
                          id-sym-name
                          id?
                          nonsymbol-id?
                          global-extend
                          lookup
                          sanitize-binding
                          lookup*
                          displaced-lexical-error
                          transformer-env
                          extend-var-env*
                          extend-env*
                          extend-env
                          null-env
                          binding?
                          set-binding-value!
                          set-binding-type!
                          binding-value
                          binding-type
                          make-binding
                          arg-check
                          source-annotation
                          no-source
                          unannotate
                          set-syntax-object-wrap!
                          set-syntax-object-expression!
                          syntax-object-wrap
                          syntax-object-expression
                          syntax-object?
                          make-syntax-object
                          self-evaluating?
                          build-lexical-var
                          build-letrec
                          build-sequence
                          build-data
                          build-primref
                          build-lambda
                          build-revisit-only
                          build-visit-only
                          build-cte-install
                          build-module-definition
                          build-global-definition
                          build-global-assignment
                          build-global-reference
                          build-lexical-assignment
                          build-lexical-reference
                          build-conditional
                          build-application
                          generate-id
                          get-import-binding
                          get-global-definition-hook
                          put-global-definition-hook
                          gensym-hook
                          error-hook
                          local-eval-hook
                          top-level-eval-hook
                          annotation?
                          fx<
                          fx=
                          fx-
                          fx+
                          noexpand
                          define-structure
                          unless
                          when)
                        ((top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top)
                         (top))
                        ("i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"
                         "i"))
                     #4(ribcage ((import-token . *top*)) ())
                     #4(ribcage ((import-token . *top*)) ()))))
              '#f)))
        (set! %_1349 (lambda () (list 'void)))
        (set! %_1348
          (lambda (%_1776 %_1777 %_1778 %_1779 %_1780 %_1781)
            ((lambda (%_1782)
               ((lambda (%_1783)
                  (if %_1783
                    (apply (lambda (%_1785 %_1786 %_1787 %_1788 %_1789)
                             ((lambda (%_1790)
                                (if (not (%_1289 %_1790))
                                  (%_1291
                                    (map (lambda (%_1798)
                                           (%_1293 %_1798 %_1779))
                                         %_1790)
                                    (%_1294 %_1777 %_1779 %_1780)
                                    '"keyword")
                                  ((lambda (%_1791)
                                     ((lambda (%_1792)
                                        (%_1781
                                          (cons %_1788 %_1789)
                                          (%_1155
                                            %_1791
                                            ((lambda (%_1794 %_1795)
                                               (map (lambda (%_1796)
                                                      (%_1139
                                                        'deferred
                                                        (%_1335
                                                          %_1796
                                                          %_1795
                                                          %_1794)))
                                                    %_1787))
                                             (if %_1776 %_1792 %_1779)
                                             (%_1157 %_1778))
                                            %_1778)
                                          %_1792
                                          %_1780))
                                      (%_1276 %_1790 %_1791 %_1779)))
                                   (%_1207 %_1790))))
                              %_1786))
                           %_1783)
                    ((lambda (%_1784)
                       (syntax-error (%_1294 %_1777 %_1779 %_1780)))
                     %_1782)))
                ($syntax-dispatch
                  %_1782
                  '(any #2(each (any any)) any . each-any))))
             %_1777)))
        (set! %_1347
          (lambda (%_1800 %_1801 %_1802 %_1803 %_1804)
            ((lambda (%_1805)
               ((lambda (%_1806)
                  (if %_1806
                    (apply (lambda (%_1819 %_1820 %_1821)
                             ((lambda (%_1822)
                                (if (not (%_1289 %_1822))
                                  (syntax-error
                                    %_1800
                                    '"invalid parameter list in")
                                  ((lambda (%_1823 %_1824)
                                     (%_1804
                                       %_1824
                                       (%_1340
                                         (cons %_1820 %_1821)
                                         %_1800
                                         (%_1156 %_1823 %_1824 %_1802)
                                         (%_1276 %_1822 %_1823 %_1803))))
                                   (%_1207 %_1822)
                                   (map %_1354 %_1822))))
                              %_1819))
                           %_1806)
                    ((lambda (%_1807)
                       (if %_1807
                         (apply (lambda (%_1809 %_1810 %_1811)
                                  ((lambda (%_1812)
                                     (if (not (%_1289 %_1812))
                                       (syntax-error
                                         %_1800
                                         '"invalid parameter list in")
                                       ((lambda (%_1813 %_1814)
                                          (%_1804
                                            (((lambda (%_1815)
                                                (begin
                                                  (set! %_1815
                                                    (lambda (%_1816 %_1817)
                                                      (if (null? %_1816)
                                                        %_1817
                                                        (%_1815
                                                          (cdr %_1816)
                                                          (cons (car %_1816)
                                                                %_1817)))))
                                                  %_1815))
                                              #f)
                                             (cdr %_1814)
                                             (car %_1814))
                                            (%_1340
                                              (cons %_1810 %_1811)
                                              %_1800
                                              (%_1156 %_1813 %_1814 %_1802)
                                              (%_1276 %_1812 %_1813 %_1803))))
                                        (%_1207 %_1812)
                                        (map %_1354 %_1812))))
                                   (%_1355 %_1809)))
                                %_1807)
                         ((lambda (%_1808) (syntax-error %_1800)) %_1805)))
                     ($syntax-dispatch %_1805 '(any any . each-any)))))
                ($syntax-dispatch
                  %_1805
                  '(each-any any . each-any))))
             %_1801)))
        (set! %_1346
          (lambda (%_1827 %_1828 %_1829 %_1830)
            ((lambda (%_1831)
               ((lambda (%_1832)
                  (if (if %_1832
                        (apply (lambda (%_1837 %_1838 %_1839) (%_1164 %_1838))
                               %_1832)
                        '#f)
                    (apply (lambda (%_1834 %_1835 %_1836)
                             (%_1830 %_1835 %_1836 %_1828))
                           %_1832)
                    ((lambda (%_1833)
                       (syntax-error (%_1294 %_1827 %_1828 %_1829)))
                     %_1831)))
                ($syntax-dispatch %_1831 '(any any any))))
             %_1827)))
        (set! %_1345
          (lambda (%_1840 %_1841 %_1842 %_1843)
            ((lambda (%_1844)
               ((lambda (%_1845)
                  (if (if %_1845
                        (apply (lambda (%_1867 %_1868 %_1869) (%_1164 %_1868))
                               %_1845)
                        '#f)
                    (apply (lambda (%_1864 %_1865 %_1866)
                             (%_1843 %_1865 %_1866 %_1841))
                           %_1845)
                    ((lambda (%_1846)
                       (if (if %_1846
                             (apply (lambda (%_1859
                                             %_1860
                                             %_1861
                                             %_1862
                                             %_1863)
                                      (if (%_1164 %_1860)
                                        (%_1289 (%_1355 %_1861))
                                        '#f))
                                    %_1846)
                             '#f)
                         (apply (lambda (%_1853 %_1854 %_1855 %_1856 %_1857)
                                  (%_1843
                                    (%_1293 %_1854 %_1841)
                                    (cons '#3(syntax-object
                                              lambda
                                              ((top)
                                               #4(ribcage
                                                  #5(_ name args e1 e2)
                                                  #5((top))
                                                  #5("i" "i" "i" "i" "i"))
                                               #4(ribcage ())
                                               #4(ribcage
                                                  #4(e w s k)
                                                  #4((top))
                                                  #4("i" "i" "i" "i"))
                                               #4(ribcage
                                                  (lambda-var-list
                                                    gen-var
                                                    strip
                                                    strip*
                                                    strip-annotation
                                                    ellipsis?
                                                    chi-void
                                                    chi-local-syntax
                                                    chi-lambda-clause
                                                    parse-define-syntax
                                                    parse-define
                                                    parse-import
                                                    parse-module
                                                    do-import!
                                                    chi-internal
                                                    chi-body
                                                    chi-macro
                                                    chi-set!
                                                    chi-application
                                                    chi-expr
                                                    chi
                                                    ct-eval/residualize
                                                    rt-eval/residualize
                                                    initial-mode-set
                                                    update-mode-set
                                                    do-top-import
                                                    vfor-each
                                                    vmap
                                                    chi-external
                                                    check-defined-ids
                                                    check-module-exports
                                                    extend-store!
                                                    id-set-diff
                                                    chi-top-module
                                                    set-module-binding-val!
                                                    set-module-binding-imps!
                                                    set-module-binding-label!
                                                    set-module-binding-id!
                                                    set-module-binding-type!
                                                    module-binding-val
                                                    module-binding-imps
                                                    module-binding-label
                                                    module-binding-id
                                                    module-binding-type
                                                    module-binding?
                                                    make-module-binding
                                                    make-resolved-interface
                                                    make-trimmed-interface
                                                    set-interface-token!
                                                    set-interface-exports!
                                                    interface-token
                                                    interface-exports
                                                    interface?
                                                    make-interface
                                                    flatten-exports
                                                    chi-top
                                                    chi-top-expr
                                                    syntax-type
                                                    chi-when-list
                                                    chi-top-sequence
                                                    chi-sequence
                                                    source-wrap
                                                    wrap
                                                    bound-id-member?
                                                    invalid-ids-error
                                                    distinct-bound-ids?
                                                    valid-bound-ids?
                                                    bound-id=?
                                                    literal-id=?
                                                    free-id=?
                                                    id-var-name
                                                    id-var-name-loc
                                                    id-var-name&marks
                                                    id-var-name-loc&marks
                                                    same-marks?
                                                    join-marks
                                                    join-wraps
                                                    smart-append
                                                    make-trimmed-syntax-object
                                                    make-binding-wrap
                                                    lookup-import-binding-name
                                                    extend-ribcage-subst!
                                                    extend-ribcage-barrier-help!
                                                    extend-ribcage-barrier!
                                                    extend-ribcage!
                                                    make-empty-ribcage
                                                    import-token-key
                                                    import-token?
                                                    make-import-token
                                                    barrier-marker
                                                    new-mark
                                                    anti-mark
                                                    the-anti-mark
                                                    only-top-marked?
                                                    top-marked?
                                                    top-wrap
                                                    empty-wrap
                                                    set-ribcage-labels!
                                                    set-ribcage-marks!
                                                    set-ribcage-symnames!
                                                    ribcage-labels
                                                    ribcage-marks
                                                    ribcage-symnames
                                                    ribcage?
                                                    make-ribcage
                                                    set-indirect-label!
                                                    get-indirect-label
                                                    indirect-label?
                                                    gen-indirect-label
                                                    gen-labels
                                                    label?
                                                    gen-label
                                                    make-rename
                                                    rename-marks
                                                    rename-new
                                                    rename-old
                                                    subst-rename?
                                                    wrap-subst
                                                    wrap-marks
                                                    make-wrap
                                                    id-sym-name&marks
                                                    id-sym-name
                                                    id?
                                                    nonsymbol-id?
                                                    global-extend
                                                    lookup
                                                    sanitize-binding
                                                    lookup*
                                                    displaced-lexical-error
                                                    transformer-env
                                                    extend-var-env*
                                                    extend-env*
                                                    extend-env
                                                    null-env
                                                    binding?
                                                    set-binding-value!
                                                    set-binding-type!
                                                    binding-value
                                                    binding-type
                                                    make-binding
                                                    arg-check
                                                    source-annotation
                                                    no-source
                                                    unannotate
                                                    set-syntax-object-wrap!
                                                    set-syntax-object-expression!
                                                    syntax-object-wrap
                                                    syntax-object-expression
                                                    syntax-object?
                                                    make-syntax-object
                                                    self-evaluating?
                                                    build-lexical-var
                                                    build-letrec
                                                    build-sequence
                                                    build-data
                                                    build-primref
                                                    build-lambda
                                                    build-revisit-only
                                                    build-visit-only
                                                    build-cte-install
                                                    build-module-definition
                                                    build-global-definition
                                                    build-global-assignment
                                                    build-global-reference
                                                    build-lexical-assignment
                                                    build-lexical-reference
                                                    build-conditional
                                                    build-application
                                                    generate-id
                                                    get-import-binding
                                                    get-global-definition-hook
                                                    put-global-definition-hook
                                                    gensym-hook
                                                    error-hook
                                                    local-eval-hook
                                                    top-level-eval-hook
                                                    annotation?
                                                    fx<
                                                    fx=
                                                    fx-
                                                    fx+
                                                    noexpand
                                                    define-structure
                                                    unless
                                                    when)
                                                  ((top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top)
                                                   (top))
                                                  ("i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"))
                                               #4(ribcage
                                                  ((import-token . *top*))
                                                  ()
                                                  ())
                                               #4(ribcage
                                                  ((import-token . *top*))
                                                  ()
                                                  ())))
                                          (%_1293
                                            (cons %_1855 (cons %_1856 %_1857))
                                            %_1841))
                                    '(())))
                                %_1846)
                         ((lambda (%_1847)
                            (if (if %_1847
                                  (apply (lambda (%_1851 %_1852)
                                           (%_1164 %_1852))
                                         %_1847)
                                  '#f)
                              (apply (lambda (%_1849 %_1850)
                                       (%_1843
                                         (%_1293 %_1850 %_1841)
                                         '#3(syntax-object
                                             (void)
                                             ((top)
                                              #4(ribcage
                                                 #2(_ name)
                                                 #2((top))
                                                 #2("i" "i"))
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #4(e w s k)
                                                 #4((top))
                                                 #4("i" "i" "i" "i"))
                                              #4(ribcage
                                                 (lambda-var-list
                                                   gen-var
                                                   strip
                                                   strip*
                                                   strip-annotation
                                                   ellipsis?
                                                   chi-void
                                                   chi-local-syntax
                                                   chi-lambda-clause
                                                   parse-define-syntax
                                                   parse-define
                                                   parse-import
                                                   parse-module
                                                   do-import!
                                                   chi-internal
                                                   chi-body
                                                   chi-macro
                                                   chi-set!
                                                   chi-application
                                                   chi-expr
                                                   chi
                                                   ct-eval/residualize
                                                   rt-eval/residualize
                                                   initial-mode-set
                                                   update-mode-set
                                                   do-top-import
                                                   vfor-each
                                                   vmap
                                                   chi-external
                                                   check-defined-ids
                                                   check-module-exports
                                                   extend-store!
                                                   id-set-diff
                                                   chi-top-module
                                                   set-module-binding-val!
                                                   set-module-binding-imps!
                                                   set-module-binding-label!
                                                   set-module-binding-id!
                                                   set-module-binding-type!
                                                   module-binding-val
                                                   module-binding-imps
                                                   module-binding-label
                                                   module-binding-id
                                                   module-binding-type
                                                   module-binding?
                                                   make-module-binding
                                                   make-resolved-interface
                                                   make-trimmed-interface
                                                   set-interface-token!
                                                   set-interface-exports!
                                                   interface-token
                                                   interface-exports
                                                   interface?
                                                   make-interface
                                                   flatten-exports
                                                   chi-top
                                                   chi-top-expr
                                                   syntax-type
                                                   chi-when-list
                                                   chi-top-sequence
                                                   chi-sequence
                                                   source-wrap
                                                   wrap
                                                   bound-id-member?
                                                   invalid-ids-error
                                                   distinct-bound-ids?
                                                   valid-bound-ids?
                                                   bound-id=?
                                                   literal-id=?
                                                   free-id=?
                                                   id-var-name
                                                   id-var-name-loc
                                                   id-var-name&marks
                                                   id-var-name-loc&marks
                                                   same-marks?
                                                   join-marks
                                                   join-wraps
                                                   smart-append
                                                   make-trimmed-syntax-object
                                                   make-binding-wrap
                                                   lookup-import-binding-name
                                                   extend-ribcage-subst!
                                                   extend-ribcage-barrier-help!
                                                   extend-ribcage-barrier!
                                                   extend-ribcage!
                                                   make-empty-ribcage
                                                   import-token-key
                                                   import-token?
                                                   make-import-token
                                                   barrier-marker
                                                   new-mark
                                                   anti-mark
                                                   the-anti-mark
                                                   only-top-marked?
                                                   top-marked?
                                                   top-wrap
                                                   empty-wrap
                                                   set-ribcage-labels!
                                                   set-ribcage-marks!
                                                   set-ribcage-symnames!
                                                   ribcage-labels
                                                   ribcage-marks
                                                   ribcage-symnames
                                                   ribcage?
                                                   make-ribcage
                                                   set-indirect-label!
                                                   get-indirect-label
                                                   indirect-label?
                                                   gen-indirect-label
                                                   gen-labels
                                                   label?
                                                   gen-label
                                                   make-rename
                                                   rename-marks
                                                   rename-new
                                                   rename-old
                                                   subst-rename?
                                                   wrap-subst
                                                   wrap-marks
                                                   make-wrap
                                                   id-sym-name&marks
                                                   id-sym-name
                                                   id?
                                                   nonsymbol-id?
                                                   global-extend
                                                   lookup
                                                   sanitize-binding
                                                   lookup*
                                                   displaced-lexical-error
                                                   transformer-env
                                                   extend-var-env*
                                                   extend-env*
                                                   extend-env
                                                   null-env
                                                   binding?
                                                   set-binding-value!
                                                   set-binding-type!
                                                   binding-value
                                                   binding-type
                                                   make-binding
                                                   arg-check
                                                   source-annotation
                                                   no-source
                                                   unannotate
                                                   set-syntax-object-wrap!
                                                   set-syntax-object-expression!
                                                   syntax-object-wrap
                                                   syntax-object-expression
                                                   syntax-object?
                                                   make-syntax-object
                                                   self-evaluating?
                                                   build-lexical-var
                                                   build-letrec
                                                   build-sequence
                                                   build-data
                                                   build-primref
                                                   build-lambda
                                                   build-revisit-only
                                                   build-visit-only
                                                   build-cte-install
                                                   build-module-definition
                                                   build-global-definition
                                                   build-global-assignment
                                                   build-global-reference
                                                   build-lexical-assignment
                                                   build-lexical-reference
                                                   build-conditional
                                                   build-application
                                                   generate-id
                                                   get-import-binding
                                                   get-global-definition-hook
                                                   put-global-definition-hook
                                                   gensym-hook
                                                   error-hook
                                                   local-eval-hook
                                                   top-level-eval-hook
                                                   annotation?
                                                   fx<
                                                   fx=
                                                   fx-
                                                   fx+
                                                   noexpand
                                                   define-structure
                                                   unless
                                                   when)
                                                 ((top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top)
                                                  (top))
                                                 ("i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"))
                                              #4(ribcage
                                                 ((import-token . *top*))
                                                 ()
                                                 ())
                                              #4(ribcage
                                                 ((import-token . *top*))
                                                 ()
                                                 ())))
                                         '(())))
                                     %_1847)
                              ((lambda (%_1848)
                                 (syntax-error (%_1294 %_1840 %_1841 %_1842)))
                               %_1844)))
                          ($syntax-dispatch %_1844 '(any any)))))
                     ($syntax-dispatch
                       %_1844
                       '(any (any . any) any . each-any)))))
                ($syntax-dispatch %_1844 '(any any any))))
             %_1840)))
        (set! %_1344
          (lambda (%_1870 %_1871 %_1872 %_1873)
            ((lambda (%_1874)
               ((lambda (%_1875)
                  (if (if %_1875
                        (apply (lambda (%_1879 %_1880) (%_1164 %_1880))
                               %_1875)
                        '#f)
                    (apply (lambda (%_1877 %_1878)
                             (%_1873 (%_1293 %_1878 %_1871)))
                           %_1875)
                    ((lambda (%_1876)
                       (syntax-error (%_1294 %_1870 %_1871 %_1872)))
                     %_1874)))
                ($syntax-dispatch %_1874 '(any any))))
             %_1870)))
        (set! %_1343
          (lambda (%_1881 %_1882 %_1883 %_1884 %_1885)
            ((lambda (%_1887 %_1886)
               (begin
                 (set! %_1887
                   (lambda (%_1907 %_1908 %_1909)
                     (%_1885
                       %_1907
                       (%_1886 %_1908)
                       (map (lambda (%_1910) (%_1293 %_1910 %_1884))
                            %_1909))))
                 (set! %_1886
                   (lambda (%_1911)
                     (if (null? %_1911)
                       '()
                       (cons ((lambda (%_1912)
                                ((lambda (%_1913)
                                   (if %_1913
                                     (apply (lambda (%_1915) (%_1886 %_1915))
                                            %_1913)
                                     ((lambda (%_1914)
                                        (if (%_1164 %_1914)
                                          (%_1293 %_1914 %_1884)
                                          (syntax-error
                                            (%_1294 %_1881 %_1882 %_1883)
                                            '"invalid exports list in")))
                                      %_1912)))
                                 ($syntax-dispatch %_1912 'each-any)))
                              (car %_1911))
                             (%_1886 (cdr %_1911))))))
                 ((lambda (%_1888)
                    ((lambda (%_1889)
                       (if %_1889
                         (apply (lambda (%_1902 %_1903 %_1904)
                                  (%_1887 '#f %_1903 %_1904))
                                %_1889)
                         ((lambda (%_1890)
                            (if (if %_1890
                                  (apply (lambda (%_1898 %_1899 %_1900 %_1901)
                                           (%_1164 %_1899))
                                         %_1890)
                                  '#f)
                              (apply (lambda (%_1892 %_1893 %_1894 %_1895)
                                       (%_1887
                                         (%_1293 %_1893 %_1882)
                                         %_1894
                                         %_1895))
                                     %_1890)
                              ((lambda (%_1891)
                                 (syntax-error (%_1294 %_1881 %_1882 %_1883)))
                               %_1888)))
                          ($syntax-dispatch
                            %_1888
                            '(any any each-any . each-any)))))
                     ($syntax-dispatch
                       %_1888
                       '(any each-any . each-any))))
                  %_1881)))
             #f
             #f)))
        (set! %_1342
          (lambda (%_1917 %_1918)
            ((lambda (%_1919)
               (if %_1919
                 (%_1274 %_1918 %_1919)
                 (%_1329
                   (lambda (%_1920)
                     ((lambda (%_1921)
                        (begin
                          (if (not %_1921)
                            (syntax-error
                              %_1920
                              '"exported identifier not visible")
                            (void))
                          (%_1271 %_1918 %_1920 %_1921)))
                      (%_1284 %_1920 '(()))))
                   (%_1304 %_1917))))
             (%_1305 %_1917))))
        (set! %_1341
          (lambda (%_1922 %_1923 %_1924 %_1925 %_1926)
            ((lambda (%_1927)
               (begin
                 (set! %_1927
                   (lambda (%_1997 %_1998 %_1999 %_2000 %_2001)
                     (begin
                       (%_1326 %_1923 %_1998)
                       (%_1926 %_1997 %_1998 %_1999 %_2000 %_2001))))
                 (((lambda (%_1928)
                     (begin
                       (set! %_1928
                         (lambda (%_1929 %_1930 %_1931 %_1932 %_1933)
                           (if (null? %_1929)
                             (%_1927 %_1929 %_1930 %_1931 %_1932 %_1933)
                             ((lambda (%_1934 %_1935)
                                (call-with-values
                                  (lambda ()
                                    (%_1298 %_1934 %_1935 '(()) '#f %_1922))
                                  (lambda (%_1936 %_1937 %_1938 %_1939 %_1940)
                                    ((lambda (%_1941)
                                       (if (memv %_1941 '(define-form))
                                         (%_1345
                                           %_1938
                                           %_1939
                                           %_1940
                                           (lambda (%_1991 %_1992 %_1993)
                                             ((lambda (%_1994 %_1995)
                                                ((lambda (%_1996)
                                                   (begin
                                                     (%_1271
                                                       %_1922
                                                       %_1994
                                                       %_1995)
                                                     (%_1324
                                                       %_1925
                                                       %_1995
                                                       (%_1139
                                                         'lexical
                                                         %_1996))
                                                     (%_1928
                                                       (cdr %_1929)
                                                       (cons %_1994 %_1930)
                                                       (cons %_1996 %_1931)
                                                       (cons (cons %_1935
                                                                   (%_1293
                                                                     %_1992
                                                                     %_1993))
                                                             %_1932)
                                                       %_1933)))
                                                 (%_1354 %_1994)))
                                              (%_1293 %_1991 %_1993)
                                              (%_1205))))
                                         (if (memv %_1941
                                                   '(define-syntax-form))
                                           (%_1346
                                             %_1938
                                             %_1939
                                             %_1940
                                             (lambda (%_1985 %_1986 %_1987)
                                               ((lambda (%_1988 %_1989 %_1990)
                                                  (begin
                                                    (%_1271
                                                      %_1922
                                                      %_1988
                                                      %_1989)
                                                    (%_1324
                                                      %_1925
                                                      %_1989
                                                      (%_1139
                                                        'deferred
                                                        %_1990))
                                                    (%_1928
                                                      (cdr %_1929)
                                                      (cons %_1988 %_1930)
                                                      %_1931
                                                      %_1932
                                                      %_1933)))
                                                (%_1293 %_1985 %_1987)
                                                (%_1205)
                                                (%_1335
                                                  %_1986
                                                  (%_1157 %_1935)
                                                  %_1987))))
                                           (if (memv %_1941 '(module-form))
                                             ((lambda (%_1969)
                                                ((lambda (%_1970)
                                                   ((lambda ()
                                                      (%_1343
                                                        %_1938
                                                        %_1939
                                                        %_1940
                                                        %_1970
                                                        (lambda (%_1971
                                                                 %_1972
                                                                 %_1973)
                                                          (%_1341
                                                            %_1969
                                                            (%_1294
                                                              %_1938
                                                              %_1939
                                                              %_1940)
                                                            (map (lambda (%_1974)
                                                                   (cons %_1935
                                                                         %_1974))
                                                                 %_1973)
                                                            %_1925
                                                            (lambda (%_1975
                                                                     %_1976
                                                                     %_1977
                                                                     %_1978
                                                                     %_1979)
                                                              (begin
                                                                (%_1325
                                                                  %_1923
                                                                  (%_1301
                                                                    %_1972)
                                                                  %_1976)
                                                                ((lambda (%_1980
                                                                          %_1981
                                                                          %_1982
                                                                          %_1983)
                                                                   (if %_1971
                                                                     ((lambda (%_1984)
                                                                        (begin
                                                                          (%_1271
                                                                            %_1922
                                                                            %_1971
                                                                            %_1984)
                                                                          (%_1324
                                                                            %_1925
                                                                            %_1984
                                                                            (%_1139
                                                                              'module
                                                                              %_1980))
                                                                          (%_1928
                                                                            (cdr %_1929)
                                                                            (cons %_1971
                                                                                  %_1930)
                                                                            %_1981
                                                                            %_1982
                                                                            %_1983)))
                                                                      (%_1205))
                                                                     ((lambda ()
                                                                        (begin
                                                                          (%_1342
                                                                            %_1980
                                                                            %_1922)
                                                                          (%_1928
                                                                            (cdr %_1929)
                                                                            (cons %_1980
                                                                                  %_1930)
                                                                            %_1981
                                                                            %_1982
                                                                            %_1983))))))
                                                                 (%_1308
                                                                   %_1972)
                                                                 (append
                                                                   %_1977
                                                                   %_1931)
                                                                 (append
                                                                   %_1978
                                                                   %_1932)
                                                                 (append
                                                                   %_1933
                                                                   %_1979
                                                                   %_1975))))))))))
                                                 (%_1171
                                                   (%_1172 %_1939)
                                                   (cons %_1969
                                                         (%_1173 %_1939)))))
                                              (%_1212 '() '() '()))
                                             (if (memv %_1941 '(import-form))
                                               (%_1344
                                                 %_1938
                                                 %_1939
                                                 %_1940
                                                 (lambda (%_1964)
                                                   ((lambda (%_1965)
                                                      ((lambda (%_1966)
                                                         ((lambda (%_1967)
                                                            (if (memv %_1967
                                                                      '(module))
                                                              ((lambda (%_1968)
                                                                 (begin
                                                                   (if %_1937
                                                                     (%_1272
                                                                       %_1922
                                                                       %_1937)
                                                                     (void))
                                                                   (%_1342
                                                                     %_1968
                                                                     %_1922)
                                                                   (%_1928
                                                                     (cdr %_1929)
                                                                     (cons %_1968
                                                                           %_1930)
                                                                     %_1931
                                                                     %_1932
                                                                     %_1933)))
                                                               (cdr %_1966))
                                                              (if (memv %_1967
                                                                        '(displaced-lexical))
                                                                (%_1158 %_1964)
                                                                (syntax-error
                                                                  %_1964
                                                                  '"import from unknown module"))))
                                                          (car %_1966)))
                                                       (%_1161 %_1965 %_1925)))
                                                    (%_1285 %_1964 '(())))))
                                               (if (memv %_1941 '(begin-form))
                                                 ((lambda (%_1957)
                                                    ((lambda (%_1958)
                                                       (if %_1958
                                                         (apply (lambda (%_1959
                                                                         %_1960)
                                                                  (%_1928
                                                                    (((lambda (%_1961)
                                                                        (begin
                                                                          (set! %_1961
                                                                            (lambda (%_1962)
                                                                              (if (null? %_1962)
                                                                                (cdr %_1929)
                                                                                (cons (cons %_1935
                                                                                            (%_1293
                                                                                              (car %_1962)
                                                                                              %_1939))
                                                                                      (%_1961
                                                                                        (cdr %_1962))))))
                                                                          %_1961))
                                                                      #f)
                                                                     %_1960)
                                                                    %_1930
                                                                    %_1931
                                                                    %_1932
                                                                    %_1933))
                                                                %_1958)
                                                         (syntax-error
                                                           %_1957)))
                                                     ($syntax-dispatch
                                                       %_1957
                                                       '(any . each-any))))
                                                  %_1938)
                                                 (if (memv %_1941
                                                           '(eval-when-form))
                                                   ((lambda (%_1948)
                                                      ((lambda (%_1949)
                                                         (if %_1949
                                                           (apply (lambda (%_1950
                                                                           %_1951
                                                                           %_1952)
                                                                    (%_1928
                                                                      (if (memq 'eval
                                                                                (%_1297
                                                                                  %_1951
                                                                                  %_1939))
                                                                        (((lambda (%_1953)
                                                                            (begin
                                                                              (set! %_1953
                                                                                (lambda (%_1954)
                                                                                  (if (null? %_1954)
                                                                                    (cdr %_1929)
                                                                                    (cons (cons %_1935
                                                                                                (%_1293
                                                                                                  (car %_1954)
                                                                                                  %_1939))
                                                                                          (%_1953
                                                                                            (cdr %_1954))))))
                                                                              %_1953))
                                                                          #f)
                                                                         %_1952)
                                                                        (cdr %_1929))
                                                                      %_1930
                                                                      %_1931
                                                                      %_1932
                                                                      %_1933))
                                                                  %_1949)
                                                           (syntax-error
                                                             %_1948)))
                                                       ($syntax-dispatch
                                                         %_1948
                                                         '(any each-any
                                                               .
                                                               each-any))))
                                                    %_1938)
                                                   (if (memv %_1941
                                                             '(local-syntax-form))
                                                     (%_1348
                                                       %_1937
                                                       %_1938
                                                       %_1935
                                                       %_1939
                                                       %_1940
                                                       (lambda (%_1942
                                                                %_1943
                                                                %_1944
                                                                %_1945)
                                                         (%_1928
                                                           (((lambda (%_1946)
                                                               (begin
                                                                 (set! %_1946
                                                                   (lambda (%_1947)
                                                                     (if (null? %_1947)
                                                                       (cdr %_1929)
                                                                       (cons (cons %_1943
                                                                                   (%_1293
                                                                                     (car %_1947)
                                                                                     %_1944))
                                                                             (%_1946
                                                                               (cdr %_1947))))))
                                                                 %_1946))
                                                             #f)
                                                            %_1942)
                                                           %_1930
                                                           %_1931
                                                           %_1932
                                                           %_1933)))
                                                     (%_1927
                                                       (cons (cons %_1935
                                                                   (%_1294
                                                                     %_1938
                                                                     %_1939
                                                                     %_1940))
                                                             (cdr %_1929))
                                                       %_1930
                                                       %_1931
                                                       %_1932
                                                       %_1933)))))))))
                                     %_1936))))
                              (cdar %_1929)
                              (caar %_1929)))))
                       %_1928))
                   #f)
                  %_1924
                  '()
                  '()
                  '()
                  '())))
             #f)))
        (set! %_1340
          (lambda (%_2002 %_2003 %_2004 %_2005)
            ((lambda (%_2006)
               ((lambda (%_2007)
                  ((lambda (%_2008)
                     ((lambda (%_2009)
                        ((lambda ()
                           (%_1341
                             %_2007
                             %_2003
                             %_2009
                             %_2006
                             (lambda (%_2010 %_2011 %_2012 %_2013 %_2014)
                               (begin
                                 (if (null? %_2010)
                                   (syntax-error
                                     %_2003
                                     '"no expressions in body")
                                   (void))
                                 (%_1099
                                   '#f
                                   %_2012
                                   (map (lambda (%_2015)
                                          (%_1335
                                            (cdr %_2015)
                                            (car %_2015)
                                            '(())))
                                        %_2013)
                                   (%_1098
                                     '#f
                                     (map (lambda (%_2016)
                                            (%_1335
                                              (cdr %_2016)
                                              (car %_2016)
                                              '(())))
                                          (append %_2014 %_2010))))))))))
                      (map (lambda (%_2017)
                             (cons %_2006 (%_1293 %_2017 %_2008)))
                           %_2002)))
                   (%_1171
                     (%_1172 %_2005)
                     (cons %_2007 (%_1173 %_2005)))))
                (%_1212 '() '() '())))
             (cons '("placeholder" placeholder) %_2004))))
        (set! %_1339
          (lambda (%_2018 %_2019 %_2020 %_2021 %_2022 %_2023)
            ((lambda (%_2024)
               (begin
                 (set! %_2024
                   (lambda (%_2027 %_2028)
                     (if (pair? %_2027)
                       (cons (%_2024 (car %_2027) %_2028)
                             (%_2024 (cdr %_2027) %_2028))
                       (if (%_1112 %_2027)
                         ((lambda (%_2033)
                            ((lambda (%_2034 %_2035)
                               (%_1111
                                 (%_1113 %_2027)
                                 (if (if (pair? %_2034)
                                       (eq? (car %_2034) '#f)
                                       '#f)
                                   (%_1171
                                     (cdr %_2034)
                                     (if %_2023
                                       (cons %_2023 (cdr %_2035))
                                       (cdr %_2035)))
                                   (%_1171
                                     (cons %_2028 %_2034)
                                     (if %_2023
                                       (cons %_2023 (cons 'shift %_2035))
                                       (cons 'shift %_2035))))))
                             (%_1172 %_2033)
                             (%_1173 %_2033)))
                          (%_1114 %_2027))
                         (if (vector? %_2027)
                           ((lambda (%_2029)
                              ((lambda (%_2030)
                                 ((lambda ()
                                    (((lambda (%_2031)
                                        (begin
                                          (set! %_2031
                                            (lambda (%_2032)
                                              (if (= %_2032 %_2029)
                                                %_2030
                                                (begin
                                                  (vector-set!
                                                    %_2030
                                                    %_2032
                                                    (%_2024
                                                      (vector-ref
                                                        %_2027
                                                        %_2032)
                                                      %_2028))
                                                  (%_2031 (+ %_2032 '1))))))
                                          %_2031))
                                      #f)
                                     '0))))
                               (make-vector %_2029)))
                            (vector-length %_2027))
                           (if (symbol? %_2027)
                             (syntax-error
                               (%_1294 %_2019 %_2021 %_2022)
                               '"encountered raw symbol "
                               (format '"~s" %_2027)
                               '" in output of macro")
                             %_2027))))))
                 (%_2024
                   ((lambda (%_2025)
                      (if (procedure? %_2025)
                        (%_2025
                          (lambda (%_2026)
                            (begin
                              (if (not (identifier? %_2026))
                                (syntax-error
                                  %_2026
                                  '"environment argument is not an identifier")
                                (void))
                              (%_1161 (%_1285 %_2026 '(())) %_2020))))
                        %_2025))
                    (%_2018 (%_1294 %_2019 (%_1257 %_2021) %_2022)))
                   (string '#\m))))
             #f)))
        (set! %_1338
          (lambda (%_2036 %_2037 %_2038 %_2039 %_2040)
            ((lambda (%_2041)
               ((lambda (%_2042)
                  (if (if %_2042
                        (apply (lambda (%_2060 %_2061 %_2062) (%_1164 %_2061))
                               %_2042)
                        '#f)
                    (apply (lambda (%_2044 %_2045 %_2046)
                             ((lambda (%_2047)
                                ((lambda (%_2048)
                                   ((lambda (%_2049)
                                      (if (memv %_2049 '(macro!))
                                        ((lambda (%_2058 %_2059)
                                           (%_1298
                                             (%_1339
                                               (%_1141 %_2048)
                                               (list '#3(syntax-object
                                                         set!
                                                         ((top)
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #2(id val)
                                                             #2((top))
                                                             #2("i" "i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #1(t)
                                                             #1(("m" top))
                                                             #1("i"))
                                                          #4(ribcage ())
                                                          #4(ribcage ())
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #1(b)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage ())
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #1(n)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage
                                                             #3(_ id val)
                                                             #3((top))
                                                             #3("i" "i" "i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #5(e r w s rib)
                                                             #5((top))
                                                             #5("i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"))
                                                          #4(ribcage
                                                             (lambda-var-list
                                                               gen-var
                                                               strip
                                                               strip*
                                                               strip-annotation
                                                               ellipsis?
                                                               chi-void
                                                               chi-local-syntax
                                                               chi-lambda-clause
                                                               parse-define-syntax
                                                               parse-define
                                                               parse-import
                                                               parse-module
                                                               do-import!
                                                               chi-internal
                                                               chi-body
                                                               chi-macro
                                                               chi-set!
                                                               chi-application
                                                               chi-expr
                                                               chi
                                                               ct-eval/residualize
                                                               rt-eval/residualize
                                                               initial-mode-set
                                                               update-mode-set
                                                               do-top-import
                                                               vfor-each
                                                               vmap
                                                               chi-external
                                                               check-defined-ids
                                                               check-module-exports
                                                               extend-store!
                                                               id-set-diff
                                                               chi-top-module
                                                               set-module-binding-val!
                                                               set-module-binding-imps!
                                                               set-module-binding-label!
                                                               set-module-binding-id!
                                                               set-module-binding-type!
                                                               module-binding-val
                                                               module-binding-imps
                                                               module-binding-label
                                                               module-binding-id
                                                               module-binding-type
                                                               module-binding?
                                                               make-module-binding
                                                               make-resolved-interface
                                                               make-trimmed-interface
                                                               set-interface-token!
                                                               set-interface-exports!
                                                               interface-token
                                                               interface-exports
                                                               interface?
                                                               make-interface
                                                               flatten-exports
                                                               chi-top
                                                               chi-top-expr
                                                               syntax-type
                                                               chi-when-list
                                                               chi-top-sequence
                                                               chi-sequence
                                                               source-wrap
                                                               wrap
                                                               bound-id-member?
                                                               invalid-ids-error
                                                               distinct-bound-ids?
                                                               valid-bound-ids?
                                                               bound-id=?
                                                               literal-id=?
                                                               free-id=?
                                                               id-var-name
                                                               id-var-name-loc
                                                               id-var-name&marks
                                                               id-var-name-loc&marks
                                                               same-marks?
                                                               join-marks
                                                               join-wraps
                                                               smart-append
                                                               make-trimmed-syntax-object
                                                               make-binding-wrap
                                                               lookup-import-binding-name
                                                               extend-ribcage-subst!
                                                               extend-ribcage-barrier-help!
                                                               extend-ribcage-barrier!
                                                               extend-ribcage!
                                                               make-empty-ribcage
                                                               import-token-key
                                                               import-token?
                                                               make-import-token
                                                               barrier-marker
                                                               new-mark
                                                               anti-mark
                                                               the-anti-mark
                                                               only-top-marked?
                                                               top-marked?
                                                               top-wrap
                                                               empty-wrap
                                                               set-ribcage-labels!
                                                               set-ribcage-marks!
                                                               set-ribcage-symnames!
                                                               ribcage-labels
                                                               ribcage-marks
                                                               ribcage-symnames
                                                               ribcage?
                                                               make-ribcage
                                                               set-indirect-label!
                                                               get-indirect-label
                                                               indirect-label?
                                                               gen-indirect-label
                                                               gen-labels
                                                               label?
                                                               gen-label
                                                               make-rename
                                                               rename-marks
                                                               rename-new
                                                               rename-old
                                                               subst-rename?
                                                               wrap-subst
                                                               wrap-marks
                                                               make-wrap
                                                               id-sym-name&marks
                                                               id-sym-name
                                                               id?
                                                               nonsymbol-id?
                                                               global-extend
                                                               lookup
                                                               sanitize-binding
                                                               lookup*
                                                               displaced-lexical-error
                                                               transformer-env
                                                               extend-var-env*
                                                               extend-env*
                                                               extend-env
                                                               null-env
                                                               binding?
                                                               set-binding-value!
                                                               set-binding-type!
                                                               binding-value
                                                               binding-type
                                                               make-binding
                                                               arg-check
                                                               source-annotation
                                                               no-source
                                                               unannotate
                                                               set-syntax-object-wrap!
                                                               set-syntax-object-expression!
                                                               syntax-object-wrap
                                                               syntax-object-expression
                                                               syntax-object?
                                                               make-syntax-object
                                                               self-evaluating?
                                                               build-lexical-var
                                                               build-letrec
                                                               build-sequence
                                                               build-data
                                                               build-primref
                                                               build-lambda
                                                               build-revisit-only
                                                               build-visit-only
                                                               build-cte-install
                                                               build-module-definition
                                                               build-global-definition
                                                               build-global-assignment
                                                               build-global-reference
                                                               build-lexical-assignment
                                                               build-lexical-reference
                                                               build-conditional
                                                               build-application
                                                               generate-id
                                                               get-import-binding
                                                               get-global-definition-hook
                                                               put-global-definition-hook
                                                               gensym-hook
                                                               error-hook
                                                               local-eval-hook
                                                               top-level-eval-hook
                                                               annotation?
                                                               fx<
                                                               fx=
                                                               fx-
                                                               fx+
                                                               noexpand
                                                               define-structure
                                                               unless
                                                               when)
                                                             ((top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top)
                                                              (top))
                                                             ("i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"
                                                              "i"))
                                                          #4(ribcage
                                                             ((import-token
                                                                .
                                                                *top*))
                                                             ()
                                                             ())
                                                          #4(ribcage
                                                             ((import-token
                                                                .
                                                                *top*))
                                                             ()
                                                             ())))
                                                     %_2058
                                                     %_2059)
                                               %_2037
                                               '(())
                                               %_2039
                                               %_2040)
                                             %_2037
                                             '(())
                                             %_2039
                                             %_2040))
                                         (%_1293 %_2045 %_2038)
                                         (%_1293 %_2046 %_2038))
                                        (values
                                          'core
                                          (lambda (%_2050 %_2051 %_2052 %_2053)
                                            ((lambda (%_2054 %_2055)
                                               ((lambda (%_2056)
                                                  ((lambda (%_2057)
                                                     (if (memv %_2057
                                                               '(lexical))
                                                       (list 'set!
                                                             (%_1141 %_2056)
                                                             %_2054)
                                                       (if (memv %_2057
                                                                 '(global))
                                                         (list 'set!
                                                               (%_1141 %_2056)
                                                               %_2054)
                                                         (if (memv %_2057
                                                                   '(displaced-lexical))
                                                           (syntax-error
                                                             (%_1293
                                                               %_2045
                                                               %_2052)
                                                             '"identifier out of context")
                                                           (syntax-error
                                                             (%_1294
                                                               %_2050
                                                               %_2052
                                                               %_2053))))))
                                                   (%_1140 %_2056)))
                                                (%_1161 %_2055 %_2051)))
                                             (%_1335 %_2046 %_2051 %_2052)
                                             (%_1285 %_2045 %_2052)))
                                          %_2036
                                          %_2038
                                          %_2039)))
                                    (%_1140 %_2048)))
                                 (%_1161 %_2047 %_2037)))
                              (%_1285 %_2045 %_2038)))
                           %_2042)
                    ((lambda (%_2043)
                       (syntax-error (%_1294 %_2036 %_2038 %_2039)))
                     %_2041)))
                ($syntax-dispatch %_2041 '(any any any))))
             %_2036)))
        (set! %_1337
          (lambda (%_2063 %_2064 %_2065 %_2066 %_2067)
            ((lambda (%_2068)
               ((lambda (%_2069)
                  (if %_2069
                    (apply (lambda (%_2071 %_2072)
                             (cons %_2063
                                   (map (lambda (%_2073)
                                          (%_1335 %_2073 %_2065 %_2066))
                                        %_2072)))
                           %_2069)
                    ((lambda (%_2070)
                       (syntax-error (%_1294 %_2064 %_2066 %_2067)))
                     %_2068)))
                ($syntax-dispatch %_2068 '(any . each-any))))
             %_2064)))
        (set! %_1336
          (lambda (%_2075 %_2076 %_2077 %_2078 %_2079 %_2080)
            ((lambda (%_2081)
               (if (memv %_2081 '(lexical))
                 %_2076
                 (if (memv %_2081 '(core))
                   (%_2076 %_2077 %_2078 %_2079 %_2080)
                   (if (memv %_2081 '(lexical-call))
                     (%_1337 %_2076 %_2077 %_2078 %_2079 %_2080)
                     (if (memv %_2081 '(constant))
                       (list 'quote
                             (%_1353 (%_1294 %_2077 %_2079 %_2080) '(())))
                       (if (memv %_2081 '(global))
                         %_2076
                         (if (memv %_2081 '(call))
                           (%_1337
                             (%_1335 (car %_2077) %_2078 %_2079)
                             %_2077
                             %_2078
                             %_2079
                             %_2080)
                           (if (memv %_2081 '(begin-form))
                             ((lambda (%_2090)
                                ((lambda (%_2091)
                                   (if %_2091
                                     (apply (lambda (%_2092 %_2093 %_2094)
                                              (%_1295
                                                (cons %_2093 %_2094)
                                                %_2078
                                                %_2079
                                                %_2080))
                                            %_2091)
                                     (syntax-error %_2090)))
                                 ($syntax-dispatch
                                   %_2090
                                   '(any any . each-any))))
                              %_2077)
                             (if (memv %_2081 '(local-syntax-form))
                               (%_1348
                                 %_2076
                                 %_2077
                                 %_2078
                                 %_2079
                                 %_2080
                                 %_1295)
                               (if (memv %_2081 '(eval-when-form))
                                 ((lambda (%_2082)
                                    ((lambda (%_2083)
                                       (if %_2083
                                         (apply (lambda (%_2084
                                                         %_2085
                                                         %_2086
                                                         %_2087)
                                                  (if (memq 'eval
                                                            (%_1297
                                                              %_2085
                                                              %_2079))
                                                    (%_1295
                                                      (cons %_2086 %_2087)
                                                      %_2078
                                                      %_2079
                                                      %_2080)
                                                    (%_1349)))
                                                %_2083)
                                         (syntax-error %_2082)))
                                     ($syntax-dispatch
                                       %_2082
                                       '(any each-any any . each-any))))
                                  %_2077)
                                 (if (memv %_2081
                                           '(define-form
                                              define-syntax-form
                                              module-form
                                              import-form))
                                   (syntax-error
                                     (%_1294 %_2077 %_2079 %_2080)
                                     '"invalid context for definition")
                                   (if (memv %_2081 '(syntax))
                                     (syntax-error
                                       (%_1294 %_2077 %_2079 %_2080)
                                       '"reference to pattern variable outside syntax form")
                                     (if (memv %_2081 '(displaced-lexical))
                                       (%_1158 (%_1294 %_2077 %_2079 %_2080))
                                       (syntax-error
                                         (%_1294
                                           %_2077
                                           %_2079
                                           %_2080)))))))))))))))
             %_2075)))
        (set! %_1335
          (lambda (%_2096 %_2097 %_2098)
            (call-with-values
              (lambda () (%_1298 %_2096 %_2097 %_2098 '#f '#f))
              (lambda (%_2099 %_2100 %_2101 %_2102 %_2103)
                (%_1336
                  %_2099
                  %_2100
                  %_2101
                  %_2097
                  %_2102
                  %_2103)))))
        (set! %_1334
          (lambda (%_2104 %_2105)
            (if (memq 'e %_2104)
              (begin (%_989 (%_2105)) (%_1349))
              ((lambda (%_2106)
                 (if (memq 'r %_2104)
                   (if ((lambda (%_2108)
                          (if %_2108 %_2108 (memq 'v %_2104)))
                        (memq 'l %_2104))
                     (%_2106)
                     (%_2106))
                   (if ((lambda (%_2107)
                          (if %_2107 %_2107 (memq 'v %_2104)))
                        (memq 'l %_2104))
                     (%_2106)
                     (%_1349))))
               (if (memq 'c %_2104)
                 ((lambda (%_2109)
                    (begin (%_989 %_2109) (lambda () %_2109)))
                  (%_2105))
                 %_2105)))))
        (set! %_1333
          (lambda (%_2110 %_2111)
            (if (memq 'e %_2110)
              (%_2111)
              ((lambda (%_2112)
                 (if (memq 'v %_2110)
                   (if ((lambda (%_2114)
                          (if %_2114 %_2114 (memq 'r %_2110)))
                        (memq 'l %_2110))
                     (%_2112)
                     (%_2112))
                   (if ((lambda (%_2113)
                          (if %_2113 %_2113 (memq 'r %_2110)))
                        (memq 'l %_2110))
                     (%_2112)
                     (%_1349))))
               (if (memq 'c %_2110)
                 ((lambda (%_2115)
                    (begin (%_989 %_2115) (lambda () %_2115)))
                  (%_2111))
                 %_2111)))))
        (set! %_1332
          (lambda (%_2116 %_2117)
            (apply append
                   (map (lambda (%_2118)
                          (if %_2117
                            ((lambda (%_2120)
                               (if (memv %_2120 '(compile))
                                 '(c)
                                 (if (memv %_2120 '(load))
                                   '(l)
                                   (if (memv %_2120 '(visit))
                                     '(v)
                                     (if (memv %_2120 '(revisit)) '(r) '())))))
                             %_2118)
                            ((lambda (%_2119)
                               (if (memv %_2119 '(eval)) '(e) '()))
                             %_2118)))
                        %_2116))))
        (set! %_1331
          ((lambda (%_2121)
             (lambda (%_2122 %_2123)
               (remq '-
                     (apply append
                            (map (lambda (%_2124)
                                   ((lambda (%_2125)
                                      (map (lambda (%_2126)
                                             (cdr (assq %_2126 %_2125)))
                                           %_2122))
                                    (cdr (assq %_2124 %_2121))))
                                 %_2123)))))
           '((l (load . l)
                (compile . c)
                (visit . v)
                (revisit . r)
                (eval . -))
             (c (load . -)
                (compile . -)
                (visit . -)
                (revisit . -)
                (eval . c))
             (v (load . v)
                (compile . c)
                (visit . v)
                (revisit . -)
                (eval . -))
             (r (load . r)
                (compile . c)
                (visit . -)
                (revisit . r)
                (eval . -))
             (e (load . -)
                (compile . -)
                (visit . -)
                (revisit . -)
                (eval . e)))))
        (set! %_1330
          (lambda (%_2127 %_2128)
            (list '$sc-put-cte
                  (list 'quote %_2127)
                  (list 'quote (%_1139 'do-import %_2128)))))
        (set! %_1329
          (lambda (%_2129 %_2130)
            ((lambda (%_2131)
               (((lambda (%_2132)
                   (begin
                     (set! %_2132
                       (lambda (%_2133)
                         (if (not (= %_2133 %_2131))
                           (begin
                             (%_2129 (vector-ref %_2130 %_2133))
                             (%_2132 (+ %_2133 '1)))
                           (void))))
                     %_2132))
                 #f)
                '0))
             (vector-length %_2130))))
        (set! %_1328
          (lambda (%_2134 %_2135)
            (((lambda (%_2136)
                (begin
                  (set! %_2136
                    (lambda (%_2137 %_2138)
                      (if (< %_2137 '0)
                        %_2138
                        (%_2136
                          (- %_2137 '1)
                          (cons (%_2134 (vector-ref %_2135 %_2137)) %_2138)))))
                  %_2136))
              #f)
             (- (vector-length %_2135) '1)
             '())))
        (set! %_1327
          (lambda (%_2139
                   %_2140
                   %_2141
                   %_2142
                   %_2143
                   %_2144
                   %_2145
                   %_2146
                   %_2147)
            ((lambda (%_2150 %_2149 %_2148)
               (begin
                 (set! %_2150
                   (lambda (%_2217 %_2218)
                     ((lambda (%_2219)
                        (map (lambda (%_2220)
                               ((lambda (%_2221)
                                  (if (not (%_1292 %_2221 %_2219))
                                    %_2220
                                    (%_1310
                                      (%_1312 %_2220)
                                      %_2221
                                      (%_1314 %_2220)
                                      (append (%_2149 %_2221) (%_1315 %_2220))
                                      (%_1316 %_2220))))
                                (%_1313 %_2220)))
                             %_2217))
                      (map (lambda (%_2222)
                             (if (pair? %_2222) (car %_2222) %_2222))
                           %_2218))))
                 (set! %_2149
                   (lambda (%_2223)
                     (((lambda (%_2224)
                         (begin
                           (set! %_2224
                             (lambda (%_2225)
                               (if (null? %_2225)
                                 '()
                                 (if (if (pair? (car %_2225))
                                       (%_1288 %_2223 (caar %_2225))
                                       '#f)
                                   (%_1301 (cdar %_2225))
                                   (%_2224 (cdr %_2225))))))
                           %_2224))
                       #f)
                      %_2143)))
                 (set! %_2148
                   (lambda (%_2226 %_2227 %_2228)
                     (begin
                       (%_1326 %_2140 %_2227)
                       (%_1325 %_2140 %_2144 %_2227)
                       (%_2147 %_2226 %_2228))))
                 (((lambda (%_2151)
                     (begin
                       (set! %_2151
                         (lambda (%_2152 %_2153 %_2154 %_2155)
                           (if (null? %_2152)
                             (%_2148 %_2154 %_2153 %_2155)
                             ((lambda (%_2156 %_2157)
                                (call-with-values
                                  (lambda ()
                                    (%_1298 %_2156 %_2157 '(()) '#f %_2139))
                                  (lambda (%_2158 %_2159 %_2160 %_2161 %_2162)
                                    ((lambda (%_2163)
                                       (if (memv %_2163 '(define-form))
                                         (%_1345
                                           %_2160
                                           %_2161
                                           %_2162
                                           (lambda (%_2211 %_2212 %_2213)
                                             ((lambda (%_2214)
                                                ((lambda (%_2215)
                                                   ((lambda (%_2216)
                                                      ((lambda ()
                                                         (begin
                                                           (%_1271
                                                             %_2139
                                                             %_2214
                                                             %_2215)
                                                           (%_2151
                                                             (cdr %_2152)
                                                             (cons %_2214
                                                                   %_2153)
                                                             (cons (%_1310
                                                                     %_2158
                                                                     %_2214
                                                                     %_2215
                                                                     %_2216
                                                                     (cons %_2157
                                                                           (%_1293
                                                                             %_2212
                                                                             %_2213)))
                                                                   %_2154)
                                                             %_2155)))))
                                                    (%_2149 %_2214)))
                                                 (%_1208)))
                                              (%_1293 %_2211 %_2213))))
                                         (if (memv %_2163
                                                   '(define-syntax-form))
                                           (%_1346
                                             %_2160
                                             %_2161
                                             %_2162
                                             (lambda (%_2204 %_2205 %_2206)
                                               ((lambda (%_2207)
                                                  ((lambda (%_2208)
                                                     ((lambda (%_2209)
                                                        ((lambda (%_2210)
                                                           ((lambda ()
                                                              (begin
                                                                (%_1324
                                                                  %_2142
                                                                  (%_1210
                                                                    %_2208)
                                                                  (cons 'deferred
                                                                        %_2210))
                                                                (%_1271
                                                                  %_2139
                                                                  %_2207
                                                                  %_2208)
                                                                (%_2151
                                                                  (cdr %_2152)
                                                                  (cons %_2207
                                                                        %_2153)
                                                                  (cons (%_1310
                                                                          %_2158
                                                                          %_2207
                                                                          %_2208
                                                                          %_2209
                                                                          %_2210)
                                                                        %_2154)
                                                                  %_2155)))))
                                                         (%_1335
                                                           %_2205
                                                           (%_1157 %_2157)
                                                           %_2206)))
                                                      (%_2149 %_2207)))
                                                   (%_1208)))
                                                (%_1293 %_2204 %_2206))))
                                           (if (memv %_2163 '(module-form))
                                             ((lambda (%_2191)
                                                ((lambda (%_2192)
                                                   ((lambda ()
                                                      (%_1343
                                                        %_2160
                                                        %_2161
                                                        %_2162
                                                        %_2192
                                                        (lambda (%_2193
                                                                 %_2194
                                                                 %_2195)
                                                          (%_1327
                                                            %_2191
                                                            (%_1294
                                                              %_2160
                                                              %_2161
                                                              %_2162)
                                                            (map (lambda (%_2196)
                                                                   (cons %_2157
                                                                         %_2196))
                                                                 %_2195)
                                                            %_2142
                                                            %_2194
                                                            (%_1301 %_2194)
                                                            %_2145
                                                            %_2146
                                                            (lambda (%_2197
                                                                     %_2198)
                                                              ((lambda (%_2199)
                                                                 ((lambda (%_2200)
                                                                    ((lambda (%_2201)
                                                                       ((lambda ()
                                                                          (if %_2193
                                                                            ((lambda (%_2202
                                                                                      %_2203)
                                                                               (begin
                                                                                 (%_1324
                                                                                   %_2142
                                                                                   (%_1210
                                                                                     %_2202)
                                                                                   (%_1139
                                                                                     'module
                                                                                     %_2199))
                                                                                 (%_1271
                                                                                   %_2139
                                                                                   %_2193
                                                                                   %_2202)
                                                                                 (%_2151
                                                                                   (cdr %_2152)
                                                                                   (cons %_2193
                                                                                         %_2153)
                                                                                   (cons (%_1310
                                                                                           %_2158
                                                                                           %_2193
                                                                                           %_2202
                                                                                           %_2203
                                                                                           %_2194)
                                                                                         %_2200)
                                                                                   %_2201)))
                                                                             (%_1208)
                                                                             (%_2149
                                                                               %_2193))
                                                                            ((lambda ()
                                                                               (begin
                                                                                 (%_1342
                                                                                   %_2199
                                                                                   %_2139)
                                                                                 (%_2151
                                                                                   (cdr %_2152)
                                                                                   (cons %_2199
                                                                                         %_2153)
                                                                                   %_2200
                                                                                   %_2201))))))))
                                                                     (append
                                                                       %_2155
                                                                       %_2198)))
                                                                  (append
                                                                    (if %_2193
                                                                      %_2197
                                                                      (%_2150
                                                                        %_2197
                                                                        %_2194))
                                                                    %_2154)))
                                                               (%_1308
                                                                 %_2194)))))))))
                                                 (%_1171
                                                   (%_1172 %_2161)
                                                   (cons %_2191
                                                         (%_1173 %_2161)))))
                                              (%_1212 '() '() '()))
                                             (if (memv %_2163 '(import-form))
                                               (%_1344
                                                 %_2160
                                                 %_2161
                                                 %_2162
                                                 (lambda (%_2186)
                                                   ((lambda (%_2187)
                                                      ((lambda (%_2188)
                                                         ((lambda (%_2189)
                                                            (if (memv %_2189
                                                                      '(module))
                                                              ((lambda (%_2190)
                                                                 (begin
                                                                   (if %_2159
                                                                     (%_1272
                                                                       %_2139
                                                                       %_2159)
                                                                     (void))
                                                                   (%_1342
                                                                     %_2190
                                                                     %_2139)
                                                                   (%_2151
                                                                     (cdr %_2152)
                                                                     (cons %_2190
                                                                           %_2153)
                                                                     (%_2150
                                                                       %_2154
                                                                       (vector->list
                                                                         (%_1304
                                                                           %_2190)))
                                                                     %_2155)))
                                                               (%_1141 %_2188))
                                                              (if (memv %_2189
                                                                        '(displaced-lexical))
                                                                (%_1158 %_2186)
                                                                (syntax-error
                                                                  %_2186
                                                                  '"import from unknown module"))))
                                                          (%_1140 %_2188)))
                                                       (%_1161 %_2187 %_2142)))
                                                    (%_1285 %_2186 '(())))))
                                               (if (memv %_2163 '(begin-form))
                                                 ((lambda (%_2179)
                                                    ((lambda (%_2180)
                                                       (if %_2180
                                                         (apply (lambda (%_2181
                                                                         %_2182)
                                                                  (%_2151
                                                                    (((lambda (%_2183)
                                                                        (begin
                                                                          (set! %_2183
                                                                            (lambda (%_2184)
                                                                              (if (null? %_2184)
                                                                                (cdr %_2152)
                                                                                (cons (cons %_2157
                                                                                            (%_1293
                                                                                              (car %_2184)
                                                                                              %_2161))
                                                                                      (%_2183
                                                                                        (cdr %_2184))))))
                                                                          %_2183))
                                                                      #f)
                                                                     %_2182)
                                                                    %_2153
                                                                    %_2154
                                                                    %_2155))
                                                                %_2180)
                                                         (syntax-error
                                                           %_2179)))
                                                     ($syntax-dispatch
                                                       %_2179
                                                       '(any . each-any))))
                                                  %_2160)
                                                 (if (memv %_2163
                                                           '(eval-when-form))
                                                   ((lambda (%_2170)
                                                      ((lambda (%_2171)
                                                         (if %_2171
                                                           (apply (lambda (%_2172
                                                                           %_2173
                                                                           %_2174)
                                                                    (%_2151
                                                                      (if (memq 'eval
                                                                                (%_1297
                                                                                  %_2173
                                                                                  %_2161))
                                                                        (((lambda (%_2175)
                                                                            (begin
                                                                              (set! %_2175
                                                                                (lambda (%_2176)
                                                                                  (if (null? %_2176)
                                                                                    (cdr %_2152)
                                                                                    (cons (cons %_2157
                                                                                                (%_1293
                                                                                                  (car %_2176)
                                                                                                  %_2161))
                                                                                          (%_2175
                                                                                            (cdr %_2176))))))
                                                                              %_2175))
                                                                          #f)
                                                                         %_2174)
                                                                        (cdr %_2152))
                                                                      %_2153
                                                                      %_2154
                                                                      %_2155))
                                                                  %_2171)
                                                           (syntax-error
                                                             %_2170)))
                                                       ($syntax-dispatch
                                                         %_2170
                                                         '(any each-any
                                                               .
                                                               each-any))))
                                                    %_2160)
                                                   (if (memv %_2163
                                                             '(local-syntax-form))
                                                     (%_1348
                                                       %_2159
                                                       %_2160
                                                       %_2157
                                                       %_2161
                                                       %_2162
                                                       (lambda (%_2164
                                                                %_2165
                                                                %_2166
                                                                %_2167)
                                                         (%_2151
                                                           (((lambda (%_2168)
                                                               (begin
                                                                 (set! %_2168
                                                                   (lambda (%_2169)
                                                                     (if (null? %_2169)
                                                                       (cdr %_2152)
                                                                       (cons (cons %_2165
                                                                                   (%_1293
                                                                                     (car %_2169)
                                                                                     %_2166))
                                                                             (%_2168
                                                                               (cdr %_2169))))))
                                                                 %_2168))
                                                             #f)
                                                            %_2164)
                                                           %_2153
                                                           %_2154
                                                           %_2155)))
                                                     (%_2148
                                                       %_2154
                                                       %_2153
                                                       (append
                                                         %_2155
                                                         (cons (cons %_2157
                                                                     (%_1294
                                                                       %_2160
                                                                       %_2161
                                                                       %_2162))
                                                               (cdr %_2152))))))))))))
                                     %_2158))))
                              (cdar %_2152)
                              (caar %_2152)))))
                       %_2151))
                   #f)
                  %_2141
                  '()
                  '()
                  '())))
             #f
             #f
             #f)))
        (set! %_1326
          (lambda (%_2229 %_2230)
            ((lambda (%_2234 %_2233 %_2232 %_2231)
               (begin
                 (set! %_2234
                   (lambda (%_2243 %_2244 %_2245)
                     ((lambda (%_2246)
                        (if %_2246
                          (if (%_1275
                                ((lambda (%_2249)
                                   ((lambda (%_2250)
                                      (if (%_988 %_2250)
                                        (annotation-expression %_2250)
                                        %_2250))
                                    (if (%_1112 %_2249)
                                      (%_1113 %_2249)
                                      %_2249)))
                                 %_2243)
                                %_2246
                                (if (symbol? %_2243)
                                  (%_1172 '((top)))
                                  (%_1172 (%_1114 %_2243))))
                            (cons %_2243 %_2245)
                            %_2245)
                          (%_2232
                            (%_1304 %_2244)
                            (lambda (%_2247 %_2248)
                              (if (%_2231 %_2247 %_2243)
                                (cons %_2247 %_2248)
                                %_2248))
                            %_2245)))
                      (%_1305 %_2244))))
                 (set! %_2233
                   (lambda (%_2251 %_2252 %_2253)
                     (if (%_1303 %_2251)
                       (if (%_1303 %_2252)
                         (call-with-values
                           (lambda ()
                             ((lambda (%_2254 %_2255)
                                (if (fx> (vector-length %_2254)
                                         (vector-length %_2255))
                                  (values %_2251 %_2255)
                                  (values %_2252 %_2254)))
                              (%_1304 %_2251)
                              (%_1304 %_2252)))
                           (lambda (%_2256 %_2257)
                             (%_2232
                               %_2257
                               (lambda (%_2258 %_2259)
                                 (%_2234 %_2258 %_2256 %_2259))
                               %_2253)))
                         (%_2234 %_2252 %_2251 %_2253))
                       (if (%_1303 %_2252)
                         (%_2234 %_2251 %_2252 %_2253)
                         (if (%_2231 %_2251 %_2252)
                           (cons %_2251 %_2253)
                           %_2253)))))
                 (set! %_2232
                   (lambda (%_2260 %_2261 %_2262)
                     ((lambda (%_2263)
                        (((lambda (%_2264)
                            (begin
                              (set! %_2264
                                (lambda (%_2265 %_2266)
                                  (if (= %_2265 %_2263)
                                    %_2266
                                    (%_2264
                                      (+ %_2265 '1)
                                      (%_2261
                                        (vector-ref %_2260 %_2265)
                                        %_2266)))))
                              %_2264))
                          #f)
                         '0
                         %_2262))
                      (vector-length %_2260))))
                 (set! %_2231
                   (lambda (%_2267 %_2268)
                     (if (symbol? %_2267)
                       (if (symbol? %_2268)
                         (eq? %_2267 %_2268)
                         (if (eq? %_2267
                                  ((lambda (%_2271)
                                     ((lambda (%_2272)
                                        (if (%_988 %_2272)
                                          (annotation-expression %_2272)
                                          %_2272))
                                      (if (%_1112 %_2271)
                                        (%_1113 %_2271)
                                        %_2271)))
                                   %_2268))
                           (%_1281
                             (%_1172 (%_1114 %_2268))
                             (%_1172 '((top))))
                           '#f))
                       (if (symbol? %_2268)
                         (if (eq? %_2268
                                  ((lambda (%_2269)
                                     ((lambda (%_2270)
                                        (if (%_988 %_2270)
                                          (annotation-expression %_2270)
                                          %_2270))
                                      (if (%_1112 %_2269)
                                        (%_1113 %_2269)
                                        %_2269)))
                                   %_2267))
                           (%_1281
                             (%_1172 (%_1114 %_2267))
                             (%_1172 '((top))))
                           '#f)
                         (%_1288 %_2267 %_2268)))))
                 (if (not (null? %_2230))
                   (((lambda (%_2235)
                       (begin
                         (set! %_2235
                           (lambda (%_2236 %_2237 %_2238)
                             (if (null? %_2237)
                               (if (not (null? %_2238))
                                 ((lambda (%_2242)
                                    (syntax-error
                                      %_2229
                                      '"duplicate definition for "
                                      (symbol->string (car %_2242))
                                      '" in"))
                                  (syntax-object->datum %_2238))
                                 (void))
                               (((lambda (%_2239)
                                   (begin
                                     (set! %_2239
                                       (lambda (%_2240 %_2241)
                                         (if (null? %_2240)
                                           (%_2235
                                             (car %_2237)
                                             (cdr %_2237)
                                             %_2241)
                                           (%_2239
                                             (cdr %_2240)
                                             (%_2233
                                               %_2236
                                               (car %_2240)
                                               %_2241)))))
                                     %_2239))
                                 #f)
                                %_2237
                                %_2238))))
                         %_2235))
                     #f)
                    (car %_2230)
                    (cdr %_2230)
                    '())
                   (void))))
             #f
             #f
             #f
             #f)))
        (set! %_1325
          (lambda (%_2273 %_2274 %_2275)
            ((lambda (%_2276)
               (begin
                 (set! %_2276
                   (lambda (%_2282 %_2283)
                     (ormap (lambda (%_2284)
                              (if (%_1303 %_2284)
                                ((lambda (%_2285)
                                   (if %_2285
                                     (%_1275
                                       ((lambda (%_2290)
                                          ((lambda (%_2291)
                                             (if (%_988 %_2291)
                                               (annotation-expression %_2291)
                                               %_2291))
                                           (if (%_1112 %_2290)
                                             (%_1113 %_2290)
                                             %_2290)))
                                        %_2282)
                                       %_2285
                                       (%_1172 (%_1114 %_2282)))
                                     ((lambda (%_2286)
                                        (((lambda (%_2287)
                                            (begin
                                              (set! %_2287
                                                (lambda (%_2288)
                                                  (if (fx>= %_2288 '0)
                                                    ((lambda (%_2289)
                                                       (if %_2289
                                                         %_2289
                                                         (%_2287
                                                           (- %_2288 '1))))
                                                     (%_1288
                                                       %_2282
                                                       (vector-ref
                                                         %_2286
                                                         %_2288)))
                                                    '#f)))
                                              %_2287))
                                          #f)
                                         (- (vector-length %_2286) '1)))
                                      (%_1304 %_2284))))
                                 (%_1305 %_2284))
                                (%_1288 %_2282 %_2284)))
                            %_2283)))
                 (((lambda (%_2277)
                     (begin
                       (set! %_2277
                         (lambda (%_2278 %_2279)
                           (if (null? %_2278)
                             (if (not (null? %_2279))
                               (syntax-error
                                 %_2279
                                 '"missing definition for export(s)")
                               (void))
                             ((lambda (%_2280 %_2281)
                                (if (%_2276 %_2280 %_2275)
                                  (%_2277 %_2281 %_2279)
                                  (%_2277 %_2281 (cons %_2280 %_2279))))
                              (car %_2278)
                              (cdr %_2278)))))
                       %_2277))
                   #f)
                  %_2274
                  '())))
             #f)))
        (set! %_1324
          (lambda (%_2292 %_2293 %_2294)
            (set-cdr!
              %_2292
              (%_1154 %_2293 %_2294 (cdr %_2292)))))
        (set! %_1323
          (lambda (%_2295 %_2296)
            (if (null? %_2295)
              '()
              (if (%_1292 (car %_2295) %_2296)
                (%_1323 (cdr %_2295) %_2296)
                (cons (car %_2295) (%_1323 (cdr %_2295) %_2296))))))
        (set! %_1322
          (lambda (%_2297
                   %_2298
                   %_2299
                   %_2300
                   %_2301
                   %_2302
                   %_2303
                   %_2304
                   %_2305
                   %_2306)
            ((lambda (%_2307)
               (%_1327
                 %_2299
                 (%_1294 %_2297 %_2300 %_2301)
                 (map (lambda (%_2308) (cons %_2298 %_2308))
                      %_2306)
                 %_2298
                 %_2305
                 %_2307
                 %_2302
                 %_2303
                 (lambda (%_2309 %_2310)
                   (((lambda (%_2311)
                       (begin
                         (set! %_2311
                           (lambda (%_2312 %_2313 %_2314 %_2315 %_2316)
                             (if (null? %_2312)
                               (((lambda (%_2338)
                                   (begin
                                     (set! %_2338
                                       (lambda (%_2339 %_2340 %_2341)
                                         (if (null? %_2339)
                                           ((lambda (%_2345 %_2346 %_2347)
                                              (begin
                                                (for-each
                                                  (lambda (%_2348)
                                                    (apply (lambda (%_2349
                                                                    %_2350
                                                                    %_2351
                                                                    %_2352)
                                                             (if %_2350
                                                               (%_1211
                                                                 %_2350
                                                                 %_2351)
                                                               (void)))
                                                           %_2348))
                                                  %_2316)
                                                (%_1098
                                                  '#f
                                                  (list (%_1334
                                                          %_2302
                                                          (lambda ()
                                                            (if (null? %_2316)
                                                              (%_1349)
                                                              (%_1098
                                                                '#f
                                                                (map (lambda (%_2353)
                                                                       (apply (lambda (%_2354
                                                                                       %_2355
                                                                                       %_2356
                                                                                       %_2357)
                                                                                (list '$sc-put-cte
                                                                                      (list 'quote
                                                                                            %_2356)
                                                                                      (if (eq? %_2354
                                                                                               'define-syntax-form)
                                                                                        %_2357
                                                                                        (list 'quote
                                                                                              (%_1139
                                                                                                'module
                                                                                                (%_1309
                                                                                                  %_2357
                                                                                                  %_2356))))))
                                                                              %_2353))
                                                                     %_2316)))))
                                                        (%_1334
                                                          %_2302
                                                          (lambda ()
                                                            ((lambda (%_2358)
                                                               ((lambda (%_2359)
                                                                  ((lambda (%_2360)
                                                                     ((lambda ()
                                                                        (if %_2358
                                                                          (list '$sc-put-cte
                                                                                (list 'quote
                                                                                      (if (%_1281
                                                                                            (%_1172
                                                                                              (%_1114
                                                                                                %_2304))
                                                                                            (%_1172
                                                                                              '((top))))
                                                                                        %_2358
                                                                                        ((lambda (%_2362)
                                                                                           (%_1111
                                                                                             %_2358
                                                                                             (%_1171
                                                                                               %_2362
                                                                                               (list (%_1212
                                                                                                       (vector
                                                                                                         %_2358)
                                                                                                       (vector
                                                                                                         %_2362)
                                                                                                       (vector
                                                                                                         (%_999 %_2358)))))))
                                                                                         (%_1172
                                                                                           (%_1114
                                                                                             %_2304)))))
                                                                                %_2360)
                                                                          ((lambda (%_2361)
                                                                             (%_1098
                                                                               '#f
                                                                               (list (list '$sc-put-cte
                                                                                           (list 'quote
                                                                                                 %_2361)
                                                                                           %_2360)
                                                                                     (%_1330
                                                                                       %_2361
                                                                                       %_2359))))
                                                                           (%_999 'tmp))))))
                                                                   (list 'quote
                                                                         (%_1139
                                                                           'module
                                                                           (%_1309
                                                                             %_2305
                                                                             %_2359)))))
                                                                (%_999 %_2358)))
                                                             (if %_2304
                                                               ((lambda (%_2363)
                                                                  ((lambda (%_2364)
                                                                     (if (%_988 %_2364)
                                                                       (annotation-expression
                                                                         %_2364)
                                                                       %_2364))
                                                                   (if (%_1112
                                                                         %_2363)
                                                                     (%_1113
                                                                       %_2363)
                                                                     %_2363)))
                                                                %_2304)
                                                               '#f))))
                                                        (if (null? %_2314)
                                                          (%_1349)
                                                          (%_1098
                                                            '#f
                                                            (map (lambda (%_2365)
                                                                   (list 'define
                                                                         %_2365
                                                                         (%_1349)))
                                                                 %_2314)))
                                                        (%_1099
                                                          '#f
                                                          %_2340
                                                          %_2346
                                                          (%_1098
                                                            '#f
                                                            (list (if (null? %_2314)
                                                                    (%_1349)
                                                                    (%_1098
                                                                      '#f
                                                                      (map (lambda (%_2366
                                                                                    %_2367)
                                                                             (list 'set!
                                                                                   %_2366
                                                                                   %_2367))
                                                                           %_2314
                                                                           %_2345)))
                                                                  (if (null? %_2347)
                                                                    (%_1349)
                                                                    (%_1098
                                                                      '#f
                                                                      %_2347)))))
                                                        (%_1349)))))
                                            (map (lambda (%_2368)
                                                   (%_1335
                                                     (cdr %_2368)
                                                     (car %_2368)
                                                     '(())))
                                                 %_2315)
                                            (map (lambda (%_2369)
                                                   (%_1335
                                                     (cdr %_2369)
                                                     (car %_2369)
                                                     '(())))
                                                 %_2341)
                                            (map (lambda (%_2370)
                                                   (%_1335
                                                     (cdr %_2370)
                                                     (car %_2370)
                                                     '(())))
                                                 %_2310))
                                           ((lambda (%_2342)
                                              ((lambda (%_2343)
                                                 (if (memv %_2343
                                                           '(define-form))
                                                   ((lambda (%_2344)
                                                      (begin
                                                        (%_1324
                                                          %_2298
                                                          (%_1210
                                                            (%_1314 %_2342))
                                                          (%_1139
                                                            'lexical
                                                            %_2344))
                                                        (%_2338
                                                          (cdr %_2339)
                                                          (cons %_2344 %_2340)
                                                          (cons (%_1316 %_2342)
                                                                %_2341))))
                                                    (%_1354 (%_1313 %_2342)))
                                                   (if (memv %_2343
                                                             '(define-syntax-form
                                                                module-form))
                                                     (%_2338
                                                       (cdr %_2339)
                                                       %_2340
                                                       %_2341)
                                                     (error 'sc-expand-internal
                                                            '"unexpected module binding type"))))
                                               (%_1312 %_2342)))
                                            (car %_2339)))))
                                     %_2338))
                                 #f)
                                %_2313
                                '()
                                '())
                               ((lambda (%_2317 %_2318)
                                  ((lambda (%_2319)
                                     (begin
                                       (set! %_2319
                                         (lambda (%_2331 %_2332 %_2333 %_2334)
                                           (((lambda (%_2335)
                                               (begin
                                                 (set! %_2335
                                                   (lambda (%_2336 %_2337)
                                                     (if (null? %_2336)
                                                       (%_2334)
                                                       (if (%_1288
                                                             (%_1313
                                                               (car %_2336))
                                                             %_2331)
                                                         (%_2333
                                                           (car %_2336)
                                                           (%_1278
                                                             (reverse %_2337)
                                                             (cdr %_2336)))
                                                         (%_2335
                                                           (cdr %_2336)
                                                           (cons (car %_2336)
                                                                 %_2337))))))
                                                 %_2335))
                                             #f)
                                            %_2332
                                            '())))
                                       (%_2319
                                         %_2317
                                         %_2313
                                         (lambda (%_2320 %_2321)
                                           ((lambda (%_2322 %_2323 %_2324)
                                              ((lambda (%_2325 %_2326)
                                                 ((lambda (%_2327)
                                                    (if (memv %_2327
                                                              '(define-form))
                                                      (begin
                                                        (%_1211 %_2323 %_2326)
                                                        (%_2311
                                                          %_2325
                                                          %_2321
                                                          (cons %_2326 %_2314)
                                                          (cons (%_1316 %_2320)
                                                                %_2315)
                                                          %_2316))
                                                      (if (memv %_2327
                                                                '(define-syntax-form))
                                                        (%_2311
                                                          %_2325
                                                          %_2321
                                                          %_2314
                                                          %_2315
                                                          (cons (list %_2322
                                                                      %_2323
                                                                      %_2326
                                                                      (%_1316
                                                                        %_2320))
                                                                %_2316))
                                                        (if (memv %_2327
                                                                  '(module-form))
                                                          ((lambda (%_2328)
                                                             (%_2311
                                                               (append
                                                                 (%_1301
                                                                   %_2328)
                                                                 %_2325)
                                                               %_2321
                                                               %_2314
                                                               %_2315
                                                               (cons (list %_2322
                                                                           %_2323
                                                                           %_2326
                                                                           %_2328)
                                                                     %_2316)))
                                                           (%_1316 %_2320))
                                                          (error 'sc-expand-internal
                                                                 '"unexpected module binding type")))))
                                                  %_2322))
                                               (append %_2324 %_2318)
                                               (%_999 ((lambda (%_2329)
                                                         ((lambda (%_2330)
                                                            (if (%_988 %_2330)
                                                              (annotation-expression
                                                                %_2330)
                                                              %_2330))
                                                          (if (%_1112 %_2329)
                                                            (%_1113 %_2329)
                                                            %_2329)))
                                                       %_2317))))
                                            (%_1312 %_2320)
                                            (%_1314 %_2320)
                                            (%_1315 %_2320)))
                                         (lambda ()
                                           (%_2311
                                             %_2318
                                             %_2313
                                             %_2314
                                             %_2315
                                             %_2316)))))
                                   #f))
                                (car %_2312)
                                (cdr %_2312)))))
                         %_2311))
                     #f)
                    %_2307
                    %_2309
                    '()
                    '()
                    '()))))
             (%_1301 %_2305))))
        (set! %_1321
          (lambda (%_2371 %_2372)
            (vector-set! %_2371 '5 %_2372)))
        (set! %_1320
          (lambda (%_2373 %_2374)
            (vector-set! %_2373 '4 %_2374)))
        (set! %_1319
          (lambda (%_2375 %_2376)
            (vector-set! %_2375 '3 %_2376)))
        (set! %_1318
          (lambda (%_2377 %_2378)
            (vector-set! %_2377 '2 %_2378)))
        (set! %_1317
          (lambda (%_2379 %_2380)
            (vector-set! %_2379 '1 %_2380)))
        (set! %_1316
          (lambda (%_2381) (vector-ref %_2381 '5)))
        (set! %_1315
          (lambda (%_2382) (vector-ref %_2382 '4)))
        (set! %_1314
          (lambda (%_2383) (vector-ref %_2383 '3)))
        (set! %_1313
          (lambda (%_2384) (vector-ref %_2384 '2)))
        (set! %_1312
          (lambda (%_2385) (vector-ref %_2385 '1)))
        (set! %_1311
          (lambda (%_2386)
            (if (vector? %_2386)
              (if (= (vector-length %_2386) '6)
                (eq? (vector-ref %_2386 '0) 'module-binding)
                '#f)
              '#f)))
        (set! %_1310
          (lambda (%_2387 %_2388 %_2389 %_2390 %_2391)
            (vector
              'module-binding
              %_2387
              %_2388
              %_2389
              %_2390
              %_2391)))
        (set! %_1309
          (lambda (%_2392 %_2393)
            (%_1302
              (list->vector
                (map (lambda (%_2394)
                       (%_1277 (if (pair? %_2394) (car %_2394) %_2394)))
                     %_2392))
              %_2393)))
        (set! %_1308
          (lambda (%_2395)
            (%_1302
              (list->vector
                (map (lambda (%_2396)
                       (if (pair? %_2396) (car %_2396) %_2396))
                     %_2395))
              '#f)))
        (set! %_1307
          (lambda (%_2397 %_2398)
            (vector-set! %_2397 '2 %_2398)))
        (set! %_1306
          (lambda (%_2399 %_2400)
            (vector-set! %_2399 '1 %_2400)))
        (set! %_1305
          (lambda (%_2401) (vector-ref %_2401 '2)))
        (set! %_1304
          (lambda (%_2402) (vector-ref %_2402 '1)))
        (set! %_1303
          (lambda (%_2403)
            (if (vector? %_2403)
              (if (= (vector-length %_2403) '3)
                (eq? (vector-ref %_2403 '0) 'interface)
                '#f)
              '#f)))
        (set! %_1302
          (lambda (%_2404 %_2405)
            (vector 'interface %_2404 %_2405)))
        (set! %_1301
          (lambda (%_2406)
            (((lambda (%_2407)
                (begin
                  (set! %_2407
                    (lambda (%_2408 %_2409)
                      (if (null? %_2408)
                        %_2409
                        (%_2407
                          (cdr %_2408)
                          (if (pair? (car %_2408))
                            (%_2407 (car %_2408) %_2409)
                            (cons (car %_2408) %_2409))))))
                  %_2407))
              #f)
             %_2406
             '())))
        (set! %_1300
          (lambda (%_2410 %_2411 %_2412 %_2413 %_2414 %_2415)
            (call-with-values
              (lambda ()
                (%_1298 %_2410 %_2411 %_2412 '#f %_2415))
              (lambda (%_2416 %_2417 %_2418 %_2419 %_2420)
                ((lambda (%_2421)
                   (if (memv %_2421 '(begin-form))
                     ((lambda (%_2472)
                        ((lambda (%_2473)
                           (if %_2473
                             (apply (lambda (%_2479) (%_1349)) %_2473)
                             ((lambda (%_2474)
                                (if %_2474
                                  (apply (lambda (%_2475 %_2476 %_2477)
                                           (%_1296
                                             (cons %_2476 %_2477)
                                             %_2411
                                             %_2419
                                             %_2420
                                             %_2413
                                             %_2414
                                             %_2415))
                                         %_2474)
                                  (syntax-error %_2472)))
                              ($syntax-dispatch
                                %_2472
                                '(any any . each-any)))))
                         ($syntax-dispatch %_2472 '(any))))
                      %_2418)
                     (if (memv %_2421 '(local-syntax-form))
                       (%_1348
                         %_2417
                         %_2418
                         %_2411
                         %_2419
                         %_2420
                         (lambda (%_2468 %_2469 %_2470 %_2471)
                           (%_1296
                             %_2468
                             %_2469
                             %_2470
                             %_2471
                             %_2413
                             %_2414
                             %_2415)))
                       (if (memv %_2421 '(eval-when-form))
                         ((lambda (%_2456)
                            ((lambda (%_2457)
                               (if %_2457
                                 (apply (lambda (%_2458 %_2459 %_2460 %_2461)
                                          ((lambda (%_2462 %_2463)
                                             ((lambda (%_2464 %_2465)
                                                (if (if (null? %_2464)
                                                      (null? %_2465)
                                                      '#f)
                                                  (%_1349)
                                                  (%_1296
                                                    %_2463
                                                    %_2411
                                                    %_2419
                                                    %_2420
                                                    %_2464
                                                    %_2465
                                                    %_2415)))
                                              (%_1331 %_2462 %_2413)
                                              (%_1331 %_2462 %_2414)))
                                           (%_1297 %_2459 %_2419)
                                           (cons %_2460 %_2461)))
                                        %_2457)
                                 (syntax-error %_2456)))
                             ($syntax-dispatch
                               %_2456
                               '(any each-any any . each-any))))
                          %_2418)
                         (if (memv %_2421 '(define-syntax-form))
                           (%_1346
                             %_2418
                             %_2419
                             %_2420
                             (lambda (%_2445 %_2446 %_2447)
                               ((lambda (%_2448)
                                  (begin
                                    ((lambda (%_2449)
                                       ((lambda (%_2450)
                                          ((lambda (%_2451)
                                             (if (memv %_2451
                                                       '(displaced-lexical))
                                               (%_1158 %_2448)
                                               (void)))
                                           (%_1140 %_2450)))
                                        (%_1161 %_2449 %_2411)))
                                     (%_1285 %_2448 '(())))
                                    (%_1334
                                      %_2413
                                      (lambda ()
                                        (list '$sc-put-cte
                                              (list 'quote
                                                    ((lambda (%_2452)
                                                       (if (%_1281
                                                             (%_1172
                                                               (%_1114 %_2448))
                                                             (%_1172 '((top))))
                                                         %_2452
                                                         ((lambda (%_2453)
                                                            (%_1111
                                                              %_2452
                                                              (%_1171
                                                                %_2453
                                                                (list (%_1212
                                                                        (vector
                                                                          %_2452)
                                                                        (vector
                                                                          %_2453)
                                                                        (vector
                                                                          (%_999 %_2452)))))))
                                                          (%_1172
                                                            (%_1114 %_2448)))))
                                                     ((lambda (%_2454)
                                                        ((lambda (%_2455)
                                                           (if (%_988 %_2455)
                                                             (annotation-expression
                                                               %_2455)
                                                             %_2455))
                                                         (if (%_1112 %_2454)
                                                           (%_1113 %_2454)
                                                           %_2454)))
                                                      %_2448)))
                                              (%_1335
                                                %_2446
                                                (%_1157 %_2411)
                                                %_2447))))))
                                (%_1293 %_2445 %_2447))))
                           (if (memv %_2421 '(define-form))
                             (%_1345
                               %_2418
                               %_2419
                               %_2420
                               (lambda (%_2433 %_2434 %_2435)
                                 ((lambda (%_2436)
                                    (begin
                                      ((lambda (%_2437)
                                         ((lambda (%_2438)
                                            ((lambda (%_2439)
                                               (if (memv %_2439
                                                         '(displaced-lexical))
                                                 (%_1158 %_2436)
                                                 (void)))
                                             (%_1140 %_2438)))
                                          (%_1161 %_2437 %_2411)))
                                       (%_1285 %_2436 '(())))
                                      ((lambda (%_2440)
                                         ((lambda (%_2441)
                                            (%_1098
                                              '#f
                                              (list (%_1334
                                                      %_2413
                                                      (lambda ()
                                                        (list '$sc-put-cte
                                                              (list 'quote
                                                                    (if (eq? %_2440
                                                                             %_2441)
                                                                      %_2440
                                                                      ((lambda (%_2442)
                                                                         (%_1111
                                                                           %_2440
                                                                           (%_1171
                                                                             %_2442
                                                                             (list (%_1212
                                                                                     (vector
                                                                                       %_2440)
                                                                                     (vector
                                                                                       %_2442)
                                                                                     (vector
                                                                                       %_2441))))))
                                                                       (%_1172
                                                                         (%_1114
                                                                           %_2436)))))
                                                              (list 'quote
                                                                    (%_1139
                                                                      'global
                                                                      %_2441)))))
                                                    (%_1333
                                                      %_2414
                                                      (lambda ()
                                                        (list 'define
                                                              %_2441
                                                              (%_1335
                                                                %_2434
                                                                %_2411
                                                                %_2435)))))))
                                          (if (%_1281
                                                (%_1172 (%_1114 %_2436))
                                                (%_1172 '((top))))
                                            %_2440
                                            (%_999 %_2440))))
                                       ((lambda (%_2443)
                                          ((lambda (%_2444)
                                             (if (%_988 %_2444)
                                               (annotation-expression %_2444)
                                               %_2444))
                                           (if (%_1112 %_2443)
                                             (%_1113 %_2443)
                                             %_2443)))
                                        %_2436))))
                                  (%_1293 %_2433 %_2435))))
                             (if (memv %_2421 '(module-form))
                               ((lambda (%_2425 %_2426)
                                  (%_1343
                                    %_2418
                                    %_2419
                                    %_2420
                                    (%_1171
                                      (%_1172 %_2419)
                                      (cons %_2426 (%_1173 %_2419)))
                                    (lambda (%_2427 %_2428 %_2429)
                                      (if %_2427
                                        (begin
                                          ((lambda (%_2430)
                                             ((lambda (%_2431)
                                                ((lambda (%_2432)
                                                   (if (memv %_2432
                                                             '(displaced-lexical))
                                                     (%_1158
                                                       (%_1293 %_2427 %_2419))
                                                     (void)))
                                                 (%_1140 %_2431)))
                                              (%_1161 %_2430 %_2425)))
                                           (%_1285 %_2427 '(())))
                                          (%_1322
                                            %_2418
                                            %_2425
                                            %_2426
                                            %_2419
                                            %_2420
                                            %_2413
                                            %_2414
                                            %_2427
                                            %_2428
                                            %_2429))
                                        (%_1322
                                          %_2418
                                          %_2425
                                          %_2426
                                          %_2419
                                          %_2420
                                          %_2413
                                          %_2414
                                          '#f
                                          %_2428
                                          %_2429)))))
                                (cons '("top-level module placeholder"
                                        placeholder)
                                      %_2411)
                                (%_1212 '() '() '()))
                               (if (memv %_2421 '(import-form))
                                 (%_1344
                                   %_2418
                                   %_2419
                                   %_2420
                                   (lambda (%_2422)
                                     (%_1334
                                       %_2413
                                       (lambda ()
                                         (begin
                                           (if %_2417
                                             (syntax-error
                                               (%_1294 %_2418 %_2419 %_2420)
                                               '"not valid at top-level")
                                             (void))
                                           ((lambda (%_2423)
                                              ((lambda (%_2424)
                                                 (if (memv %_2424 '(module))
                                                   (%_1330
                                                     %_2422
                                                     (%_1305 (%_1141 %_2423)))
                                                   (if (memv %_2424
                                                             '(displaced-lexical))
                                                     (%_1158 %_2422)
                                                     (syntax-error
                                                       %_2422
                                                       '"import from unknown module"))))
                                               (%_1140 %_2423)))
                                            (%_1161
                                              (%_1285 %_2422 '(()))
                                              '())))))))
                                 (%_1333
                                   %_2414
                                   (lambda ()
                                     (%_1336
                                       %_2416
                                       %_2417
                                       %_2418
                                       %_2411
                                       %_2419
                                       %_2420)))))))))))
                 %_2416)))))
        (set! %_1299
          (lambda (%_2480 %_2481 %_2482 %_2483)
            (call-with-values
              (lambda ()
                (%_1298 %_2480 %_2481 %_2482 '#f %_2483))
              (lambda (%_2484 %_2485 %_2486 %_2487 %_2488)
                (%_1336
                  %_2484
                  %_2485
                  %_2486
                  %_2481
                  %_2487
                  %_2488)))))
        (set! %_1298
          (lambda (%_2489 %_2490 %_2491 %_2492 %_2493)
            (if (symbol? %_2489)
              ((lambda (%_2500)
                 ((lambda (%_2501)
                    ((lambda (%_2502)
                       ((lambda ()
                          ((lambda (%_2503)
                             (if (memv %_2503 '(lexical))
                               (values
                                 %_2502
                                 (%_1141 %_2501)
                                 %_2489
                                 %_2491
                                 %_2492)
                               (if (memv %_2503 '(global))
                                 (values
                                   %_2502
                                   (%_1141 %_2501)
                                   %_2489
                                   %_2491
                                   %_2492)
                                 (if (memv %_2503 '(macro macro!))
                                   (%_1298
                                     (%_1339
                                       (%_1141 %_2501)
                                       %_2489
                                       %_2490
                                       %_2491
                                       %_2492
                                       %_2493)
                                     %_2490
                                     '(())
                                     '#f
                                     %_2493)
                                   (values
                                     %_2502
                                     (%_1141 %_2501)
                                     %_2489
                                     %_2491
                                     %_2492)))))
                           %_2502))))
                     (%_1140 %_2501)))
                  (%_1161 %_2500 %_2490)))
               (%_1285 %_2489 %_2491))
              (if (pair? %_2489)
                ((lambda (%_2495)
                   (if (%_1164 %_2495)
                     ((lambda (%_2496)
                        ((lambda (%_2497)
                           ((lambda (%_2498)
                              ((lambda ()
                                 ((lambda (%_2499)
                                    (if (memv %_2499 '(lexical))
                                      (values
                                        'lexical-call
                                        (%_1141 %_2497)
                                        %_2489
                                        %_2491
                                        %_2492)
                                      (if (memv %_2499 '(macro macro!))
                                        (%_1298
                                          (%_1339
                                            (%_1141 %_2497)
                                            %_2489
                                            %_2490
                                            %_2491
                                            %_2492
                                            %_2493)
                                          %_2490
                                          '(())
                                          '#f
                                          %_2493)
                                        (if (memv %_2499 '(core))
                                          (values
                                            %_2498
                                            (%_1141 %_2497)
                                            %_2489
                                            %_2491
                                            %_2492)
                                          (if (memv %_2499 '(local-syntax))
                                            (values
                                              'local-syntax-form
                                              (%_1141 %_2497)
                                              %_2489
                                              %_2491
                                              %_2492)
                                            (if (memv %_2499 '(begin))
                                              (values
                                                'begin-form
                                                '#f
                                                %_2489
                                                %_2491
                                                %_2492)
                                              (if (memv %_2499 '(eval-when))
                                                (values
                                                  'eval-when-form
                                                  '#f
                                                  %_2489
                                                  %_2491
                                                  %_2492)
                                                (if (memv %_2499 '(define))
                                                  (values
                                                    'define-form
                                                    '#f
                                                    %_2489
                                                    %_2491
                                                    %_2492)
                                                  (if (memv %_2499
                                                            '(define-syntax))
                                                    (values
                                                      'define-syntax-form
                                                      '#f
                                                      %_2489
                                                      %_2491
                                                      %_2492)
                                                    (if (memv %_2499
                                                              '(module-key))
                                                      (values
                                                        'module-form
                                                        '#f
                                                        %_2489
                                                        %_2491
                                                        %_2492)
                                                      (if (memv %_2499
                                                                '(import))
                                                        (values
                                                          'import-form
                                                          (if (%_1141 %_2497)
                                                            (%_1293
                                                              %_2495
                                                              %_2491)
                                                            '#f)
                                                          %_2489
                                                          %_2491
                                                          %_2492)
                                                        (if (memv %_2499
                                                                  '(set!))
                                                          (%_1338
                                                            %_2489
                                                            %_2490
                                                            %_2491
                                                            %_2492
                                                            %_2493)
                                                          (values
                                                            'call
                                                            '#f
                                                            %_2489
                                                            %_2491
                                                            %_2492)))))))))))))
                                  %_2498))))
                            (%_1140 %_2497)))
                         (%_1161 %_2496 %_2490)))
                      (%_1285 %_2495 %_2491))
                     (values 'call '#f %_2489 %_2491 %_2492)))
                 (car %_2489))
                (if (%_1112 %_2489)
                  (%_1298
                    (%_1113 %_2489)
                    %_2490
                    (%_1279 %_2491 (%_1114 %_2489))
                    '#f
                    %_2493)
                  (if (%_988 %_2489)
                    (%_1298
                      (annotation-expression %_2489)
                      %_2490
                      %_2491
                      (annotation-source %_2489)
                      %_2493)
                    (if ((lambda (%_2494) (not (pair? %_2494))) %_2489)
                      (values 'constant '#f %_2489 %_2491 %_2492)
                      (values 'other '#f %_2489 %_2491 %_2492))))))))
        (set! %_1297
          (lambda (%_2504 %_2505)
            (map (lambda (%_2506)
                   (if (%_1287
                         %_2506
                         '#3(syntax-object
                             compile
                             ((top)
                              #4(ribcage ())
                              #4(ribcage ())
                              #4(ribcage #1(x) #1((top)) #1("i"))
                              #4(ribcage ())
                              #4(ribcage #2(when-list w) #2((top)) #2("i" "i"))
                              #4(ribcage
                                 (lambda-var-list
                                   gen-var
                                   strip
                                   strip*
                                   strip-annotation
                                   ellipsis?
                                   chi-void
                                   chi-local-syntax
                                   chi-lambda-clause
                                   parse-define-syntax
                                   parse-define
                                   parse-import
                                   parse-module
                                   do-import!
                                   chi-internal
                                   chi-body
                                   chi-macro
                                   chi-set!
                                   chi-application
                                   chi-expr
                                   chi
                                   ct-eval/residualize
                                   rt-eval/residualize
                                   initial-mode-set
                                   update-mode-set
                                   do-top-import
                                   vfor-each
                                   vmap
                                   chi-external
                                   check-defined-ids
                                   check-module-exports
                                   extend-store!
                                   id-set-diff
                                   chi-top-module
                                   set-module-binding-val!
                                   set-module-binding-imps!
                                   set-module-binding-label!
                                   set-module-binding-id!
                                   set-module-binding-type!
                                   module-binding-val
                                   module-binding-imps
                                   module-binding-label
                                   module-binding-id
                                   module-binding-type
                                   module-binding?
                                   make-module-binding
                                   make-resolved-interface
                                   make-trimmed-interface
                                   set-interface-token!
                                   set-interface-exports!
                                   interface-token
                                   interface-exports
                                   interface?
                                   make-interface
                                   flatten-exports
                                   chi-top
                                   chi-top-expr
                                   syntax-type
                                   chi-when-list
                                   chi-top-sequence
                                   chi-sequence
                                   source-wrap
                                   wrap
                                   bound-id-member?
                                   invalid-ids-error
                                   distinct-bound-ids?
                                   valid-bound-ids?
                                   bound-id=?
                                   literal-id=?
                                   free-id=?
                                   id-var-name
                                   id-var-name-loc
                                   id-var-name&marks
                                   id-var-name-loc&marks
                                   same-marks?
                                   join-marks
                                   join-wraps
                                   smart-append
                                   make-trimmed-syntax-object
                                   make-binding-wrap
                                   lookup-import-binding-name
                                   extend-ribcage-subst!
                                   extend-ribcage-barrier-help!
                                   extend-ribcage-barrier!
                                   extend-ribcage!
                                   make-empty-ribcage
                                   import-token-key
                                   import-token?
                                   make-import-token
                                   barrier-marker
                                   new-mark
                                   anti-mark
                                   the-anti-mark
                                   only-top-marked?
                                   top-marked?
                                   top-wrap
                                   empty-wrap
                                   set-ribcage-labels!
                                   set-ribcage-marks!
                                   set-ribcage-symnames!
                                   ribcage-labels
                                   ribcage-marks
                                   ribcage-symnames
                                   ribcage?
                                   make-ribcage
                                   set-indirect-label!
                                   get-indirect-label
                                   indirect-label?
                                   gen-indirect-label
                                   gen-labels
                                   label?
                                   gen-label
                                   make-rename
                                   rename-marks
                                   rename-new
                                   rename-old
                                   subst-rename?
                                   wrap-subst
                                   wrap-marks
                                   make-wrap
                                   id-sym-name&marks
                                   id-sym-name
                                   id?
                                   nonsymbol-id?
                                   global-extend
                                   lookup
                                   sanitize-binding
                                   lookup*
                                   displaced-lexical-error
                                   transformer-env
                                   extend-var-env*
                                   extend-env*
                                   extend-env
                                   null-env
                                   binding?
                                   set-binding-value!
                                   set-binding-type!
                                   binding-value
                                   binding-type
                                   make-binding
                                   arg-check
                                   source-annotation
                                   no-source
                                   unannotate
                                   set-syntax-object-wrap!
                                   set-syntax-object-expression!
                                   syntax-object-wrap
                                   syntax-object-expression
                                   syntax-object?
                                   make-syntax-object
                                   self-evaluating?
                                   build-lexical-var
                                   build-letrec
                                   build-sequence
                                   build-data
                                   build-primref
                                   build-lambda
                                   build-revisit-only
                                   build-visit-only
                                   build-cte-install
                                   build-module-definition
                                   build-global-definition
                                   build-global-assignment
                                   build-global-reference
                                   build-lexical-assignment
                                   build-lexical-reference
                                   build-conditional
                                   build-application
                                   generate-id
                                   get-import-binding
                                   get-global-definition-hook
                                   put-global-definition-hook
                                   gensym-hook
                                   error-hook
                                   local-eval-hook
                                   top-level-eval-hook
                                   annotation?
                                   fx<
                                   fx=
                                   fx-
                                   fx+
                                   noexpand
                                   define-structure
                                   unless
                                   when)
                                 ((top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top)
                                  (top))
                                 ("i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"
                                  "i"))
                              #4(ribcage ((import-token . *top*)) ())
                              #4(ribcage ((import-token . *top*)) ()))))
                     'compile
                     (if (%_1287
                           %_2506
                           '#3(syntax-object
                               load
                               ((top)
                                #4(ribcage ())
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ())
                                #4(ribcage
                                   #2(when-list w)
                                   #2((top))
                                   #2("i" "i"))
                                #4(ribcage
                                   (lambda-var-list
                                     gen-var
                                     strip
                                     strip*
                                     strip-annotation
                                     ellipsis?
                                     chi-void
                                     chi-local-syntax
                                     chi-lambda-clause
                                     parse-define-syntax
                                     parse-define
                                     parse-import
                                     parse-module
                                     do-import!
                                     chi-internal
                                     chi-body
                                     chi-macro
                                     chi-set!
                                     chi-application
                                     chi-expr
                                     chi
                                     ct-eval/residualize
                                     rt-eval/residualize
                                     initial-mode-set
                                     update-mode-set
                                     do-top-import
                                     vfor-each
                                     vmap
                                     chi-external
                                     check-defined-ids
                                     check-module-exports
                                     extend-store!
                                     id-set-diff
                                     chi-top-module
                                     set-module-binding-val!
                                     set-module-binding-imps!
                                     set-module-binding-label!
                                     set-module-binding-id!
                                     set-module-binding-type!
                                     module-binding-val
                                     module-binding-imps
                                     module-binding-label
                                     module-binding-id
                                     module-binding-type
                                     module-binding?
                                     make-module-binding
                                     make-resolved-interface
                                     make-trimmed-interface
                                     set-interface-token!
                                     set-interface-exports!
                                     interface-token
                                     interface-exports
                                     interface?
                                     make-interface
                                     flatten-exports
                                     chi-top
                                     chi-top-expr
                                     syntax-type
                                     chi-when-list
                                     chi-top-sequence
                                     chi-sequence
                                     source-wrap
                                     wrap
                                     bound-id-member?
                                     invalid-ids-error
                                     distinct-bound-ids?
                                     valid-bound-ids?
                                     bound-id=?
                                     literal-id=?
                                     free-id=?
                                     id-var-name
                                     id-var-name-loc
                                     id-var-name&marks
                                     id-var-name-loc&marks
                                     same-marks?
                                     join-marks
                                     join-wraps
                                     smart-append
                                     make-trimmed-syntax-object
                                     make-binding-wrap
                                     lookup-import-binding-name
                                     extend-ribcage-subst!
                                     extend-ribcage-barrier-help!
                                     extend-ribcage-barrier!
                                     extend-ribcage!
                                     make-empty-ribcage
                                     import-token-key
                                     import-token?
                                     make-import-token
                                     barrier-marker
                                     new-mark
                                     anti-mark
                                     the-anti-mark
                                     only-top-marked?
                                     top-marked?
                                     top-wrap
                                     empty-wrap
                                     set-ribcage-labels!
                                     set-ribcage-marks!
                                     set-ribcage-symnames!
                                     ribcage-labels
                                     ribcage-marks
                                     ribcage-symnames
                                     ribcage?
                                     make-ribcage
                                     set-indirect-label!
                                     get-indirect-label
                                     indirect-label?
                                     gen-indirect-label
                                     gen-labels
                                     label?
                                     gen-label
                                     make-rename
                                     rename-marks
                                     rename-new
                                     rename-old
                                     subst-rename?
                                     wrap-subst
                                     wrap-marks
                                     make-wrap
                                     id-sym-name&marks
                                     id-sym-name
                                     id?
                                     nonsymbol-id?
                                     global-extend
                                     lookup
                                     sanitize-binding
                                     lookup*
                                     displaced-lexical-error
                                     transformer-env
                                     extend-var-env*
                                     extend-env*
                                     extend-env
                                     null-env
                                     binding?
                                     set-binding-value!
                                     set-binding-type!
                                     binding-value
                                     binding-type
                                     make-binding
                                     arg-check
                                     source-annotation
                                     no-source
                                     unannotate
                                     set-syntax-object-wrap!
                                     set-syntax-object-expression!
                                     syntax-object-wrap
                                     syntax-object-expression
                                     syntax-object?
                                     make-syntax-object
                                     self-evaluating?
                                     build-lexical-var
                                     build-letrec
                                     build-sequence
                                     build-data
                                     build-primref
                                     build-lambda
                                     build-revisit-only
                                     build-visit-only
                                     build-cte-install
                                     build-module-definition
                                     build-global-definition
                                     build-global-assignment
                                     build-global-reference
                                     build-lexical-assignment
                                     build-lexical-reference
                                     build-conditional
                                     build-application
                                     generate-id
                                     get-import-binding
                                     get-global-definition-hook
                                     put-global-definition-hook
                                     gensym-hook
                                     error-hook
                                     local-eval-hook
                                     top-level-eval-hook
                                     annotation?
                                     fx<
                                     fx=
                                     fx-
                                     fx+
                                     noexpand
                                     define-structure
                                     unless
                                     when)
                                   ((top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top)
                                    (top))
                                   ("i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"
                                    "i"))
                                #4(ribcage ((import-token . *top*)) ())
                                #4(ribcage ((import-token . *top*)) ()))))
                       'load
                       (if (%_1287
                             %_2506
                             '#3(syntax-object
                                 visit
                                 ((top)
                                  #4(ribcage ())
                                  #4(ribcage ())
                                  #4(ribcage #1(x) #1((top)) #1("i"))
                                  #4(ribcage ())
                                  #4(ribcage
                                     #2(when-list w)
                                     #2((top))
                                     #2("i" "i"))
                                  #4(ribcage
                                     (lambda-var-list
                                       gen-var
                                       strip
                                       strip*
                                       strip-annotation
                                       ellipsis?
                                       chi-void
                                       chi-local-syntax
                                       chi-lambda-clause
                                       parse-define-syntax
                                       parse-define
                                       parse-import
                                       parse-module
                                       do-import!
                                       chi-internal
                                       chi-body
                                       chi-macro
                                       chi-set!
                                       chi-application
                                       chi-expr
                                       chi
                                       ct-eval/residualize
                                       rt-eval/residualize
                                       initial-mode-set
                                       update-mode-set
                                       do-top-import
                                       vfor-each
                                       vmap
                                       chi-external
                                       check-defined-ids
                                       check-module-exports
                                       extend-store!
                                       id-set-diff
                                       chi-top-module
                                       set-module-binding-val!
                                       set-module-binding-imps!
                                       set-module-binding-label!
                                       set-module-binding-id!
                                       set-module-binding-type!
                                       module-binding-val
                                       module-binding-imps
                                       module-binding-label
                                       module-binding-id
                                       module-binding-type
                                       module-binding?
                                       make-module-binding
                                       make-resolved-interface
                                       make-trimmed-interface
                                       set-interface-token!
                                       set-interface-exports!
                                       interface-token
                                       interface-exports
                                       interface?
                                       make-interface
                                       flatten-exports
                                       chi-top
                                       chi-top-expr
                                       syntax-type
                                       chi-when-list
                                       chi-top-sequence
                                       chi-sequence
                                       source-wrap
                                       wrap
                                       bound-id-member?
                                       invalid-ids-error
                                       distinct-bound-ids?
                                       valid-bound-ids?
                                       bound-id=?
                                       literal-id=?
                                       free-id=?
                                       id-var-name
                                       id-var-name-loc
                                       id-var-name&marks
                                       id-var-name-loc&marks
                                       same-marks?
                                       join-marks
                                       join-wraps
                                       smart-append
                                       make-trimmed-syntax-object
                                       make-binding-wrap
                                       lookup-import-binding-name
                                       extend-ribcage-subst!
                                       extend-ribcage-barrier-help!
                                       extend-ribcage-barrier!
                                       extend-ribcage!
                                       make-empty-ribcage
                                       import-token-key
                                       import-token?
                                       make-import-token
                                       barrier-marker
                                       new-mark
                                       anti-mark
                                       the-anti-mark
                                       only-top-marked?
                                       top-marked?
                                       top-wrap
                                       empty-wrap
                                       set-ribcage-labels!
                                       set-ribcage-marks!
                                       set-ribcage-symnames!
                                       ribcage-labels
                                       ribcage-marks
                                       ribcage-symnames
                                       ribcage?
                                       make-ribcage
                                       set-indirect-label!
                                       get-indirect-label
                                       indirect-label?
                                       gen-indirect-label
                                       gen-labels
                                       label?
                                       gen-label
                                       make-rename
                                       rename-marks
                                       rename-new
                                       rename-old
                                       subst-rename?
                                       wrap-subst
                                       wrap-marks
                                       make-wrap
                                       id-sym-name&marks
                                       id-sym-name
                                       id?
                                       nonsymbol-id?
                                       global-extend
                                       lookup
                                       sanitize-binding
                                       lookup*
                                       displaced-lexical-error
                                       transformer-env
                                       extend-var-env*
                                       extend-env*
                                       extend-env
                                       null-env
                                       binding?
                                       set-binding-value!
                                       set-binding-type!
                                       binding-value
                                       binding-type
                                       make-binding
                                       arg-check
                                       source-annotation
                                       no-source
                                       unannotate
                                       set-syntax-object-wrap!
                                       set-syntax-object-expression!
                                       syntax-object-wrap
                                       syntax-object-expression
                                       syntax-object?
                                       make-syntax-object
                                       self-evaluating?
                                       build-lexical-var
                                       build-letrec
                                       build-sequence
                                       build-data
                                       build-primref
                                       build-lambda
                                       build-revisit-only
                                       build-visit-only
                                       build-cte-install
                                       build-module-definition
                                       build-global-definition
                                       build-global-assignment
                                       build-global-reference
                                       build-lexical-assignment
                                       build-lexical-reference
                                       build-conditional
                                       build-application
                                       generate-id
                                       get-import-binding
                                       get-global-definition-hook
                                       put-global-definition-hook
                                       gensym-hook
                                       error-hook
                                       local-eval-hook
                                       top-level-eval-hook
                                       annotation?
                                       fx<
                                       fx=
                                       fx-
                                       fx+
                                       noexpand
                                       define-structure
                                       unless
                                       when)
                                     ((top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top)
                                      (top))
                                     ("i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"
                                      "i"))
                                  #4(ribcage ((import-token . *top*)) ())
                                  #4(ribcage ((import-token . *top*)) ()))))
                         'visit
                         (if (%_1287
                               %_2506
                               '#3(syntax-object
                                   revisit
                                   ((top)
                                    #4(ribcage ())
                                    #4(ribcage ())
                                    #4(ribcage #1(x) #1((top)) #1("i"))
                                    #4(ribcage ())
                                    #4(ribcage
                                       #2(when-list w)
                                       #2((top))
                                       #2("i" "i"))
                                    #4(ribcage
                                       (lambda-var-list
                                         gen-var
                                         strip
                                         strip*
                                         strip-annotation
                                         ellipsis?
                                         chi-void
                                         chi-local-syntax
                                         chi-lambda-clause
                                         parse-define-syntax
                                         parse-define
                                         parse-import
                                         parse-module
                                         do-import!
                                         chi-internal
                                         chi-body
                                         chi-macro
                                         chi-set!
                                         chi-application
                                         chi-expr
                                         chi
                                         ct-eval/residualize
                                         rt-eval/residualize
                                         initial-mode-set
                                         update-mode-set
                                         do-top-import
                                         vfor-each
                                         vmap
                                         chi-external
                                         check-defined-ids
                                         check-module-exports
                                         extend-store!
                                         id-set-diff
                                         chi-top-module
                                         set-module-binding-val!
                                         set-module-binding-imps!
                                         set-module-binding-label!
                                         set-module-binding-id!
                                         set-module-binding-type!
                                         module-binding-val
                                         module-binding-imps
                                         module-binding-label
                                         module-binding-id
                                         module-binding-type
                                         module-binding?
                                         make-module-binding
                                         make-resolved-interface
                                         make-trimmed-interface
                                         set-interface-token!
                                         set-interface-exports!
                                         interface-token
                                         interface-exports
                                         interface?
                                         make-interface
                                         flatten-exports
                                         chi-top
                                         chi-top-expr
                                         syntax-type
                                         chi-when-list
                                         chi-top-sequence
                                         chi-sequence
                                         source-wrap
                                         wrap
                                         bound-id-member?
                                         invalid-ids-error
                                         distinct-bound-ids?
                                         valid-bound-ids?
                                         bound-id=?
                                         literal-id=?
                                         free-id=?
                                         id-var-name
                                         id-var-name-loc
                                         id-var-name&marks
                                         id-var-name-loc&marks
                                         same-marks?
                                         join-marks
                                         join-wraps
                                         smart-append
                                         make-trimmed-syntax-object
                                         make-binding-wrap
                                         lookup-import-binding-name
                                         extend-ribcage-subst!
                                         extend-ribcage-barrier-help!
                                         extend-ribcage-barrier!
                                         extend-ribcage!
                                         make-empty-ribcage
                                         import-token-key
                                         import-token?
                                         make-import-token
                                         barrier-marker
                                         new-mark
                                         anti-mark
                                         the-anti-mark
                                         only-top-marked?
                                         top-marked?
                                         top-wrap
                                         empty-wrap
                                         set-ribcage-labels!
                                         set-ribcage-marks!
                                         set-ribcage-symnames!
                                         ribcage-labels
                                         ribcage-marks
                                         ribcage-symnames
                                         ribcage?
                                         make-ribcage
                                         set-indirect-label!
                                         get-indirect-label
                                         indirect-label?
                                         gen-indirect-label
                                         gen-labels
                                         label?
                                         gen-label
                                         make-rename
                                         rename-marks
                                         rename-new
                                         rename-old
                                         subst-rename?
                                         wrap-subst
                                         wrap-marks
                                         make-wrap
                                         id-sym-name&marks
                                         id-sym-name
                                         id?
                                         nonsymbol-id?
                                         global-extend
                                         lookup
                                         sanitize-binding
                                         lookup*
                                         displaced-lexical-error
                                         transformer-env
                                         extend-var-env*
                                         extend-env*
                                         extend-env
                                         null-env
                                         binding?
                                         set-binding-value!
                                         set-binding-type!
                                         binding-value
                                         binding-type
                                         make-binding
                                         arg-check
                                         source-annotation
                                         no-source
                                         unannotate
                                         set-syntax-object-wrap!
                                         set-syntax-object-expression!
                                         syntax-object-wrap
                                         syntax-object-expression
                                         syntax-object?
                                         make-syntax-object
                                         self-evaluating?
                                         build-lexical-var
                                         build-letrec
                                         build-sequence
                                         build-data
                                         build-primref
                                         build-lambda
                                         build-revisit-only
                                         build-visit-only
                                         build-cte-install
                                         build-module-definition
                                         build-global-definition
                                         build-global-assignment
                                         build-global-reference
                                         build-lexical-assignment
                                         build-lexical-reference
                                         build-conditional
                                         build-application
                                         generate-id
                                         get-import-binding
                                         get-global-definition-hook
                                         put-global-definition-hook
                                         gensym-hook
                                         error-hook
                                         local-eval-hook
                                         top-level-eval-hook
                                         annotation?
                                         fx<
                                         fx=
                                         fx-
                                         fx+
                                         noexpand
                                         define-structure
                                         unless
                                         when)
                                       ((top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top)
                                        (top))
                                       ("i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"
                                        "i"))
                                    #4(ribcage ((import-token . *top*)) ())
                                    #4(ribcage ((import-token . *top*)) ()))))
                           'revisit
                           (if (%_1287
                                 %_2506
                                 '#3(syntax-object
                                     eval
                                     ((top)
                                      #4(ribcage ())
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ())
                                      #4(ribcage
                                         #2(when-list w)
                                         #2((top))
                                         #2("i" "i"))
                                      #4(ribcage
                                         (lambda-var-list
                                           gen-var
                                           strip
                                           strip*
                                           strip-annotation
                                           ellipsis?
                                           chi-void
                                           chi-local-syntax
                                           chi-lambda-clause
                                           parse-define-syntax
                                           parse-define
                                           parse-import
                                           parse-module
                                           do-import!
                                           chi-internal
                                           chi-body
                                           chi-macro
                                           chi-set!
                                           chi-application
                                           chi-expr
                                           chi
                                           ct-eval/residualize
                                           rt-eval/residualize
                                           initial-mode-set
                                           update-mode-set
                                           do-top-import
                                           vfor-each
                                           vmap
                                           chi-external
                                           check-defined-ids
                                           check-module-exports
                                           extend-store!
                                           id-set-diff
                                           chi-top-module
                                           set-module-binding-val!
                                           set-module-binding-imps!
                                           set-module-binding-label!
                                           set-module-binding-id!
                                           set-module-binding-type!
                                           module-binding-val
                                           module-binding-imps
                                           module-binding-label
                                           module-binding-id
                                           module-binding-type
                                           module-binding?
                                           make-module-binding
                                           make-resolved-interface
                                           make-trimmed-interface
                                           set-interface-token!
                                           set-interface-exports!
                                           interface-token
                                           interface-exports
                                           interface?
                                           make-interface
                                           flatten-exports
                                           chi-top
                                           chi-top-expr
                                           syntax-type
                                           chi-when-list
                                           chi-top-sequence
                                           chi-sequence
                                           source-wrap
                                           wrap
                                           bound-id-member?
                                           invalid-ids-error
                                           distinct-bound-ids?
                                           valid-bound-ids?
                                           bound-id=?
                                           literal-id=?
                                           free-id=?
                                           id-var-name
                                           id-var-name-loc
                                           id-var-name&marks
                                           id-var-name-loc&marks
                                           same-marks?
                                           join-marks
                                           join-wraps
                                           smart-append
                                           make-trimmed-syntax-object
                                           make-binding-wrap
                                           lookup-import-binding-name
                                           extend-ribcage-subst!
                                           extend-ribcage-barrier-help!
                                           extend-ribcage-barrier!
                                           extend-ribcage!
                                           make-empty-ribcage
                                           import-token-key
                                           import-token?
                                           make-import-token
                                           barrier-marker
                                           new-mark
                                           anti-mark
                                           the-anti-mark
                                           only-top-marked?
                                           top-marked?
                                           top-wrap
                                           empty-wrap
                                           set-ribcage-labels!
                                           set-ribcage-marks!
                                           set-ribcage-symnames!
                                           ribcage-labels
                                           ribcage-marks
                                           ribcage-symnames
                                           ribcage?
                                           make-ribcage
                                           set-indirect-label!
                                           get-indirect-label
                                           indirect-label?
                                           gen-indirect-label
                                           gen-labels
                                           label?
                                           gen-label
                                           make-rename
                                           rename-marks
                                           rename-new
                                           rename-old
                                           subst-rename?
                                           wrap-subst
                                           wrap-marks
                                           make-wrap
                                           id-sym-name&marks
                                           id-sym-name
                                           id?
                                           nonsymbol-id?
                                           global-extend
                                           lookup
                                           sanitize-binding
                                           lookup*
                                           displaced-lexical-error
                                           transformer-env
                                           extend-var-env*
                                           extend-env*
                                           extend-env
                                           null-env
                                           binding?
                                           set-binding-value!
                                           set-binding-type!
                                           binding-value
                                           binding-type
                                           make-binding
                                           arg-check
                                           source-annotation
                                           no-source
                                           unannotate
                                           set-syntax-object-wrap!
                                           set-syntax-object-expression!
                                           syntax-object-wrap
                                           syntax-object-expression
                                           syntax-object?
                                           make-syntax-object
                                           self-evaluating?
                                           build-lexical-var
                                           build-letrec
                                           build-sequence
                                           build-data
                                           build-primref
                                           build-lambda
                                           build-revisit-only
                                           build-visit-only
                                           build-cte-install
                                           build-module-definition
                                           build-global-definition
                                           build-global-assignment
                                           build-global-reference
                                           build-lexical-assignment
                                           build-lexical-reference
                                           build-conditional
                                           build-application
                                           generate-id
                                           get-import-binding
                                           get-global-definition-hook
                                           put-global-definition-hook
                                           gensym-hook
                                           error-hook
                                           local-eval-hook
                                           top-level-eval-hook
                                           annotation?
                                           fx<
                                           fx=
                                           fx-
                                           fx+
                                           noexpand
                                           define-structure
                                           unless
                                           when)
                                         ((top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top)
                                          (top))
                                         ("i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"
                                          "i"))
                                      #4(ribcage ((import-token . *top*)) ())
                                      #4(ribcage
                                         ((import-token . *top*))
                                         ()
                                         ()))))
                             'eval
                             (syntax-error
                               (%_1293 %_2506 %_2505)
                               '"invalid eval-when situation")))))))
                 %_2504)))
        (set! %_1296
          (lambda (%_2507
                   %_2508
                   %_2509
                   %_2510
                   %_2511
                   %_2512
                   %_2513)
            (%_1098
              %_2510
              (((lambda (%_2514)
                  (begin
                    (set! %_2514
                      (lambda (%_2515 %_2516 %_2517 %_2518 %_2519)
                        (if (null? %_2515)
                          '()
                          ((lambda (%_2520)
                             (cons %_2520
                                   (%_2514
                                     (cdr %_2515)
                                     %_2516
                                     %_2517
                                     %_2518
                                     %_2519)))
                           (%_1300
                             (car %_2515)
                             %_2516
                             %_2517
                             %_2518
                             %_2519
                             %_2513)))))
                    %_2514))
                #f)
               %_2507
               %_2508
               %_2509
               %_2511
               %_2512))))
        (set! %_1295
          (lambda (%_2521 %_2522 %_2523 %_2524)
            (%_1098
              %_2524
              (((lambda (%_2525)
                  (begin
                    (set! %_2525
                      (lambda (%_2526 %_2527 %_2528)
                        (if (null? %_2526)
                          '()
                          ((lambda (%_2529)
                             (cons %_2529 (%_2525 (cdr %_2526) %_2527 %_2528)))
                           (%_1335 (car %_2526) %_2527 %_2528)))))
                    %_2525))
                #f)
               %_2521
               %_2522
               %_2523))))
        (set! %_1294
          (lambda (%_2530 %_2531 %_2532)
            (%_1293
              (if %_2532
                (make-annotation %_2530 %_2532 '#f)
                %_2530)
              %_2531)))
        (set! %_1293
          (lambda (%_2533 %_2534)
            (if (if (null? (%_1172 %_2534))
                  (null? (%_1173 %_2534))
                  '#f)
              %_2533
              (if (%_1112 %_2533)
                (%_1111
                  (%_1113 %_2533)
                  (%_1279 %_2534 (%_1114 %_2533)))
                (if (null? %_2533) %_2533 (%_1111 %_2533 %_2534))))))
        (set! %_1292
          (lambda (%_2535 %_2536)
            (if (not (null? %_2536))
              ((lambda (%_2537)
                 (if %_2537 %_2537 (%_1292 %_2535 (cdr %_2536))))
               (%_1288 %_2535 (car %_2536)))
              '#f)))
        (set! %_1291
          (lambda (%_2538 %_2539 %_2540)
            (((lambda (%_2541)
                (begin
                  (set! %_2541
                    (lambda (%_2542 %_2543)
                      (if (null? %_2542)
                        (syntax-error %_2539)
                        (if (%_1164 (car %_2542))
                          (if (%_1292 (car %_2542) %_2543)
                            (syntax-error (car %_2542) '"duplicate " %_2540)
                            (%_2541 (cdr %_2542) (cons (car %_2542) %_2543)))
                          (syntax-error (car %_2542) '"invalid " %_2540)))))
                  %_2541))
              #f)
             %_2538
             '())))
        (set! %_1290
          (lambda (%_2544)
            (((lambda (%_2545)
                (begin
                  (set! %_2545
                    (lambda (%_2546)
                      ((lambda (%_2547)
                         (if %_2547
                           %_2547
                           (if (not (%_1292 (car %_2546) (cdr %_2546)))
                             (%_2545 (cdr %_2546))
                             '#f)))
                       (null? %_2546))))
                  %_2545))
              #f)
             %_2544)))
        (set! %_1289
          (lambda (%_2548)
            (if (((lambda (%_2549)
                    (begin
                      (set! %_2549
                        (lambda (%_2550)
                          ((lambda (%_2551)
                             (if %_2551
                               %_2551
                               (if (%_1164 (car %_2550))
                                 (%_2549 (cdr %_2550))
                                 '#f)))
                           (null? %_2550))))
                      %_2549))
                  #f)
                 %_2548)
              (%_1290 %_2548)
              '#f)))
        (set! %_1288
          (lambda (%_2552 %_2553)
            (if (if (%_1112 %_2552) (%_1112 %_2553) '#f)
              (if (eq? ((lambda (%_2556)
                          (if (%_988 %_2556)
                            (annotation-expression %_2556)
                            %_2556))
                        (%_1113 %_2552))
                       ((lambda (%_2557)
                          (if (%_988 %_2557)
                            (annotation-expression %_2557)
                            %_2557))
                        (%_1113 %_2553)))
                (%_1281
                  (%_1172 (%_1114 %_2552))
                  (%_1172 (%_1114 %_2553)))
                '#f)
              (eq? ((lambda (%_2554)
                      (if (%_988 %_2554)
                        (annotation-expression %_2554)
                        %_2554))
                    %_2552)
                   ((lambda (%_2555)
                      (if (%_988 %_2555)
                        (annotation-expression %_2555)
                        %_2555))
                    %_2553)))))
        (set! %_1287
          (lambda (%_2558 %_2559)
            (if (eq? ((lambda (%_2565)
                        ((lambda (%_2566)
                           (if (%_988 %_2566)
                             (annotation-expression %_2566)
                             %_2566))
                         (if (%_1112 %_2565) (%_1113 %_2565) %_2565)))
                      %_2558)
                     ((lambda (%_2567)
                        ((lambda (%_2568)
                           (if (%_988 %_2568)
                             (annotation-expression %_2568)
                             %_2568))
                         (if (%_1112 %_2567) (%_1113 %_2567) %_2567)))
                      %_2559))
              ((lambda (%_2560 %_2561)
                 ((lambda (%_2562)
                    (if %_2562
                      %_2562
                      (if ((lambda (%_2564)
                             (if %_2564 %_2564 (symbol? %_2560)))
                           (not %_2560))
                        ((lambda (%_2563)
                           (if %_2563 %_2563 (symbol? %_2561)))
                         (not %_2561))
                        '#f)))
                  (eq? %_2560 %_2561)))
               (%_1285 %_2558 '(()))
               (%_1285 %_2559 '(())))
              '#f)))
        (set! %_1286
          (lambda (%_2569 %_2570)
            (if (eq? ((lambda (%_2571)
                        ((lambda (%_2572)
                           (if (%_988 %_2572)
                             (annotation-expression %_2572)
                             %_2572))
                         (if (%_1112 %_2571) (%_1113 %_2571) %_2571)))
                      %_2569)
                     ((lambda (%_2573)
                        ((lambda (%_2574)
                           (if (%_988 %_2574)
                             (annotation-expression %_2574)
                             %_2574))
                         (if (%_1112 %_2573) (%_1113 %_2573) %_2573)))
                      %_2570))
              (eq? (%_1285 %_2569 '(())) (%_1285 %_2570 '(())))
              '#f)))
        (set! %_1285
          (lambda (%_2575 %_2576)
            (call-with-values
              (lambda () (%_1282 %_2575 %_2576))
              (lambda (%_2577 %_2578)
                (if (%_1209 %_2577) (%_1210 %_2577) %_2577)))))
        (set! %_1284
          (lambda (%_2579 %_2580)
            (call-with-values
              (lambda () (%_1282 %_2579 %_2580))
              (lambda (%_2581 %_2582) %_2581))))
        (set! %_1283
          (lambda (%_2583 %_2584)
            (call-with-values
              (lambda () (%_1282 %_2583 %_2584))
              (lambda (%_2585 %_2586)
                (values
                  (if (%_1209 %_2585) (%_1210 %_2585) %_2585)
                  %_2586)))))
        (set! %_1282
          (lambda (%_2587 %_2588)
            ((lambda (%_2591 %_2590 %_2589)
               (begin
                 (set! %_2591
                   (lambda (%_2599 %_2600 %_2601 %_2602 %_2603)
                     ((lambda (%_2604)
                        (((lambda (%_2605)
                            (begin
                              (set! %_2605
                                (lambda (%_2606)
                                  (if (= %_2606 %_2604)
                                    (%_2589 %_2599 (cdr %_2600) %_2601)
                                    (if (if (eq? (vector-ref %_2602 %_2606)
                                                 %_2599)
                                          (%_1281
                                            %_2601
                                            (vector-ref
                                              (%_1215 %_2603)
                                              %_2606))
                                          '#f)
                                      (values
                                        (vector-ref (%_1216 %_2603) %_2606)
                                        %_2601)
                                      (%_2605 (+ %_2606 '1))))))
                              %_2605))
                          #f)
                         '0))
                      (vector-length %_2602))))
                 (set! %_2590
                   (lambda (%_2607 %_2608 %_2609 %_2610 %_2611)
                     (((lambda (%_2612)
                         (begin
                           (set! %_2612
                             (lambda (%_2613 %_2614)
                               (if (null? %_2613)
                                 (%_2589 %_2607 (cdr %_2608) %_2609)
                                 (if (if (eq? (car %_2613) %_2607)
                                       (%_1281
                                         %_2609
                                         (list-ref (%_1215 %_2611) %_2614))
                                       '#f)
                                   (values
                                     (list-ref (%_1216 %_2611) %_2614)
                                     %_2609)
                                   (if (%_1265 (car %_2613))
                                     ((lambda (%_2615)
                                        (if %_2615
                                          ((lambda (%_2616)
                                             (if (symbol? %_2616)
                                               (values %_2616 %_2609)
                                               (%_1283 %_2616 '(()))))
                                           %_2615)
                                          (%_2612 (cdr %_2613) %_2614)))
                                      (%_1275
                                        %_2607
                                        (%_1266 (car %_2613))
                                        %_2609))
                                     (if (if (eq? (car %_2613) %_1262)
                                           (%_1281
                                             %_2609
                                             (list-ref (%_1215 %_2611) %_2614))
                                           '#f)
                                       (values '#f %_2609)
                                       (%_2612
                                         (cdr %_2613)
                                         (+ %_2614 '1))))))))
                           %_2612))
                       #f)
                      %_2610
                      '0)))
                 (set! %_2589
                   (lambda (%_2617 %_2618 %_2619)
                     (if (null? %_2618)
                       (values %_2617 %_2619)
                       ((lambda (%_2620)
                          (if (eq? %_2620 'shift)
                            (%_2589 %_2617 (cdr %_2618) (cdr %_2619))
                            ((lambda (%_2621)
                               (if (vector? %_2621)
                                 (%_2591 %_2617 %_2618 %_2619 %_2621 %_2620)
                                 (%_2590 %_2617 %_2618 %_2619 %_2621 %_2620)))
                             (%_1214 %_2620))))
                        (car %_2618)))))
                 (if (symbol? %_2587)
                   (%_2589 %_2587 (%_1173 %_2588) (%_1172 %_2588))
                   (if (%_1112 %_2587)
                     ((lambda (%_2593 %_2594)
                        ((lambda (%_2595)
                           (call-with-values
                             (lambda ()
                               (%_2589 %_2593 (%_1173 %_2588) %_2595))
                             (lambda (%_2596 %_2597)
                               (if (eq? %_2596 %_2593)
                                 (%_2589 %_2593 (%_1173 %_2594) %_2597)
                                 (values %_2596 %_2597)))))
                         (%_1280 (%_1172 %_2588) (%_1172 %_2594))))
                      ((lambda (%_2598)
                         (if (%_988 %_2598)
                           (annotation-expression %_2598)
                           %_2598))
                       (%_1113 %_2587))
                      (%_1114 %_2587))
                     (if (%_988 %_2587)
                       (%_2589
                         ((lambda (%_2592)
                            (if (%_988 %_2592)
                              (annotation-expression %_2592)
                              %_2592))
                          %_2587)
                         (%_1173 %_2588)
                         (%_1172 %_2588))
                       (%_991 'id-var-name '"invalid id" %_2587))))))
             #f
             #f
             #f)))
        (set! %_1281
          (lambda (%_2622 %_2623)
            ((lambda (%_2624)
               (if %_2624
                 %_2624
                 (if (not (null? %_2622))
                   (if (not (null? %_2623))
                     (if (eq? (car %_2622) (car %_2623))
                       (%_1281 (cdr %_2622) (cdr %_2623))
                       '#f)
                     '#f)
                   '#f)))
             (eq? %_2622 %_2623))))
        (set! %_1280
          (lambda (%_2625 %_2626) (%_1278 %_2625 %_2626)))
        (set! %_1279
          (lambda (%_2627 %_2628)
            ((lambda (%_2629 %_2630)
               (if (null? %_2629)
                 (if (null? %_2630)
                   %_2628
                   (%_1171
                     (%_1172 %_2628)
                     (%_1278 %_2630 (%_1173 %_2628))))
                 (%_1171
                   (%_1278 %_2629 (%_1172 %_2628))
                   (%_1278 %_2630 (%_1173 %_2628)))))
             (%_1172 %_2627)
             (%_1173 %_2627))))
        (set! %_1278
          (lambda (%_2631 %_2632)
            (if (null? %_2632) %_2631 (append %_2631 %_2632))))
        (set! %_1277
          (lambda (%_2633)
            (call-with-values
              (lambda () (%_1283 %_2633 '(())))
              (lambda (%_2634 %_2635)
                (begin
                  (if (not %_2634)
                    (syntax-error
                      %_2633
                      '"identifier not visible for export")
                    (void))
                  ((lambda (%_2636)
                     (%_1111
                       %_2636
                       (%_1171
                         %_2635
                         (list (%_1212
                                 (vector %_2636)
                                 (vector %_2635)
                                 (vector %_2634))))))
                   ((lambda (%_2637)
                      ((lambda (%_2638)
                         (if (%_988 %_2638)
                           (annotation-expression %_2638)
                           %_2638))
                       (if (%_1112 %_2637) (%_1113 %_2637) %_2637)))
                    %_2633)))))))
        (set! %_1276
          (lambda (%_2639 %_2640 %_2641)
            (if (null? %_2639)
              %_2641
              (%_1171
                (%_1172 %_2641)
                (cons ((lambda (%_2642)
                         ((lambda (%_2643)
                            ((lambda (%_2644 %_2645)
                               (begin
                                 (((lambda (%_2646)
                                     (begin
                                       (set! %_2646
                                         (lambda (%_2647 %_2648)
                                           (if (not (null? %_2647))
                                             (call-with-values
                                               (lambda ()
                                                 (%_1170 (car %_2647) %_2641))
                                               (lambda (%_2649 %_2650)
                                                 (begin
                                                   (vector-set!
                                                     %_2644
                                                     %_2648
                                                     %_2649)
                                                   (vector-set!
                                                     %_2645
                                                     %_2648
                                                     %_2650)
                                                   (%_2646
                                                     (cdr %_2647)
                                                     (+ %_2648 '1)))))
                                             (void))))
                                       %_2646))
                                   #f)
                                  %_2639
                                  '0)
                                 (%_1212 %_2644 %_2645 %_2642)))
                             (make-vector %_2643)
                             (make-vector %_2643)))
                          (vector-length %_2642)))
                       (list->vector %_2640))
                      (%_1173 %_2641))))))
        (set! %_1275
          (lambda (%_2651 %_2652 %_2653)
            ((lambda (%_2654)
               (if %_2654
                 (((lambda (%_2655)
                     (begin
                       (set! %_2655
                         (lambda (%_2656)
                           (if (pair? %_2656)
                             ((lambda (%_2657)
                                (if %_2657 %_2657 (%_2655 (cdr %_2656))))
                              (%_2655 (car %_2656)))
                             (if (%_1281 %_2653 (%_1172 (%_1114 %_2656)))
                               %_2656
                               '#f))))
                       %_2655))
                   #f)
                  %_2654)
                 '#f))
             (%_998 %_2651 %_2652))))
        (set! %_1274
          (lambda (%_2658 %_2659)
            (%_1217
              %_2658
              (cons (%_1264 %_2659) (%_1214 %_2658)))))
        (set! %_1273
          (lambda (%_2660 %_2661)
            (begin
              (%_1217 %_2660 (cons %_1262 (%_1214 %_2660)))
              (%_1218
                %_2660
                (cons (%_1172 %_2661) (%_1215 %_2660))))))
        (set! %_1272
          (lambda (%_2662 %_2663)
            (%_1273 %_2662 (%_1114 %_2663))))
        (set! %_1271
          (lambda (%_2664 %_2665 %_2666)
            (begin
              (%_1217
                %_2664
                (cons ((lambda (%_2667)
                         (if (%_988 %_2667)
                           (annotation-expression %_2667)
                           %_2667))
                       (%_1113 %_2665))
                      (%_1214 %_2664)))
              (%_1218
                %_2664
                (cons (%_1172 (%_1114 %_2665)) (%_1215 %_2664)))
              (%_1219 %_2664 (cons %_2666 (%_1216 %_2664))))))
        (set! %_1266 cdr)
        (set! %_1265
          (lambda (%_2668)
            (if (pair? %_2668) (eq? (car %_2668) %_1263) '#f)))
        (set! %_1264
          (lambda (%_2669) (cons %_1263 %_2669)))
        (set! %_1263 'import-token)
        (set! %_1262 '#f)
        (set! %_1257
          (lambda (%_2670)
            (%_1171
              (cons '#f (%_1172 %_2670))
              (cons 'shift (%_1173 %_2670)))))
        (set! %_1219
          (lambda (%_2671 %_2672)
            (vector-set! %_2671 '3 %_2672)))
        (set! %_1218
          (lambda (%_2673 %_2674)
            (vector-set! %_2673 '2 %_2674)))
        (set! %_1217
          (lambda (%_2675 %_2676)
            (vector-set! %_2675 '1 %_2676)))
        (set! %_1216
          (lambda (%_2677) (vector-ref %_2677 '3)))
        (set! %_1215
          (lambda (%_2678) (vector-ref %_2678 '2)))
        (set! %_1214
          (lambda (%_2679) (vector-ref %_2679 '1)))
        (set! %_1213
          (lambda (%_2680)
            (if (vector? %_2680)
              (if (= (vector-length %_2680) '4)
                (eq? (vector-ref %_2680 '0) 'ribcage)
                '#f)
              '#f)))
        (set! %_1212
          (lambda (%_2681 %_2682 %_2683)
            (vector 'ribcage %_2681 %_2682 %_2683)))
        (set! %_1211 set-car!)
        (set! %_1210 car)
        (set! %_1209 pair?)
        (set! %_1208 (lambda () (list (%_1205))))
        (set! %_1207
          (lambda (%_2684)
            (if (null? %_2684)
              '()
              (cons (%_1205) (%_1207 (cdr %_2684))))))
        (set! %_1206
          (lambda (%_2685)
            ((lambda (%_2686)
               (if %_2686
                 %_2686
                 ((lambda (%_2687)
                    (if %_2687 %_2687 (%_1209 %_2685)))
                  (symbol? %_2685))))
             (string? %_2685))))
        (set! %_1205 (lambda () (string '#\i)))
        (set! %_1173 cdr)
        (set! %_1172 car)
        (set! %_1171 cons)
        (set! %_1170
          (lambda (%_2688 %_2689)
            (if (%_1112 %_2688)
              (values
                ((lambda (%_2691)
                   (if (%_988 %_2691)
                     (annotation-expression %_2691)
                     %_2691))
                 (%_1113 %_2688))
                (%_1280 (%_1172 %_2689) (%_1172 (%_1114 %_2688))))
              (values
                ((lambda (%_2690)
                   (if (%_988 %_2690)
                     (annotation-expression %_2690)
                     %_2690))
                 %_2688)
                (%_1172 %_2689)))))
        (set! %_1164
          (lambda (%_2692)
            (if (symbol? %_2692)
              '#t
              (if (%_1112 %_2692)
                (symbol?
                  ((lambda (%_2693)
                     (if (%_988 %_2693)
                       (annotation-expression %_2693)
                       %_2693))
                   (%_1113 %_2692)))
                (if (%_988 %_2692)
                  (symbol? (annotation-expression %_2692))
                  '#f)))))
        (set! %_1163
          (lambda (%_2694)
            (if (%_1112 %_2694)
              (symbol?
                ((lambda (%_2695)
                   (if (%_988 %_2695)
                     (annotation-expression %_2695)
                     %_2695))
                 (%_1113 %_2694)))
              '#f)))
        (set! %_1162
          (lambda (%_2696 %_2697 %_2698)
            (%_996 %_2697 (%_1139 %_2696 %_2698))))
        (set! %_1161
          (lambda (%_2699 %_2700)
            ((lambda (%_2701)
               (begin
                 (set! %_2701
                   (lambda (%_2707 %_2708)
                     (begin
                       (%_1142 %_2707 (%_1140 %_2708))
                       (%_1143 %_2707 (%_1141 %_2708)))))
                 ((lambda (%_2702)
                    ((lambda (%_2703)
                       (if (memv %_2703 '(deferred))
                         (begin
                           (%_2701
                             %_2702
                             ((lambda (%_2704)
                                ((lambda (%_2705)
                                   (if %_2705
                                     %_2705
                                     (syntax-error
                                       %_2704
                                       '"invalid transformer")))
                                 (%_1160 %_2704)))
                              (%_990 (%_1141 %_2702))))
                           ((lambda (%_2706) %_2702) (%_1140 %_2702)))
                         %_2702))
                     (%_1140 %_2702)))
                  (%_1159 %_2699 %_2700))))
             #f)))
        (set! %_1160
          (lambda (%_2709)
            (if (procedure? %_2709)
              (%_1139 'macro %_2709)
              (if (%_1144 %_2709)
                ((lambda (%_2710)
                   (if (memv %_2710 '(core macro macro!))
                     (if (procedure? (%_1141 %_2709)) %_2709 '#f)
                     (if (memv %_2710 '(module))
                       (if (%_1303 (%_1141 %_2709)) %_2709 '#f)
                       %_2709)))
                 (%_1140 %_2709))
                '#f))))
        (set! %_1159
          (lambda (%_2711 %_2712)
            ((lambda (%_2713)
               (if %_2713
                 (cdr %_2713)
                 (if (symbol? %_2711)
                   ((lambda (%_2714)
                      (if %_2714 %_2714 (%_1139 'global %_2711)))
                    (%_997 %_2711))
                   (%_1139 'displaced-lexical '#f))))
             (assq %_2711 %_2712))))
        (set! %_1158
          (lambda (%_2715)
            (syntax-error
              %_2715
              (if (%_1285 %_2715 '(()))
                '"identifier out of context"
                '"identifier not visible"))))
        (set! %_1157
          (lambda (%_2716)
            (if (null? %_2716)
              '()
              ((lambda (%_2717)
                 (if (eq? (cadr %_2717) 'lexical)
                   (%_1157 (cdr %_2716))
                   (cons %_2717 (%_1157 (cdr %_2716)))))
               (car %_2716)))))
        (set! %_1156
          (lambda (%_2718 %_2719 %_2720)
            (if (null? %_2718)
              %_2720
              (%_1156
                (cdr %_2718)
                (cdr %_2719)
                (%_1154
                  (car %_2718)
                  (%_1139 'lexical (car %_2719))
                  %_2720)))))
        (set! %_1155
          (lambda (%_2721 %_2722 %_2723)
            (if (null? %_2721)
              %_2723
              (%_1155
                (cdr %_2721)
                (cdr %_2722)
                (%_1154 (car %_2721) (car %_2722) %_2723)))))
        (set! %_1154
          (lambda (%_2724 %_2725 %_2726)
            (cons (cons %_2724 %_2725) %_2726)))
        (set! %_1144
          (lambda (%_2727)
            (if (pair? %_2727) (symbol? (car %_2727)) '#f)))
        (set! %_1143 set-cdr!)
        (set! %_1142 set-car!)
        (set! %_1141 cdr)
        (set! %_1140 car)
        (set! %_1139
          (lambda (%_2728 %_2729) (cons %_2728 %_2729)))
        (set! %_1131
          (lambda (%_2730)
            (if (%_988 %_2730)
              (annotation-source %_2730)
              (if (%_1112 %_2730) (%_1131 (%_1113 %_2730)) '#f))))
        (set! %_1116
          (lambda (%_2731 %_2732)
            (vector-set! %_2731 '2 %_2732)))
        (set! %_1115
          (lambda (%_2733 %_2734)
            (vector-set! %_2733 '1 %_2734)))
        (set! %_1114
          (lambda (%_2735) (vector-ref %_2735 '2)))
        (set! %_1113
          (lambda (%_2736) (vector-ref %_2736 '1)))
        (set! %_1112
          (lambda (%_2737)
            (if (vector? %_2737)
              (if (= (vector-length %_2737) '3)
                (eq? (vector-ref %_2737 '0) 'syntax-object)
                '#f)
              '#f)))
        (set! %_1111
          (lambda (%_2738 %_2739)
            (vector 'syntax-object %_2738 %_2739)))
        (set! %_1099
          (lambda (%_2740 %_2741 %_2742 %_2743)
            (if (null? %_2741)
              %_2743
              (cons (list 'lambda
                          %_2741
                          (append
                            (cons 'begin
                                  (map (lambda (%_2744 %_2745)
                                         (list 'set! %_2744 %_2745))
                                       %_2741
                                       %_2742))
                            (list %_2743)))
                    (map (lambda (%_2746) '#f) %_2741)))))
        (set! %_1098
          (lambda (%_2747 %_2748)
            (if (null? (cdr %_2748))
              (car %_2748)
              (cons 'begin %_2748))))
        (set! %_999
          ((lambda (%_2749)
             ((lambda (%_2752 %_2751 %_2750)
                (begin
                  (set! %_2752
                    (lambda (%_2756)
                      (((lambda (%_2757)
                          (begin
                            (set! %_2757
                              (lambda (%_2758 %_2759)
                                (if (< %_2758 %_2749)
                                  (list->string (cons (%_2751 %_2758) %_2759))
                                  ((lambda (%_2760 %_2761)
                                     (%_2757
                                       %_2761
                                       (cons (%_2751 %_2760) %_2759)))
                                   (modulo %_2758 %_2749)
                                   (quotient %_2758 %_2749)))))
                            %_2757))
                        #f)
                       %_2756
                       '())))
                  (set! %_2751
                    (lambda (%_2762)
                      (integer->char
                        (+ %_2762 (if (> %_2762 '9) '55 '48)))))
                  (set! %_2750 (lambda () '0))
                  ((lambda (%_2753 %_2754)
                     (lambda (%_2755)
                       (begin
                         (set! %_2754 (+ %_2754 '1))
                         (string->symbol
                           (string-append
                             (symbol->string %_2755)
                             '"#"
                             %_2753
                             (%_2752 %_2754))))))
                   (%_2752 (%_2750))
                   '-1)))
              #f
              #f
              #f))
           '36))
        (set! %_998
          (lambda (%_2763 %_2764) (getprop %_2763 %_2764)))
        (set! %_997
          (lambda (%_2765) (getprop %_2765 '*sc-expander*)))
        (set! %_996
          (lambda (%_2766 %_2767)
            ($sc-put-cte %_2766 %_2767)))
        (set! %_991
          (lambda (%_2768 %_2769 %_2770)
            (error %_2768 '"~a ~s" %_2769 %_2770)))
        (set! %_990
          (lambda (%_2771) (eval (list %_951 %_2771))))
        (set! %_989
          (lambda (%_2772) (eval (list %_951 %_2772))))
        (set! %_988 (lambda (%_2773) '#f))
        (set! %_951 '"noexpand")
        (begin
          (set! $sc-put-cte
            (lambda (%_1356 %_1357)
              ((lambda (%_1360 %_1359 %_1358)
                 (begin
                   (set! %_1360
                     (lambda (%_1369 %_1370)
                       (begin
                         (%_1358 %_1369 '*top*)
                         ((lambda (%_1371)
                            (putprop %_1371 '*sc-expander* %_1370))
                          (if (symbol? %_1369)
                            %_1369
                            (%_1285 %_1369 '(())))))))
                   (set! %_1359
                     (lambda (%_1372 %_1373)
                       (%_1329
                         (lambda (%_1374) (%_1358 %_1374 %_1373))
                         %_1372)))
                   (set! %_1358
                     (lambda (%_1375 %_1376)
                       ((lambda (%_1378 %_1377)
                          (begin
                            (set! %_1378
                              (lambda (%_1383 %_1384)
                                (if (pair? %_1384)
                                  (if (%_1288 (car %_1384) %_1383)
                                    (%_1378 %_1383 (cdr %_1384))
                                    (%_1377
                                      (car %_1384)
                                      (%_1378 %_1383 (cdr %_1384))))
                                  (if ((lambda (%_1385)
                                         (if %_1385
                                           %_1385
                                           (%_1288 %_1384 %_1383)))
                                       (not %_1384))
                                    '#f
                                    %_1384))))
                            (set! %_1377
                              (lambda (%_1386 %_1387)
                                (if (not %_1387) %_1386 (cons %_1386 %_1387))))
                            ((lambda (%_1379)
                               ((lambda (%_1380)
                                  (if (if (not %_1380) (symbol? %_1375) '#f)
                                    (remprop %_1379 %_1376)
                                    (putprop
                                      %_1379
                                      %_1376
                                      (%_1377 %_1375 %_1380))))
                                (%_1378 %_1375 (getprop %_1379 %_1376))))
                             ((lambda (%_1381)
                                ((lambda (%_1382)
                                   (if (%_988 %_1382)
                                     (annotation-expression %_1382)
                                     %_1382))
                                 (if (%_1112 %_1381) (%_1113 %_1381) %_1381)))
                              %_1375))))
                        #f
                        #f)))
                   ((lambda (%_1361)
                      ((lambda (%_1362)
                         (if (memv %_1362 '(module))
                           (begin
                             ((lambda (%_1367)
                                (%_1359 (%_1304 %_1367) (%_1305 %_1367)))
                              (%_1141 %_1361))
                             (%_1360 %_1356 %_1361))
                           (if (memv %_1362 '(do-import))
                             ((lambda (%_1363)
                                ((lambda (%_1364)
                                   ((lambda (%_1365)
                                      (if (memv %_1365 '(module))
                                        ((lambda (%_1366)
                                           (begin
                                             (if (not (eq? (%_1305 %_1366)
                                                           %_1363))
                                               (syntax-error
                                                 %_1356
                                                 '"import mismatch for module")
                                               (void))
                                             (%_1359 (%_1304 %_1366) '*top*)))
                                         (%_1141 %_1364))
                                        (syntax-error
                                          %_1356
                                          '"import from unknown module")))
                                    (%_1140 %_1364)))
                                 (%_1161 (%_1285 %_1356 '(())) '())))
                              (%_1141 %_1357))
                             (%_1360 %_1356 %_1361))))
                       (%_1140 %_1361)))
                    ((lambda (%_1368)
                       (if %_1368
                         %_1368
                         (error 'define-syntax
                                '"invalid transformer ~s"
                                %_1357)))
                     (%_1160 %_1357)))))
               #f
               #f
               #f)))
          (%_1162 'local-syntax 'letrec-syntax '#t)
          (%_1162 'local-syntax 'let-syntax '#f)
          (%_1162
            'core
            'fluid-let-syntax
            (lambda (%_1388 %_1389 %_1390 %_1391)
              ((lambda (%_1392)
                 ((lambda (%_1393)
                    (if (if %_1393
                          (apply (lambda (%_1411 %_1412 %_1413 %_1414 %_1415)
                                   (%_1289 %_1412))
                                 %_1393)
                          '#f)
                      (apply (lambda (%_1395 %_1396 %_1397 %_1398 %_1399)
                               ((lambda (%_1400)
                                  (begin
                                    (for-each
                                      (lambda (%_1401 %_1402)
                                        ((lambda (%_1403)
                                           (if (memv %_1403
                                                     '(displaced-lexical))
                                             (%_1158 (%_1293 %_1401 %_1390))
                                             (void)))
                                         (%_1140 (%_1161 %_1402 %_1389))))
                                      %_1396
                                      %_1400)
                                    (%_1340
                                      (cons %_1398 %_1399)
                                      (%_1294 %_1388 %_1390 %_1391)
                                      (%_1155
                                        %_1400
                                        ((lambda (%_1406)
                                           (map (lambda (%_1407)
                                                  (%_1139
                                                    'deferred
                                                    (%_1335
                                                      %_1407
                                                      %_1406
                                                      %_1390)))
                                                %_1397))
                                         (%_1157 %_1389))
                                        %_1389)
                                      %_1390)))
                                (map (lambda (%_1409) (%_1285 %_1409 %_1390))
                                     %_1396)))
                             %_1393)
                      ((lambda (%_1394)
                         (syntax-error (%_1294 %_1388 %_1390 %_1391)))
                       %_1392)))
                  ($syntax-dispatch
                    %_1392
                    '(any #2(each (any any)) any . each-any))))
               %_1388)))
          (%_1162
            'core
            'quote
            (lambda (%_1417 %_1418 %_1419 %_1420)
              ((lambda (%_1421)
                 ((lambda (%_1422)
                    (if %_1422
                      (apply (lambda (%_1424 %_1425)
                               (list 'quote (%_1353 %_1425 %_1419)))
                             %_1422)
                      ((lambda (%_1423)
                         (syntax-error (%_1294 %_1417 %_1419 %_1420)))
                       %_1421)))
                  ($syntax-dispatch %_1421 '(any any))))
               %_1417)))
          (%_1162
            'core
            'syntax
            ((lambda ()
               ((lambda (%_1433
                         %_1432
                         %_1431
                         %_1430
                         %_1429
                         %_1428
                         %_1427
                         %_1426)
                  (begin
                    (set! %_1433
                      (lambda (%_1446)
                        ((lambda (%_1447)
                           (if (memv %_1447 '(ref))
                             (cadr %_1446)
                             (if (memv %_1447 '(primitive))
                               (cadr %_1446)
                               (if (memv %_1447 '(quote))
                                 (list 'quote (cadr %_1446))
                                 (if (memv %_1447 '(lambda))
                                   (list 'lambda
                                         (cadr %_1446)
                                         (%_1433 (caddr %_1446)))
                                   (if (memv %_1447 '(map))
                                     ((lambda (%_1448)
                                        (cons (if (= (length %_1448) '2)
                                                'map
                                                'map)
                                              %_1448))
                                      (map %_1433 (cdr %_1446)))
                                     (cons (car %_1446)
                                           (map %_1433 (cdr %_1446)))))))))
                         (car %_1446))))
                    (set! %_1432
                      (lambda (%_1449 %_1450 %_1451)
                        (if (eq? (car %_1451) 'quote)
                          (if (eq? (cadr %_1451) %_1450)
                            (list 'quote %_1449)
                            (list 'quote (list->vector (cadr %_1451))))
                          (if (eq? (car %_1451) 'list)
                            (cons 'vector (cdr %_1451))
                            (list 'list->vector %_1451)))))
                    (set! %_1431
                      (lambda (%_1452 %_1453 %_1454 %_1455 %_1456)
                        ((lambda (%_1457)
                           (if (memv %_1457 '(quote))
                             (if (eq? (car %_1455) 'quote)
                               ((lambda (%_1458 %_1459)
                                  (if (if (eq? %_1458 %_1453)
                                        (eq? %_1459 %_1454)
                                        '#f)
                                    (list 'quote %_1452)
                                    (list 'quote (cons %_1458 %_1459))))
                                (cadr %_1455)
                                (cadr %_1456))
                               (if (eq? (cadr %_1456) '())
                                 (list 'list %_1455)
                                 (list 'cons %_1455 %_1456)))
                             (if (memv %_1457 '(list))
                               (cons 'list (cons %_1455 (cdr %_1456)))
                               (list 'cons %_1455 %_1456))))
                         (car %_1456))))
                    (set! %_1430
                      (lambda (%_1460 %_1461)
                        ((lambda (%_1462 %_1463)
                           (if (eq? (car %_1460) 'ref)
                             (car %_1463)
                             (if (andmap
                                   (lambda (%_1466)
                                     (if (eq? (car %_1466) 'ref)
                                       (memq (cadr %_1466) %_1462)
                                       '#f))
                                   (cdr %_1460))
                               (cons 'map
                                     (cons (list 'primitive (car %_1460))
                                           (map ((lambda (%_1464)
                                                   (lambda (%_1465)
                                                     (cdr (assq (cadr %_1465)
                                                                %_1464))))
                                                 (map cons %_1462 %_1463))
                                                (cdr %_1460))))
                               (cons 'map
                                     (cons (list 'lambda %_1462 %_1460)
                                           %_1463)))))
                         (map cdr %_1461)
                         (map (lambda (%_1467) (list 'ref (car %_1467)))
                              %_1461))))
                    (set! %_1429
                      (lambda (%_1468 %_1469)
                        (list 'apply
                              '(primitive append)
                              (%_1430 %_1468 %_1469))))
                    (set! %_1428
                      (lambda (%_1470 %_1471)
                        (if (equal? %_1471 ''())
                          %_1470
                          (list 'append %_1470 %_1471))))
                    (set! %_1427
                      (lambda (%_1472 %_1473 %_1474 %_1475)
                        (if (= %_1474 '0)
                          (values %_1473 %_1475)
                          (if (null? %_1475)
                            (syntax-error
                              %_1472
                              '"missing ellipsis in syntax form")
                            (call-with-values
                              (lambda ()
                                (%_1427
                                  %_1472
                                  %_1473
                                  (- %_1474 '1)
                                  (cdr %_1475)))
                              (lambda (%_1476 %_1477)
                                ((lambda (%_1478)
                                   (if %_1478
                                     (values (cdr %_1478) %_1475)
                                     ((lambda (%_1479)
                                        (values
                                          %_1479
                                          (cons (cons (cons %_1476 %_1479)
                                                      (car %_1475))
                                                %_1477)))
                                      (%_1354 'tmp))))
                                 (assq %_1476 (car %_1475)))))))))
                    (set! %_1426
                      (lambda (%_1480 %_1481 %_1482 %_1483 %_1484)
                        (if (%_1164 %_1481)
                          ((lambda (%_1534)
                             ((lambda (%_1535)
                                (if (eq? (%_1140 %_1535) 'syntax)
                                  (call-with-values
                                    (lambda ()
                                      ((lambda (%_1536)
                                         (%_1427
                                           %_1480
                                           (car %_1536)
                                           (cdr %_1536)
                                           %_1483))
                                       (%_1141 %_1535)))
                                    (lambda (%_1537 %_1538)
                                      (values (list 'ref %_1537) %_1538)))
                                  (if (%_1484 %_1481)
                                    (syntax-error
                                      %_1480
                                      '"misplaced ellipsis in syntax form")
                                    (values (list 'quote %_1481) %_1483))))
                              (%_1161 %_1534 %_1482)))
                           (%_1285 %_1481 '(())))
                          ((lambda (%_1485)
                             ((lambda (%_1486)
                                (if (if %_1486
                                      (apply (lambda (%_1532 %_1533)
                                               (%_1484 %_1532))
                                             %_1486)
                                      '#f)
                                  (apply (lambda (%_1529 %_1530)
                                           (%_1426
                                             %_1480
                                             %_1530
                                             %_1482
                                             %_1483
                                             (lambda (%_1531) '#f)))
                                         %_1486)
                                  ((lambda (%_1487)
                                     (if (if %_1487
                                           (apply (lambda (%_1526
                                                           %_1527
                                                           %_1528)
                                                    (%_1484 %_1527))
                                                  %_1487)
                                           '#f)
                                       (apply (lambda (%_1503 %_1504 %_1505)
                                                (((lambda (%_1506)
                                                    (begin
                                                      (set! %_1506
                                                        (lambda (%_1507 %_1508)
                                                          ((lambda (%_1509)
                                                             ((lambda (%_1510)
                                                                (if (if %_1510
                                                                      (apply (lambda (%_1521
                                                                                      %_1522)
                                                                               (%_1484
                                                                                 %_1521))
                                                                             %_1510)
                                                                      '#f)
                                                                  (apply (lambda (%_1516
                                                                                  %_1517)
                                                                           (%_1506
                                                                             %_1517
                                                                             (lambda (%_1518)
                                                                               (call-with-values
                                                                                 (lambda ()
                                                                                   (%_1508
                                                                                     (cons '()
                                                                                           %_1518)))
                                                                                 (lambda (%_1519
                                                                                          %_1520)
                                                                                   (if (null? (car %_1520))
                                                                                     (syntax-error
                                                                                       %_1480
                                                                                       '"extra ellipsis in syntax form")
                                                                                     (values
                                                                                       (%_1429
                                                                                         %_1519
                                                                                         (car %_1520))
                                                                                       (cdr %_1520))))))))
                                                                         %_1510)
                                                                  ((lambda (%_1511)
                                                                     (call-with-values
                                                                       (lambda ()
                                                                         (%_1426
                                                                           %_1480
                                                                           %_1507
                                                                           %_1482
                                                                           %_1483
                                                                           %_1484))
                                                                       (lambda (%_1512
                                                                                %_1513)
                                                                         (call-with-values
                                                                           (lambda ()
                                                                             (%_1508
                                                                               %_1513))
                                                                           (lambda (%_1514
                                                                                    %_1515)
                                                                             (values
                                                                               (%_1428
                                                                                 %_1514
                                                                                 %_1512)
                                                                               %_1515))))))
                                                                   %_1509)))
                                                              ($syntax-dispatch
                                                                %_1509
                                                                '(any . any))))
                                                           %_1507)))
                                                      %_1506))
                                                  #f)
                                                 %_1505
                                                 (lambda (%_1523)
                                                   (call-with-values
                                                     (lambda ()
                                                       (%_1426
                                                         %_1480
                                                         %_1503
                                                         %_1482
                                                         (cons '() %_1523)
                                                         %_1484))
                                                     (lambda (%_1524 %_1525)
                                                       (if (null? (car %_1525))
                                                         (syntax-error
                                                           %_1480
                                                           '"extra ellipsis in syntax form")
                                                         (values
                                                           (%_1430
                                                             %_1524
                                                             (car %_1525))
                                                           (cdr %_1525))))))))
                                              %_1487)
                                       ((lambda (%_1488)
                                          (if %_1488
                                            (apply (lambda (%_1497 %_1498)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_1426
                                                           %_1480
                                                           %_1497
                                                           %_1482
                                                           %_1483
                                                           %_1484))
                                                       (lambda (%_1499 %_1500)
                                                         (call-with-values
                                                           (lambda ()
                                                             (%_1426
                                                               %_1480
                                                               %_1498
                                                               %_1482
                                                               %_1500
                                                               %_1484))
                                                           (lambda (%_1501
                                                                    %_1502)
                                                             (values
                                                               (%_1431
                                                                 %_1481
                                                                 %_1497
                                                                 %_1498
                                                                 %_1499
                                                                 %_1501)
                                                               %_1502))))))
                                                   %_1488)
                                            ((lambda (%_1489)
                                               (if %_1489
                                                 (apply (lambda (%_1491 %_1492)
                                                          ((lambda (%_1493)
                                                             (call-with-values
                                                               (lambda ()
                                                                 (%_1426
                                                                   %_1480
                                                                   %_1493
                                                                   %_1482
                                                                   %_1483
                                                                   %_1484))
                                                               (lambda (%_1494
                                                                        %_1495)
                                                                 (values
                                                                   (%_1432
                                                                     %_1481
                                                                     %_1493
                                                                     %_1494)
                                                                   %_1495))))
                                                           (cons %_1491
                                                                 %_1492)))
                                                        %_1489)
                                                 ((lambda (%_1490)
                                                    (values
                                                      (list 'quote %_1481)
                                                      %_1483))
                                                  %_1485)))
                                             ($syntax-dispatch
                                               %_1485
                                               '#2(vector (any . each-any))))))
                                        ($syntax-dispatch
                                          %_1485
                                          '(any . any)))))
                                   ($syntax-dispatch
                                     %_1485
                                     '(any any . any)))))
                              ($syntax-dispatch %_1485 '(any any))))
                           %_1481))))
                    (lambda (%_1434 %_1435 %_1436 %_1437)
                      ((lambda (%_1438)
                         ((lambda (%_1439)
                            ((lambda (%_1440)
                               (if %_1440
                                 (apply (lambda (%_1442 %_1443)
                                          (call-with-values
                                            (lambda ()
                                              (%_1426
                                                %_1438
                                                %_1443
                                                %_1435
                                                '()
                                                %_1350))
                                            (lambda (%_1444 %_1445)
                                              (%_1433 %_1444))))
                                        %_1440)
                                 ((lambda (%_1441) (syntax-error %_1438))
                                  %_1439)))
                             ($syntax-dispatch %_1439 '(any any))))
                          %_1438))
                       (%_1294 %_1434 %_1436 %_1437)))))
                #f
                #f
                #f
                #f
                #f
                #f
                #f
                #f))))
          (%_1162
            'core
            'lambda
            (lambda (%_1539 %_1540 %_1541 %_1542)
              ((lambda (%_1543)
                 ((lambda (%_1544)
                    (if %_1544
                      (apply (lambda (%_1545 %_1546)
                               (%_1347
                                 (%_1294 %_1539 %_1541 %_1542)
                                 %_1546
                                 %_1540
                                 %_1541
                                 (lambda (%_1547 %_1548)
                                   (list 'lambda %_1547 %_1548))))
                             %_1544)
                      (syntax-error %_1543)))
                  ($syntax-dispatch %_1543 '(any . any))))
               %_1539)))
          (%_1162
            'core
            'letrec
            (lambda (%_1549 %_1550 %_1551 %_1552)
              ((lambda (%_1553)
                 ((lambda (%_1554)
                    (if %_1554
                      (apply (lambda (%_1556 %_1557 %_1558 %_1559 %_1560)
                               ((lambda (%_1561)
                                  (if (not (%_1289 %_1561))
                                    (%_1291
                                      (map (lambda (%_1569)
                                             (%_1293 %_1569 %_1551))
                                           %_1561)
                                      (%_1294 %_1549 %_1551 %_1552)
                                      '"bound variable")
                                    ((lambda (%_1562 %_1563)
                                       ((lambda (%_1564 %_1565)
                                          (%_1099
                                            %_1552
                                            %_1563
                                            (map (lambda (%_1566)
                                                   (%_1335
                                                     %_1566
                                                     %_1565
                                                     %_1564))
                                                 %_1558)
                                            (%_1340
                                              (cons %_1559 %_1560)
                                              (%_1294 %_1549 %_1564 %_1552)
                                              %_1565
                                              %_1564)))
                                        (%_1276 %_1561 %_1562 %_1551)
                                        (%_1156 %_1562 %_1563 %_1550)))
                                     (%_1207 %_1561)
                                     (map %_1354 %_1561))))
                                %_1557))
                             %_1554)
                      ((lambda (%_1555)
                         (syntax-error (%_1294 %_1549 %_1551 %_1552)))
                       %_1553)))
                  ($syntax-dispatch
                    %_1553
                    '(any #2(each (any any)) any . each-any))))
               %_1549)))
          (%_1162
            'core
            'if
            (lambda (%_1571 %_1572 %_1573 %_1574)
              ((lambda (%_1575)
                 ((lambda (%_1576)
                    (if %_1576
                      (apply (lambda (%_1583 %_1584 %_1585)
                               (list 'if
                                     (%_1335 %_1584 %_1572 %_1573)
                                     (%_1335 %_1585 %_1572 %_1573)
                                     (%_1349)))
                             %_1576)
                      ((lambda (%_1577)
                         (if %_1577
                           (apply (lambda (%_1579 %_1580 %_1581 %_1582)
                                    (list 'if
                                          (%_1335 %_1580 %_1572 %_1573)
                                          (%_1335 %_1581 %_1572 %_1573)
                                          (%_1335 %_1582 %_1572 %_1573)))
                                  %_1577)
                           ((lambda (%_1578)
                              (syntax-error (%_1294 %_1571 %_1573 %_1574)))
                            %_1575)))
                       ($syntax-dispatch %_1575 '(any any any any)))))
                  ($syntax-dispatch %_1575 '(any any any))))
               %_1571)))
          (%_1162 'set! 'set! '())
          (%_1162 'begin 'begin '())
          (%_1162 'module-key 'module '())
          (%_1162 'import 'import '#f)
          (%_1162 'import 'import-only '#t)
          (%_1162 'define 'define '())
          (%_1162 'define-syntax 'define-syntax '())
          (%_1162 'eval-when 'eval-when '())
          (%_1162
            'core
            'syntax-case
            ((lambda ()
               ((lambda (%_1589 %_1588 %_1587 %_1586)
                  (begin
                    (set! %_1589
                      (lambda (%_1606 %_1607 %_1608 %_1609)
                        (if (null? %_1608)
                          (list 'syntax-error %_1606)
                          ((lambda (%_1610)
                             ((lambda (%_1611)
                                (if %_1611
                                  (apply (lambda (%_1617 %_1618)
                                           (if (if (%_1164 %_1617)
                                                 (if (not (%_1292
                                                            %_1617
                                                            %_1607))
                                                   (not (%_1350 %_1617))
                                                   '#f)
                                                 '#f)
                                             ((lambda (%_1619 %_1620)
                                                (list (list 'lambda
                                                            (list %_1620)
                                                            (%_1335
                                                              %_1618
                                                              (%_1154
                                                                %_1619
                                                                (%_1139
                                                                  'syntax
                                                                  (cons %_1620
                                                                        '0))
                                                                %_1609)
                                                              (%_1276
                                                                (list %_1617)
                                                                (list %_1619)
                                                                '(()))))
                                                      %_1606))
                                              (%_1205)
                                              (%_1354 %_1617))
                                             (%_1588
                                               %_1606
                                               %_1607
                                               (cdr %_1608)
                                               %_1609
                                               %_1617
                                               '#t
                                               %_1618)))
                                         %_1611)
                                  ((lambda (%_1612)
                                     (if %_1612
                                       (apply (lambda (%_1614 %_1615 %_1616)
                                                (%_1588
                                                  %_1606
                                                  %_1607
                                                  (cdr %_1608)
                                                  %_1609
                                                  %_1614
                                                  %_1615
                                                  %_1616))
                                              %_1612)
                                       ((lambda (%_1613)
                                          (syntax-error
                                            (car %_1608)
                                            '"invalid syntax-case clause"))
                                        %_1610)))
                                   ($syntax-dispatch %_1610 '(any any any)))))
                              ($syntax-dispatch %_1610 '(any any))))
                           (car %_1608)))))
                    (set! %_1588
                      (lambda (%_1621
                               %_1622
                               %_1623
                               %_1624
                               %_1625
                               %_1626
                               %_1627)
                        (call-with-values
                          (lambda () (%_1586 %_1625 %_1622))
                          (lambda (%_1628 %_1629)
                            (if (not (%_1290 (map car %_1629)))
                              (%_1291
                                (map car %_1629)
                                %_1625
                                '"pattern variable")
                              (if (not (andmap
                                         (lambda (%_1643)
                                           (not (%_1350 (car %_1643))))
                                         %_1629))
                                (syntax-error
                                  %_1625
                                  '"misplaced ellipsis in syntax-case pattern")
                                ((lambda (%_1630)
                                   (list (list 'lambda
                                               (list %_1630)
                                               (list 'if
                                                     ((lambda (%_1640)
                                                        ((lambda (%_1641)
                                                           (if %_1641
                                                             (apply (lambda ()
                                                                      %_1630)
                                                                    %_1641)
                                                             ((lambda (%_1642)
                                                                (list 'if
                                                                      %_1630
                                                                      (%_1587
                                                                        %_1629
                                                                        %_1626
                                                                        %_1630
                                                                        %_1624)
                                                                      (list 'quote
                                                                            '#f)))
                                                              %_1640)))
                                                         ($syntax-dispatch
                                                           %_1640
                                                           '#2(atom #t))))
                                                      %_1626)
                                                     (%_1587
                                                       %_1629
                                                       %_1627
                                                       %_1630
                                                       %_1624)
                                                     (%_1589
                                                       %_1621
                                                       %_1622
                                                       %_1623
                                                       %_1624)))
                                         (if (eq? %_1628 'any)
                                           (list 'list %_1621)
                                           (list '$syntax-dispatch
                                                 %_1621
                                                 (list 'quote %_1628)))))
                                 (%_1354 'tmp))))))))
                    (set! %_1587
                      (lambda (%_1644 %_1645 %_1646 %_1647)
                        ((lambda (%_1648 %_1649)
                           ((lambda (%_1650 %_1651)
                              (list 'apply
                                    (list 'lambda
                                          %_1651
                                          (%_1335
                                            %_1645
                                            (%_1155
                                              %_1650
                                              (map (lambda (%_1652 %_1653)
                                                     (%_1139
                                                       'syntax
                                                       (cons %_1652 %_1653)))
                                                   %_1651
                                                   (map cdr %_1644))
                                              %_1647)
                                            (%_1276 %_1648 %_1650 '(()))))
                                    %_1646))
                            (%_1207 %_1648)
                            (map %_1354 %_1648)))
                         (map car %_1644)
                         (map cdr %_1644))))
                    (set! %_1586
                      (lambda (%_1654 %_1655)
                        (((lambda (%_1656)
                            (begin
                              (set! %_1656
                                (lambda (%_1657 %_1658 %_1659)
                                  (if (%_1164 %_1657)
                                    (if (%_1292 %_1657 %_1655)
                                      (values (vector 'free-id %_1657) %_1659)
                                      (values
                                        'any
                                        (cons (cons %_1657 %_1658) %_1659)))
                                    ((lambda (%_1660)
                                       ((lambda (%_1661)
                                          (if (if %_1661
                                                (apply (lambda (%_1680 %_1681)
                                                         (%_1350 %_1681))
                                                       %_1661)
                                                '#f)
                                            (apply (lambda (%_1676 %_1677)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_1656
                                                           %_1676
                                                           (+ %_1658 '1)
                                                           %_1659))
                                                       (lambda (%_1678 %_1679)
                                                         (values
                                                           (if (eq? %_1678
                                                                    'any)
                                                             'each-any
                                                             (vector
                                                               'each
                                                               %_1678))
                                                           %_1679))))
                                                   %_1661)
                                            ((lambda (%_1662)
                                               (if %_1662
                                                 (apply (lambda (%_1670 %_1671)
                                                          (call-with-values
                                                            (lambda ()
                                                              (%_1656
                                                                %_1671
                                                                %_1658
                                                                %_1659))
                                                            (lambda (%_1672
                                                                     %_1673)
                                                              (call-with-values
                                                                (lambda ()
                                                                  (%_1656
                                                                    %_1670
                                                                    %_1658
                                                                    %_1673))
                                                                (lambda (%_1674
                                                                         %_1675)
                                                                  (values
                                                                    (cons %_1674
                                                                          %_1672)
                                                                    %_1675))))))
                                                        %_1662)
                                                 ((lambda (%_1663)
                                                    (if %_1663
                                                      (apply (lambda ()
                                                               (values
                                                                 '()
                                                                 %_1659))
                                                             %_1663)
                                                      ((lambda (%_1664)
                                                         (if %_1664
                                                           (apply (lambda (%_1666)
                                                                    (call-with-values
                                                                      (lambda ()
                                                                        (%_1656
                                                                          %_1666
                                                                          %_1658
                                                                          %_1659))
                                                                      (lambda (%_1668
                                                                               %_1669)
                                                                        (values
                                                                          (vector
                                                                            'vector
                                                                            %_1668)
                                                                          %_1669))))
                                                                  %_1664)
                                                           ((lambda (%_1665)
                                                              (values
                                                                (vector
                                                                  'atom
                                                                  (%_1353
                                                                    %_1657
                                                                    '(())))
                                                                %_1659))
                                                            %_1660)))
                                                       ($syntax-dispatch
                                                         %_1660
                                                         '#2(vector
                                                             each-any)))))
                                                  ($syntax-dispatch
                                                    %_1660
                                                    '()))))
                                             ($syntax-dispatch
                                               %_1660
                                               '(any . any)))))
                                        ($syntax-dispatch %_1660 '(any any))))
                                     %_1657))))
                              %_1656))
                          #f)
                         %_1654
                         '0
                         '())))
                    (lambda (%_1590 %_1591 %_1592 %_1593)
                      ((lambda (%_1594)
                         ((lambda (%_1595)
                            ((lambda (%_1596)
                               (if %_1596
                                 (apply (lambda (%_1597 %_1598 %_1599 %_1600)
                                          (if (andmap
                                                (lambda (%_1604)
                                                  (if (%_1164 %_1604)
                                                    (not (%_1350 %_1604))
                                                    '#f))
                                                %_1599)
                                            ((lambda (%_1601)
                                               (list (list 'lambda
                                                           (list %_1601)
                                                           (%_1589
                                                             %_1601
                                                             %_1599
                                                             %_1600
                                                             %_1591))
                                                     (%_1335
                                                       %_1598
                                                       %_1591
                                                       '(()))))
                                             (%_1354 'tmp))
                                            (syntax-error
                                              %_1594
                                              '"invalid literals list in")))
                                        %_1596)
                                 (syntax-error %_1595)))
                             ($syntax-dispatch
                               %_1595
                               '(any any each-any . each-any))))
                          %_1594))
                       (%_1294 %_1590 %_1592 %_1593)))))
                #f
                #f
                #f
                #f))))
          (set! sc-expand
            ((lambda (%_1682 %_1683 %_1684)
               ((lambda (%_1685)
                  (lambda (%_1686)
                    (if (if (pair? %_1686)
                          (equal? (car %_1686) %_951)
                          '#f)
                      (cadr %_1686)
                      (%_1300 %_1686 '() %_1685 %_1682 %_1683 %_1684))))
                (%_1171
                  (%_1172 '((top)))
                  (cons %_1684 (%_1173 '((top)))))))
             '(l c)
             '(l)
             ((lambda (%_1687)
                (begin (%_1274 %_1687 '*top*) %_1687))
              (%_1212 '() '() '()))))
          (set! identifier?
            (lambda (%_1688) (%_1163 %_1688)))
          (set! datum->syntax-object
            (lambda (%_1689 %_1690)
              (begin
                ((lambda (%_1691)
                   (if (not (%_1163 %_1691))
                     (%_991 'datum->syntax-object
                            '"invalid argument"
                            %_1691)
                     (void)))
                 %_1689)
                (%_1111 %_1690 (%_1114 %_1689)))))
          (set! syntax-object->datum
            (lambda (%_1692) (%_1353 %_1692 '(()))))
          (set! generate-temporaries
            (lambda (%_1693)
              (begin
                ((lambda (%_1694)
                   (if (not (list? %_1694))
                     (%_991 'generate-temporaries
                            '"invalid argument"
                            %_1694)
                     (void)))
                 %_1693)
                (map (lambda (%_1695) (%_1293 (gensym) '((top))))
                     %_1693))))
          (set! free-identifier=?
            (lambda (%_1696 %_1697)
              (begin
                ((lambda (%_1698)
                   (if (not (%_1163 %_1698))
                     (%_991 'free-identifier=?
                            '"invalid argument"
                            %_1698)
                     (void)))
                 %_1696)
                ((lambda (%_1699)
                   (if (not (%_1163 %_1699))
                     (%_991 'free-identifier=?
                            '"invalid argument"
                            %_1699)
                     (void)))
                 %_1697)
                (%_1286 %_1696 %_1697))))
          (set! bound-identifier=?
            (lambda (%_1700 %_1701)
              (begin
                ((lambda (%_1702)
                   (if (not (%_1163 %_1702))
                     (%_991 'bound-identifier=?
                            '"invalid argument"
                            %_1702)
                     (void)))
                 %_1700)
                ((lambda (%_1703)
                   (if (not (%_1163 %_1703))
                     (%_991 'bound-identifier=?
                            '"invalid argument"
                            %_1703)
                     (void)))
                 %_1701)
                (%_1288 %_1700 %_1701))))
          (set! literal-identifier=?
            (lambda (%_1704 %_1705)
              (begin
                ((lambda (%_1706)
                   (if (not (%_1163 %_1706))
                     (%_991 'literal-identifier=?
                            '"invalid argument"
                            %_1706)
                     (void)))
                 %_1704)
                ((lambda (%_1707)
                   (if (not (%_1163 %_1707))
                     (%_991 'literal-identifier=?
                            '"invalid argument"
                            %_1707)
                     (void)))
                 %_1705)
                (%_1287 %_1704 %_1705))))
          (set! syntax-error
            (lambda (%_1709 . %_1708)
              (begin
                (for-each
                  (lambda (%_1710)
                    ((lambda (%_1711)
                       (if (not (string? %_1711))
                         (%_991 'syntax-error '"invalid argument" %_1711)
                         (void)))
                     %_1710))
                  %_1708)
                ((lambda (%_1712)
                   (%_991 '#f %_1712 (%_1353 %_1709 '(()))))
                 (if (null? %_1708)
                   '"invalid syntax"
                   (apply string-append %_1708))))))
          ((lambda ()
             ((lambda (%_1717 %_1716 %_1715 %_1714 %_1713)
                (begin
                  (set! %_1717
                    (lambda (%_1722 %_1723 %_1724 %_1725)
                      (if (not %_1725)
                        '#f
                        (if (eq? %_1723 'any)
                          (cons (%_1293 %_1722 %_1724) %_1725)
                          (if (%_1112 %_1722)
                            (%_1716
                              ((lambda (%_1727)
                                 (if (%_988 %_1727)
                                   (annotation-expression %_1727)
                                   %_1727))
                               (%_1113 %_1722))
                              %_1723
                              (%_1279 %_1724 (%_1114 %_1722))
                              %_1725)
                            (%_1716
                              ((lambda (%_1726)
                                 (if (%_988 %_1726)
                                   (annotation-expression %_1726)
                                   %_1726))
                               %_1722)
                              %_1723
                              %_1724
                              %_1725))))))
                  (set! %_1716
                    (lambda (%_1728 %_1729 %_1730 %_1731)
                      (if (null? %_1729)
                        (if (null? %_1728) %_1731 '#f)
                        (if (pair? %_1729)
                          (if (pair? %_1728)
                            (%_1717
                              (car %_1728)
                              (car %_1729)
                              %_1730
                              (%_1717 (cdr %_1728) (cdr %_1729) %_1730 %_1731))
                            '#f)
                          (if (eq? %_1729 'each-any)
                            ((lambda (%_1736)
                               (if %_1736 (cons %_1736 %_1731) '#f))
                             (%_1714 %_1728 %_1730))
                            ((lambda (%_1732)
                               (if (memv %_1732 '(each))
                                 (if (null? %_1728)
                                   (%_1715 (vector-ref %_1729 '1) %_1731)
                                   ((lambda (%_1733)
                                      (if %_1733
                                        (((lambda (%_1734)
                                            (begin
                                              (set! %_1734
                                                (lambda (%_1735)
                                                  (if (null? (car %_1735))
                                                    %_1731
                                                    (cons (map car %_1735)
                                                          (%_1734
                                                            (map cdr
                                                                 %_1735))))))
                                              %_1734))
                                          #f)
                                         %_1733)
                                        '#f))
                                    (%_1713
                                      %_1728
                                      (vector-ref %_1729 '1)
                                      %_1730)))
                                 (if (memv %_1732 '(free-id))
                                   (if (%_1164 %_1728)
                                     (if (%_1287
                                           (%_1293 %_1728 %_1730)
                                           (vector-ref %_1729 '1))
                                       %_1731
                                       '#f)
                                     '#f)
                                   (if (memv %_1732 '(atom))
                                     (if (equal?
                                           (vector-ref %_1729 '1)
                                           (%_1353 %_1728 %_1730))
                                       %_1731
                                       '#f)
                                     (if (memv %_1732 '(vector))
                                       (if (vector? %_1728)
                                         (%_1717
                                           (vector->list %_1728)
                                           (vector-ref %_1729 '1)
                                           %_1730
                                           %_1731)
                                         '#f)
                                       (void))))))
                             (vector-ref %_1729 '0)))))))
                  (set! %_1715
                    (lambda (%_1737 %_1738)
                      (if (null? %_1737)
                        %_1738
                        (if (eq? %_1737 'any)
                          (cons '() %_1738)
                          (if (pair? %_1737)
                            (%_1715
                              (car %_1737)
                              (%_1715 (cdr %_1737) %_1738))
                            (if (eq? %_1737 'each-any)
                              (cons '() %_1738)
                              ((lambda (%_1739)
                                 (if (memv %_1739 '(each))
                                   (%_1715 (vector-ref %_1737 '1) %_1738)
                                   (if (memv %_1739 '(free-id atom))
                                     %_1738
                                     (if (memv %_1739 '(vector))
                                       (%_1715 (vector-ref %_1737 '1) %_1738)
                                       (void)))))
                               (vector-ref %_1737 '0))))))))
                  (set! %_1714
                    (lambda (%_1740 %_1741)
                      (if (%_988 %_1740)
                        (%_1714 (annotation-expression %_1740) %_1741)
                        (if (pair? %_1740)
                          ((lambda (%_1742)
                             (if %_1742
                               (cons (%_1293 (car %_1740) %_1741) %_1742)
                               '#f))
                           (%_1714 (cdr %_1740) %_1741))
                          (if (null? %_1740)
                            '()
                            (if (%_1112 %_1740)
                              (%_1714
                                (%_1113 %_1740)
                                (%_1279 %_1741 (%_1114 %_1740)))
                              '#f))))))
                  (set! %_1713
                    (lambda (%_1743 %_1744 %_1745)
                      (if (%_988 %_1743)
                        (%_1713
                          (annotation-expression %_1743)
                          %_1744
                          %_1745)
                        (if (pair? %_1743)
                          ((lambda (%_1746)
                             (if %_1746
                               ((lambda (%_1747)
                                  (if %_1747 (cons %_1746 %_1747) '#f))
                                (%_1713 (cdr %_1743) %_1744 %_1745))
                               '#f))
                           (%_1717 (car %_1743) %_1744 %_1745 '()))
                          (if (null? %_1743)
                            '()
                            (if (%_1112 %_1743)
                              (%_1713
                                (%_1113 %_1743)
                                %_1744
                                (%_1279 %_1745 (%_1114 %_1743)))
                              '#f))))))
                  (set! $syntax-dispatch
                    (lambda (%_1718 %_1719)
                      (if (eq? %_1719 'any)
                        (list %_1718)
                        (if (%_1112 %_1718)
                          (%_1716
                            ((lambda (%_1721)
                               (if (%_988 %_1721)
                                 (annotation-expression %_1721)
                                 %_1721))
                             (%_1113 %_1718))
                            %_1719
                            (%_1114 %_1718)
                            '())
                          (%_1716
                            ((lambda (%_1720)
                               (if (%_988 %_1720)
                                 (annotation-expression %_1720)
                                 %_1720))
                             %_1718)
                            %_1719
                            '(())
                            '())))))))
              #f
              #f
              #f
              #f
              #f))))))
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f
    #f)))
($sc-put-cte
  'with-syntax
  (lambda (%_2774)
    ((lambda (%_2775)
       ((lambda (%_2776)
          (if %_2776
            (apply (lambda (%_2793 %_2794 %_2795)
                     (cons '#3(syntax-object
                               begin
                               ((top)
                                #4(ribcage
                                   #3(_ e1 e2)
                                   #3((top))
                                   #3("i" "i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           (cons %_2794 %_2795)))
                   %_2776)
            ((lambda (%_2777)
               (if %_2777
                 (apply (lambda (%_2787 %_2788 %_2789 %_2790 %_2791)
                          (list '#3(syntax-object
                                    syntax-case
                                    ((top)
                                     #4(ribcage
                                        #5(_ out in e1 e2)
                                        #5((top))
                                        #5("i" "i" "i" "i" "i"))
                                     #4(ribcage ())
                                     #4(ribcage #1(x) #1((top)) #1("i"))
                                     #4(ribcage ((import-token . *top*)) ())))
                                %_2789
                                '()
                                (list %_2788
                                      (cons '#3(syntax-object
                                                begin
                                                ((top)
                                                 #4(ribcage
                                                    #5(_ out in e1 e2)
                                                    #5((top))
                                                    #5("i" "i" "i" "i" "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #1(x)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ())))
                                            (cons %_2790 %_2791)))))
                        %_2777)
                 ((lambda (%_2778)
                    (if %_2778
                      (apply (lambda (%_2779 %_2780 %_2781 %_2782 %_2783)
                               (list '#3(syntax-object
                                         syntax-case
                                         ((top)
                                          #4(ribcage
                                             #5(_ out in e1 e2)
                                             #5((top))
                                             #5("i" "i" "i" "i" "i"))
                                          #4(ribcage ())
                                          #4(ribcage #1(x) #1((top)) #1("i"))
                                          #4(ribcage
                                             ((import-token . *top*))
                                             ()
                                             ())))
                                     (cons '#3(syntax-object
                                               list
                                               ((top)
                                                #4(ribcage
                                                   #5(_ out in e1 e2)
                                                   #5((top))
                                                   #5("i" "i" "i" "i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   ((import-token . *top*))
                                                   ()
                                                   ())))
                                           %_2781)
                                     '()
                                     (list %_2780
                                           (cons '#3(syntax-object
                                                     begin
                                                     ((top)
                                                      #4(ribcage
                                                         #5(_ out in e1 e2)
                                                         #5((top))
                                                         #5("i"
                                                            "i"
                                                            "i"
                                                            "i"
                                                            "i"))
                                                      #4(ribcage ())
                                                      #4(ribcage
                                                         #1(x)
                                                         #1((top))
                                                         #1("i"))
                                                      #4(ribcage
                                                         ((import-token
                                                            .
                                                            *top*))
                                                         ()
                                                         ())))
                                                 (cons %_2782 %_2783)))))
                             %_2778)
                      (syntax-error %_2775)))
                  ($syntax-dispatch
                    %_2775
                    '(any #2(each (any any)) any . each-any)))))
             ($syntax-dispatch
               %_2775
               '(any ((any any)) any . each-any)))))
        ($syntax-dispatch
          %_2775
          '(any () any . each-any))))
     %_2774)))
($sc-put-cte
  'syntax-rules
  (lambda (%_2797)
    ((lambda (%_2798)
       ((lambda (%_2799)
          (if %_2799
            (apply (lambda (%_2800 %_2801 %_2802 %_2803 %_2804)
                     (list '#3(syntax-object
                               lambda
                               ((top)
                                #4(ribcage
                                   #5(_ k keyword pattern template)
                                   #5((top))
                                   #5("i" "i" "i" "i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           '#3(syntax-object
                               (x)
                               ((top)
                                #4(ribcage
                                   #5(_ k keyword pattern template)
                                   #5((top))
                                   #5("i" "i" "i" "i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           (cons '#3(syntax-object
                                     syntax-case
                                     ((top)
                                      #4(ribcage
                                         #5(_ k keyword pattern template)
                                         #5((top))
                                         #5("i" "i" "i" "i" "i"))
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ((import-token . *top*)) ())))
                                 (cons '#3(syntax-object
                                           x
                                           ((top)
                                            #4(ribcage
                                               #5(_ k keyword pattern template)
                                               #5((top))
                                               #5("i" "i" "i" "i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))
                                       (cons %_2801
                                             (map (lambda (%_2807 %_2806)
                                                    (list (cons '#3(syntax-object
                                                                    dummy
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #5(_
                                                                           k
                                                                           keyword
                                                                           pattern
                                                                           template)
                                                                        #5((top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #5("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #1(x)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        ((import-token
                                                                           .
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                %_2806)
                                                          (list '#3(syntax-object
                                                                    syntax
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #5(_
                                                                           k
                                                                           keyword
                                                                           pattern
                                                                           template)
                                                                        #5((top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #5("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #1(x)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        ((import-token
                                                                           .
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                %_2807)))
                                                  %_2804
                                                  %_2803))))))
                   %_2799)
            (syntax-error %_2798)))
        ($syntax-dispatch
          %_2798
          '(any each-any . #2(each ((any . any) any))))))
     %_2797)))
($sc-put-cte
  'or
  (lambda (%_2808)
    ((lambda (%_2809)
       ((lambda (%_2810)
          (if %_2810
            (apply (lambda (%_2820)
                     '#3(syntax-object
                         #f
                         ((top)
                          #4(ribcage #1(_) #1((top)) #1("i"))
                          #4(ribcage ())
                          #4(ribcage #1(x) #1((top)) #1("i"))
                          #4(ribcage ((import-token . *top*)) ()))))
                   %_2810)
            ((lambda (%_2811)
               (if %_2811
                 (apply (lambda (%_2818 %_2819) %_2819) %_2811)
                 ((lambda (%_2812)
                    (if %_2812
                      (apply (lambda (%_2813 %_2814 %_2815 %_2816)
                               (list '#3(syntax-object
                                         let
                                         ((top)
                                          #4(ribcage
                                             #4(_ e1 e2 e3)
                                             #4((top))
                                             #4("i" "i" "i" "i"))
                                          #4(ribcage ())
                                          #4(ribcage #1(x) #1((top)) #1("i"))
                                          #4(ribcage
                                             ((import-token . *top*))
                                             ()
                                             ())))
                                     (list (list '#3(syntax-object
                                                     t
                                                     ((top)
                                                      #4(ribcage
                                                         #4(_ e1 e2 e3)
                                                         #4((top))
                                                         #4("i" "i" "i" "i"))
                                                      #4(ribcage ())
                                                      #4(ribcage
                                                         #1(x)
                                                         #1((top))
                                                         #1("i"))
                                                      #4(ribcage
                                                         ((import-token
                                                            .
                                                            *top*))
                                                         ()
                                                         ())))
                                                 %_2814))
                                     (list '#3(syntax-object
                                               if
                                               ((top)
                                                #4(ribcage
                                                   #4(_ e1 e2 e3)
                                                   #4((top))
                                                   #4("i" "i" "i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   ((import-token . *top*))
                                                   ()
                                                   ())))
                                           '#3(syntax-object
                                               t
                                               ((top)
                                                #4(ribcage
                                                   #4(_ e1 e2 e3)
                                                   #4((top))
                                                   #4("i" "i" "i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   ((import-token . *top*))
                                                   ()
                                                   ())))
                                           '#3(syntax-object
                                               t
                                               ((top)
                                                #4(ribcage
                                                   #4(_ e1 e2 e3)
                                                   #4((top))
                                                   #4("i" "i" "i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   ((import-token . *top*))
                                                   ()
                                                   ())))
                                           (cons '#3(syntax-object
                                                     or
                                                     ((top)
                                                      #4(ribcage
                                                         #4(_ e1 e2 e3)
                                                         #4((top))
                                                         #4("i" "i" "i" "i"))
                                                      #4(ribcage ())
                                                      #4(ribcage
                                                         #1(x)
                                                         #1((top))
                                                         #1("i"))
                                                      #4(ribcage
                                                         ((import-token
                                                            .
                                                            *top*))
                                                         ()
                                                         ())))
                                                 (cons %_2815 %_2816)))))
                             %_2812)
                      (syntax-error %_2809)))
                  ($syntax-dispatch
                    %_2809
                    '(any any any . each-any)))))
             ($syntax-dispatch %_2809 '(any any)))))
        ($syntax-dispatch %_2809 '(any))))
     %_2808)))
($sc-put-cte
  'and
  (lambda (%_2821)
    ((lambda (%_2822)
       ((lambda (%_2823)
          (if %_2823
            (apply (lambda (%_2829 %_2830 %_2831 %_2832)
                     (cons '#3(syntax-object
                               if
                               ((top)
                                #4(ribcage
                                   #4(_ e1 e2 e3)
                                   #4((top))
                                   #4("i" "i" "i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           (cons %_2830
                                 (cons (cons '#3(syntax-object
                                                 and
                                                 ((top)
                                                  #4(ribcage
                                                     #4(_ e1 e2 e3)
                                                     #4((top))
                                                     #4("i" "i" "i" "i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #1(x)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage
                                                     ((import-token . *top*))
                                                     ()
                                                     ())))
                                             (cons %_2831 %_2832))
                                       '#3(syntax-object
                                           (#f)
                                           ((top)
                                            #4(ribcage
                                               #4(_ e1 e2 e3)
                                               #4((top))
                                               #4("i" "i" "i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))))))
                   %_2823)
            ((lambda (%_2824)
               (if %_2824
                 (apply (lambda (%_2827 %_2828) %_2828) %_2824)
                 ((lambda (%_2825)
                    (if %_2825
                      (apply (lambda (%_2826)
                               '#3(syntax-object
                                   #t
                                   ((top)
                                    #4(ribcage #1(_) #1((top)) #1("i"))
                                    #4(ribcage ())
                                    #4(ribcage #1(x) #1((top)) #1("i"))
                                    #4(ribcage ((import-token . *top*)) ()))))
                             %_2825)
                      (syntax-error %_2822)))
                  ($syntax-dispatch %_2822 '(any)))))
             ($syntax-dispatch %_2822 '(any any)))))
        ($syntax-dispatch
          %_2822
          '(any any any . each-any))))
     %_2821)))
($sc-put-cte
  'let
  (lambda (%_2834)
    ((lambda (%_2835)
       ((lambda (%_2836)
          (if (if %_2836
                (apply (lambda (%_2862 %_2863 %_2864 %_2865 %_2866)
                         (andmap identifier? %_2863))
                       %_2836)
                '#f)
            (apply (lambda (%_2854 %_2855 %_2856 %_2857 %_2858)
                     (cons (cons '#3(syntax-object
                                     lambda
                                     ((top)
                                      #4(ribcage
                                         #5(_ x v e1 e2)
                                         #5((top))
                                         #5("i" "i" "i" "i" "i"))
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ((import-token . *top*)) ())))
                                 (cons %_2855 (cons %_2857 %_2858)))
                           %_2856))
                   %_2836)
            ((lambda (%_2837)
               (if (if %_2837
                     (apply (lambda (%_2847 %_2848 %_2849 %_2850 %_2851 %_2852)
                              (andmap identifier? (cons %_2848 %_2849)))
                            %_2837)
                     '#f)
                 (apply (lambda (%_2838 %_2839 %_2840 %_2841 %_2842 %_2843)
                          (cons (list '#3(syntax-object
                                          letrec
                                          ((top)
                                           #4(ribcage
                                              #6(_ f x v e1 e2)
                                              #6((top))
                                              #6("i" "i" "i" "i" "i" "i"))
                                           #4(ribcage ())
                                           #4(ribcage #1(x) #1((top)) #1("i"))
                                           #4(ribcage
                                              ((import-token . *top*))
                                              ()
                                              ())))
                                      (list (list %_2839
                                                  (cons '#3(syntax-object
                                                            lambda
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   f
                                                                   x
                                                                   v
                                                                   e1
                                                                   e2)
                                                                #6((top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (cons %_2840
                                                              (cons %_2842
                                                                    %_2843)))))
                                      %_2839)
                                %_2841))
                        %_2837)
                 (syntax-error %_2835)))
             ($syntax-dispatch
               %_2835
               '(any any #2(each (any any)) any . each-any)))))
        ($syntax-dispatch
          %_2835
          '(any #2(each (any any)) any . each-any))))
     %_2834)))
($sc-put-cte
  'let*
  (lambda (%_2868)
    ((lambda (%_2869)
       ((lambda (%_2870)
          (if (if %_2870
                (apply (lambda (%_2885 %_2886 %_2887 %_2888 %_2889)
                         (andmap identifier? %_2886))
                       %_2870)
                '#f)
            (apply (lambda (%_2871 %_2872 %_2873 %_2874 %_2875)
                     (((lambda (%_2876)
                         (begin
                           (set! %_2876
                             (lambda (%_2877)
                               (if (null? %_2877)
                                 (cons '#3(syntax-object
                                           let
                                           ((top)
                                            #4(ribcage ())
                                            #4(ribcage
                                               #1(bindings)
                                               #1((top))
                                               #1("i"))
                                            #4(ribcage #1(f) #1((top)) #1("i"))
                                            #4(ribcage
                                               #5(let* x v e1 e2)
                                               #5((top))
                                               #5("i" "i" "i" "i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))
                                       (cons '() (cons %_2874 %_2875)))
                                 ((lambda (%_2878)
                                    ((lambda (%_2879)
                                       (if %_2879
                                         (apply (lambda (%_2880 %_2881)
                                                  (list '#3(syntax-object
                                                            let
                                                            ((top)
                                                             #4(ribcage
                                                                #2(body
                                                                   binding)
                                                                #2((top))
                                                                #2("i" "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(bindings)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                #1(f)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                #5(let*
                                                                   x
                                                                   v
                                                                   e1
                                                                   e2)
                                                                #5((top))
                                                                #5("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (list %_2881)
                                                        %_2880))
                                                %_2879)
                                         (syntax-error %_2878)))
                                     ($syntax-dispatch %_2878 '(any any))))
                                  (list (%_2876 (cdr %_2877)) (car %_2877))))))
                           %_2876))
                       #f)
                      (map list %_2872 %_2873)))
                   %_2870)
            (syntax-error %_2869)))
        ($syntax-dispatch
          %_2869
          '(any #2(each (any any)) any . each-any))))
     %_2868)))
($sc-put-cte
  'cond
  (lambda (%_2891)
    ((lambda (%_2892)
       ((lambda (%_2893)
          (if %_2893
            (apply (lambda (%_2894 %_2895 %_2896)
                     (((lambda (%_2897)
                         (begin
                           (set! %_2897
                             (lambda (%_2898 %_2899)
                               (if (null? %_2899)
                                 ((lambda (%_2914)
                                    ((lambda (%_2915)
                                       (if %_2915
                                         (apply (lambda (%_2927 %_2928)
                                                  (cons '#3(syntax-object
                                                            begin
                                                            ((top)
                                                             #4(ribcage
                                                                #2(e1 e2)
                                                                #2((top))
                                                                #2("i" "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #2(clause
                                                                   clauses)
                                                                #2((top))
                                                                #2("i" "i"))
                                                             #4(ribcage
                                                                #1(f)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                #3(_ m1 m2)
                                                                #3((top))
                                                                #3("i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (cons %_2927 %_2928)))
                                                %_2915)
                                         ((lambda (%_2916)
                                            (if %_2916
                                              (apply (lambda (%_2926)
                                                       (cons '#3(syntax-object
                                                                 let
                                                                 ((top)
                                                                  #4(ribcage
                                                                     #1(e0)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #2(clause
                                                                        clauses)
                                                                     #2((top))
                                                                     #2("i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     #1(f)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     #3(_
                                                                        m1
                                                                        m2)
                                                                     #3((top))
                                                                     #3("i"
                                                                        "i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #1(x)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     ((import-token
                                                                        .
                                                                        *top*))
                                                                     ()
                                                                     ())))
                                                             (cons (list (list '#3(syntax-object
                                                                                   t
                                                                                   ((top)
                                                                                    #4(ribcage
                                                                                       #1(e0)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #2(clause
                                                                                          clauses)
                                                                                       #2((top)
                                                                                          (top))
                                                                                       #2("i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       #1(f)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       #3(_
                                                                                          m1
                                                                                          m2)
                                                                                       #3((top)
                                                                                          (top)
                                                                                          (top))
                                                                                       #3("i"
                                                                                          "i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #1(x)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ((import-token
                                                                                          .
                                                                                          *top*))
                                                                                       ()
                                                                                       ())))
                                                                               %_2926))
                                                                   '#3(syntax-object
                                                                       ((if t
                                                                          t))
                                                                       ((top)
                                                                        #4(ribcage
                                                                           #1(e0)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #2(clause
                                                                              clauses)
                                                                           #2((top)
                                                                              (top))
                                                                           #2("i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           #1(f)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           #3(_
                                                                              m1
                                                                              m2)
                                                                           #3((top)
                                                                              (top)
                                                                              (top))
                                                                           #3("i"
                                                                              "i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #1(x)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ((import-token
                                                                              .
                                                                              *top*))
                                                                           ()
                                                                           ()))))))
                                                     %_2916)
                                              ((lambda (%_2917)
                                                 (if %_2917
                                                   (apply (lambda (%_2924
                                                                   %_2925)
                                                            (list '#3(syntax-object
                                                                      let
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #2(e0
                                                                             e1)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #2(clause
                                                                             clauses)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #1(f)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          #3(_
                                                                             m1
                                                                             m2)
                                                                          #3((top)
                                                                             (top)
                                                                             (top))
                                                                          #3("i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #1(x)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          ((import-token
                                                                             .
                                                                             *top*))
                                                                          ()
                                                                          ())))
                                                                  (list (list '#3(syntax-object
                                                                                  t
                                                                                  ((top)
                                                                                   #4(ribcage
                                                                                      #2(e0
                                                                                         e1)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #2(clause
                                                                                         clauses)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(f)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      #3(_
                                                                                         m1
                                                                                         m2)
                                                                                      #3((top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #3("i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #1(x)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ((import-token
                                                                                         .
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))
                                                                              %_2924))
                                                                  (list '#3(syntax-object
                                                                            if
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #2(e0
                                                                                   e1)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #2(clause
                                                                                   clauses)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(f)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #3(_
                                                                                   m1
                                                                                   m2)
                                                                                #3((top)
                                                                                   (top)
                                                                                   (top))
                                                                                #3("i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                ((import-token
                                                                                   .
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                        '#3(syntax-object
                                                                            t
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #2(e0
                                                                                   e1)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #2(clause
                                                                                   clauses)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(f)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #3(_
                                                                                   m1
                                                                                   m2)
                                                                                #3((top)
                                                                                   (top)
                                                                                   (top))
                                                                                #3("i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                ((import-token
                                                                                   .
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                        (cons %_2925
                                                                              '#3(syntax-object
                                                                                  (t)
                                                                                  ((top)
                                                                                   #4(ribcage
                                                                                      #2(e0
                                                                                         e1)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #2(clause
                                                                                         clauses)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(f)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      #3(_
                                                                                         m1
                                                                                         m2)
                                                                                      #3((top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #3("i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #1(x)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ((import-token
                                                                                         .
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))))))
                                                          %_2917)
                                                   ((lambda (%_2918)
                                                      (if %_2918
                                                        (apply (lambda (%_2920
                                                                        %_2921
                                                                        %_2922)
                                                                 (list '#3(syntax-object
                                                                           if
                                                                           ((top)
                                                                            #4(ribcage
                                                                               #3(e0
                                                                                  e1
                                                                                  e2)
                                                                               #3((top)
                                                                                  (top)
                                                                                  (top))
                                                                               #3("i"
                                                                                  "i"
                                                                                  "i"))
                                                                            #4(ribcage
                                                                               ()
                                                                               ()
                                                                               ())
                                                                            #4(ribcage
                                                                               #2(clause
                                                                                  clauses)
                                                                               #2((top)
                                                                                  (top))
                                                                               #2("i"
                                                                                  "i"))
                                                                            #4(ribcage
                                                                               #1(f)
                                                                               #1((top))
                                                                               #1("i"))
                                                                            #4(ribcage
                                                                               #3(_
                                                                                  m1
                                                                                  m2)
                                                                               #3((top)
                                                                                  (top)
                                                                                  (top))
                                                                               #3("i"
                                                                                  "i"
                                                                                  "i"))
                                                                            #4(ribcage
                                                                               ()
                                                                               ()
                                                                               ())
                                                                            #4(ribcage
                                                                               #1(x)
                                                                               #1((top))
                                                                               #1("i"))
                                                                            #4(ribcage
                                                                               ((import-token
                                                                                  .
                                                                                  *top*))
                                                                               ()
                                                                               ())))
                                                                       %_2920
                                                                       (cons '#3(syntax-object
                                                                                 begin
                                                                                 ((top)
                                                                                  #4(ribcage
                                                                                     #3(e0
                                                                                        e1
                                                                                        e2)
                                                                                     #3((top)
                                                                                        (top)
                                                                                        (top))
                                                                                     #3("i"
                                                                                        "i"
                                                                                        "i"))
                                                                                  #4(ribcage
                                                                                     ()
                                                                                     ()
                                                                                     ())
                                                                                  #4(ribcage
                                                                                     #2(clause
                                                                                        clauses)
                                                                                     #2((top)
                                                                                        (top))
                                                                                     #2("i"
                                                                                        "i"))
                                                                                  #4(ribcage
                                                                                     #1(f)
                                                                                     #1((top))
                                                                                     #1("i"))
                                                                                  #4(ribcage
                                                                                     #3(_
                                                                                        m1
                                                                                        m2)
                                                                                     #3((top)
                                                                                        (top)
                                                                                        (top))
                                                                                     #3("i"
                                                                                        "i"
                                                                                        "i"))
                                                                                  #4(ribcage
                                                                                     ()
                                                                                     ()
                                                                                     ())
                                                                                  #4(ribcage
                                                                                     #1(x)
                                                                                     #1((top))
                                                                                     #1("i"))
                                                                                  #4(ribcage
                                                                                     ((import-token
                                                                                        .
                                                                                        *top*))
                                                                                     ()
                                                                                     ())))
                                                                             (cons %_2921
                                                                                   %_2922))))
                                                               %_2918)
                                                        ((lambda (%_2919)
                                                           (syntax-error
                                                             %_2891))
                                                         %_2914)))
                                                    ($syntax-dispatch
                                                      %_2914
                                                      '(any any . each-any)))))
                                               ($syntax-dispatch
                                                 %_2914
                                                 '(any #2(free-id
                                                          #3(syntax-object
                                                             =>
                                                             ((top)
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #2(clause
                                                                    clauses)
                                                                 #2((top))
                                                                 #2("i" "i"))
                                                              #4(ribcage
                                                                 #1(f)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 #3(_ m1 m2)
                                                                 #3((top))
                                                                 #3("i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(x)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 ((import-token
                                                                    .
                                                                    *top*))
                                                                 ()
                                                                 ()))))
                                                       any)))))
                                          ($syntax-dispatch %_2914 '(any)))))
                                     ($syntax-dispatch
                                       %_2914
                                       '(#2(free-id
                                            #3(syntax-object
                                               else
                                               ((top)
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #2(clause clauses)
                                                   #2((top))
                                                   #2("i" "i"))
                                                #4(ribcage
                                                   #1(f)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   #3(_ m1 m2)
                                                   #3((top))
                                                   #3("i" "i" "i"))
                                                #4(ribcage ())
                                                #4(ribcage
                                                   #1(x)
                                                   #1((top))
                                                   #1("i"))
                                                #4(ribcage
                                                   ((import-token . *top*))
                                                   ()
                                                   ()))))
                                         any
                                         .
                                         each-any))))
                                  %_2898)
                                 ((lambda (%_2900)
                                    ((lambda (%_2901)
                                       ((lambda (%_2902)
                                          ((lambda (%_2903)
                                             (if %_2903
                                               (apply (lambda (%_2913)
                                                        (list '#3(syntax-object
                                                                  let
                                                                  ((top)
                                                                   #4(ribcage
                                                                      #1(e0)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      #1(rest)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #2(clause
                                                                         clauses)
                                                                      #2((top))
                                                                      #2("i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      #1(f)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      #3(_
                                                                         m1
                                                                         m2)
                                                                      #3((top))
                                                                      #3("i"
                                                                         "i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #1(x)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      ((import-token
                                                                         .
                                                                         *top*))
                                                                      ()
                                                                      ())))
                                                              (list (list '#3(syntax-object
                                                                              t
                                                                              ((top)
                                                                               #4(ribcage
                                                                                  #1(e0)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  #1(rest)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #2(clause
                                                                                     clauses)
                                                                                  #2((top)
                                                                                     (top))
                                                                                  #2("i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  #1(f)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  #3(_
                                                                                     m1
                                                                                     m2)
                                                                                  #3((top)
                                                                                     (top)
                                                                                     (top))
                                                                                  #3("i"
                                                                                     "i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #1(x)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  ((import-token
                                                                                     .
                                                                                     *top*))
                                                                                  ()
                                                                                  ())))
                                                                          %_2913))
                                                              (list '#3(syntax-object
                                                                        if
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #1(e0)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #1(rest)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #3(_
                                                                               m1
                                                                               m2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    '#3(syntax-object
                                                                        t
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #1(e0)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #1(rest)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #3(_
                                                                               m1
                                                                               m2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    '#3(syntax-object
                                                                        t
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #1(e0)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #1(rest)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #3(_
                                                                               m1
                                                                               m2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    %_2901)))
                                                      %_2903)
                                               ((lambda (%_2904)
                                                  (if %_2904
                                                    (apply (lambda (%_2911
                                                                    %_2912)
                                                             (list '#3(syntax-object
                                                                       let
                                                                       ((top)
                                                                        #4(ribcage
                                                                           #2(e0
                                                                              e1)
                                                                           #2((top)
                                                                              (top))
                                                                           #2("i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           #1(rest)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #2(clause
                                                                              clauses)
                                                                           #2((top)
                                                                              (top))
                                                                           #2("i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           #1(f)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           #3(_
                                                                              m1
                                                                              m2)
                                                                           #3((top)
                                                                              (top)
                                                                              (top))
                                                                           #3("i"
                                                                              "i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #1(x)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ((import-token
                                                                              .
                                                                              *top*))
                                                                           ()
                                                                           ())))
                                                                   (list (list '#3(syntax-object
                                                                                   t
                                                                                   ((top)
                                                                                    #4(ribcage
                                                                                       #2(e0
                                                                                          e1)
                                                                                       #2((top)
                                                                                          (top))
                                                                                       #2("i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       #1(rest)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #2(clause
                                                                                          clauses)
                                                                                       #2((top)
                                                                                          (top))
                                                                                       #2("i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       #1(f)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       #3(_
                                                                                          m1
                                                                                          m2)
                                                                                       #3((top)
                                                                                          (top)
                                                                                          (top))
                                                                                       #3("i"
                                                                                          "i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #1(x)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ((import-token
                                                                                          .
                                                                                          *top*))
                                                                                       ()
                                                                                       ())))
                                                                               %_2911))
                                                                   (list '#3(syntax-object
                                                                             if
                                                                             ((top)
                                                                              #4(ribcage
                                                                                 #2(e0
                                                                                    e1)
                                                                                 #2((top)
                                                                                    (top))
                                                                                 #2("i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 #1(rest)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #2(clause
                                                                                    clauses)
                                                                                 #2((top)
                                                                                    (top))
                                                                                 #2("i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 #1(f)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 #3(_
                                                                                    m1
                                                                                    m2)
                                                                                 #3((top)
                                                                                    (top)
                                                                                    (top))
                                                                                 #3("i"
                                                                                    "i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #1(x)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ((import-token
                                                                                    .
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                         '#3(syntax-object
                                                                             t
                                                                             ((top)
                                                                              #4(ribcage
                                                                                 #2(e0
                                                                                    e1)
                                                                                 #2((top)
                                                                                    (top))
                                                                                 #2("i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 #1(rest)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #2(clause
                                                                                    clauses)
                                                                                 #2((top)
                                                                                    (top))
                                                                                 #2("i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 #1(f)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 #3(_
                                                                                    m1
                                                                                    m2)
                                                                                 #3((top)
                                                                                    (top)
                                                                                    (top))
                                                                                 #3("i"
                                                                                    "i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #1(x)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ((import-token
                                                                                    .
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                         (cons %_2912
                                                                               '#3(syntax-object
                                                                                   (t)
                                                                                   ((top)
                                                                                    #4(ribcage
                                                                                       #2(e0
                                                                                          e1)
                                                                                       #2((top)
                                                                                          (top))
                                                                                       #2("i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       #1(rest)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #2(clause
                                                                                          clauses)
                                                                                       #2((top)
                                                                                          (top))
                                                                                       #2("i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       #1(f)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       #3(_
                                                                                          m1
                                                                                          m2)
                                                                                       #3((top)
                                                                                          (top)
                                                                                          (top))
                                                                                       #3("i"
                                                                                          "i"
                                                                                          "i"))
                                                                                    #4(ribcage
                                                                                       ()
                                                                                       ()
                                                                                       ())
                                                                                    #4(ribcage
                                                                                       #1(x)
                                                                                       #1((top))
                                                                                       #1("i"))
                                                                                    #4(ribcage
                                                                                       ((import-token
                                                                                          .
                                                                                          *top*))
                                                                                       ()
                                                                                       ()))))
                                                                         %_2901)))
                                                           %_2904)
                                                    ((lambda (%_2905)
                                                       (if %_2905
                                                         (apply (lambda (%_2907
                                                                         %_2908
                                                                         %_2909)
                                                                  (list '#3(syntax-object
                                                                            if
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #3(e0
                                                                                   e1
                                                                                   e2)
                                                                                #3((top)
                                                                                   (top)
                                                                                   (top))
                                                                                #3("i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(rest)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #2(clause
                                                                                   clauses)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(f)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #3(_
                                                                                   m1
                                                                                   m2)
                                                                                #3((top)
                                                                                   (top)
                                                                                   (top))
                                                                                #3("i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                ((import-token
                                                                                   .
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                        %_2907
                                                                        (cons '#3(syntax-object
                                                                                  begin
                                                                                  ((top)
                                                                                   #4(ribcage
                                                                                      #3(e0
                                                                                         e1
                                                                                         e2)
                                                                                      #3((top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #3("i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(rest)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #2(clause
                                                                                         clauses)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(f)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      #3(_
                                                                                         m1
                                                                                         m2)
                                                                                      #3((top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #3("i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #1(x)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ((import-token
                                                                                         .
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))
                                                                              (cons %_2908
                                                                                    %_2909))
                                                                        %_2901))
                                                                %_2905)
                                                         ((lambda (%_2906)
                                                            (syntax-error
                                                              %_2891))
                                                          %_2902)))
                                                     ($syntax-dispatch
                                                       %_2902
                                                       '(any any
                                                             .
                                                             each-any)))))
                                                ($syntax-dispatch
                                                  %_2902
                                                  '(any #2(free-id
                                                           #3(syntax-object
                                                              =>
                                                              ((top)
                                                               #4(ribcage
                                                                  #1(rest)
                                                                  #1((top))
                                                                  #1("i"))
                                                               #4(ribcage ())
                                                               #4(ribcage
                                                                  #2(clause
                                                                     clauses)
                                                                  #2((top))
                                                                  #2("i" "i"))
                                                               #4(ribcage
                                                                  #1(f)
                                                                  #1((top))
                                                                  #1("i"))
                                                               #4(ribcage
                                                                  #3(_ m1 m2)
                                                                  #3((top))
                                                                  #3("i"
                                                                     "i"
                                                                     "i"))
                                                               #4(ribcage ())
                                                               #4(ribcage
                                                                  #1(x)
                                                                  #1((top))
                                                                  #1("i"))
                                                               #4(ribcage
                                                                  ((import-token
                                                                     .
                                                                     *top*))
                                                                  ()
                                                                  ()))))
                                                        any)))))
                                           ($syntax-dispatch %_2902 '(any))))
                                        %_2898))
                                     %_2900))
                                  (%_2897 (car %_2899) (cdr %_2899))))))
                           %_2897))
                       #f)
                      %_2895
                      %_2896))
                   %_2893)
            (syntax-error %_2892)))
        ($syntax-dispatch %_2892 '(any any . each-any))))
     %_2891)))
($sc-put-cte
  'do
  (lambda (%_2931)
    ((lambda (%_2932)
       ((lambda (%_2933)
          (if %_2933
            (apply (lambda (%_2934
                            %_2935
                            %_2936
                            %_2937
                            %_2938
                            %_2939
                            %_2940)
                     ((lambda (%_2941)
                        ((lambda (%_2951)
                           (if %_2951
                             (apply (lambda (%_2952)
                                      ((lambda (%_2953)
                                         ((lambda (%_2955)
                                            (if %_2955
                                              (apply (lambda ()
                                                       (list '#3(syntax-object
                                                                 let
                                                                 ((top)
                                                                  #4(ribcage
                                                                     #1(step)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     #7(_
                                                                        var
                                                                        init
                                                                        step
                                                                        e0
                                                                        e1
                                                                        c)
                                                                     #7((top))
                                                                     #7("i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #1(orig-x)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     ((import-token
                                                                        .
                                                                        *top*))
                                                                     ()
                                                                     ())))
                                                             '#3(syntax-object
                                                                 doloop
                                                                 ((top)
                                                                  #4(ribcage
                                                                     #1(step)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     #7(_
                                                                        var
                                                                        init
                                                                        step
                                                                        e0
                                                                        e1
                                                                        c)
                                                                     #7((top))
                                                                     #7("i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"
                                                                        "i"))
                                                                  #4(ribcage
                                                                     ()
                                                                     ()
                                                                     ())
                                                                  #4(ribcage
                                                                     #1(orig-x)
                                                                     #1((top))
                                                                     #1("i"))
                                                                  #4(ribcage
                                                                     ((import-token
                                                                        .
                                                                        *top*))
                                                                     ()
                                                                     ())))
                                                             (map list
                                                                  %_2935
                                                                  %_2936)
                                                             (list '#3(syntax-object
                                                                       if
                                                                       ((top)
                                                                        #4(ribcage
                                                                           #1(step)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           #7(_
                                                                              var
                                                                              init
                                                                              step
                                                                              e0
                                                                              e1
                                                                              c)
                                                                           #7((top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top)
                                                                              (top))
                                                                           #7("i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"
                                                                              "i"))
                                                                        #4(ribcage
                                                                           ()
                                                                           ()
                                                                           ())
                                                                        #4(ribcage
                                                                           #1(orig-x)
                                                                           #1((top))
                                                                           #1("i"))
                                                                        #4(ribcage
                                                                           ((import-token
                                                                              .
                                                                              *top*))
                                                                           ()
                                                                           ())))
                                                                   (list '#3(syntax-object
                                                                             not
                                                                             ((top)
                                                                              #4(ribcage
                                                                                 #1(step)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 #7(_
                                                                                    var
                                                                                    init
                                                                                    step
                                                                                    e0
                                                                                    e1
                                                                                    c)
                                                                                 #7((top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top))
                                                                                 #7("i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #1(orig-x)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ((import-token
                                                                                    .
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                         %_2938)
                                                                   (cons '#3(syntax-object
                                                                             begin
                                                                             ((top)
                                                                              #4(ribcage
                                                                                 #1(step)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 #7(_
                                                                                    var
                                                                                    init
                                                                                    step
                                                                                    e0
                                                                                    e1
                                                                                    c)
                                                                                 #7((top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top)
                                                                                    (top))
                                                                                 #7("i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"
                                                                                    "i"))
                                                                              #4(ribcage
                                                                                 ()
                                                                                 ()
                                                                                 ())
                                                                              #4(ribcage
                                                                                 #1(orig-x)
                                                                                 #1((top))
                                                                                 #1("i"))
                                                                              #4(ribcage
                                                                                 ((import-token
                                                                                    .
                                                                                    *top*))
                                                                                 ()
                                                                                 ())))
                                                                         (append
                                                                           %_2940
                                                                           (list (cons '#3(syntax-object
                                                                                           doloop
                                                                                           ((top)
                                                                                            #4(ribcage
                                                                                               #1(step)
                                                                                               #1((top))
                                                                                               #1("i"))
                                                                                            #4(ribcage
                                                                                               #7(_
                                                                                                  var
                                                                                                  init
                                                                                                  step
                                                                                                  e0
                                                                                                  e1
                                                                                                  c)
                                                                                               #7((top)
                                                                                                  (top)
                                                                                                  (top)
                                                                                                  (top)
                                                                                                  (top)
                                                                                                  (top)
                                                                                                  (top))
                                                                                               #7("i"
                                                                                                  "i"
                                                                                                  "i"
                                                                                                  "i"
                                                                                                  "i"
                                                                                                  "i"
                                                                                                  "i"))
                                                                                            #4(ribcage
                                                                                               ()
                                                                                               ()
                                                                                               ())
                                                                                            #4(ribcage
                                                                                               #1(orig-x)
                                                                                               #1((top))
                                                                                               #1("i"))
                                                                                            #4(ribcage
                                                                                               ((import-token
                                                                                                  .
                                                                                                  *top*))
                                                                                               ()
                                                                                               ())))
                                                                                       %_2952)))))))
                                                     %_2955)
                                              ((lambda (%_2956)
                                                 (if %_2956
                                                   (apply (lambda (%_2957
                                                                   %_2958)
                                                            (list '#3(syntax-object
                                                                      let
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #2(e1
                                                                             e2)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #1(step)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          #7(_
                                                                             var
                                                                             init
                                                                             step
                                                                             e0
                                                                             e1
                                                                             c)
                                                                          #7((top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                          #7("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #1(orig-x)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          ((import-token
                                                                             .
                                                                             *top*))
                                                                          ()
                                                                          ())))
                                                                  '#3(syntax-object
                                                                      doloop
                                                                      ((top)
                                                                       #4(ribcage
                                                                          #2(e1
                                                                             e2)
                                                                          #2((top)
                                                                             (top))
                                                                          #2("i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          #1(step)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          #7(_
                                                                             var
                                                                             init
                                                                             step
                                                                             e0
                                                                             e1
                                                                             c)
                                                                          #7((top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top)
                                                                             (top))
                                                                          #7("i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"
                                                                             "i"))
                                                                       #4(ribcage
                                                                          ()
                                                                          ()
                                                                          ())
                                                                       #4(ribcage
                                                                          #1(orig-x)
                                                                          #1((top))
                                                                          #1("i"))
                                                                       #4(ribcage
                                                                          ((import-token
                                                                             .
                                                                             *top*))
                                                                          ()
                                                                          ())))
                                                                  (map list
                                                                       %_2935
                                                                       %_2936)
                                                                  (list '#3(syntax-object
                                                                            if
                                                                            ((top)
                                                                             #4(ribcage
                                                                                #2(e1
                                                                                   e2)
                                                                                #2((top)
                                                                                   (top))
                                                                                #2("i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                #1(step)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                #7(_
                                                                                   var
                                                                                   init
                                                                                   step
                                                                                   e0
                                                                                   e1
                                                                                   c)
                                                                                #7((top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top)
                                                                                   (top))
                                                                                #7("i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"
                                                                                   "i"))
                                                                             #4(ribcage
                                                                                ()
                                                                                ()
                                                                                ())
                                                                             #4(ribcage
                                                                                #1(orig-x)
                                                                                #1((top))
                                                                                #1("i"))
                                                                             #4(ribcage
                                                                                ((import-token
                                                                                   .
                                                                                   *top*))
                                                                                ()
                                                                                ())))
                                                                        %_2938
                                                                        (cons '#3(syntax-object
                                                                                  begin
                                                                                  ((top)
                                                                                   #4(ribcage
                                                                                      #2(e1
                                                                                         e2)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(step)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      #7(_
                                                                                         var
                                                                                         init
                                                                                         step
                                                                                         e0
                                                                                         e1
                                                                                         c)
                                                                                      #7((top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #7("i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #1(orig-x)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ((import-token
                                                                                         .
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))
                                                                              (cons %_2957
                                                                                    %_2958))
                                                                        (cons '#3(syntax-object
                                                                                  begin
                                                                                  ((top)
                                                                                   #4(ribcage
                                                                                      #2(e1
                                                                                         e2)
                                                                                      #2((top)
                                                                                         (top))
                                                                                      #2("i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      #1(step)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      #7(_
                                                                                         var
                                                                                         init
                                                                                         step
                                                                                         e0
                                                                                         e1
                                                                                         c)
                                                                                      #7((top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top)
                                                                                         (top))
                                                                                      #7("i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"
                                                                                         "i"))
                                                                                   #4(ribcage
                                                                                      ()
                                                                                      ()
                                                                                      ())
                                                                                   #4(ribcage
                                                                                      #1(orig-x)
                                                                                      #1((top))
                                                                                      #1("i"))
                                                                                   #4(ribcage
                                                                                      ((import-token
                                                                                         .
                                                                                         *top*))
                                                                                      ()
                                                                                      ())))
                                                                              (append
                                                                                %_2940
                                                                                (list (cons '#3(syntax-object
                                                                                                doloop
                                                                                                ((top)
                                                                                                 #4(ribcage
                                                                                                    #2(e1
                                                                                                       e2)
                                                                                                    #2((top)
                                                                                                       (top))
                                                                                                    #2("i"
                                                                                                       "i"))
                                                                                                 #4(ribcage
                                                                                                    #1(step)
                                                                                                    #1((top))
                                                                                                    #1("i"))
                                                                                                 #4(ribcage
                                                                                                    #7(_
                                                                                                       var
                                                                                                       init
                                                                                                       step
                                                                                                       e0
                                                                                                       e1
                                                                                                       c)
                                                                                                    #7((top)
                                                                                                       (top)
                                                                                                       (top)
                                                                                                       (top)
                                                                                                       (top)
                                                                                                       (top)
                                                                                                       (top))
                                                                                                    #7("i"
                                                                                                       "i"
                                                                                                       "i"
                                                                                                       "i"
                                                                                                       "i"
                                                                                                       "i"
                                                                                                       "i"))
                                                                                                 #4(ribcage
                                                                                                    ()
                                                                                                    ()
                                                                                                    ())
                                                                                                 #4(ribcage
                                                                                                    #1(orig-x)
                                                                                                    #1((top))
                                                                                                    #1("i"))
                                                                                                 #4(ribcage
                                                                                                    ((import-token
                                                                                                       .
                                                                                                       *top*))
                                                                                                    ()
                                                                                                    ())))
                                                                                            %_2952)))))))
                                                          %_2956)
                                                   (syntax-error %_2953)))
                                               ($syntax-dispatch
                                                 %_2953
                                                 '(any . each-any)))))
                                          ($syntax-dispatch %_2953 '())))
                                       %_2939))
                                    %_2951)
                             (syntax-error %_2941)))
                         ($syntax-dispatch %_2941 'each-any)))
                      (map (lambda (%_2942 %_2943)
                             ((lambda (%_2944)
                                ((lambda (%_2945)
                                   (if %_2945
                                     (apply (lambda () %_2942) %_2945)
                                     ((lambda (%_2946)
                                        (if %_2946
                                          (apply (lambda (%_2948) %_2948)
                                                 %_2946)
                                          ((lambda (%_2947)
                                             (syntax-error %_2931))
                                           %_2944)))
                                      ($syntax-dispatch %_2944 '(any)))))
                                 ($syntax-dispatch %_2944 '())))
                              %_2943))
                           %_2935
                           %_2937)))
                   %_2933)
            (syntax-error %_2932)))
        ($syntax-dispatch
          %_2932
          '(any #2(each (any any . any))
                (any . each-any)
                .
                each-any))))
     %_2931)))
($sc-put-cte
  'quasiquote
  ((lambda (%_2968
            %_2969
            %_2970
            %_2971
            %_2972
            %_2973
            %_2974
            %_2975
            %_2976)
     (begin
       (set! %_2968
         (lambda (%_2982)
           (if (identifier? %_2982)
             (free-identifier=?
               %_2982
               '#3(syntax-object
                   quote
                   ((top)
                    #4(ribcage ())
                    #4(ribcage ())
                    #4(ribcage #1(x) #1((top)) #1("i"))
                    #4(ribcage
                       #9(isquote?
                          islist?
                          iscons?
                          quote-nil?
                          quasilist*
                          quasicons
                          quasiappend
                          quasivector
                          quasi)
                       #9((top))
                       #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                    #4(ribcage ((import-token . *top*)) ()))))
             '#f)))
       (set! %_2969
         (lambda (%_2983)
           (if (identifier? %_2983)
             (free-identifier=?
               %_2983
               '#3(syntax-object
                   list
                   ((top)
                    #4(ribcage ())
                    #4(ribcage ())
                    #4(ribcage #1(x) #1((top)) #1("i"))
                    #4(ribcage
                       #9(isquote?
                          islist?
                          iscons?
                          quote-nil?
                          quasilist*
                          quasicons
                          quasiappend
                          quasivector
                          quasi)
                       #9((top))
                       #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                    #4(ribcage ((import-token . *top*)) ()))))
             '#f)))
       (set! %_2970
         (lambda (%_2984)
           (if (identifier? %_2984)
             (free-identifier=?
               %_2984
               '#3(syntax-object
                   cons
                   ((top)
                    #4(ribcage ())
                    #4(ribcage ())
                    #4(ribcage #1(x) #1((top)) #1("i"))
                    #4(ribcage
                       #9(isquote?
                          islist?
                          iscons?
                          quote-nil?
                          quasilist*
                          quasicons
                          quasiappend
                          quasivector
                          quasi)
                       #9((top))
                       #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                    #4(ribcage ((import-token . *top*)) ()))))
             '#f)))
       (set! %_2971
         (lambda (%_2985)
           ((lambda (%_2986)
              ((lambda (%_2987)
                 (if %_2987
                   (apply (lambda (%_2989) (%_2968 %_2989)) %_2987)
                   ((lambda (%_2988) '#f) %_2986)))
               ($syntax-dispatch %_2986 '(any ()))))
            %_2985)))
       (set! %_2972
         (lambda (%_2990 %_2991)
           (((lambda (%_2992)
               (begin
                 (set! %_2992
                   (lambda (%_2993)
                     (if (null? %_2993)
                       %_2991
                       (%_2973 (car %_2993) (%_2992 (cdr %_2993))))))
                 %_2992))
             #f)
            %_2990)))
       (set! %_2973
         (lambda (%_2994 %_2995)
           ((lambda (%_2996)
              ((lambda (%_2997)
                 (if %_2997
                   (apply (lambda (%_2998 %_2999)
                            ((lambda (%_3000)
                               ((lambda (%_3001)
                                  (if (if %_3001
                                        (apply (lambda (%_3017 %_3018)
                                                 (%_2968 %_3017))
                                               %_3001)
                                        '#f)
                                    (apply (lambda (%_3008 %_3009)
                                             ((lambda (%_3010)
                                                ((lambda (%_3011)
                                                   (if (if %_3011
                                                         (apply (lambda (%_3015
                                                                         %_3016)
                                                                  (%_2968
                                                                    %_3015))
                                                                %_3011)
                                                         '#f)
                                                     (apply (lambda (%_3013
                                                                     %_3014)
                                                              (list '#3(syntax-object
                                                                        quote
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #2(quote?
                                                                               dx)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #2(quote?
                                                                               dy)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #2(x
                                                                               y)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(x
                                                                               y)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #9(isquote?
                                                                               islist?
                                                                               iscons?
                                                                               quote-nil?
                                                                               quasilist*
                                                                               quasicons
                                                                               quasiappend
                                                                               quasivector
                                                                               quasi)
                                                                            #9((top)
                                                                               (top)
                                                                               (top)
                                                                               (top)
                                                                               (top)
                                                                               (top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                            #9("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"
                                                                               "i"
                                                                               "i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    (cons %_3014
                                                                          %_3009)))
                                                            %_3011)
                                                     ((lambda (%_3012)
                                                        (if (null? %_3009)
                                                          (list '#3(syntax-object
                                                                    list
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #1(_)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        #2(quote?
                                                                           dy)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #2(x y)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #2(x y)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #9(isquote?
                                                                           islist?
                                                                           iscons?
                                                                           quote-nil?
                                                                           quasilist*
                                                                           quasicons
                                                                           quasiappend
                                                                           quasivector
                                                                           quasi)
                                                                        #9((top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #9("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ((import-token
                                                                           .
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                %_2998)
                                                          (list '#3(syntax-object
                                                                    cons
                                                                    ((top)
                                                                     #4(ribcage
                                                                        #1(_)
                                                                        #1((top))
                                                                        #1("i"))
                                                                     #4(ribcage
                                                                        #2(quote?
                                                                           dy)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #2(x y)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        ()
                                                                        ()
                                                                        ())
                                                                     #4(ribcage
                                                                        #2(x y)
                                                                        #2((top)
                                                                           (top))
                                                                        #2("i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        #9(isquote?
                                                                           islist?
                                                                           iscons?
                                                                           quote-nil?
                                                                           quasilist*
                                                                           quasicons
                                                                           quasiappend
                                                                           quasivector
                                                                           quasi)
                                                                        #9((top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top)
                                                                           (top))
                                                                        #9("i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"
                                                                           "i"))
                                                                     #4(ribcage
                                                                        ((import-token
                                                                           .
                                                                           *top*))
                                                                        ()
                                                                        ())))
                                                                %_2998
                                                                %_2999)))
                                                      %_3010)))
                                                 ($syntax-dispatch
                                                   %_3010
                                                   '(any any))))
                                              %_2998))
                                           %_3001)
                                    ((lambda (%_3002)
                                       (if (if %_3002
                                             (apply (lambda (%_3006 %_3007)
                                                      (%_2969 %_3006))
                                                    %_3002)
                                             '#f)
                                         (apply (lambda (%_3004 %_3005)
                                                  (cons '#3(syntax-object
                                                            list
                                                            ((top)
                                                             #4(ribcage
                                                                #2(listp stuff)
                                                                #2((top))
                                                                #2("i" "i"))
                                                             #4(ribcage
                                                                #2(x y)
                                                                #2((top))
                                                                #2("i" "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #2(x y)
                                                                #2((top))
                                                                #2("i" "i"))
                                                             #4(ribcage
                                                                #9(isquote?
                                                                   islist?
                                                                   iscons?
                                                                   quote-nil?
                                                                   quasilist*
                                                                   quasicons
                                                                   quasiappend
                                                                   quasivector
                                                                   quasi)
                                                                #9((top))
                                                                #9("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (cons %_2998 %_3005)))
                                                %_3002)
                                         ((lambda (%_3003)
                                            (list '#3(syntax-object
                                                      cons
                                                      ((top)
                                                       #4(ribcage
                                                          #1(else)
                                                          #1((top))
                                                          #1("i"))
                                                       #4(ribcage
                                                          #2(x y)
                                                          #2((top))
                                                          #2("i" "i"))
                                                       #4(ribcage ())
                                                       #4(ribcage ())
                                                       #4(ribcage
                                                          #2(x y)
                                                          #2((top))
                                                          #2("i" "i"))
                                                       #4(ribcage
                                                          #9(isquote?
                                                             islist?
                                                             iscons?
                                                             quote-nil?
                                                             quasilist*
                                                             quasicons
                                                             quasiappend
                                                             quasivector
                                                             quasi)
                                                          #9((top))
                                                          #9("i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"
                                                             "i"))
                                                       #4(ribcage
                                                          ((import-token
                                                             .
                                                             *top*))
                                                          ()
                                                          ())))
                                                  %_2998
                                                  %_2999))
                                          %_3000)))
                                     ($syntax-dispatch %_3000 '(any . any)))))
                                ($syntax-dispatch %_3000 '(any any))))
                             %_2999))
                          %_2997)
                   (syntax-error %_2996)))
               ($syntax-dispatch %_2996 '(any any))))
            (list %_2994 %_2995))))
       (set! %_2974
         (lambda (%_3019 %_3020)
           ((lambda (%_3021)
              (if (null? %_3021)
                '#3(syntax-object
                    '()
                    ((top)
                     #4(ribcage ())
                     #4(ribcage ())
                     #4(ribcage #1(ls) #1((top)) #1("i"))
                     #4(ribcage ())
                     #4(ribcage ())
                     #4(ribcage #2(x y) #2((top)) #2("i" "i"))
                     #4(ribcage
                        #9(isquote?
                           islist?
                           iscons?
                           quote-nil?
                           quasilist*
                           quasicons
                           quasiappend
                           quasivector
                           quasi)
                        #9((top))
                        #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                     #4(ribcage ((import-token . *top*)) ())))
                (if (null? (cdr %_3021))
                  (car %_3021)
                  ((lambda (%_3022)
                     ((lambda (%_3023)
                        (if %_3023
                          (apply (lambda (%_3024)
                                   (cons '#3(syntax-object
                                             append
                                             ((top)
                                              #4(ribcage
                                                 #1(p)
                                                 #1((top))
                                                 #1("i"))
                                              #4(ribcage ())
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #1(ls)
                                                 #1((top))
                                                 #1("i"))
                                              #4(ribcage ())
                                              #4(ribcage ())
                                              #4(ribcage
                                                 #2(x y)
                                                 #2((top))
                                                 #2("i" "i"))
                                              #4(ribcage
                                                 #9(isquote?
                                                    islist?
                                                    iscons?
                                                    quote-nil?
                                                    quasilist*
                                                    quasicons
                                                    quasiappend
                                                    quasivector
                                                    quasi)
                                                 #9((top))
                                                 #9("i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"
                                                    "i"))
                                              #4(ribcage
                                                 ((import-token . *top*))
                                                 ()
                                                 ())))
                                         %_3024))
                                 %_3023)
                          (syntax-error %_3022)))
                      ($syntax-dispatch %_3022 'each-any)))
                   %_3021))))
            (((lambda (%_3026)
                (begin
                  (set! %_3026
                    (lambda (%_3027)
                      (if (null? %_3027)
                        (if (%_2971 %_3020) '() (list %_3020))
                        (if (%_2971 (car %_3027))
                          (%_3026 (cdr %_3027))
                          (cons (car %_3027) (%_3026 (cdr %_3027)))))))
                  %_3026))
              #f)
             %_3019))))
       (set! %_2975
         (lambda (%_3028)
           ((lambda (%_3029)
              ((lambda (%_3030)
                 ((lambda (%_3031)
                    ((lambda (%_3032)
                       (if (if %_3032
                             (apply (lambda (%_3063 %_3064) (%_2968 %_3063))
                                    %_3032)
                             '#f)
                         (apply (lambda (%_3060 %_3061)
                                  (list '#3(syntax-object
                                            quote
                                            ((top)
                                             #4(ribcage
                                                #2(quote? x)
                                                #2((top))
                                                #2("i" "i"))
                                             #4(ribcage
                                                #1(pat-x)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage ())
                                             #4(ribcage ())
                                             #4(ribcage
                                                #1(x)
                                                #1((top))
                                                #1("i"))
                                             #4(ribcage
                                                #9(isquote?
                                                   islist?
                                                   iscons?
                                                   quote-nil?
                                                   quasilist*
                                                   quasicons
                                                   quasiappend
                                                   quasivector
                                                   quasi)
                                                #9((top))
                                                #9("i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"
                                                   "i"))
                                             #4(ribcage
                                                ((import-token . *top*))
                                                ()
                                                ())))
                                        (list->vector %_3061)))
                                %_3032)
                         ((lambda (%_3033)
                            (((lambda (%_3034)
                                (begin
                                  (set! %_3034
                                    (lambda (%_3035 %_3036)
                                      ((lambda (%_3037)
                                         ((lambda (%_3038)
                                            (if (if %_3038
                                                  (apply (lambda (%_3057
                                                                  %_3058)
                                                           (%_2968 %_3057))
                                                         %_3038)
                                                  '#f)
                                              (apply (lambda (%_3054 %_3055)
                                                       (%_3036
                                                         (map (lambda (%_3056)
                                                                (list '#3(syntax-object
                                                                          quote
                                                                          ((top)
                                                                           #4(ribcage
                                                                              #2(quote?
                                                                                 x)
                                                                              #2((top)
                                                                                 (top))
                                                                              #2("i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              #2(x
                                                                                 k)
                                                                              #2((top)
                                                                                 (top))
                                                                              #2("i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              #1(f)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              #1(_)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              #1(pat-x)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              ()
                                                                              ()
                                                                              ())
                                                                           #4(ribcage
                                                                              #1(x)
                                                                              #1((top))
                                                                              #1("i"))
                                                                           #4(ribcage
                                                                              #9(isquote?
                                                                                 islist?
                                                                                 iscons?
                                                                                 quote-nil?
                                                                                 quasilist*
                                                                                 quasicons
                                                                                 quasiappend
                                                                                 quasivector
                                                                                 quasi)
                                                                              #9((top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top)
                                                                                 (top))
                                                                              #9("i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"
                                                                                 "i"))
                                                                           #4(ribcage
                                                                              ((import-token
                                                                                 .
                                                                                 *top*))
                                                                              ()
                                                                              ())))
                                                                      %_3056))
                                                              %_3055)))
                                                     %_3038)
                                              ((lambda (%_3039)
                                                 (if (if %_3039
                                                       (apply (lambda (%_3052
                                                                       %_3053)
                                                                (%_2969
                                                                  %_3052))
                                                              %_3039)
                                                       '#f)
                                                   (apply (lambda (%_3049
                                                                   %_3050)
                                                            (%_3036 %_3050))
                                                          %_3039)
                                                   ((lambda (%_3040)
                                                      (if (if %_3040
                                                            (apply (lambda (%_3046
                                                                            %_3047
                                                                            %_3048)
                                                                     (%_2970
                                                                       %_3046))
                                                                   %_3040)
                                                            '#f)
                                                        (apply (lambda (%_3042
                                                                        %_3043
                                                                        %_3044)
                                                                 (%_3034
                                                                   %_3044
                                                                   (lambda (%_3045)
                                                                     (%_3036
                                                                       (cons %_3043
                                                                             %_3045)))))
                                                               %_3040)
                                                        ((lambda (%_3041)
                                                           (list '#3(syntax-object
                                                                     list->vector
                                                                     ((top)
                                                                      #4(ribcage
                                                                         #1(else)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                      #4(ribcage
                                                                         #2(x
                                                                            k)
                                                                         #2((top)
                                                                            (top))
                                                                         #2("i"
                                                                            "i"))
                                                                      #4(ribcage
                                                                         #1(f)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         #1(_)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         #1(pat-x)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                      #4(ribcage
                                                                         ()
                                                                         ()
                                                                         ())
                                                                      #4(ribcage
                                                                         #1(x)
                                                                         #1((top))
                                                                         #1("i"))
                                                                      #4(ribcage
                                                                         #9(isquote?
                                                                            islist?
                                                                            iscons?
                                                                            quote-nil?
                                                                            quasilist*
                                                                            quasicons
                                                                            quasiappend
                                                                            quasivector
                                                                            quasi)
                                                                         #9((top)
                                                                            (top)
                                                                            (top)
                                                                            (top)
                                                                            (top)
                                                                            (top)
                                                                            (top)
                                                                            (top)
                                                                            (top))
                                                                         #9("i"
                                                                            "i"
                                                                            "i"
                                                                            "i"
                                                                            "i"
                                                                            "i"
                                                                            "i"
                                                                            "i"
                                                                            "i"))
                                                                      #4(ribcage
                                                                         ((import-token
                                                                            .
                                                                            *top*))
                                                                         ()
                                                                         ())))
                                                                 %_3030))
                                                         %_3037)))
                                                    ($syntax-dispatch
                                                      %_3037
                                                      '(any any any)))))
                                               ($syntax-dispatch
                                                 %_3037
                                                 '(any . each-any)))))
                                          ($syntax-dispatch
                                            %_3037
                                            '(any each-any))))
                                       %_3035)))
                                  %_3034))
                              #f)
                             %_3028
                             (lambda (%_3059)
                               (cons '#3(syntax-object
                                         vector
                                         ((top)
                                          #4(ribcage ())
                                          #4(ribcage ())
                                          #4(ribcage #1(ls) #1((top)) #1("i"))
                                          #4(ribcage #1(_) #1((top)) #1("i"))
                                          #4(ribcage
                                             #1(pat-x)
                                             #1((top))
                                             #1("i"))
                                          #4(ribcage ())
                                          #4(ribcage ())
                                          #4(ribcage #1(x) #1((top)) #1("i"))
                                          #4(ribcage
                                             #9(isquote?
                                                islist?
                                                iscons?
                                                quote-nil?
                                                quasilist*
                                                quasicons
                                                quasiappend
                                                quasivector
                                                quasi)
                                             #9((top))
                                             #9("i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"
                                                "i"))
                                          #4(ribcage
                                             ((import-token . *top*))
                                             ()
                                             ())))
                                     %_3059))))
                          %_3031)))
                     ($syntax-dispatch %_3031 '(any each-any))))
                  %_3030))
               %_3029))
            %_3028)))
       (set! %_2976
         (lambda (%_3065 %_3066)
           ((lambda (%_3067)
              ((lambda (%_3068)
                 (if %_3068
                   (apply (lambda (%_3088)
                            (if (= %_3066 '0)
                              %_3088
                              (%_2973
                                '#3(syntax-object
                                    'unquote
                                    ((top)
                                     #4(ribcage #1(p) #1((top)) #1("i"))
                                     #4(ribcage ())
                                     #4(ribcage
                                        #2(p lev)
                                        #2((top))
                                        #2("i" "i"))
                                     #4(ribcage
                                        #9(isquote?
                                           islist?
                                           iscons?
                                           quote-nil?
                                           quasilist*
                                           quasicons
                                           quasiappend
                                           quasivector
                                           quasi)
                                        #9((top))
                                        #9("i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"))
                                     #4(ribcage ((import-token . *top*)) ())))
                                (%_2976 (list %_3088) (- %_3066 '1)))))
                          %_3068)
                   ((lambda (%_3069)
                      (if %_3069
                        (apply (lambda (%_3084 %_3085)
                                 (if (= %_3066 '0)
                                   (%_2972 %_3084 (%_2976 %_3085 %_3066))
                                   (%_2973
                                     (%_2973
                                       '#3(syntax-object
                                           'unquote
                                           ((top)
                                            #4(ribcage
                                               #2(p q)
                                               #2((top))
                                               #2("i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage
                                               #2(p lev)
                                               #2((top))
                                               #2("i" "i"))
                                            #4(ribcage
                                               #9(isquote?
                                                  islist?
                                                  iscons?
                                                  quote-nil?
                                                  quasilist*
                                                  quasicons
                                                  quasiappend
                                                  quasivector
                                                  quasi)
                                               #9((top))
                                               #9("i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"
                                                  "i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))
                                       (%_2976 %_3084 (- %_3066 '1)))
                                     (%_2976 %_3085 %_3066))))
                               %_3069)
                        ((lambda (%_3070)
                           (if %_3070
                             (apply (lambda (%_3080 %_3081)
                                      (if (= %_3066 '0)
                                        (%_2974 %_3080 (%_2976 %_3081 %_3066))
                                        (%_2973
                                          (%_2973
                                            '#3(syntax-object
                                                'unquote-splicing
                                                ((top)
                                                 #4(ribcage
                                                    #2(p q)
                                                    #2((top))
                                                    #2("i" "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #2(p lev)
                                                    #2((top))
                                                    #2("i" "i"))
                                                 #4(ribcage
                                                    #9(isquote?
                                                       islist?
                                                       iscons?
                                                       quote-nil?
                                                       quasilist*
                                                       quasicons
                                                       quasiappend
                                                       quasivector
                                                       quasi)
                                                    #9((top))
                                                    #9("i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ())))
                                            (%_2976 %_3080 (- %_3066 '1)))
                                          (%_2976 %_3081 %_3066))))
                                    %_3070)
                             ((lambda (%_3071)
                                (if %_3071
                                  (apply (lambda (%_3079)
                                           (%_2973
                                             '#3(syntax-object
                                                 'quasiquote
                                                 ((top)
                                                  #4(ribcage
                                                     #1(p)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #2(p lev)
                                                     #2((top))
                                                     #2("i" "i"))
                                                  #4(ribcage
                                                     #9(isquote?
                                                        islist?
                                                        iscons?
                                                        quote-nil?
                                                        quasilist*
                                                        quasicons
                                                        quasiappend
                                                        quasivector
                                                        quasi)
                                                     #9((top))
                                                     #9("i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"
                                                        "i"))
                                                  #4(ribcage
                                                     ((import-token . *top*))
                                                     ()
                                                     ())))
                                             (%_2976
                                               (list %_3079)
                                               (+ %_3066 '1))))
                                         %_3071)
                                  ((lambda (%_3072)
                                     (if %_3072
                                       (apply (lambda (%_3077 %_3078)
                                                (%_2973
                                                  (%_2976 %_3077 %_3066)
                                                  (%_2976 %_3078 %_3066)))
                                              %_3072)
                                       ((lambda (%_3073)
                                          (if %_3073
                                            (apply (lambda (%_3075)
                                                     (%_2975
                                                       (%_2976 %_3075 %_3066)))
                                                   %_3073)
                                            ((lambda (%_3074)
                                               (list '#3(syntax-object
                                                         quote
                                                         ((top)
                                                          #4(ribcage
                                                             #1(p)
                                                             #1((top))
                                                             #1("i"))
                                                          #4(ribcage ())
                                                          #4(ribcage
                                                             #2(p lev)
                                                             #2((top))
                                                             #2("i" "i"))
                                                          #4(ribcage
                                                             #9(isquote?
                                                                islist?
                                                                iscons?
                                                                quote-nil?
                                                                quasilist*
                                                                quasicons
                                                                quasiappend
                                                                quasivector
                                                                quasi)
                                                             #9((top))
                                                             #9("i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"
                                                                "i"))
                                                          #4(ribcage
                                                             ((import-token
                                                                .
                                                                *top*))
                                                             ()
                                                             ())))
                                                     %_3074))
                                             %_3067)))
                                        ($syntax-dispatch
                                          %_3067
                                          '#2(vector each-any)))))
                                   ($syntax-dispatch %_3067 '(any . any)))))
                              ($syntax-dispatch
                                %_3067
                                '(#2(free-id
                                     #3(syntax-object
                                        quasiquote
                                        ((top)
                                         #4(ribcage ())
                                         #4(ribcage
                                            #2(p lev)
                                            #2((top))
                                            #2("i" "i"))
                                         #4(ribcage
                                            #9(isquote?
                                               islist?
                                               iscons?
                                               quote-nil?
                                               quasilist*
                                               quasicons
                                               quasiappend
                                               quasivector
                                               quasi)
                                            #9((top))
                                            #9("i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"
                                               "i"))
                                         #4(ribcage
                                            ((import-token . *top*))
                                            ()
                                            ()))))
                                  any)))))
                         ($syntax-dispatch
                           %_3067
                           '((#2(free-id
                                 #3(syntax-object
                                    unquote-splicing
                                    ((top)
                                     #4(ribcage ())
                                     #4(ribcage
                                        #2(p lev)
                                        #2((top))
                                        #2("i" "i"))
                                     #4(ribcage
                                        #9(isquote?
                                           islist?
                                           iscons?
                                           quote-nil?
                                           quasilist*
                                           quasicons
                                           quasiappend
                                           quasivector
                                           quasi)
                                        #9((top))
                                        #9("i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"
                                           "i"))
                                     #4(ribcage ((import-token . *top*)) ()))))
                              .
                              each-any)
                             .
                             any)))))
                    ($syntax-dispatch
                      %_3067
                      '((#2(free-id
                            #3(syntax-object
                               unquote
                               ((top)
                                #4(ribcage ())
                                #4(ribcage #2(p lev) #2((top)) #2("i" "i"))
                                #4(ribcage
                                   #9(isquote?
                                      islist?
                                      iscons?
                                      quote-nil?
                                      quasilist*
                                      quasicons
                                      quasiappend
                                      quasivector
                                      quasi)
                                   #9((top))
                                   #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                                #4(ribcage ((import-token . *top*)) ()))))
                         .
                         each-any)
                        .
                        any)))))
               ($syntax-dispatch
                 %_3067
                 '(#2(free-id
                      #3(syntax-object
                         unquote
                         ((top)
                          #4(ribcage ())
                          #4(ribcage #2(p lev) #2((top)) #2("i" "i"))
                          #4(ribcage
                             #9(isquote?
                                islist?
                                iscons?
                                quote-nil?
                                quasilist*
                                quasicons
                                quasiappend
                                quasivector
                                quasi)
                             #9((top))
                             #9("i" "i" "i" "i" "i" "i" "i" "i" "i"))
                          #4(ribcage ((import-token . *top*)) ()))))
                   any))))
            %_3065)))
       (lambda (%_2977)
         ((lambda (%_2978)
            ((lambda (%_2979)
               (if %_2979
                 (apply (lambda (%_2980 %_2981) (%_2976 %_2981 '0))
                        %_2979)
                 (syntax-error %_2978)))
             ($syntax-dispatch %_2978 '(any any))))
          %_2977))))
   #f
   #f
   #f
   #f
   #f
   #f
   #f
   #f
   #f))
($sc-put-cte
  'include
  (lambda (%_3089)
    ((lambda (%_3090)
       (begin
         (set! %_3090
           (lambda (%_3100 %_3101)
             ((lambda (%_3102)
                (((lambda (%_3103)
                    (begin
                      (set! %_3103
                        (lambda ()
                          ((lambda (%_3104)
                             (if (eof-object? %_3104)
                               (begin (close-input-port %_3102) '())
                               (cons (datum->syntax-object %_3101 %_3104)
                                     (%_3103))))
                           (read %_3102))))
                      %_3103))
                  #f)))
              (open-input-file %_3100))))
         ((lambda (%_3091)
            ((lambda (%_3092)
               (if %_3092
                 (apply (lambda (%_3093 %_3094)
                          ((lambda (%_3095)
                             ((lambda (%_3096)
                                ((lambda (%_3097)
                                   (if %_3097
                                     (apply (lambda (%_3098)
                                              (cons '#3(syntax-object
                                                        begin
                                                        ((top)
                                                         #4(ribcage
                                                            #1(exp)
                                                            #1((top))
                                                            #1("i"))
                                                         #4(ribcage ())
                                                         #4(ribcage ())
                                                         #4(ribcage
                                                            #1(fn)
                                                            #1((top))
                                                            #1("i"))
                                                         #4(ribcage
                                                            #2(k filename)
                                                            #2((top))
                                                            #2("i" "i"))
                                                         #4(ribcage
                                                            (read-file)
                                                            ((top))
                                                            ("i"))
                                                         #4(ribcage
                                                            #1(x)
                                                            #1((top))
                                                            #1("i"))
                                                         #4(ribcage
                                                            ((import-token
                                                               .
                                                               *top*))
                                                            ()
                                                            ())))
                                                    %_3098))
                                            %_3097)
                                     (syntax-error %_3096)))
                                 ($syntax-dispatch %_3096 'each-any)))
                              (%_3090 %_3095 %_3093)))
                           (syntax-object->datum %_3094)))
                        %_3092)
                 (syntax-error %_3091)))
             ($syntax-dispatch %_3091 '(any any))))
          %_3089)))
     #f)))
($sc-put-cte
  'unquote
  (lambda (%_3105)
    ((lambda (%_3106)
       ((lambda (%_3107)
          (if %_3107
            (apply (lambda (%_3108 %_3109)
                     (syntax-error
                       %_3105
                       '"expression not valid outside of quasiquote"))
                   %_3107)
            (syntax-error %_3106)))
        ($syntax-dispatch %_3106 '(any . each-any))))
     %_3105)))
($sc-put-cte
  'unquote-splicing
  (lambda (%_3110)
    ((lambda (%_3111)
       ((lambda (%_3112)
          (if %_3112
            (apply (lambda (%_3113 %_3114)
                     (syntax-error
                       %_3110
                       '"expression not valid outside of quasiquote"))
                   %_3112)
            (syntax-error %_3111)))
        ($syntax-dispatch %_3111 '(any . each-any))))
     %_3110)))
($sc-put-cte
  'case
  (lambda (%_3115)
    ((lambda (%_3116)
       ((lambda (%_3117)
          (if %_3117
            (apply (lambda (%_3118 %_3119 %_3120 %_3121)
                     ((lambda (%_3122)
                        ((lambda (%_3149)
                           (list '#3(syntax-object
                                     let
                                     ((top)
                                      #4(ribcage #1(body) #1((top)) #1("i"))
                                      #4(ribcage
                                         #4(_ e m1 m2)
                                         #4((top))
                                         #4("i" "i" "i" "i"))
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ((import-token . *top*)) ())))
                                 (list (list '#3(syntax-object
                                                 t
                                                 ((top)
                                                  #4(ribcage
                                                     #1(body)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage
                                                     #4(_ e m1 m2)
                                                     #4((top))
                                                     #4("i" "i" "i" "i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #1(x)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage
                                                     ((import-token . *top*))
                                                     ()
                                                     ())))
                                             %_3119))
                                 %_3149))
                         %_3122))
                      (((lambda (%_3123)
                          (begin
                            (set! %_3123
                              (lambda (%_3124 %_3125)
                                (if (null? %_3125)
                                  ((lambda (%_3136)
                                     ((lambda (%_3137)
                                        (if %_3137
                                          (apply (lambda (%_3145 %_3146)
                                                   (cons '#3(syntax-object
                                                             begin
                                                             ((top)
                                                              #4(ribcage
                                                                 #2(e1 e2)
                                                                 #2((top))
                                                                 #2("i" "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #2(clause
                                                                    clauses)
                                                                 #2((top))
                                                                 #2("i" "i"))
                                                              #4(ribcage
                                                                 #1(f)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 #4(_ e m1 m2)
                                                                 #4((top))
                                                                 #4("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(x)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 ((import-token
                                                                    .
                                                                    *top*))
                                                                 ()
                                                                 ())))
                                                         (cons %_3145 %_3146)))
                                                 %_3137)
                                          ((lambda (%_3138)
                                             (if %_3138
                                               (apply (lambda (%_3140
                                                               %_3141
                                                               %_3142)
                                                        (list '#3(syntax-object
                                                                  if
                                                                  ((top)
                                                                   #4(ribcage
                                                                      #3(k
                                                                         e1
                                                                         e2)
                                                                      #3((top))
                                                                      #3("i"
                                                                         "i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #2(clause
                                                                         clauses)
                                                                      #2((top))
                                                                      #2("i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      #1(f)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      #4(_
                                                                         e
                                                                         m1
                                                                         m2)
                                                                      #4((top))
                                                                      #4("i"
                                                                         "i"
                                                                         "i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #1(x)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      ((import-token
                                                                         .
                                                                         *top*))
                                                                      ()
                                                                      ())))
                                                              (list '#3(syntax-object
                                                                        memv
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #3(k
                                                                               e1
                                                                               e2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #4(_
                                                                               e
                                                                               m1
                                                                               m2)
                                                                            #4((top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                            #4("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    '#3(syntax-object
                                                                        t
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #3(k
                                                                               e1
                                                                               e2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #4(_
                                                                               e
                                                                               m1
                                                                               m2)
                                                                            #4((top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                            #4("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    (list '#3(syntax-object
                                                                              quote
                                                                              ((top)
                                                                               #4(ribcage
                                                                                  #3(k
                                                                                     e1
                                                                                     e2)
                                                                                  #3((top)
                                                                                     (top)
                                                                                     (top))
                                                                                  #3("i"
                                                                                     "i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #2(clause
                                                                                     clauses)
                                                                                  #2((top)
                                                                                     (top))
                                                                                  #2("i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  #1(f)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  #4(_
                                                                                     e
                                                                                     m1
                                                                                     m2)
                                                                                  #4((top)
                                                                                     (top)
                                                                                     (top)
                                                                                     (top))
                                                                                  #4("i"
                                                                                     "i"
                                                                                     "i"
                                                                                     "i"))
                                                                               #4(ribcage
                                                                                  ()
                                                                                  ()
                                                                                  ())
                                                                               #4(ribcage
                                                                                  #1(x)
                                                                                  #1((top))
                                                                                  #1("i"))
                                                                               #4(ribcage
                                                                                  ((import-token
                                                                                     .
                                                                                     *top*))
                                                                                  ()
                                                                                  ())))
                                                                          %_3140))
                                                              (cons '#3(syntax-object
                                                                        begin
                                                                        ((top)
                                                                         #4(ribcage
                                                                            #3(k
                                                                               e1
                                                                               e2)
                                                                            #3((top)
                                                                               (top)
                                                                               (top))
                                                                            #3("i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #2(clause
                                                                               clauses)
                                                                            #2((top)
                                                                               (top))
                                                                            #2("i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            #1(f)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            #4(_
                                                                               e
                                                                               m1
                                                                               m2)
                                                                            #4((top)
                                                                               (top)
                                                                               (top)
                                                                               (top))
                                                                            #4("i"
                                                                               "i"
                                                                               "i"
                                                                               "i"))
                                                                         #4(ribcage
                                                                            ()
                                                                            ()
                                                                            ())
                                                                         #4(ribcage
                                                                            #1(x)
                                                                            #1((top))
                                                                            #1("i"))
                                                                         #4(ribcage
                                                                            ((import-token
                                                                               .
                                                                               *top*))
                                                                            ()
                                                                            ())))
                                                                    (cons %_3141
                                                                          %_3142))))
                                                      %_3138)
                                               ((lambda (%_3139)
                                                  (syntax-error %_3115))
                                                %_3136)))
                                           ($syntax-dispatch
                                             %_3136
                                             '(each-any any . each-any)))))
                                      ($syntax-dispatch
                                        %_3136
                                        '(#2(free-id
                                             #3(syntax-object
                                                else
                                                ((top)
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #2(clause clauses)
                                                    #2((top))
                                                    #2("i" "i"))
                                                 #4(ribcage
                                                    #1(f)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    #4(_ e m1 m2)
                                                    #4((top))
                                                    #4("i" "i" "i" "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #1(x)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ()))))
                                          any
                                          .
                                          each-any))))
                                   %_3124)
                                  ((lambda (%_3126)
                                     ((lambda (%_3127)
                                        ((lambda (%_3128)
                                           ((lambda (%_3129)
                                              (if %_3129
                                                (apply (lambda (%_3131
                                                                %_3132
                                                                %_3133)
                                                         (list '#3(syntax-object
                                                                   if
                                                                   ((top)
                                                                    #4(ribcage
                                                                       #3(k
                                                                          e1
                                                                          e2)
                                                                       #3((top)
                                                                          (top)
                                                                          (top))
                                                                       #3("i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       #1(rest)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #2(clause
                                                                          clauses)
                                                                       #2((top)
                                                                          (top))
                                                                       #2("i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       #1(f)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       #4(_
                                                                          e
                                                                          m1
                                                                          m2)
                                                                       #4((top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                       #4("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ((import-token
                                                                          .
                                                                          *top*))
                                                                       ()
                                                                       ())))
                                                               (list '#3(syntax-object
                                                                         memv
                                                                         ((top)
                                                                          #4(ribcage
                                                                             #3(k
                                                                                e1
                                                                                e2)
                                                                             #3((top)
                                                                                (top)
                                                                                (top))
                                                                             #3("i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(rest)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #2(clause
                                                                                clauses)
                                                                             #2((top)
                                                                                (top))
                                                                             #2("i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(f)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             #4(_
                                                                                e
                                                                                m1
                                                                                m2)
                                                                             #4((top)
                                                                                (top)
                                                                                (top)
                                                                                (top))
                                                                             #4("i"
                                                                                "i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #1(x)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ((import-token
                                                                                .
                                                                                *top*))
                                                                             ()
                                                                             ())))
                                                                     '#3(syntax-object
                                                                         t
                                                                         ((top)
                                                                          #4(ribcage
                                                                             #3(k
                                                                                e1
                                                                                e2)
                                                                             #3((top)
                                                                                (top)
                                                                                (top))
                                                                             #3("i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(rest)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #2(clause
                                                                                clauses)
                                                                             #2((top)
                                                                                (top))
                                                                             #2("i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(f)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             #4(_
                                                                                e
                                                                                m1
                                                                                m2)
                                                                             #4((top)
                                                                                (top)
                                                                                (top)
                                                                                (top))
                                                                             #4("i"
                                                                                "i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #1(x)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ((import-token
                                                                                .
                                                                                *top*))
                                                                             ()
                                                                             ())))
                                                                     (list '#3(syntax-object
                                                                               quote
                                                                               ((top)
                                                                                #4(ribcage
                                                                                   #3(k
                                                                                      e1
                                                                                      e2)
                                                                                   #3((top)
                                                                                      (top)
                                                                                      (top))
                                                                                   #3("i"
                                                                                      "i"
                                                                                      "i"))
                                                                                #4(ribcage
                                                                                   #1(rest)
                                                                                   #1((top))
                                                                                   #1("i"))
                                                                                #4(ribcage
                                                                                   ()
                                                                                   ()
                                                                                   ())
                                                                                #4(ribcage
                                                                                   #2(clause
                                                                                      clauses)
                                                                                   #2((top)
                                                                                      (top))
                                                                                   #2("i"
                                                                                      "i"))
                                                                                #4(ribcage
                                                                                   #1(f)
                                                                                   #1((top))
                                                                                   #1("i"))
                                                                                #4(ribcage
                                                                                   #4(_
                                                                                      e
                                                                                      m1
                                                                                      m2)
                                                                                   #4((top)
                                                                                      (top)
                                                                                      (top)
                                                                                      (top))
                                                                                   #4("i"
                                                                                      "i"
                                                                                      "i"
                                                                                      "i"))
                                                                                #4(ribcage
                                                                                   ()
                                                                                   ()
                                                                                   ())
                                                                                #4(ribcage
                                                                                   #1(x)
                                                                                   #1((top))
                                                                                   #1("i"))
                                                                                #4(ribcage
                                                                                   ((import-token
                                                                                      .
                                                                                      *top*))
                                                                                   ()
                                                                                   ())))
                                                                           %_3131))
                                                               (cons '#3(syntax-object
                                                                         begin
                                                                         ((top)
                                                                          #4(ribcage
                                                                             #3(k
                                                                                e1
                                                                                e2)
                                                                             #3((top)
                                                                                (top)
                                                                                (top))
                                                                             #3("i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(rest)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #2(clause
                                                                                clauses)
                                                                             #2((top)
                                                                                (top))
                                                                             #2("i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             #1(f)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             #4(_
                                                                                e
                                                                                m1
                                                                                m2)
                                                                             #4((top)
                                                                                (top)
                                                                                (top)
                                                                                (top))
                                                                             #4("i"
                                                                                "i"
                                                                                "i"
                                                                                "i"))
                                                                          #4(ribcage
                                                                             ()
                                                                             ()
                                                                             ())
                                                                          #4(ribcage
                                                                             #1(x)
                                                                             #1((top))
                                                                             #1("i"))
                                                                          #4(ribcage
                                                                             ((import-token
                                                                                .
                                                                                *top*))
                                                                             ()
                                                                             ())))
                                                                     (cons %_3132
                                                                           %_3133))
                                                               %_3127))
                                                       %_3129)
                                                ((lambda (%_3130)
                                                   (syntax-error %_3115))
                                                 %_3128)))
                                            ($syntax-dispatch
                                              %_3128
                                              '(each-any any . each-any))))
                                         %_3124))
                                      %_3126))
                                   (%_3123 (car %_3125) (cdr %_3125))))))
                            %_3123))
                        #f)
                       %_3120
                       %_3121)))
                   %_3117)
            (syntax-error %_3116)))
        ($syntax-dispatch
          %_3116
          '(any any any . each-any))))
     %_3115)))
($sc-put-cte
  'identifier-syntax
  (lambda (%_3150)
    ((lambda (%_3151)
       ((lambda (%_3152)
          (if %_3152
            (apply (lambda (%_3166 %_3167)
                     (list '#3(syntax-object
                               lambda
                               ((top)
                                #4(ribcage #2(_ e) #2((top)) #2("i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           '#3(syntax-object
                               (x)
                               ((top)
                                #4(ribcage #2(_ e) #2((top)) #2("i" "i"))
                                #4(ribcage ())
                                #4(ribcage #1(x) #1((top)) #1("i"))
                                #4(ribcage ((import-token . *top*)) ())))
                           (list '#3(syntax-object
                                     syntax-case
                                     ((top)
                                      #4(ribcage #2(_ e) #2((top)) #2("i" "i"))
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ((import-token . *top*)) ())))
                                 '#3(syntax-object
                                     x
                                     ((top)
                                      #4(ribcage #2(_ e) #2((top)) #2("i" "i"))
                                      #4(ribcage ())
                                      #4(ribcage #1(x) #1((top)) #1("i"))
                                      #4(ribcage ((import-token . *top*)) ())))
                                 '()
                                 (list '#3(syntax-object
                                           id
                                           ((top)
                                            #4(ribcage
                                               #2(_ e)
                                               #2((top))
                                               #2("i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))
                                       '#3(syntax-object
                                           (identifier? (syntax id))
                                           ((top)
                                            #4(ribcage
                                               #2(_ e)
                                               #2((top))
                                               #2("i" "i"))
                                            #4(ribcage ())
                                            #4(ribcage #1(x) #1((top)) #1("i"))
                                            #4(ribcage
                                               ((import-token . *top*))
                                               ()
                                               ())))
                                       (list '#3(syntax-object
                                                 syntax
                                                 ((top)
                                                  #4(ribcage
                                                     #2(_ e)
                                                     #2((top))
                                                     #2("i" "i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #1(x)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage
                                                     ((import-token . *top*))
                                                     ()
                                                     ())))
                                             %_3167))
                                 (list (cons %_3166
                                             '(#3(syntax-object
                                                  x
                                                  ((top)
                                                   #4(ribcage
                                                      #2(_ e)
                                                      #2((top))
                                                      #2("i" "i"))
                                                   #4(ribcage ())
                                                   #4(ribcage
                                                      #1(x)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage
                                                      ((import-token . *top*))
                                                      ()
                                                      ())))
                                               #3(syntax-object
                                                  ...
                                                  ((top)
                                                   #4(ribcage
                                                      #2(_ e)
                                                      #2((top))
                                                      #2("i" "i"))
                                                   #4(ribcage ())
                                                   #4(ribcage
                                                      #1(x)
                                                      #1((top))
                                                      #1("i"))
                                                   #4(ribcage
                                                      ((import-token . *top*))
                                                      ()
                                                      ())))))
                                       (list '#3(syntax-object
                                                 syntax
                                                 ((top)
                                                  #4(ribcage
                                                     #2(_ e)
                                                     #2((top))
                                                     #2("i" "i"))
                                                  #4(ribcage ())
                                                  #4(ribcage
                                                     #1(x)
                                                     #1((top))
                                                     #1("i"))
                                                  #4(ribcage
                                                     ((import-token . *top*))
                                                     ()
                                                     ())))
                                             (cons %_3167
                                                   '(#3(syntax-object
                                                        x
                                                        ((top)
                                                         #4(ribcage
                                                            #2(_ e)
                                                            #2((top))
                                                            #2("i" "i"))
                                                         #4(ribcage ())
                                                         #4(ribcage
                                                            #1(x)
                                                            #1((top))
                                                            #1("i"))
                                                         #4(ribcage
                                                            ((import-token
                                                               .
                                                               *top*))
                                                            ()
                                                            ())))
                                                     #3(syntax-object
                                                        ...
                                                        ((top)
                                                         #4(ribcage
                                                            #2(_ e)
                                                            #2((top))
                                                            #2("i" "i"))
                                                         #4(ribcage ())
                                                         #4(ribcage
                                                            #1(x)
                                                            #1((top))
                                                            #1("i"))
                                                         #4(ribcage
                                                            ((import-token
                                                               .
                                                               *top*))
                                                            ()
                                                            ()))))))))))
                   %_3152)
            ((lambda (%_3153)
               (if (if %_3153
                     (apply (lambda (%_3160 %_3161 %_3162 %_3163 %_3164 %_3165)
                              (if (identifier? %_3161)
                                (identifier? %_3163)
                                '#f))
                            %_3153)
                     '#f)
                 (apply (lambda (%_3154 %_3155 %_3156 %_3157 %_3158 %_3159)
                          (list '#3(syntax-object
                                    cons
                                    ((top)
                                     #4(ribcage
                                        #6(_ id exp1 var val exp2)
                                        #6((top))
                                        #6("i" "i" "i" "i" "i" "i"))
                                     #4(ribcage ())
                                     #4(ribcage #1(x) #1((top)) #1("i"))
                                     #4(ribcage ((import-token . *top*)) ())))
                                '#3(syntax-object
                                    'macro!
                                    ((top)
                                     #4(ribcage
                                        #6(_ id exp1 var val exp2)
                                        #6((top))
                                        #6("i" "i" "i" "i" "i" "i"))
                                     #4(ribcage ())
                                     #4(ribcage #1(x) #1((top)) #1("i"))
                                     #4(ribcage ((import-token . *top*)) ())))
                                (list '#3(syntax-object
                                          lambda
                                          ((top)
                                           #4(ribcage
                                              #6(_ id exp1 var val exp2)
                                              #6((top))
                                              #6("i" "i" "i" "i" "i" "i"))
                                           #4(ribcage ())
                                           #4(ribcage #1(x) #1((top)) #1("i"))
                                           #4(ribcage
                                              ((import-token . *top*))
                                              ()
                                              ())))
                                      '#3(syntax-object
                                          (x)
                                          ((top)
                                           #4(ribcage
                                              #6(_ id exp1 var val exp2)
                                              #6((top))
                                              #6("i" "i" "i" "i" "i" "i"))
                                           #4(ribcage ())
                                           #4(ribcage #1(x) #1((top)) #1("i"))
                                           #4(ribcage
                                              ((import-token . *top*))
                                              ()
                                              ())))
                                      (list '#3(syntax-object
                                                syntax-case
                                                ((top)
                                                 #4(ribcage
                                                    #6(_ id exp1 var val exp2)
                                                    #6((top))
                                                    #6("i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #1(x)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ())))
                                            '#3(syntax-object
                                                x
                                                ((top)
                                                 #4(ribcage
                                                    #6(_ id exp1 var val exp2)
                                                    #6((top))
                                                    #6("i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #1(x)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ())))
                                            '#3(syntax-object
                                                (set!)
                                                ((top)
                                                 #4(ribcage
                                                    #6(_ id exp1 var val exp2)
                                                    #6((top))
                                                    #6("i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"
                                                       "i"))
                                                 #4(ribcage ())
                                                 #4(ribcage
                                                    #1(x)
                                                    #1((top))
                                                    #1("i"))
                                                 #4(ribcage
                                                    ((import-token . *top*))
                                                    ()
                                                    ())))
                                            (list (list '#3(syntax-object
                                                            set!
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                #6((top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        %_3157
                                                        %_3158)
                                                  (list '#3(syntax-object
                                                            syntax
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                #6((top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        %_3159))
                                            (list (cons %_3155
                                                        '(#3(syntax-object
                                                             x
                                                             ((top)
                                                              #4(ribcage
                                                                 #6(_
                                                                    id
                                                                    exp1
                                                                    var
                                                                    val
                                                                    exp2)
                                                                 #6((top))
                                                                 #6("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(x)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 ((import-token
                                                                    .
                                                                    *top*))
                                                                 ()
                                                                 ())))
                                                          #3(syntax-object
                                                             ...
                                                             ((top)
                                                              #4(ribcage
                                                                 #6(_
                                                                    id
                                                                    exp1
                                                                    var
                                                                    val
                                                                    exp2)
                                                                 #6((top))
                                                                 #6("i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"
                                                                    "i"))
                                                              #4(ribcage ())
                                                              #4(ribcage
                                                                 #1(x)
                                                                 #1((top))
                                                                 #1("i"))
                                                              #4(ribcage
                                                                 ((import-token
                                                                    .
                                                                    *top*))
                                                                 ()
                                                                 ())))))
                                                  (list '#3(syntax-object
                                                            syntax
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                #6((top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (cons %_3156
                                                              '(#3(syntax-object
                                                                   x
                                                                   ((top)
                                                                    #4(ribcage
                                                                       #6(_
                                                                          id
                                                                          exp1
                                                                          var
                                                                          val
                                                                          exp2)
                                                                       #6((top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                       #6("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ((import-token
                                                                          .
                                                                          *top*))
                                                                       ()
                                                                       ())))
                                                                #3(syntax-object
                                                                   ...
                                                                   ((top)
                                                                    #4(ribcage
                                                                       #6(_
                                                                          id
                                                                          exp1
                                                                          var
                                                                          val
                                                                          exp2)
                                                                       #6((top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top)
                                                                          (top))
                                                                       #6("i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"
                                                                          "i"))
                                                                    #4(ribcage
                                                                       ()
                                                                       ()
                                                                       ())
                                                                    #4(ribcage
                                                                       #1(x)
                                                                       #1((top))
                                                                       #1("i"))
                                                                    #4(ribcage
                                                                       ((import-token
                                                                          .
                                                                          *top*))
                                                                       ()
                                                                       ())))))))
                                            (list %_3155
                                                  (list '#3(syntax-object
                                                            identifier?
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                #6((top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        (list '#3(syntax-object
                                                                  syntax
                                                                  ((top)
                                                                   #4(ribcage
                                                                      #6(_
                                                                         id
                                                                         exp1
                                                                         var
                                                                         val
                                                                         exp2)
                                                                      #6((top))
                                                                      #6("i"
                                                                         "i"
                                                                         "i"
                                                                         "i"
                                                                         "i"
                                                                         "i"))
                                                                   #4(ribcage
                                                                      ()
                                                                      ()
                                                                      ())
                                                                   #4(ribcage
                                                                      #1(x)
                                                                      #1((top))
                                                                      #1("i"))
                                                                   #4(ribcage
                                                                      ((import-token
                                                                         .
                                                                         *top*))
                                                                      ()
                                                                      ())))
                                                              %_3155))
                                                  (list '#3(syntax-object
                                                            syntax
                                                            ((top)
                                                             #4(ribcage
                                                                #6(_
                                                                   id
                                                                   exp1
                                                                   var
                                                                   val
                                                                   exp2)
                                                                #6((top))
                                                                #6("i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"
                                                                   "i"))
                                                             #4(ribcage ())
                                                             #4(ribcage
                                                                #1(x)
                                                                #1((top))
                                                                #1("i"))
                                                             #4(ribcage
                                                                ((import-token
                                                                   .
                                                                   *top*))
                                                                ()
                                                                ())))
                                                        %_3156))))))
                        %_3153)
                 (syntax-error %_3151)))
             ($syntax-dispatch
               %_3151
               '(any (any any)
                     ((#2(free-id
                          #3(syntax-object
                             set!
                             ((top)
                              #4(ribcage ())
                              #4(ribcage #1(x) #1((top)) #1("i"))
                              #4(ribcage ((import-token . *top*)) ()))))
                       any
                       any)
                      any))))))
        ($syntax-dispatch %_3151 '(any any))))
     %_3150)))
