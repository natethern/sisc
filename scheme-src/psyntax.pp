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
   ((lambda (%_1372
             %_1371
             %_1370
             %_1369
             %_1368
             %_1367
             %_1366
             %_1365
             %_1364
             %_1363
             %_1362
             %_1361
             %_1360
             %_1359
             %_1358
             %_1357
             %_1356
             %_1355
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
             %_1283
             %_1282
             %_1281
             %_1280
             %_1279
             %_1274
             %_1236
             %_1235
             %_1234
             %_1233
             %_1232
             %_1231
             %_1230
             %_1229
             %_1228
             %_1227
             %_1226
             %_1225
             %_1224
             %_1223
             %_1222
             %_1190
             %_1189
             %_1188
             %_1187
             %_1181
             %_1180
             %_1179
             %_1178
             %_1177
             %_1176
             %_1175
             %_1174
             %_1173
             %_1172
             %_1171
             %_1161
             %_1160
             %_1159
             %_1158
             %_1157
             %_1156
             %_1148
             %_1133
             %_1132
             %_1131
             %_1130
             %_1129
             %_1128
             %_1116
             %_1115
             %_1016
             %_1015
             %_1014
             %_1013
             %_1008
             %_1007
             %_1006
             %_969)
      (begin
        (set! %_1372
          (lambda (%_1825)
            (((lambda (%_1826)
                (begin
                  (set! %_1826
                    (lambda (%_1827 %_1828 %_1829)
                      (if (pair? %_1827)
                        (%_1826
                          (cdr %_1827)
                          (cons (%_1310 (car %_1827) %_1829) %_1828)
                          %_1829)
                        (if (%_1181 %_1827)
                          (cons (%_1310 %_1827 %_1829) %_1828)
                          (if (null? %_1827)
                            %_1828
                            (if (%_1129 %_1827)
                              (%_1826
                                (%_1130 %_1827)
                                %_1828
                                (%_1296 %_1829 (%_1131 %_1827)))
                              (if (annotation? %_1827)
                                (%_1826
                                  (annotation-expression %_1827)
                                  %_1828
                                  %_1829)
                                (cons %_1827 %_1828))))))))
                  %_1826))
              #f)
             %_1825
             '()
             '(()))))
        (set! %_1371
          (lambda (%_1830)
            ((lambda (%_1831)
               (if (annotation? %_1831)
                 (if (annotation-source %_1831)
                   (list 'make-annotation
                         (gensym)
                         (annotation-source %_1831))
                   (gensym))
                 (if '#f
                   (list 'make-annotation (gensym) '#f)
                   (gensym))))
             (if (%_1129 %_1830) (%_1130 %_1830) %_1830))))
        (set! %_1370
          (lambda (%_1832 %_1833)
            (%_1369
              %_1832
              %_1833
              (lambda (%_1834)
                (if ((lambda (%_1835)
                       (if %_1835
                         %_1835
                         (if (pair? %_1834)
                           (annotation? (car %_1834))
                           '#f)))
                     (annotation? %_1834))
                  (%_1368 %_1834 '#f)
                  %_1834)))))
        (set! %_1369
          (lambda (%_1836 %_1837 %_1838)
            (if (memq 'top (%_1189 %_1837))
              (%_1838 %_1836)
              (((lambda (%_1839)
                  (begin
                    (set! %_1839
                      (lambda (%_1840)
                        (if (%_1129 %_1840)
                          (%_1369 (%_1130 %_1840) (%_1131 %_1840) %_1838)
                          (if (pair? %_1840)
                            ((lambda (%_1843 %_1844)
                               (if (if (eq? %_1843 (car %_1840))
                                     (eq? %_1844 (cdr %_1840))
                                     '#f)
                                 %_1840
                                 (cons %_1843 %_1844)))
                             (%_1839 (car %_1840))
                             (%_1839 (cdr %_1840)))
                            (if (vector? %_1840)
                              ((lambda (%_1841)
                                 ((lambda (%_1842)
                                    (if (andmap eq? %_1841 %_1842)
                                      %_1840
                                      (list->vector %_1842)))
                                  (map %_1839 %_1841)))
                               (vector->list %_1840))
                              %_1840)))))
                    %_1839))
                #f)
               %_1836))))
        (set! %_1368
          (lambda (%_1845 %_1846)
            (if (annotation? %_1845)
              ((lambda (%_1851)
                 (if %_1851
                   %_1851
                   (%_1368 (annotation-expression %_1845) %_1845)))
               (annotation-stripped %_1845))
              (if (pair? %_1845)
                ((lambda (%_1850)
                   (begin
                     (if %_1846
                       (set-annotation-stripped! %_1846 %_1850)
                       (void))
                     (set-car! %_1850 (%_1368 (car %_1845) '#f))
                     (set-cdr! %_1850 (%_1368 (cdr %_1845) '#f))
                     %_1850))
                 (cons '#f '#f))
                (if (vector? %_1845)
                  ((lambda (%_1847)
                     (begin
                       (if %_1846
                         (set-annotation-stripped! %_1846 %_1847)
                         (void))
                       (((lambda (%_1848)
                           (begin
                             (set! %_1848
                               (lambda (%_1849)
                                 (if (not (< %_1849 '0))
                                   (begin
                                     (vector-set!
                                       %_1847
                                       %_1849
                                       (%_1368 (vector-ref %_1845 %_1849) '#f))
                                     (%_1848 (- %_1849 '1)))
                                   (void))))
                             %_1848))
                         #f)
                        (- (vector-length %_1845) '1))
                       %_1847))
                   (make-vector (vector-length %_1845)))
                  %_1845)))))
        (set! %_1367
          (lambda (%_1852)
            (if (%_1180 %_1852)
              (%_1304
                %_1852
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
                         "i"))
                     #4(ribcage ((import-token . *top*)) ())
                     #4(ribcage ((import-token . *top*)) ()))))
              '#f)))
        (set! %_1366
          (lambda ()
            (if '#f
              (list 'make-annotation (list 'void) '#f)
              (list 'void))))
        (set! %_1365
          (lambda (%_1853 %_1854 %_1855 %_1856 %_1857 %_1858)
            ((lambda (%_1859)
               ((lambda (%_1860)
                  (if %_1860
                    (apply (lambda (%_1862 %_1863 %_1864 %_1865 %_1866)
                             ((lambda (%_1867)
                                (if (not (%_1306 %_1867))
                                  (%_1308
                                    (map (lambda (%_1875)
                                           (%_1310 %_1875 %_1856))
                                         %_1867)
                                    (%_1311 %_1854 %_1856 %_1857)
                                    '"keyword")
                                  ((lambda (%_1868)
                                     ((lambda (%_1869)
                                        (%_1858
                                          (cons %_1865 %_1866)
                                          (%_1172
                                            %_1868
                                            ((lambda (%_1871 %_1872)
                                               (map (lambda (%_1873)
                                                      (%_1156
                                                        'deferred
                                                        (%_1352
                                                          %_1873
                                                          %_1872
                                                          %_1871)))
                                                    %_1864))
                                             (if %_1853 %_1869 %_1856)
                                             (%_1174 %_1855))
                                            %_1855)
                                          %_1869
                                          %_1857))
                                      (%_1293 %_1867 %_1868 %_1856)))
                                   (%_1224 %_1867))))
                              %_1863))
                           %_1860)
                    ((lambda (%_1861)
                       (syntax-error (%_1311 %_1854 %_1856 %_1857)))
                     %_1859)))
                ($syntax-dispatch
                  %_1859
                  '(any #2(each (any any)) any . each-any))))
             %_1854)))
        (set! %_1364
          (lambda (%_1877 %_1878 %_1879 %_1880 %_1881)
            ((lambda (%_1882)
               ((lambda (%_1883)
                  (if %_1883
                    (apply (lambda (%_1896 %_1897 %_1898)
                             ((lambda (%_1899)
                                (if (not (%_1306 %_1899))
                                  (syntax-error
                                    %_1877
                                    '"invalid parameter list in")
                                  ((lambda (%_1900 %_1901)
                                     (%_1881
                                       %_1901
                                       (%_1357
                                         (cons %_1897 %_1898)
                                         %_1877
                                         (%_1173 %_1900 %_1901 %_1879)
                                         (%_1293 %_1899 %_1900 %_1880))))
                                   (%_1224 %_1899)
                                   (map %_1371 %_1899))))
                              %_1896))
                           %_1883)
                    ((lambda (%_1884)
                       (if %_1884
                         (apply (lambda (%_1886 %_1887 %_1888)
                                  ((lambda (%_1889)
                                     (if (not (%_1306 %_1889))
                                       (syntax-error
                                         %_1877
                                         '"invalid parameter list in")
                                       ((lambda (%_1890 %_1891)
                                          (%_1881
                                            (((lambda (%_1892)
                                                (begin
                                                  (set! %_1892
                                                    (lambda (%_1893 %_1894)
                                                      (if (null? %_1893)
                                                        %_1894
                                                        (%_1892
                                                          (cdr %_1893)
                                                          (cons (car %_1893)
                                                                %_1894)))))
                                                  %_1892))
                                              #f)
                                             (cdr %_1891)
                                             (car %_1891))
                                            (%_1357
                                              (cons %_1887 %_1888)
                                              %_1877
                                              (%_1173 %_1890 %_1891 %_1879)
                                              (%_1293 %_1889 %_1890 %_1880))))
                                        (%_1224 %_1889)
                                        (map %_1371 %_1889))))
                                   (%_1372 %_1886)))
                                %_1884)
                         ((lambda (%_1885) (syntax-error %_1877)) %_1882)))
                     ($syntax-dispatch %_1882 '(any any . each-any)))))
                ($syntax-dispatch
                  %_1882
                  '(each-any any . each-any))))
             %_1878)))
        (set! %_1363
          (lambda (%_1904 %_1905 %_1906 %_1907)
            ((lambda (%_1908)
               ((lambda (%_1909)
                  (if (if %_1909
                        (apply (lambda (%_1914 %_1915 %_1916) (%_1181 %_1915))
                               %_1909)
                        '#f)
                    (apply (lambda (%_1911 %_1912 %_1913)
                             (%_1907 %_1912 %_1913 %_1905))
                           %_1909)
                    ((lambda (%_1910)
                       (syntax-error (%_1311 %_1904 %_1905 %_1906)))
                     %_1908)))
                ($syntax-dispatch %_1908 '(any any any))))
             %_1904)))
        (set! %_1362
          (lambda (%_1917 %_1918 %_1919 %_1920)
            ((lambda (%_1921)
               ((lambda (%_1922)
                  (if (if %_1922
                        (apply (lambda (%_1944 %_1945 %_1946) (%_1181 %_1945))
                               %_1922)
                        '#f)
                    (apply (lambda (%_1941 %_1942 %_1943)
                             (%_1920 %_1942 %_1943 %_1918))
                           %_1922)
                    ((lambda (%_1923)
                       (if (if %_1923
                             (apply (lambda (%_1936
                                             %_1937
                                             %_1938
                                             %_1939
                                             %_1940)
                                      (if (%_1181 %_1937)
                                        (%_1306 (%_1372 %_1938))
                                        '#f))
                                    %_1923)
                             '#f)
                         (apply (lambda (%_1930 %_1931 %_1932 %_1933 %_1934)
                                  (%_1920
                                    (%_1310 %_1931 %_1918)
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
                                                   "i"))
                                               #4(ribcage
                                                  ((import-token . *top*))
                                                  ()
                                                  ())
                                               #4(ribcage
                                                  ((import-token . *top*))
                                                  ()
                                                  ())))
                                          (%_1310
                                            (cons %_1932 (cons %_1933 %_1934))
                                            %_1918))
                                    '(())))
                                %_1923)
                         ((lambda (%_1924)
                            (if (if %_1924
                                  (apply (lambda (%_1928 %_1929)
                                           (%_1181 %_1929))
                                         %_1924)
                                  '#f)
                              (apply (lambda (%_1926 %_1927)
                                       (%_1920
                                         (%_1310 %_1927 %_1918)
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
                                     %_1924)
                              ((lambda (%_1925)
                                 (syntax-error (%_1311 %_1917 %_1918 %_1919)))
                               %_1921)))
                          ($syntax-dispatch %_1921 '(any any)))))
                     ($syntax-dispatch
                       %_1921
                       '(any (any . any) any . each-any)))))
                ($syntax-dispatch %_1921 '(any any any))))
             %_1917)))
        (set! %_1361
          (lambda (%_1947 %_1948 %_1949 %_1950)
            ((lambda (%_1951)
               ((lambda (%_1952)
                  (if (if %_1952
                        (apply (lambda (%_1956 %_1957) (%_1181 %_1957))
                               %_1952)
                        '#f)
                    (apply (lambda (%_1954 %_1955)
                             (%_1950 (%_1310 %_1955 %_1948)))
                           %_1952)
                    ((lambda (%_1953)
                       (syntax-error (%_1311 %_1947 %_1948 %_1949)))
                     %_1951)))
                ($syntax-dispatch %_1951 '(any any))))
             %_1947)))
        (set! %_1360
          (lambda (%_1958 %_1959 %_1960 %_1961 %_1962)
            ((lambda (%_1964 %_1963)
               (begin
                 (set! %_1964
                   (lambda (%_1984 %_1985 %_1986)
                     (%_1962
                       %_1984
                       (%_1963 %_1985)
                       (map (lambda (%_1987) (%_1310 %_1987 %_1961))
                            %_1986))))
                 (set! %_1963
                   (lambda (%_1988)
                     (if (null? %_1988)
                       '()
                       (cons ((lambda (%_1989)
                                ((lambda (%_1990)
                                   (if %_1990
                                     (apply (lambda (%_1992) (%_1963 %_1992))
                                            %_1990)
                                     ((lambda (%_1991)
                                        (if (%_1181 %_1991)
                                          (%_1310 %_1991 %_1961)
                                          (syntax-error
                                            (%_1311 %_1958 %_1959 %_1960)
                                            '"invalid exports list in")))
                                      %_1989)))
                                 ($syntax-dispatch %_1989 'each-any)))
                              (car %_1988))
                             (%_1963 (cdr %_1988))))))
                 ((lambda (%_1965)
                    ((lambda (%_1966)
                       (if %_1966
                         (apply (lambda (%_1979 %_1980 %_1981)
                                  (%_1964 '#f %_1980 %_1981))
                                %_1966)
                         ((lambda (%_1967)
                            (if (if %_1967
                                  (apply (lambda (%_1975 %_1976 %_1977 %_1978)
                                           (%_1181 %_1976))
                                         %_1967)
                                  '#f)
                              (apply (lambda (%_1969 %_1970 %_1971 %_1972)
                                       (%_1964
                                         (%_1310 %_1970 %_1959)
                                         %_1971
                                         %_1972))
                                     %_1967)
                              ((lambda (%_1968)
                                 (syntax-error (%_1311 %_1958 %_1959 %_1960)))
                               %_1965)))
                          ($syntax-dispatch
                            %_1965
                            '(any any each-any . each-any)))))
                     ($syntax-dispatch
                       %_1965
                       '(any each-any . each-any))))
                  %_1958)))
             #f
             #f)))
        (set! %_1359
          (lambda (%_1994 %_1995)
            ((lambda (%_1996)
               (if %_1996
                 (%_1291 %_1995 %_1996)
                 (%_1346
                   (lambda (%_1997)
                     ((lambda (%_1998)
                        (begin
                          (if (not %_1998)
                            (syntax-error
                              %_1997
                              '"exported identifier not visible")
                            (void))
                          (%_1288 %_1995 %_1997 %_1998)))
                      (%_1301 %_1997 '(()))))
                   (%_1321 %_1994))))
             (%_1322 %_1994))))
        (set! %_1358
          (lambda (%_1999 %_2000 %_2001 %_2002 %_2003)
            ((lambda (%_2004)
               (begin
                 (set! %_2004
                   (lambda (%_2074 %_2075 %_2076 %_2077 %_2078)
                     (begin
                       (%_1343 %_2000 %_2075)
                       (%_2003 %_2074 %_2075 %_2076 %_2077 %_2078))))
                 (((lambda (%_2005)
                     (begin
                       (set! %_2005
                         (lambda (%_2006 %_2007 %_2008 %_2009 %_2010)
                           (if (null? %_2006)
                             (%_2004 %_2006 %_2007 %_2008 %_2009 %_2010)
                             ((lambda (%_2011 %_2012)
                                (call-with-values
                                  (lambda ()
                                    (%_1315 %_2011 %_2012 '(()) '#f %_1999))
                                  (lambda (%_2013 %_2014 %_2015 %_2016 %_2017)
                                    ((lambda (%_2018)
                                       (if (memv %_2018 '(define-form))
                                         (%_1362
                                           %_2015
                                           %_2016
                                           %_2017
                                           (lambda (%_2068 %_2069 %_2070)
                                             ((lambda (%_2071 %_2072)
                                                ((lambda (%_2073)
                                                   (begin
                                                     (%_1288
                                                       %_1999
                                                       %_2071
                                                       %_2072)
                                                     (%_1341
                                                       %_2002
                                                       %_2072
                                                       (%_1156
                                                         'lexical
                                                         %_2073))
                                                     (%_2005
                                                       (cdr %_2006)
                                                       (cons %_2071 %_2007)
                                                       (cons %_2073 %_2008)
                                                       (cons (cons %_2012
                                                                   (%_1310
                                                                     %_2069
                                                                     %_2070))
                                                             %_2009)
                                                       %_2010)))
                                                 (%_1371 %_2071)))
                                              (%_1310 %_2068 %_2070)
                                              (%_1222))))
                                         (if (memv %_2018
                                                   '(define-syntax-form))
                                           (%_1363
                                             %_2015
                                             %_2016
                                             %_2017
                                             (lambda (%_2062 %_2063 %_2064)
                                               ((lambda (%_2065 %_2066 %_2067)
                                                  (begin
                                                    (%_1288
                                                      %_1999
                                                      %_2065
                                                      %_2066)
                                                    (%_1341
                                                      %_2002
                                                      %_2066
                                                      (%_1156
                                                        'deferred
                                                        %_2067))
                                                    (%_2005
                                                      (cdr %_2006)
                                                      (cons %_2065 %_2007)
                                                      %_2008
                                                      %_2009
                                                      %_2010)))
                                                (%_1310 %_2062 %_2064)
                                                (%_1222)
                                                (%_1352
                                                  %_2063
                                                  (%_1174 %_2012)
                                                  %_2064))))
                                           (if (memv %_2018 '(module-form))
                                             ((lambda (%_2046)
                                                ((lambda (%_2047)
                                                   ((lambda ()
                                                      (%_1360
                                                        %_2015
                                                        %_2016
                                                        %_2017
                                                        %_2047
                                                        (lambda (%_2048
                                                                 %_2049
                                                                 %_2050)
                                                          (%_1358
                                                            %_2046
                                                            (%_1311
                                                              %_2015
                                                              %_2016
                                                              %_2017)
                                                            (map (lambda (%_2051)
                                                                   (cons %_2012
                                                                         %_2051))
                                                                 %_2050)
                                                            %_2002
                                                            (lambda (%_2052
                                                                     %_2053
                                                                     %_2054
                                                                     %_2055
                                                                     %_2056)
                                                              (begin
                                                                (%_1342
                                                                  %_2000
                                                                  (%_1318
                                                                    %_2049)
                                                                  %_2053)
                                                                ((lambda (%_2057
                                                                          %_2058
                                                                          %_2059
                                                                          %_2060)
                                                                   (if %_2048
                                                                     ((lambda (%_2061)
                                                                        (begin
                                                                          (%_1288
                                                                            %_1999
                                                                            %_2048
                                                                            %_2061)
                                                                          (%_1341
                                                                            %_2002
                                                                            %_2061
                                                                            (%_1156
                                                                              'module
                                                                              %_2057))
                                                                          (%_2005
                                                                            (cdr %_2006)
                                                                            (cons %_2048
                                                                                  %_2007)
                                                                            %_2058
                                                                            %_2059
                                                                            %_2060)))
                                                                      (%_1222))
                                                                     ((lambda ()
                                                                        (begin
                                                                          (%_1359
                                                                            %_2057
                                                                            %_1999)
                                                                          (%_2005
                                                                            (cdr %_2006)
                                                                            (cons %_2057
                                                                                  %_2007)
                                                                            %_2058
                                                                            %_2059
                                                                            %_2060))))))
                                                                 (%_1325
                                                                   %_2049)
                                                                 (append
                                                                   %_2054
                                                                   %_2008)
                                                                 (append
                                                                   %_2055
                                                                   %_2009)
                                                                 (append
                                                                   %_2010
                                                                   %_2056
                                                                   %_2052))))))))))
                                                 (%_1188
                                                   (%_1189 %_2016)
                                                   (cons %_2046
                                                         (%_1190 %_2016)))))
                                              (%_1229 '() '() '()))
                                             (if (memv %_2018 '(import-form))
                                               (%_1361
                                                 %_2015
                                                 %_2016
                                                 %_2017
                                                 (lambda (%_2041)
                                                   ((lambda (%_2042)
                                                      ((lambda (%_2043)
                                                         ((lambda (%_2044)
                                                            (if (memv %_2044
                                                                      '(module))
                                                              ((lambda (%_2045)
                                                                 (begin
                                                                   (if %_2014
                                                                     (%_1289
                                                                       %_1999
                                                                       %_2014)
                                                                     (void))
                                                                   (%_1359
                                                                     %_2045
                                                                     %_1999)
                                                                   (%_2005
                                                                     (cdr %_2006)
                                                                     (cons %_2045
                                                                           %_2007)
                                                                     %_2008
                                                                     %_2009
                                                                     %_2010)))
                                                               (cdr %_2043))
                                                              (if (memv %_2044
                                                                        '(displaced-lexical))
                                                                (%_1175 %_2041)
                                                                (syntax-error
                                                                  %_2041
                                                                  '"import from unknown module"))))
                                                          (car %_2043)))
                                                       (%_1178 %_2042 %_2002)))
                                                    (%_1302 %_2041 '(())))))
                                               (if (memv %_2018 '(begin-form))
                                                 ((lambda (%_2034)
                                                    ((lambda (%_2035)
                                                       (if %_2035
                                                         (apply (lambda (%_2036
                                                                         %_2037)
                                                                  (%_2005
                                                                    (((lambda (%_2038)
                                                                        (begin
                                                                          (set! %_2038
                                                                            (lambda (%_2039)
                                                                              (if (null? %_2039)
                                                                                (cdr %_2006)
                                                                                (cons (cons %_2012
                                                                                            (%_1310
                                                                                              (car %_2039)
                                                                                              %_2016))
                                                                                      (%_2038
                                                                                        (cdr %_2039))))))
                                                                          %_2038))
                                                                      #f)
                                                                     %_2037)
                                                                    %_2007
                                                                    %_2008
                                                                    %_2009
                                                                    %_2010))
                                                                %_2035)
                                                         (syntax-error
                                                           %_2034)))
                                                     ($syntax-dispatch
                                                       %_2034
                                                       '(any . each-any))))
                                                  %_2015)
                                                 (if (memv %_2018
                                                           '(eval-when-form))
                                                   ((lambda (%_2025)
                                                      ((lambda (%_2026)
                                                         (if %_2026
                                                           (apply (lambda (%_2027
                                                                           %_2028
                                                                           %_2029)
                                                                    (%_2005
                                                                      (if (memq 'eval
                                                                                (%_1314
                                                                                  %_2028
                                                                                  %_2016))
                                                                        (((lambda (%_2030)
                                                                            (begin
                                                                              (set! %_2030
                                                                                (lambda (%_2031)
                                                                                  (if (null? %_2031)
                                                                                    (cdr %_2006)
                                                                                    (cons (cons %_2012
                                                                                                (%_1310
                                                                                                  (car %_2031)
                                                                                                  %_2016))
                                                                                          (%_2030
                                                                                            (cdr %_2031))))))
                                                                              %_2030))
                                                                          #f)
                                                                         %_2029)
                                                                        (cdr %_2006))
                                                                      %_2007
                                                                      %_2008
                                                                      %_2009
                                                                      %_2010))
                                                                  %_2026)
                                                           (syntax-error
                                                             %_2025)))
                                                       ($syntax-dispatch
                                                         %_2025
                                                         '(any each-any
                                                               .
                                                               each-any))))
                                                    %_2015)
                                                   (if (memv %_2018
                                                             '(local-syntax-form))
                                                     (%_1365
                                                       %_2014
                                                       %_2015
                                                       %_2012
                                                       %_2016
                                                       %_2017
                                                       (lambda (%_2019
                                                                %_2020
                                                                %_2021
                                                                %_2022)
                                                         (%_2005
                                                           (((lambda (%_2023)
                                                               (begin
                                                                 (set! %_2023
                                                                   (lambda (%_2024)
                                                                     (if (null? %_2024)
                                                                       (cdr %_2006)
                                                                       (cons (cons %_2020
                                                                                   (%_1310
                                                                                     (car %_2024)
                                                                                     %_2021))
                                                                             (%_2023
                                                                               (cdr %_2024))))))
                                                                 %_2023))
                                                             #f)
                                                            %_2019)
                                                           %_2007
                                                           %_2008
                                                           %_2009
                                                           %_2010)))
                                                     (%_2004
                                                       (cons (cons %_2012
                                                                   (%_1311
                                                                     %_2015
                                                                     %_2016
                                                                     %_2017))
                                                             (cdr %_2006))
                                                       %_2007
                                                       %_2008
                                                       %_2009
                                                       %_2010)))))))))
                                     %_2013))))
                              (cdar %_2006)
                              (caar %_2006)))))
                       %_2005))
                   #f)
                  %_2001
                  '()
                  '()
                  '()
                  '())))
             #f)))
        (set! %_1357
          (lambda (%_2079 %_2080 %_2081 %_2082)
            ((lambda (%_2083)
               ((lambda (%_2084)
                  ((lambda (%_2085)
                     ((lambda (%_2086)
                        ((lambda ()
                           (%_1358
                             %_2084
                             %_2080
                             %_2086
                             %_2083
                             (lambda (%_2087 %_2088 %_2089 %_2090 %_2091)
                               (begin
                                 (if (null? %_2087)
                                   (syntax-error
                                     %_2080
                                     '"no expressions in body")
                                   (void))
                                 (%_1116
                                   '#f
                                   %_2089
                                   (map (lambda (%_2092)
                                          (%_1352
                                            (cdr %_2092)
                                            (car %_2092)
                                            '(())))
                                        %_2090)
                                   (%_1115
                                     '#f
                                     (map (lambda (%_2093)
                                            (%_1352
                                              (cdr %_2093)
                                              (car %_2093)
                                              '(())))
                                          (append %_2091 %_2087))))))))))
                      (map (lambda (%_2094)
                             (cons %_2083 (%_1310 %_2094 %_2085)))
                           %_2079)))
                   (%_1188
                     (%_1189 %_2082)
                     (cons %_2084 (%_1190 %_2082)))))
                (%_1229 '() '() '())))
             (cons '("placeholder" placeholder) %_2081))))
        (set! %_1356
          (lambda (%_2095 %_2096 %_2097 %_2098 %_2099 %_2100)
            ((lambda (%_2101)
               (begin
                 (set! %_2101
                   (lambda (%_2104 %_2105)
                     (if (pair? %_2104)
                       (cons (%_2101 (car %_2104) %_2105)
                             (%_2101 (cdr %_2104) %_2105))
                       (if (%_1129 %_2104)
                         ((lambda (%_2110)
                            ((lambda (%_2111 %_2112)
                               (%_1128
                                 (%_1130 %_2104)
                                 (if (if (pair? %_2111)
                                       (eq? (car %_2111) '#f)
                                       '#f)
                                   (%_1188
                                     (cdr %_2111)
                                     (if %_2100
                                       (cons %_2100 (cdr %_2112))
                                       (cdr %_2112)))
                                   (%_1188
                                     (cons %_2105 %_2111)
                                     (if %_2100
                                       (cons %_2100 (cons 'shift %_2112))
                                       (cons 'shift %_2112))))))
                             (%_1189 %_2110)
                             (%_1190 %_2110)))
                          (%_1131 %_2104))
                         (if (vector? %_2104)
                           ((lambda (%_2106)
                              ((lambda (%_2107)
                                 ((lambda ()
                                    (((lambda (%_2108)
                                        (begin
                                          (set! %_2108
                                            (lambda (%_2109)
                                              (if (= %_2109 %_2106)
                                                %_2107
                                                (begin
                                                  (vector-set!
                                                    %_2107
                                                    %_2109
                                                    (%_2101
                                                      (vector-ref
                                                        %_2104
                                                        %_2109)
                                                      %_2105))
                                                  (%_2108 (+ %_2109 '1))))))
                                          %_2108))
                                      #f)
                                     '0))))
                               (make-vector %_2106)))
                            (vector-length %_2104))
                           (if (symbol? %_2104)
                             (syntax-error
                               (%_1311 %_2096 %_2098 %_2099)
                               '"encountered raw symbol "
                               (format '"~s" %_2104)
                               '" in output of macro")
                             %_2104))))))
                 (%_2101
                   ((lambda (%_2102)
                      (if (procedure? %_2102)
                        (%_2102
                          (lambda (%_2103)
                            (begin
                              (if (not (identifier? %_2103))
                                (syntax-error
                                  %_2103
                                  '"environment argument is not an identifier")
                                (void))
                              (%_1178 (%_1302 %_2103 '(())) %_2097))))
                        %_2102))
                    (%_2095 (%_1311 %_2096 (%_1274 %_2098) %_2099)))
                   (string '#\m))))
             #f)))
        (set! %_1355
          (lambda (%_2113 %_2114 %_2115 %_2116 %_2117)
            ((lambda (%_2118)
               ((lambda (%_2119)
                  (if (if %_2119
                        (apply (lambda (%_2137 %_2138 %_2139) (%_1181 %_2138))
                               %_2119)
                        '#f)
                    (apply (lambda (%_2121 %_2122 %_2123)
                             ((lambda (%_2124)
                                ((lambda (%_2125)
                                   ((lambda (%_2126)
                                      (if (memv %_2126 '(macro!))
                                        ((lambda (%_2135 %_2136)
                                           (%_1315
                                             (%_1356
                                               (%_1158 %_2125)
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
                                                     %_2135
                                                     %_2136)
                                               %_2114
                                               '(())
                                               %_2116
                                               %_2117)
                                             %_2114
                                             '(())
                                             %_2116
                                             %_2117))
                                         (%_1310 %_2122 %_2115)
                                         (%_1310 %_2123 %_2115))
                                        (values
                                          'core
                                          (lambda (%_2127 %_2128 %_2129 %_2130)
                                            ((lambda (%_2131 %_2132)
                                               ((lambda (%_2133)
                                                  ((lambda (%_2134)
                                                     (if (memv %_2134
                                                               '(lexical))
                                                       (if %_2130
                                                         (list 'make-annotation
                                                               (list 'set!
                                                                     (%_1158
                                                                       %_2133)
                                                                     %_2131)
                                                               %_2130)
                                                         (list 'set!
                                                               (%_1158 %_2133)
                                                               %_2131))
                                                       (if (memv %_2134
                                                                 '(global))
                                                         (if %_2130
                                                           (list 'make-annotation
                                                                 (list 'set!
                                                                       (%_1158
                                                                         %_2133)
                                                                       %_2131)
                                                                 %_2130)
                                                           (list 'set!
                                                                 (%_1158
                                                                   %_2133)
                                                                 %_2131))
                                                         (if (memv %_2134
                                                                   '(displaced-lexical))
                                                           (syntax-error
                                                             (%_1310
                                                               %_2122
                                                               %_2129)
                                                             '"identifier out of context")
                                                           (syntax-error
                                                             (%_1311
                                                               %_2127
                                                               %_2129
                                                               %_2130))))))
                                                   (%_1157 %_2133)))
                                                (%_1178 %_2132 %_2128)))
                                             (%_1352 %_2123 %_2128 %_2129)
                                             (%_1302 %_2122 %_2129)))
                                          %_2113
                                          %_2115
                                          %_2116)))
                                    (%_1157 %_2125)))
                                 (%_1178 %_2124 %_2114)))
                              (%_1302 %_2122 %_2115)))
                           %_2119)
                    ((lambda (%_2120)
                       (syntax-error (%_1311 %_2113 %_2115 %_2116)))
                     %_2118)))
                ($syntax-dispatch %_2118 '(any any any))))
             %_2113)))
        (set! %_1354
          (lambda (%_2140 %_2141 %_2142 %_2143 %_2144)
            ((lambda (%_2145)
               ((lambda (%_2146)
                  (if %_2146
                    (apply (lambda (%_2148 %_2149)
                             (if %_2144
                               (list 'make-annotation
                                     (cons %_2140
                                           (map (lambda (%_2152)
                                                  (%_1352
                                                    %_2152
                                                    %_2142
                                                    %_2143))
                                                %_2149))
                                     %_2144)
                               (cons %_2140
                                     (map (lambda (%_2150)
                                            (%_1352 %_2150 %_2142 %_2143))
                                          %_2149))))
                           %_2146)
                    ((lambda (%_2147)
                       (syntax-error (%_1311 %_2141 %_2143 %_2144)))
                     %_2145)))
                ($syntax-dispatch %_2145 '(any . each-any))))
             %_2141)))
        (set! %_1353
          (lambda (%_2154 %_2155 %_2156 %_2157 %_2158 %_2159)
            ((lambda (%_2160)
               (if (memv %_2160 '(lexical))
                 (if %_2159
                   (list 'make-annotation %_2155 %_2159)
                   %_2155)
                 (if (memv %_2160 '(core))
                   (%_2155 %_2156 %_2157 %_2158 %_2159)
                   (if (memv %_2160 '(lexical-call))
                     (%_1354
                       (if (%_1148 (car %_2156))
                         (list 'make-annotation
                               %_2155
                               (%_1148 (car %_2156)))
                         %_2155)
                       %_2156
                       %_2157
                       %_2158
                       %_2159)
                     (if (memv %_2160 '(constant))
                       (list 'quote
                             (%_1370 (%_1311 %_2156 %_2158 %_2159) '(())))
                       (if (memv %_2160 '(global))
                         (if %_2159
                           (list 'make-annotation %_2155 %_2159)
                           %_2155)
                         (if (memv %_2160 '(call))
                           (%_1354
                             (%_1352 (car %_2156) %_2157 %_2158)
                             %_2156
                             %_2157
                             %_2158
                             %_2159)
                           (if (memv %_2160 '(begin-form))
                             ((lambda (%_2169)
                                ((lambda (%_2170)
                                   (if %_2170
                                     (apply (lambda (%_2171 %_2172 %_2173)
                                              (%_1312
                                                (cons %_2172 %_2173)
                                                %_2157
                                                %_2158
                                                %_2159))
                                            %_2170)
                                     (syntax-error %_2169)))
                                 ($syntax-dispatch
                                   %_2169
                                   '(any any . each-any))))
                              %_2156)
                             (if (memv %_2160 '(local-syntax-form))
                               (%_1365
                                 %_2155
                                 %_2156
                                 %_2157
                                 %_2158
                                 %_2159
                                 %_1312)
                               (if (memv %_2160 '(eval-when-form))
                                 ((lambda (%_2161)
                                    ((lambda (%_2162)
                                       (if %_2162
                                         (apply (lambda (%_2163
                                                         %_2164
                                                         %_2165
                                                         %_2166)
                                                  (if (memq 'eval
                                                            (%_1314
                                                              %_2164
                                                              %_2158))
                                                    (%_1312
                                                      (cons %_2165 %_2166)
                                                      %_2157
                                                      %_2158
                                                      %_2159)
                                                    (%_1366)))
                                                %_2162)
                                         (syntax-error %_2161)))
                                     ($syntax-dispatch
                                       %_2161
                                       '(any each-any any . each-any))))
                                  %_2156)
                                 (if (memv %_2160
                                           '(define-form
                                              define-syntax-form
                                              module-form
                                              import-form))
                                   (syntax-error
                                     (%_1311 %_2156 %_2158 %_2159)
                                     '"invalid context for definition")
                                   (if (memv %_2160 '(syntax))
                                     (syntax-error
                                       (%_1311 %_2156 %_2158 %_2159)
                                       '"reference to pattern variable outside syntax form")
                                     (if (memv %_2160 '(displaced-lexical))
                                       (%_1175 (%_1311 %_2156 %_2158 %_2159))
                                       (syntax-error
                                         (%_1311
                                           %_2156
                                           %_2158
                                           %_2159)))))))))))))))
             %_2154)))
        (set! %_1352
          (lambda (%_2175 %_2176 %_2177)
            (call-with-values
              (lambda () (%_1315 %_2175 %_2176 %_2177 '#f '#f))
              (lambda (%_2178 %_2179 %_2180 %_2181 %_2182)
                (%_1353
                  %_2178
                  %_2179
                  %_2180
                  %_2176
                  %_2181
                  %_2182)))))
        (set! %_1351
          (lambda (%_2183 %_2184)
            (if (memq 'e %_2183)
              (begin (%_1006 (%_2184)) (%_1366))
              ((lambda (%_2185)
                 (if (memq 'r %_2183)
                   (if ((lambda (%_2187)
                          (if %_2187 %_2187 (memq 'v %_2183)))
                        (memq 'l %_2183))
                     (%_2185)
                     (%_2185))
                   (if ((lambda (%_2186)
                          (if %_2186 %_2186 (memq 'v %_2183)))
                        (memq 'l %_2183))
                     (%_2185)
                     (%_1366))))
               (if (memq 'c %_2183)
                 ((lambda (%_2188)
                    (begin (%_1006 %_2188) (lambda () %_2188)))
                  (%_2184))
                 %_2184)))))
        (set! %_1350
          (lambda (%_2189 %_2190)
            (if (memq 'e %_2189)
              (%_2190)
              ((lambda (%_2191)
                 (if (memq 'v %_2189)
                   (if ((lambda (%_2193)
                          (if %_2193 %_2193 (memq 'r %_2189)))
                        (memq 'l %_2189))
                     (%_2191)
                     (%_2191))
                   (if ((lambda (%_2192)
                          (if %_2192 %_2192 (memq 'r %_2189)))
                        (memq 'l %_2189))
                     (%_2191)
                     (%_1366))))
               (if (memq 'c %_2189)
                 ((lambda (%_2194)
                    (begin (%_1006 %_2194) (lambda () %_2194)))
                  (%_2190))
                 %_2190)))))
        (set! %_1349
          (lambda (%_2195 %_2196)
            (apply append
                   (map (lambda (%_2197)
                          (if %_2196
                            ((lambda (%_2199)
                               (if (memv %_2199 '(compile))
                                 '(c)
                                 (if (memv %_2199 '(load))
                                   '(l)
                                   (if (memv %_2199 '(visit))
                                     '(v)
                                     (if (memv %_2199 '(revisit)) '(r) '())))))
                             %_2197)
                            ((lambda (%_2198)
                               (if (memv %_2198 '(eval)) '(e) '()))
                             %_2197)))
                        %_2195))))
        (set! %_1348
          ((lambda (%_2200)
             (lambda (%_2201 %_2202)
               (remq '-
                     (apply append
                            (map (lambda (%_2203)
                                   ((lambda (%_2204)
                                      (map (lambda (%_2205)
                                             (cdr (assq %_2205 %_2204)))
                                           %_2201))
                                    (cdr (assq %_2203 %_2200))))
                                 %_2202)))))
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
        (set! %_1347
          (lambda (%_2206 %_2207)
            (list '$sc-put-cte
                  (list 'quote %_2206)
                  (list 'quote (%_1156 'do-import %_2207)))))
        (set! %_1346
          (lambda (%_2208 %_2209)
            ((lambda (%_2210)
               (((lambda (%_2211)
                   (begin
                     (set! %_2211
                       (lambda (%_2212)
                         (if (not (= %_2212 %_2210))
                           (begin
                             (%_2208 (vector-ref %_2209 %_2212))
                             (%_2211 (+ %_2212 '1)))
                           (void))))
                     %_2211))
                 #f)
                '0))
             (vector-length %_2209))))
        (set! %_1345
          (lambda (%_2213 %_2214)
            (((lambda (%_2215)
                (begin
                  (set! %_2215
                    (lambda (%_2216 %_2217)
                      (if (< %_2216 '0)
                        %_2217
                        (%_2215
                          (- %_2216 '1)
                          (cons (%_2213 (vector-ref %_2214 %_2216)) %_2217)))))
                  %_2215))
              #f)
             (- (vector-length %_2214) '1)
             '())))
        (set! %_1344
          (lambda (%_2218
                   %_2219
                   %_2220
                   %_2221
                   %_2222
                   %_2223
                   %_2224
                   %_2225
                   %_2226)
            ((lambda (%_2229 %_2228 %_2227)
               (begin
                 (set! %_2229
                   (lambda (%_2296 %_2297)
                     ((lambda (%_2298)
                        (map (lambda (%_2299)
                               ((lambda (%_2300)
                                  (if (not (%_1309 %_2300 %_2298))
                                    %_2299
                                    (%_1327
                                      (%_1329 %_2299)
                                      %_2300
                                      (%_1331 %_2299)
                                      (append (%_2228 %_2300) (%_1332 %_2299))
                                      (%_1333 %_2299))))
                                (%_1330 %_2299)))
                             %_2296))
                      (map (lambda (%_2301)
                             (if (pair? %_2301) (car %_2301) %_2301))
                           %_2297))))
                 (set! %_2228
                   (lambda (%_2302)
                     (((lambda (%_2303)
                         (begin
                           (set! %_2303
                             (lambda (%_2304)
                               (if (null? %_2304)
                                 '()
                                 (if (if (pair? (car %_2304))
                                       (%_1305 %_2302 (caar %_2304))
                                       '#f)
                                   (%_1318 (cdar %_2304))
                                   (%_2303 (cdr %_2304))))))
                           %_2303))
                       #f)
                      %_2222)))
                 (set! %_2227
                   (lambda (%_2305 %_2306 %_2307)
                     (begin
                       (%_1343 %_2219 %_2306)
                       (%_1342 %_2219 %_2223 %_2306)
                       (%_2226 %_2305 %_2307))))
                 (((lambda (%_2230)
                     (begin
                       (set! %_2230
                         (lambda (%_2231 %_2232 %_2233 %_2234)
                           (if (null? %_2231)
                             (%_2227 %_2233 %_2232 %_2234)
                             ((lambda (%_2235 %_2236)
                                (call-with-values
                                  (lambda ()
                                    (%_1315 %_2235 %_2236 '(()) '#f %_2218))
                                  (lambda (%_2237 %_2238 %_2239 %_2240 %_2241)
                                    ((lambda (%_2242)
                                       (if (memv %_2242 '(define-form))
                                         (%_1362
                                           %_2239
                                           %_2240
                                           %_2241
                                           (lambda (%_2290 %_2291 %_2292)
                                             ((lambda (%_2293)
                                                ((lambda (%_2294)
                                                   ((lambda (%_2295)
                                                      ((lambda ()
                                                         (begin
                                                           (%_1288
                                                             %_2218
                                                             %_2293
                                                             %_2294)
                                                           (%_2230
                                                             (cdr %_2231)
                                                             (cons %_2293
                                                                   %_2232)
                                                             (cons (%_1327
                                                                     %_2237
                                                                     %_2293
                                                                     %_2294
                                                                     %_2295
                                                                     (cons %_2236
                                                                           (%_1310
                                                                             %_2291
                                                                             %_2292)))
                                                                   %_2233)
                                                             %_2234)))))
                                                    (%_2228 %_2293)))
                                                 (%_1225)))
                                              (%_1310 %_2290 %_2292))))
                                         (if (memv %_2242
                                                   '(define-syntax-form))
                                           (%_1363
                                             %_2239
                                             %_2240
                                             %_2241
                                             (lambda (%_2283 %_2284 %_2285)
                                               ((lambda (%_2286)
                                                  ((lambda (%_2287)
                                                     ((lambda (%_2288)
                                                        ((lambda (%_2289)
                                                           ((lambda ()
                                                              (begin
                                                                (%_1341
                                                                  %_2221
                                                                  (%_1227
                                                                    %_2287)
                                                                  (cons 'deferred
                                                                        %_2289))
                                                                (%_1288
                                                                  %_2218
                                                                  %_2286
                                                                  %_2287)
                                                                (%_2230
                                                                  (cdr %_2231)
                                                                  (cons %_2286
                                                                        %_2232)
                                                                  (cons (%_1327
                                                                          %_2237
                                                                          %_2286
                                                                          %_2287
                                                                          %_2288
                                                                          %_2289)
                                                                        %_2233)
                                                                  %_2234)))))
                                                         (%_1352
                                                           %_2284
                                                           (%_1174 %_2236)
                                                           %_2285)))
                                                      (%_2228 %_2286)))
                                                   (%_1225)))
                                                (%_1310 %_2283 %_2285))))
                                           (if (memv %_2242 '(module-form))
                                             ((lambda (%_2270)
                                                ((lambda (%_2271)
                                                   ((lambda ()
                                                      (%_1360
                                                        %_2239
                                                        %_2240
                                                        %_2241
                                                        %_2271
                                                        (lambda (%_2272
                                                                 %_2273
                                                                 %_2274)
                                                          (%_1344
                                                            %_2270
                                                            (%_1311
                                                              %_2239
                                                              %_2240
                                                              %_2241)
                                                            (map (lambda (%_2275)
                                                                   (cons %_2236
                                                                         %_2275))
                                                                 %_2274)
                                                            %_2221
                                                            %_2273
                                                            (%_1318 %_2273)
                                                            %_2224
                                                            %_2225
                                                            (lambda (%_2276
                                                                     %_2277)
                                                              ((lambda (%_2278)
                                                                 ((lambda (%_2279)
                                                                    ((lambda (%_2280)
                                                                       ((lambda ()
                                                                          (if %_2272
                                                                            ((lambda (%_2281
                                                                                      %_2282)
                                                                               (begin
                                                                                 (%_1341
                                                                                   %_2221
                                                                                   (%_1227
                                                                                     %_2281)
                                                                                   (%_1156
                                                                                     'module
                                                                                     %_2278))
                                                                                 (%_1288
                                                                                   %_2218
                                                                                   %_2272
                                                                                   %_2281)
                                                                                 (%_2230
                                                                                   (cdr %_2231)
                                                                                   (cons %_2272
                                                                                         %_2232)
                                                                                   (cons (%_1327
                                                                                           %_2237
                                                                                           %_2272
                                                                                           %_2281
                                                                                           %_2282
                                                                                           %_2273)
                                                                                         %_2279)
                                                                                   %_2280)))
                                                                             (%_1225)
                                                                             (%_2228
                                                                               %_2272))
                                                                            ((lambda ()
                                                                               (begin
                                                                                 (%_1359
                                                                                   %_2278
                                                                                   %_2218)
                                                                                 (%_2230
                                                                                   (cdr %_2231)
                                                                                   (cons %_2278
                                                                                         %_2232)
                                                                                   %_2279
                                                                                   %_2280))))))))
                                                                     (append
                                                                       %_2234
                                                                       %_2277)))
                                                                  (append
                                                                    (if %_2272
                                                                      %_2276
                                                                      (%_2229
                                                                        %_2276
                                                                        %_2273))
                                                                    %_2233)))
                                                               (%_1325
                                                                 %_2273)))))))))
                                                 (%_1188
                                                   (%_1189 %_2240)
                                                   (cons %_2270
                                                         (%_1190 %_2240)))))
                                              (%_1229 '() '() '()))
                                             (if (memv %_2242 '(import-form))
                                               (%_1361
                                                 %_2239
                                                 %_2240
                                                 %_2241
                                                 (lambda (%_2265)
                                                   ((lambda (%_2266)
                                                      ((lambda (%_2267)
                                                         ((lambda (%_2268)
                                                            (if (memv %_2268
                                                                      '(module))
                                                              ((lambda (%_2269)
                                                                 (begin
                                                                   (if %_2238
                                                                     (%_1289
                                                                       %_2218
                                                                       %_2238)
                                                                     (void))
                                                                   (%_1359
                                                                     %_2269
                                                                     %_2218)
                                                                   (%_2230
                                                                     (cdr %_2231)
                                                                     (cons %_2269
                                                                           %_2232)
                                                                     (%_2229
                                                                       %_2233
                                                                       (vector->list
                                                                         (%_1321
                                                                           %_2269)))
                                                                     %_2234)))
                                                               (%_1158 %_2267))
                                                              (if (memv %_2268
                                                                        '(displaced-lexical))
                                                                (%_1175 %_2265)
                                                                (syntax-error
                                                                  %_2265
                                                                  '"import from unknown module"))))
                                                          (%_1157 %_2267)))
                                                       (%_1178 %_2266 %_2221)))
                                                    (%_1302 %_2265 '(())))))
                                               (if (memv %_2242 '(begin-form))
                                                 ((lambda (%_2258)
                                                    ((lambda (%_2259)
                                                       (if %_2259
                                                         (apply (lambda (%_2260
                                                                         %_2261)
                                                                  (%_2230
                                                                    (((lambda (%_2262)
                                                                        (begin
                                                                          (set! %_2262
                                                                            (lambda (%_2263)
                                                                              (if (null? %_2263)
                                                                                (cdr %_2231)
                                                                                (cons (cons %_2236
                                                                                            (%_1310
                                                                                              (car %_2263)
                                                                                              %_2240))
                                                                                      (%_2262
                                                                                        (cdr %_2263))))))
                                                                          %_2262))
                                                                      #f)
                                                                     %_2261)
                                                                    %_2232
                                                                    %_2233
                                                                    %_2234))
                                                                %_2259)
                                                         (syntax-error
                                                           %_2258)))
                                                     ($syntax-dispatch
                                                       %_2258
                                                       '(any . each-any))))
                                                  %_2239)
                                                 (if (memv %_2242
                                                           '(eval-when-form))
                                                   ((lambda (%_2249)
                                                      ((lambda (%_2250)
                                                         (if %_2250
                                                           (apply (lambda (%_2251
                                                                           %_2252
                                                                           %_2253)
                                                                    (%_2230
                                                                      (if (memq 'eval
                                                                                (%_1314
                                                                                  %_2252
                                                                                  %_2240))
                                                                        (((lambda (%_2254)
                                                                            (begin
                                                                              (set! %_2254
                                                                                (lambda (%_2255)
                                                                                  (if (null? %_2255)
                                                                                    (cdr %_2231)
                                                                                    (cons (cons %_2236
                                                                                                (%_1310
                                                                                                  (car %_2255)
                                                                                                  %_2240))
                                                                                          (%_2254
                                                                                            (cdr %_2255))))))
                                                                              %_2254))
                                                                          #f)
                                                                         %_2253)
                                                                        (cdr %_2231))
                                                                      %_2232
                                                                      %_2233
                                                                      %_2234))
                                                                  %_2250)
                                                           (syntax-error
                                                             %_2249)))
                                                       ($syntax-dispatch
                                                         %_2249
                                                         '(any each-any
                                                               .
                                                               each-any))))
                                                    %_2239)
                                                   (if (memv %_2242
                                                             '(local-syntax-form))
                                                     (%_1365
                                                       %_2238
                                                       %_2239
                                                       %_2236
                                                       %_2240
                                                       %_2241
                                                       (lambda (%_2243
                                                                %_2244
                                                                %_2245
                                                                %_2246)
                                                         (%_2230
                                                           (((lambda (%_2247)
                                                               (begin
                                                                 (set! %_2247
                                                                   (lambda (%_2248)
                                                                     (if (null? %_2248)
                                                                       (cdr %_2231)
                                                                       (cons (cons %_2244
                                                                                   (%_1310
                                                                                     (car %_2248)
                                                                                     %_2245))
                                                                             (%_2247
                                                                               (cdr %_2248))))))
                                                                 %_2247))
                                                             #f)
                                                            %_2243)
                                                           %_2232
                                                           %_2233
                                                           %_2234)))
                                                     (%_2227
                                                       %_2233
                                                       %_2232
                                                       (append
                                                         %_2234
                                                         (cons (cons %_2236
                                                                     (%_1311
                                                                       %_2239
                                                                       %_2240
                                                                       %_2241))
                                                               (cdr %_2231))))))))))))
                                     %_2237))))
                              (cdar %_2231)
                              (caar %_2231)))))
                       %_2230))
                   #f)
                  %_2220
                  '()
                  '()
                  '())))
             #f
             #f
             #f)))
        (set! %_1343
          (lambda (%_2308 %_2309)
            ((lambda (%_2313 %_2312 %_2311 %_2310)
               (begin
                 (set! %_2313
                   (lambda (%_2322 %_2323 %_2324)
                     ((lambda (%_2325)
                        (if %_2325
                          (if (%_1292
                                ((lambda (%_2328)
                                   ((lambda (%_2329)
                                      (if (annotation? %_2329)
                                        (annotation-expression %_2329)
                                        %_2329))
                                    (if (%_1129 %_2328)
                                      (%_1130 %_2328)
                                      %_2328)))
                                 %_2322)
                                %_2325
                                (if (symbol? %_2322)
                                  (%_1189 '((top)))
                                  (%_1189 (%_1131 %_2322))))
                            (cons %_2322 %_2324)
                            %_2324)
                          (%_2311
                            (%_1321 %_2323)
                            (lambda (%_2326 %_2327)
                              (if (%_2310 %_2326 %_2322)
                                (cons %_2326 %_2327)
                                %_2327))
                            %_2324)))
                      (%_1322 %_2323))))
                 (set! %_2312
                   (lambda (%_2330 %_2331 %_2332)
                     (if (%_1320 %_2330)
                       (if (%_1320 %_2331)
                         (call-with-values
                           (lambda ()
                             ((lambda (%_2333 %_2334)
                                (if (fx> (vector-length %_2333)
                                         (vector-length %_2334))
                                  (values %_2330 %_2334)
                                  (values %_2331 %_2333)))
                              (%_1321 %_2330)
                              (%_1321 %_2331)))
                           (lambda (%_2335 %_2336)
                             (%_2311
                               %_2336
                               (lambda (%_2337 %_2338)
                                 (%_2313 %_2337 %_2335 %_2338))
                               %_2332)))
                         (%_2313 %_2331 %_2330 %_2332))
                       (if (%_1320 %_2331)
                         (%_2313 %_2330 %_2331 %_2332)
                         (if (%_2310 %_2330 %_2331)
                           (cons %_2330 %_2332)
                           %_2332)))))
                 (set! %_2311
                   (lambda (%_2339 %_2340 %_2341)
                     ((lambda (%_2342)
                        (((lambda (%_2343)
                            (begin
                              (set! %_2343
                                (lambda (%_2344 %_2345)
                                  (if (= %_2344 %_2342)
                                    %_2345
                                    (%_2343
                                      (+ %_2344 '1)
                                      (%_2340
                                        (vector-ref %_2339 %_2344)
                                        %_2345)))))
                              %_2343))
                          #f)
                         '0
                         %_2341))
                      (vector-length %_2339))))
                 (set! %_2310
                   (lambda (%_2346 %_2347)
                     (if (symbol? %_2346)
                       (if (symbol? %_2347)
                         (eq? %_2346 %_2347)
                         (if (eq? %_2346
                                  ((lambda (%_2350)
                                     ((lambda (%_2351)
                                        (if (annotation? %_2351)
                                          (annotation-expression %_2351)
                                          %_2351))
                                      (if (%_1129 %_2350)
                                        (%_1130 %_2350)
                                        %_2350)))
                                   %_2347))
                           (%_1298
                             (%_1189 (%_1131 %_2347))
                             (%_1189 '((top))))
                           '#f))
                       (if (symbol? %_2347)
                         (if (eq? %_2347
                                  ((lambda (%_2348)
                                     ((lambda (%_2349)
                                        (if (annotation? %_2349)
                                          (annotation-expression %_2349)
                                          %_2349))
                                      (if (%_1129 %_2348)
                                        (%_1130 %_2348)
                                        %_2348)))
                                   %_2346))
                           (%_1298
                             (%_1189 (%_1131 %_2346))
                             (%_1189 '((top))))
                           '#f)
                         (%_1305 %_2346 %_2347)))))
                 (if (not (null? %_2309))
                   (((lambda (%_2314)
                       (begin
                         (set! %_2314
                           (lambda (%_2315 %_2316 %_2317)
                             (if (null? %_2316)
                               (if (not (null? %_2317))
                                 ((lambda (%_2321)
                                    (syntax-error
                                      %_2308
                                      '"duplicate definition for "
                                      (symbol->string (car %_2321))
                                      '" in"))
                                  (syntax-object->datum %_2317))
                                 (void))
                               (((lambda (%_2318)
                                   (begin
                                     (set! %_2318
                                       (lambda (%_2319 %_2320)
                                         (if (null? %_2319)
                                           (%_2314
                                             (car %_2316)
                                             (cdr %_2316)
                                             %_2320)
                                           (%_2318
                                             (cdr %_2319)
                                             (%_2312
                                               %_2315
                                               (car %_2319)
                                               %_2320)))))
                                     %_2318))
                                 #f)
                                %_2316
                                %_2317))))
                         %_2314))
                     #f)
                    (car %_2309)
                    (cdr %_2309)
                    '())
                   (void))))
             #f
             #f
             #f
             #f)))
        (set! %_1342
          (lambda (%_2352 %_2353 %_2354)
            ((lambda (%_2355)
               (begin
                 (set! %_2355
                   (lambda (%_2361 %_2362)
                     (ormap (lambda (%_2363)
                              (if (%_1320 %_2363)
                                ((lambda (%_2364)
                                   (if %_2364
                                     (%_1292
                                       ((lambda (%_2369)
                                          ((lambda (%_2370)
                                             (if (annotation? %_2370)
                                               (annotation-expression %_2370)
                                               %_2370))
                                           (if (%_1129 %_2369)
                                             (%_1130 %_2369)
                                             %_2369)))
                                        %_2361)
                                       %_2364
                                       (%_1189 (%_1131 %_2361)))
                                     ((lambda (%_2365)
                                        (((lambda (%_2366)
                                            (begin
                                              (set! %_2366
                                                (lambda (%_2367)
                                                  (if (fx>= %_2367 '0)
                                                    ((lambda (%_2368)
                                                       (if %_2368
                                                         %_2368
                                                         (%_2366
                                                           (- %_2367 '1))))
                                                     (%_1305
                                                       %_2361
                                                       (vector-ref
                                                         %_2365
                                                         %_2367)))
                                                    '#f)))
                                              %_2366))
                                          #f)
                                         (- (vector-length %_2365) '1)))
                                      (%_1321 %_2363))))
                                 (%_1322 %_2363))
                                (%_1305 %_2361 %_2363)))
                            %_2362)))
                 (((lambda (%_2356)
                     (begin
                       (set! %_2356
                         (lambda (%_2357 %_2358)
                           (if (null? %_2357)
                             (if (not (null? %_2358))
                               (syntax-error
                                 %_2358
                                 '"missing definition for export(s)")
                               (void))
                             ((lambda (%_2359 %_2360)
                                (if (%_2355 %_2359 %_2354)
                                  (%_2356 %_2360 %_2358)
                                  (%_2356 %_2360 (cons %_2359 %_2358))))
                              (car %_2357)
                              (cdr %_2357)))))
                       %_2356))
                   #f)
                  %_2353
                  '())))
             #f)))
        (set! %_1341
          (lambda (%_2371 %_2372 %_2373)
            (set-cdr!
              %_2371
              (%_1171 %_2372 %_2373 (cdr %_2371)))))
        (set! %_1340
          (lambda (%_2374 %_2375)
            (if (null? %_2374)
              '()
              (if (%_1309 (car %_2374) %_2375)
                (%_1340 (cdr %_2374) %_2375)
                (cons (car %_2374) (%_1340 (cdr %_2374) %_2375))))))
        (set! %_1339
          (lambda (%_2376
                   %_2377
                   %_2378
                   %_2379
                   %_2380
                   %_2381
                   %_2382
                   %_2383
                   %_2384
                   %_2385)
            ((lambda (%_2386)
               (%_1344
                 %_2378
                 (%_1311 %_2376 %_2379 %_2380)
                 (map (lambda (%_2387) (cons %_2377 %_2387))
                      %_2385)
                 %_2377
                 %_2384
                 %_2386
                 %_2381
                 %_2382
                 (lambda (%_2388 %_2389)
                   (((lambda (%_2390)
                       (begin
                         (set! %_2390
                           (lambda (%_2391 %_2392 %_2393 %_2394 %_2395)
                             (if (null? %_2391)
                               (((lambda (%_2417)
                                   (begin
                                     (set! %_2417
                                       (lambda (%_2418 %_2419 %_2420)
                                         (if (null? %_2418)
                                           ((lambda (%_2424 %_2425 %_2426)
                                              (begin
                                                (for-each
                                                  (lambda (%_2427)
                                                    (apply (lambda (%_2428
                                                                    %_2429
                                                                    %_2430
                                                                    %_2431)
                                                             (if %_2429
                                                               (%_1228
                                                                 %_2429
                                                                 %_2430)
                                                               (void)))
                                                           %_2427))
                                                  %_2395)
                                                (%_1115
                                                  '#f
                                                  (list (%_1351
                                                          %_2381
                                                          (lambda ()
                                                            (if (null? %_2395)
                                                              (%_1366)
                                                              (%_1115
                                                                '#f
                                                                (map (lambda (%_2432)
                                                                       (apply (lambda (%_2433
                                                                                       %_2434
                                                                                       %_2435
                                                                                       %_2436)
                                                                                (list '$sc-put-cte
                                                                                      (list 'quote
                                                                                            %_2435)
                                                                                      (if (eq? %_2433
                                                                                               'define-syntax-form)
                                                                                        %_2436
                                                                                        (list 'quote
                                                                                              (%_1156
                                                                                                'module
                                                                                                (%_1326
                                                                                                  %_2436
                                                                                                  %_2435))))))
                                                                              %_2432))
                                                                     %_2395)))))
                                                        (%_1351
                                                          %_2381
                                                          (lambda ()
                                                            ((lambda (%_2437)
                                                               ((lambda (%_2438)
                                                                  ((lambda (%_2439)
                                                                     ((lambda ()
                                                                        (if %_2437
                                                                          (list '$sc-put-cte
                                                                                (list 'quote
                                                                                      (if (%_1298
                                                                                            (%_1189
                                                                                              (%_1131
                                                                                                %_2383))
                                                                                            (%_1189
                                                                                              '((top))))
                                                                                        %_2437
                                                                                        ((lambda (%_2441)
                                                                                           (%_1128
                                                                                             %_2437
                                                                                             (%_1188
                                                                                               %_2441
                                                                                               (list (%_1229
                                                                                                       (vector
                                                                                                         %_2437)
                                                                                                       (vector
                                                                                                         %_2441)
                                                                                                       (vector
                                                                                                         (%_1016
                                                                                                           %_2437)))))))
                                                                                         (%_1189
                                                                                           (%_1131
                                                                                             %_2383)))))
                                                                                %_2439)
                                                                          ((lambda (%_2440)
                                                                             (%_1115
                                                                               '#f
                                                                               (list (list '$sc-put-cte
                                                                                           (list 'quote
                                                                                                 %_2440)
                                                                                           %_2439)
                                                                                     (%_1347
                                                                                       %_2440
                                                                                       %_2438))))
                                                                           (%_1016
                                                                             'tmp))))))
                                                                   (list 'quote
                                                                         (%_1156
                                                                           'module
                                                                           (%_1326
                                                                             %_2384
                                                                             %_2438)))))
                                                                (%_1016
                                                                  %_2437)))
                                                             (if %_2383
                                                               ((lambda (%_2442)
                                                                  ((lambda (%_2443)
                                                                     (if (annotation?
                                                                           %_2443)
                                                                       (annotation-expression
                                                                         %_2443)
                                                                       %_2443))
                                                                   (if (%_1129
                                                                         %_2442)
                                                                     (%_1130
                                                                       %_2442)
                                                                     %_2442)))
                                                                %_2383)
                                                               '#f))))
                                                        (if (null? %_2393)
                                                          (%_1366)
                                                          (%_1115
                                                            '#f
                                                            (map (lambda (%_2444)
                                                                   (if '#f
                                                                     (list 'make-annotation
                                                                           (list 'define
                                                                                 %_2444
                                                                                 (%_1366))
                                                                           '#f)
                                                                     (list 'define
                                                                           %_2444
                                                                           (%_1366))))
                                                                 %_2393)))
                                                        (%_1116
                                                          '#f
                                                          %_2419
                                                          %_2425
                                                          (%_1115
                                                            '#f
                                                            (list (if (null? %_2393)
                                                                    (%_1366)
                                                                    (%_1115
                                                                      '#f
                                                                      (map (lambda (%_2445
                                                                                    %_2446)
                                                                             (if '#f
                                                                               (list 'make-annotation
                                                                                     (list 'set!
                                                                                           %_2445
                                                                                           %_2446)
                                                                                     '#f)
                                                                               (list 'set!
                                                                                     %_2445
                                                                                     %_2446)))
                                                                           %_2393
                                                                           %_2424)))
                                                                  (if (null? %_2426)
                                                                    (%_1366)
                                                                    (%_1115
                                                                      '#f
                                                                      %_2426)))))
                                                        (%_1366)))))
                                            (map (lambda (%_2447)
                                                   (%_1352
                                                     (cdr %_2447)
                                                     (car %_2447)
                                                     '(())))
                                                 %_2394)
                                            (map (lambda (%_2448)
                                                   (%_1352
                                                     (cdr %_2448)
                                                     (car %_2448)
                                                     '(())))
                                                 %_2420)
                                            (map (lambda (%_2449)
                                                   (%_1352
                                                     (cdr %_2449)
                                                     (car %_2449)
                                                     '(())))
                                                 %_2389))
                                           ((lambda (%_2421)
                                              ((lambda (%_2422)
                                                 (if (memv %_2422
                                                           '(define-form))
                                                   ((lambda (%_2423)
                                                      (begin
                                                        (%_1341
                                                          %_2377
                                                          (%_1227
                                                            (%_1331 %_2421))
                                                          (%_1156
                                                            'lexical
                                                            %_2423))
                                                        (%_2417
                                                          (cdr %_2418)
                                                          (cons %_2423 %_2419)
                                                          (cons (%_1333 %_2421)
                                                                %_2420))))
                                                    (%_1371 (%_1330 %_2421)))
                                                   (if (memv %_2422
                                                             '(define-syntax-form
                                                                module-form))
                                                     (%_2417
                                                       (cdr %_2418)
                                                       %_2419
                                                       %_2420)
                                                     (error 'sc-expand-internal
                                                            '"unexpected module binding type"))))
                                               (%_1329 %_2421)))
                                            (car %_2418)))))
                                     %_2417))
                                 #f)
                                %_2392
                                '()
                                '())
                               ((lambda (%_2396 %_2397)
                                  ((lambda (%_2398)
                                     (begin
                                       (set! %_2398
                                         (lambda (%_2410 %_2411 %_2412 %_2413)
                                           (((lambda (%_2414)
                                               (begin
                                                 (set! %_2414
                                                   (lambda (%_2415 %_2416)
                                                     (if (null? %_2415)
                                                       (%_2413)
                                                       (if (%_1305
                                                             (%_1330
                                                               (car %_2415))
                                                             %_2410)
                                                         (%_2412
                                                           (car %_2415)
                                                           (%_1295
                                                             (reverse %_2416)
                                                             (cdr %_2415)))
                                                         (%_2414
                                                           (cdr %_2415)
                                                           (cons (car %_2415)
                                                                 %_2416))))))
                                                 %_2414))
                                             #f)
                                            %_2411
                                            '())))
                                       (%_2398
                                         %_2396
                                         %_2392
                                         (lambda (%_2399 %_2400)
                                           ((lambda (%_2401 %_2402 %_2403)
                                              ((lambda (%_2404 %_2405)
                                                 ((lambda (%_2406)
                                                    (if (memv %_2406
                                                              '(define-form))
                                                      (begin
                                                        (%_1228 %_2402 %_2405)
                                                        (%_2390
                                                          %_2404
                                                          %_2400
                                                          (cons %_2405 %_2393)
                                                          (cons (%_1333 %_2399)
                                                                %_2394)
                                                          %_2395))
                                                      (if (memv %_2406
                                                                '(define-syntax-form))
                                                        (%_2390
                                                          %_2404
                                                          %_2400
                                                          %_2393
                                                          %_2394
                                                          (cons (list %_2401
                                                                      %_2402
                                                                      %_2405
                                                                      (%_1333
                                                                        %_2399))
                                                                %_2395))
                                                        (if (memv %_2406
                                                                  '(module-form))
                                                          ((lambda (%_2407)
                                                             (%_2390
                                                               (append
                                                                 (%_1318
                                                                   %_2407)
                                                                 %_2404)
                                                               %_2400
                                                               %_2393
                                                               %_2394
                                                               (cons (list %_2401
                                                                           %_2402
                                                                           %_2405
                                                                           %_2407)
                                                                     %_2395)))
                                                           (%_1333 %_2399))
                                                          (error 'sc-expand-internal
                                                                 '"unexpected module binding type")))))
                                                  %_2401))
                                               (append %_2403 %_2397)
                                               (%_1016
                                                 ((lambda (%_2408)
                                                    ((lambda (%_2409)
                                                       (if (annotation? %_2409)
                                                         (annotation-expression
                                                           %_2409)
                                                         %_2409))
                                                     (if (%_1129 %_2408)
                                                       (%_1130 %_2408)
                                                       %_2408)))
                                                  %_2396))))
                                            (%_1329 %_2399)
                                            (%_1331 %_2399)
                                            (%_1332 %_2399)))
                                         (lambda ()
                                           (%_2390
                                             %_2397
                                             %_2392
                                             %_2393
                                             %_2394
                                             %_2395)))))
                                   #f))
                                (car %_2391)
                                (cdr %_2391)))))
                         %_2390))
                     #f)
                    %_2386
                    %_2388
                    '()
                    '()
                    '()))))
             (%_1318 %_2384))))
        (set! %_1338
          (lambda (%_2450 %_2451)
            (vector-set! %_2450 '5 %_2451)))
        (set! %_1337
          (lambda (%_2452 %_2453)
            (vector-set! %_2452 '4 %_2453)))
        (set! %_1336
          (lambda (%_2454 %_2455)
            (vector-set! %_2454 '3 %_2455)))
        (set! %_1335
          (lambda (%_2456 %_2457)
            (vector-set! %_2456 '2 %_2457)))
        (set! %_1334
          (lambda (%_2458 %_2459)
            (vector-set! %_2458 '1 %_2459)))
        (set! %_1333
          (lambda (%_2460) (vector-ref %_2460 '5)))
        (set! %_1332
          (lambda (%_2461) (vector-ref %_2461 '4)))
        (set! %_1331
          (lambda (%_2462) (vector-ref %_2462 '3)))
        (set! %_1330
          (lambda (%_2463) (vector-ref %_2463 '2)))
        (set! %_1329
          (lambda (%_2464) (vector-ref %_2464 '1)))
        (set! %_1328
          (lambda (%_2465)
            (if (vector? %_2465)
              (if (= (vector-length %_2465) '6)
                (eq? (vector-ref %_2465 '0) 'module-binding)
                '#f)
              '#f)))
        (set! %_1327
          (lambda (%_2466 %_2467 %_2468 %_2469 %_2470)
            (vector
              'module-binding
              %_2466
              %_2467
              %_2468
              %_2469
              %_2470)))
        (set! %_1326
          (lambda (%_2471 %_2472)
            (%_1319
              (list->vector
                (map (lambda (%_2473)
                       (%_1294 (if (pair? %_2473) (car %_2473) %_2473)))
                     %_2471))
              %_2472)))
        (set! %_1325
          (lambda (%_2474)
            (%_1319
              (list->vector
                (map (lambda (%_2475)
                       (if (pair? %_2475) (car %_2475) %_2475))
                     %_2474))
              '#f)))
        (set! %_1324
          (lambda (%_2476 %_2477)
            (vector-set! %_2476 '2 %_2477)))
        (set! %_1323
          (lambda (%_2478 %_2479)
            (vector-set! %_2478 '1 %_2479)))
        (set! %_1322
          (lambda (%_2480) (vector-ref %_2480 '2)))
        (set! %_1321
          (lambda (%_2481) (vector-ref %_2481 '1)))
        (set! %_1320
          (lambda (%_2482)
            (if (vector? %_2482)
              (if (= (vector-length %_2482) '3)
                (eq? (vector-ref %_2482 '0) 'interface)
                '#f)
              '#f)))
        (set! %_1319
          (lambda (%_2483 %_2484)
            (vector 'interface %_2483 %_2484)))
        (set! %_1318
          (lambda (%_2485)
            (((lambda (%_2486)
                (begin
                  (set! %_2486
                    (lambda (%_2487 %_2488)
                      (if (null? %_2487)
                        %_2488
                        (%_2486
                          (cdr %_2487)
                          (if (pair? (car %_2487))
                            (%_2486 (car %_2487) %_2488)
                            (cons (car %_2487) %_2488))))))
                  %_2486))
              #f)
             %_2485
             '())))
        (set! %_1317
          (lambda (%_2489 %_2490 %_2491 %_2492 %_2493 %_2494)
            (call-with-values
              (lambda ()
                (%_1315 %_2489 %_2490 %_2491 '#f %_2494))
              (lambda (%_2495 %_2496 %_2497 %_2498 %_2499)
                ((lambda (%_2500)
                   (if (memv %_2500 '(begin-form))
                     ((lambda (%_2551)
                        ((lambda (%_2552)
                           (if %_2552
                             (apply (lambda (%_2558) (%_1366)) %_2552)
                             ((lambda (%_2553)
                                (if %_2553
                                  (apply (lambda (%_2554 %_2555 %_2556)
                                           (%_1313
                                             (cons %_2555 %_2556)
                                             %_2490
                                             %_2498
                                             %_2499
                                             %_2492
                                             %_2493
                                             %_2494))
                                         %_2553)
                                  (syntax-error %_2551)))
                              ($syntax-dispatch
                                %_2551
                                '(any any . each-any)))))
                         ($syntax-dispatch %_2551 '(any))))
                      %_2497)
                     (if (memv %_2500 '(local-syntax-form))
                       (%_1365
                         %_2496
                         %_2497
                         %_2490
                         %_2498
                         %_2499
                         (lambda (%_2547 %_2548 %_2549 %_2550)
                           (%_1313
                             %_2547
                             %_2548
                             %_2549
                             %_2550
                             %_2492
                             %_2493
                             %_2494)))
                       (if (memv %_2500 '(eval-when-form))
                         ((lambda (%_2535)
                            ((lambda (%_2536)
                               (if %_2536
                                 (apply (lambda (%_2537 %_2538 %_2539 %_2540)
                                          ((lambda (%_2541 %_2542)
                                             ((lambda (%_2543 %_2544)
                                                (if (if (null? %_2543)
                                                      (null? %_2544)
                                                      '#f)
                                                  (%_1366)
                                                  (%_1313
                                                    %_2542
                                                    %_2490
                                                    %_2498
                                                    %_2499
                                                    %_2543
                                                    %_2544
                                                    %_2494)))
                                              (%_1348 %_2541 %_2492)
                                              (%_1348 %_2541 %_2493)))
                                           (%_1314 %_2538 %_2498)
                                           (cons %_2539 %_2540)))
                                        %_2536)
                                 (syntax-error %_2535)))
                             ($syntax-dispatch
                               %_2535
                               '(any each-any any . each-any))))
                          %_2497)
                         (if (memv %_2500 '(define-syntax-form))
                           (%_1363
                             %_2497
                             %_2498
                             %_2499
                             (lambda (%_2524 %_2525 %_2526)
                               ((lambda (%_2527)
                                  (begin
                                    ((lambda (%_2528)
                                       ((lambda (%_2529)
                                          ((lambda (%_2530)
                                             (if (memv %_2530
                                                       '(displaced-lexical))
                                               (%_1175 %_2527)
                                               (void)))
                                           (%_1157 %_2529)))
                                        (%_1178 %_2528 %_2490)))
                                     (%_1302 %_2527 '(())))
                                    (%_1351
                                      %_2492
                                      (lambda ()
                                        (list '$sc-put-cte
                                              (list 'quote
                                                    ((lambda (%_2531)
                                                       (if (%_1298
                                                             (%_1189
                                                               (%_1131 %_2527))
                                                             (%_1189 '((top))))
                                                         %_2531
                                                         ((lambda (%_2532)
                                                            (%_1128
                                                              %_2531
                                                              (%_1188
                                                                %_2532
                                                                (list (%_1229
                                                                        (vector
                                                                          %_2531)
                                                                        (vector
                                                                          %_2532)
                                                                        (vector
                                                                          (%_1016
                                                                            %_2531)))))))
                                                          (%_1189
                                                            (%_1131 %_2527)))))
                                                     ((lambda (%_2533)
                                                        ((lambda (%_2534)
                                                           (if (annotation?
                                                                 %_2534)
                                                             (annotation-expression
                                                               %_2534)
                                                             %_2534))
                                                         (if (%_1129 %_2533)
                                                           (%_1130 %_2533)
                                                           %_2533)))
                                                      %_2527)))
                                              (%_1352
                                                %_2525
                                                (%_1174 %_2490)
                                                %_2526))))))
                                (%_1310 %_2524 %_2526))))
                           (if (memv %_2500 '(define-form))
                             (%_1362
                               %_2497
                               %_2498
                               %_2499
                               (lambda (%_2512 %_2513 %_2514)
                                 ((lambda (%_2515)
                                    (begin
                                      ((lambda (%_2516)
                                         ((lambda (%_2517)
                                            ((lambda (%_2518)
                                               (if (memv %_2518
                                                         '(displaced-lexical))
                                                 (%_1175 %_2515)
                                                 (void)))
                                             (%_1157 %_2517)))
                                          (%_1178 %_2516 %_2490)))
                                       (%_1302 %_2515 '(())))
                                      ((lambda (%_2519)
                                         ((lambda (%_2520)
                                            (%_1115
                                              '#f
                                              (list (%_1351
                                                      %_2492
                                                      (lambda ()
                                                        (list '$sc-put-cte
                                                              (list 'quote
                                                                    (if (eq? %_2519
                                                                             %_2520)
                                                                      %_2519
                                                                      ((lambda (%_2521)
                                                                         (%_1128
                                                                           %_2519
                                                                           (%_1188
                                                                             %_2521
                                                                             (list (%_1229
                                                                                     (vector
                                                                                       %_2519)
                                                                                     (vector
                                                                                       %_2521)
                                                                                     (vector
                                                                                       %_2520))))))
                                                                       (%_1189
                                                                         (%_1131
                                                                           %_2515)))))
                                                              (list 'quote
                                                                    (%_1156
                                                                      'global
                                                                      %_2520)))))
                                                    (%_1350
                                                      %_2493
                                                      (lambda ()
                                                        (if %_2499
                                                          (list 'make-annotation
                                                                (list 'define
                                                                      %_2520
                                                                      (%_1352
                                                                        %_2513
                                                                        %_2490
                                                                        %_2514))
                                                                %_2499)
                                                          (list 'define
                                                                %_2520
                                                                (%_1352
                                                                  %_2513
                                                                  %_2490
                                                                  %_2514))))))))
                                          (if (%_1298
                                                (%_1189 (%_1131 %_2515))
                                                (%_1189 '((top))))
                                            %_2519
                                            (%_1016 %_2519))))
                                       ((lambda (%_2522)
                                          ((lambda (%_2523)
                                             (if (annotation? %_2523)
                                               (annotation-expression %_2523)
                                               %_2523))
                                           (if (%_1129 %_2522)
                                             (%_1130 %_2522)
                                             %_2522)))
                                        %_2515))))
                                  (%_1310 %_2512 %_2514))))
                             (if (memv %_2500 '(module-form))
                               ((lambda (%_2504 %_2505)
                                  (%_1360
                                    %_2497
                                    %_2498
                                    %_2499
                                    (%_1188
                                      (%_1189 %_2498)
                                      (cons %_2505 (%_1190 %_2498)))
                                    (lambda (%_2506 %_2507 %_2508)
                                      (if %_2506
                                        (begin
                                          ((lambda (%_2509)
                                             ((lambda (%_2510)
                                                ((lambda (%_2511)
                                                   (if (memv %_2511
                                                             '(displaced-lexical))
                                                     (%_1175
                                                       (%_1310 %_2506 %_2498))
                                                     (void)))
                                                 (%_1157 %_2510)))
                                              (%_1178 %_2509 %_2504)))
                                           (%_1302 %_2506 '(())))
                                          (%_1339
                                            %_2497
                                            %_2504
                                            %_2505
                                            %_2498
                                            %_2499
                                            %_2492
                                            %_2493
                                            %_2506
                                            %_2507
                                            %_2508))
                                        (%_1339
                                          %_2497
                                          %_2504
                                          %_2505
                                          %_2498
                                          %_2499
                                          %_2492
                                          %_2493
                                          '#f
                                          %_2507
                                          %_2508)))))
                                (cons '("top-level module placeholder"
                                        placeholder)
                                      %_2490)
                                (%_1229 '() '() '()))
                               (if (memv %_2500 '(import-form))
                                 (%_1361
                                   %_2497
                                   %_2498
                                   %_2499
                                   (lambda (%_2501)
                                     (%_1351
                                       %_2492
                                       (lambda ()
                                         (begin
                                           (if %_2496
                                             (syntax-error
                                               (%_1311 %_2497 %_2498 %_2499)
                                               '"not valid at top-level")
                                             (void))
                                           ((lambda (%_2502)
                                              ((lambda (%_2503)
                                                 (if (memv %_2503 '(module))
                                                   (%_1347
                                                     %_2501
                                                     (%_1322 (%_1158 %_2502)))
                                                   (if (memv %_2503
                                                             '(displaced-lexical))
                                                     (%_1175 %_2501)
                                                     (syntax-error
                                                       %_2501
                                                       '"import from unknown module"))))
                                               (%_1157 %_2502)))
                                            (%_1178
                                              (%_1302 %_2501 '(()))
                                              '())))))))
                                 (%_1350
                                   %_2493
                                   (lambda ()
                                     (%_1353
                                       %_2495
                                       %_2496
                                       %_2497
                                       %_2490
                                       %_2498
                                       %_2499)))))))))))
                 %_2495)))))
        (set! %_1316
          (lambda (%_2559 %_2560 %_2561 %_2562)
            (call-with-values
              (lambda ()
                (%_1315 %_2559 %_2560 %_2561 '#f %_2562))
              (lambda (%_2563 %_2564 %_2565 %_2566 %_2567)
                (%_1353
                  %_2563
                  %_2564
                  %_2565
                  %_2560
                  %_2566
                  %_2567)))))
        (set! %_1315
          (lambda (%_2568 %_2569 %_2570 %_2571 %_2572)
            (if (symbol? %_2568)
              ((lambda (%_2579)
                 ((lambda (%_2580)
                    ((lambda (%_2581)
                       ((lambda ()
                          ((lambda (%_2582)
                             (if (memv %_2582 '(lexical))
                               (values
                                 %_2581
                                 (%_1158 %_2580)
                                 %_2568
                                 %_2570
                                 %_2571)
                               (if (memv %_2582 '(global))
                                 (values
                                   %_2581
                                   (%_1158 %_2580)
                                   %_2568
                                   %_2570
                                   %_2571)
                                 (if (memv %_2582 '(macro macro!))
                                   (%_1315
                                     (%_1356
                                       (%_1158 %_2580)
                                       %_2568
                                       %_2569
                                       %_2570
                                       %_2571
                                       %_2572)
                                     %_2569
                                     '(())
                                     '#f
                                     %_2572)
                                   (values
                                     %_2581
                                     (%_1158 %_2580)
                                     %_2568
                                     %_2570
                                     %_2571)))))
                           %_2581))))
                     (%_1157 %_2580)))
                  (%_1178 %_2579 %_2569)))
               (%_1302 %_2568 %_2570))
              (if (pair? %_2568)
                ((lambda (%_2574)
                   (if (%_1181 %_2574)
                     ((lambda (%_2575)
                        ((lambda (%_2576)
                           ((lambda (%_2577)
                              ((lambda ()
                                 ((lambda (%_2578)
                                    (if (memv %_2578 '(lexical))
                                      (values
                                        'lexical-call
                                        (%_1158 %_2576)
                                        %_2568
                                        %_2570
                                        %_2571)
                                      (if (memv %_2578 '(macro macro!))
                                        (%_1315
                                          (%_1356
                                            (%_1158 %_2576)
                                            %_2568
                                            %_2569
                                            %_2570
                                            %_2571
                                            %_2572)
                                          %_2569
                                          '(())
                                          '#f
                                          %_2572)
                                        (if (memv %_2578 '(core))
                                          (values
                                            %_2577
                                            (%_1158 %_2576)
                                            %_2568
                                            %_2570
                                            %_2571)
                                          (if (memv %_2578 '(local-syntax))
                                            (values
                                              'local-syntax-form
                                              (%_1158 %_2576)
                                              %_2568
                                              %_2570
                                              %_2571)
                                            (if (memv %_2578 '(begin))
                                              (values
                                                'begin-form
                                                '#f
                                                %_2568
                                                %_2570
                                                %_2571)
                                              (if (memv %_2578 '(eval-when))
                                                (values
                                                  'eval-when-form
                                                  '#f
                                                  %_2568
                                                  %_2570
                                                  %_2571)
                                                (if (memv %_2578 '(define))
                                                  (values
                                                    'define-form
                                                    '#f
                                                    %_2568
                                                    %_2570
                                                    %_2571)
                                                  (if (memv %_2578
                                                            '(define-syntax))
                                                    (values
                                                      'define-syntax-form
                                                      '#f
                                                      %_2568
                                                      %_2570
                                                      %_2571)
                                                    (if (memv %_2578
                                                              '(module-key))
                                                      (values
                                                        'module-form
                                                        '#f
                                                        %_2568
                                                        %_2570
                                                        %_2571)
                                                      (if (memv %_2578
                                                                '(import))
                                                        (values
                                                          'import-form
                                                          (if (%_1158 %_2576)
                                                            (%_1310
                                                              %_2574
                                                              %_2570)
                                                            '#f)
                                                          %_2568
                                                          %_2570
                                                          %_2571)
                                                        (if (memv %_2578
                                                                  '(set!))
                                                          (%_1355
                                                            %_2568
                                                            %_2569
                                                            %_2570
                                                            %_2571
                                                            %_2572)
                                                          (values
                                                            'call
                                                            '#f
                                                            %_2568
                                                            %_2570
                                                            %_2571)))))))))))))
                                  %_2577))))
                            (%_1157 %_2576)))
                         (%_1178 %_2575 %_2569)))
                      (%_1302 %_2574 %_2570))
                     (values 'call '#f %_2568 %_2570 %_2571)))
                 (car %_2568))
                (if (%_1129 %_2568)
                  (%_1315
                    (%_1130 %_2568)
                    %_2569
                    (%_1296 %_2570 (%_1131 %_2568))
                    '#f
                    %_2572)
                  (if (annotation? %_2568)
                    (%_1315
                      (annotation-expression %_2568)
                      %_2569
                      %_2570
                      (annotation-source %_2568)
                      %_2572)
                    (if ((lambda (%_2573) (not (pair? %_2573))) %_2568)
                      (values 'constant '#f %_2568 %_2570 %_2571)
                      (values 'other '#f %_2568 %_2570 %_2571))))))))
        (set! %_1314
          (lambda (%_2583 %_2584)
            (map (lambda (%_2585)
                   (if (%_1304
                         %_2585
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
                                  "i"))
                              #4(ribcage ((import-token . *top*)) ())
                              #4(ribcage ((import-token . *top*)) ()))))
                     'compile
                     (if (%_1304
                           %_2585
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
                                    "i"))
                                #4(ribcage ((import-token . *top*)) ())
                                #4(ribcage ((import-token . *top*)) ()))))
                       'load
                       (if (%_1304
                             %_2585
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
                                      "i"))
                                  #4(ribcage ((import-token . *top*)) ())
                                  #4(ribcage ((import-token . *top*)) ()))))
                         'visit
                         (if (%_1304
                               %_2585
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
                                        "i"))
                                    #4(ribcage ((import-token . *top*)) ())
                                    #4(ribcage ((import-token . *top*)) ()))))
                           'revisit
                           (if (%_1304
                                 %_2585
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
                                          "i"))
                                      #4(ribcage ((import-token . *top*)) ())
                                      #4(ribcage
                                         ((import-token . *top*))
                                         ()
                                         ()))))
                             'eval
                             (syntax-error
                               (%_1310 %_2585 %_2584)
                               '"invalid eval-when situation")))))))
                 %_2583)))
        (set! %_1313
          (lambda (%_2586
                   %_2587
                   %_2588
                   %_2589
                   %_2590
                   %_2591
                   %_2592)
            (%_1115
              %_2589
              (((lambda (%_2593)
                  (begin
                    (set! %_2593
                      (lambda (%_2594 %_2595 %_2596 %_2597 %_2598)
                        (if (null? %_2594)
                          '()
                          ((lambda (%_2599)
                             (cons %_2599
                                   (%_2593
                                     (cdr %_2594)
                                     %_2595
                                     %_2596
                                     %_2597
                                     %_2598)))
                           (%_1317
                             (car %_2594)
                             %_2595
                             %_2596
                             %_2597
                             %_2598
                             %_2592)))))
                    %_2593))
                #f)
               %_2586
               %_2587
               %_2588
               %_2590
               %_2591))))
        (set! %_1312
          (lambda (%_2600 %_2601 %_2602 %_2603)
            (%_1115
              %_2603
              (((lambda (%_2604)
                  (begin
                    (set! %_2604
                      (lambda (%_2605 %_2606 %_2607)
                        (if (null? %_2605)
                          '()
                          ((lambda (%_2608)
                             (cons %_2608 (%_2604 (cdr %_2605) %_2606 %_2607)))
                           (%_1352 (car %_2605) %_2606 %_2607)))))
                    %_2604))
                #f)
               %_2600
               %_2601
               %_2602))))
        (set! %_1311
          (lambda (%_2609 %_2610 %_2611)
            (%_1310
              (if %_2611
                (make-annotation %_2609 %_2611 '#f)
                %_2609)
              %_2610)))
        (set! %_1310
          (lambda (%_2612 %_2613)
            (if (if (null? (%_1189 %_2613))
                  (null? (%_1190 %_2613))
                  '#f)
              %_2612
              (if (%_1129 %_2612)
                (%_1128
                  (%_1130 %_2612)
                  (%_1296 %_2613 (%_1131 %_2612)))
                (if (null? %_2612) %_2612 (%_1128 %_2612 %_2613))))))
        (set! %_1309
          (lambda (%_2614 %_2615)
            (if (not (null? %_2615))
              ((lambda (%_2616)
                 (if %_2616 %_2616 (%_1309 %_2614 (cdr %_2615))))
               (%_1305 %_2614 (car %_2615)))
              '#f)))
        (set! %_1308
          (lambda (%_2617 %_2618 %_2619)
            (((lambda (%_2620)
                (begin
                  (set! %_2620
                    (lambda (%_2621 %_2622)
                      (if (null? %_2621)
                        (syntax-error %_2618)
                        (if (%_1181 (car %_2621))
                          (if (%_1309 (car %_2621) %_2622)
                            (syntax-error (car %_2621) '"duplicate " %_2619)
                            (%_2620 (cdr %_2621) (cons (car %_2621) %_2622)))
                          (syntax-error (car %_2621) '"invalid " %_2619)))))
                  %_2620))
              #f)
             %_2617
             '())))
        (set! %_1307
          (lambda (%_2623)
            (((lambda (%_2624)
                (begin
                  (set! %_2624
                    (lambda (%_2625)
                      ((lambda (%_2626)
                         (if %_2626
                           %_2626
                           (if (not (%_1309 (car %_2625) (cdr %_2625)))
                             (%_2624 (cdr %_2625))
                             '#f)))
                       (null? %_2625))))
                  %_2624))
              #f)
             %_2623)))
        (set! %_1306
          (lambda (%_2627)
            (if (((lambda (%_2628)
                    (begin
                      (set! %_2628
                        (lambda (%_2629)
                          ((lambda (%_2630)
                             (if %_2630
                               %_2630
                               (if (%_1181 (car %_2629))
                                 (%_2628 (cdr %_2629))
                                 '#f)))
                           (null? %_2629))))
                      %_2628))
                  #f)
                 %_2627)
              (%_1307 %_2627)
              '#f)))
        (set! %_1305
          (lambda (%_2631 %_2632)
            (if (if (%_1129 %_2631) (%_1129 %_2632) '#f)
              (if (eq? ((lambda (%_2635)
                          (if (annotation? %_2635)
                            (annotation-expression %_2635)
                            %_2635))
                        (%_1130 %_2631))
                       ((lambda (%_2636)
                          (if (annotation? %_2636)
                            (annotation-expression %_2636)
                            %_2636))
                        (%_1130 %_2632)))
                (%_1298
                  (%_1189 (%_1131 %_2631))
                  (%_1189 (%_1131 %_2632)))
                '#f)
              (eq? ((lambda (%_2633)
                      (if (annotation? %_2633)
                        (annotation-expression %_2633)
                        %_2633))
                    %_2631)
                   ((lambda (%_2634)
                      (if (annotation? %_2634)
                        (annotation-expression %_2634)
                        %_2634))
                    %_2632)))))
        (set! %_1304
          (lambda (%_2637 %_2638)
            (if (eq? ((lambda (%_2644)
                        ((lambda (%_2645)
                           (if (annotation? %_2645)
                             (annotation-expression %_2645)
                             %_2645))
                         (if (%_1129 %_2644) (%_1130 %_2644) %_2644)))
                      %_2637)
                     ((lambda (%_2646)
                        ((lambda (%_2647)
                           (if (annotation? %_2647)
                             (annotation-expression %_2647)
                             %_2647))
                         (if (%_1129 %_2646) (%_1130 %_2646) %_2646)))
                      %_2638))
              ((lambda (%_2639 %_2640)
                 ((lambda (%_2641)
                    (if %_2641
                      %_2641
                      (if ((lambda (%_2643)
                             (if %_2643 %_2643 (symbol? %_2639)))
                           (not %_2639))
                        ((lambda (%_2642)
                           (if %_2642 %_2642 (symbol? %_2640)))
                         (not %_2640))
                        '#f)))
                  (eq? %_2639 %_2640)))
               (%_1302 %_2637 '(()))
               (%_1302 %_2638 '(())))
              '#f)))
        (set! %_1303
          (lambda (%_2648 %_2649)
            (if (eq? ((lambda (%_2650)
                        ((lambda (%_2651)
                           (if (annotation? %_2651)
                             (annotation-expression %_2651)
                             %_2651))
                         (if (%_1129 %_2650) (%_1130 %_2650) %_2650)))
                      %_2648)
                     ((lambda (%_2652)
                        ((lambda (%_2653)
                           (if (annotation? %_2653)
                             (annotation-expression %_2653)
                             %_2653))
                         (if (%_1129 %_2652) (%_1130 %_2652) %_2652)))
                      %_2649))
              (eq? (%_1302 %_2648 '(())) (%_1302 %_2649 '(())))
              '#f)))
        (set! %_1302
          (lambda (%_2654 %_2655)
            (call-with-values
              (lambda () (%_1299 %_2654 %_2655))
              (lambda (%_2656 %_2657)
                (if (%_1226 %_2656) (%_1227 %_2656) %_2656)))))
        (set! %_1301
          (lambda (%_2658 %_2659)
            (call-with-values
              (lambda () (%_1299 %_2658 %_2659))
              (lambda (%_2660 %_2661) %_2660))))
        (set! %_1300
          (lambda (%_2662 %_2663)
            (call-with-values
              (lambda () (%_1299 %_2662 %_2663))
              (lambda (%_2664 %_2665)
                (values
                  (if (%_1226 %_2664) (%_1227 %_2664) %_2664)
                  %_2665)))))
        (set! %_1299
          (lambda (%_2666 %_2667)
            ((lambda (%_2670 %_2669 %_2668)
               (begin
                 (set! %_2670
                   (lambda (%_2678 %_2679 %_2680 %_2681 %_2682)
                     ((lambda (%_2683)
                        (((lambda (%_2684)
                            (begin
                              (set! %_2684
                                (lambda (%_2685)
                                  (if (= %_2685 %_2683)
                                    (%_2668 %_2678 (cdr %_2679) %_2680)
                                    (if (if (eq? (vector-ref %_2681 %_2685)
                                                 %_2678)
                                          (%_1298
                                            %_2680
                                            (vector-ref
                                              (%_1232 %_2682)
                                              %_2685))
                                          '#f)
                                      (values
                                        (vector-ref (%_1233 %_2682) %_2685)
                                        %_2680)
                                      (%_2684 (+ %_2685 '1))))))
                              %_2684))
                          #f)
                         '0))
                      (vector-length %_2681))))
                 (set! %_2669
                   (lambda (%_2686 %_2687 %_2688 %_2689 %_2690)
                     (((lambda (%_2691)
                         (begin
                           (set! %_2691
                             (lambda (%_2692 %_2693)
                               (if (null? %_2692)
                                 (%_2668 %_2686 (cdr %_2687) %_2688)
                                 (if (if (eq? (car %_2692) %_2686)
                                       (%_1298
                                         %_2688
                                         (list-ref (%_1232 %_2690) %_2693))
                                       '#f)
                                   (values
                                     (list-ref (%_1233 %_2690) %_2693)
                                     %_2688)
                                   (if (%_1282 (car %_2692))
                                     ((lambda (%_2694)
                                        (if %_2694
                                          ((lambda (%_2695)
                                             (if (symbol? %_2695)
                                               (values %_2695 %_2688)
                                               (%_1300 %_2695 '(()))))
                                           %_2694)
                                          (%_2691 (cdr %_2692) %_2693)))
                                      (%_1292
                                        %_2686
                                        (%_1283 (car %_2692))
                                        %_2688))
                                     (if (if (eq? (car %_2692) %_1279)
                                           (%_1298
                                             %_2688
                                             (list-ref (%_1232 %_2690) %_2693))
                                           '#f)
                                       (values '#f %_2688)
                                       (%_2691
                                         (cdr %_2692)
                                         (+ %_2693 '1))))))))
                           %_2691))
                       #f)
                      %_2689
                      '0)))
                 (set! %_2668
                   (lambda (%_2696 %_2697 %_2698)
                     (if (null? %_2697)
                       (values %_2696 %_2698)
                       ((lambda (%_2699)
                          (if (eq? %_2699 'shift)
                            (%_2668 %_2696 (cdr %_2697) (cdr %_2698))
                            ((lambda (%_2700)
                               (if (vector? %_2700)
                                 (%_2670 %_2696 %_2697 %_2698 %_2700 %_2699)
                                 (%_2669 %_2696 %_2697 %_2698 %_2700 %_2699)))
                             (%_1231 %_2699))))
                        (car %_2697)))))
                 (if (symbol? %_2666)
                   (%_2668 %_2666 (%_1190 %_2667) (%_1189 %_2667))
                   (if (%_1129 %_2666)
                     ((lambda (%_2672 %_2673)
                        ((lambda (%_2674)
                           (call-with-values
                             (lambda ()
                               (%_2668 %_2672 (%_1190 %_2667) %_2674))
                             (lambda (%_2675 %_2676)
                               (if (eq? %_2675 %_2672)
                                 (%_2668 %_2672 (%_1190 %_2673) %_2676)
                                 (values %_2675 %_2676)))))
                         (%_1297 (%_1189 %_2667) (%_1189 %_2673))))
                      ((lambda (%_2677)
                         (if (annotation? %_2677)
                           (annotation-expression %_2677)
                           %_2677))
                       (%_1130 %_2666))
                      (%_1131 %_2666))
                     (if (annotation? %_2666)
                       (%_2668
                         ((lambda (%_2671)
                            (if (annotation? %_2671)
                              (annotation-expression %_2671)
                              %_2671))
                          %_2666)
                         (%_1190 %_2667)
                         (%_1189 %_2667))
                       (%_1008 'id-var-name '"invalid id" %_2666))))))
             #f
             #f
             #f)))
        (set! %_1298
          (lambda (%_2701 %_2702)
            ((lambda (%_2703)
               (if %_2703
                 %_2703
                 (if (not (null? %_2701))
                   (if (not (null? %_2702))
                     (if (eq? (car %_2701) (car %_2702))
                       (%_1298 (cdr %_2701) (cdr %_2702))
                       '#f)
                     '#f)
                   '#f)))
             (eq? %_2701 %_2702))))
        (set! %_1297
          (lambda (%_2704 %_2705) (%_1295 %_2704 %_2705)))
        (set! %_1296
          (lambda (%_2706 %_2707)
            ((lambda (%_2708 %_2709)
               (if (null? %_2708)
                 (if (null? %_2709)
                   %_2707
                   (%_1188
                     (%_1189 %_2707)
                     (%_1295 %_2709 (%_1190 %_2707))))
                 (%_1188
                   (%_1295 %_2708 (%_1189 %_2707))
                   (%_1295 %_2709 (%_1190 %_2707)))))
             (%_1189 %_2706)
             (%_1190 %_2706))))
        (set! %_1295
          (lambda (%_2710 %_2711)
            (if (null? %_2711) %_2710 (append %_2710 %_2711))))
        (set! %_1294
          (lambda (%_2712)
            (call-with-values
              (lambda () (%_1300 %_2712 '(())))
              (lambda (%_2713 %_2714)
                (begin
                  (if (not %_2713)
                    (syntax-error
                      %_2712
                      '"identifier not visible for export")
                    (void))
                  ((lambda (%_2715)
                     (%_1128
                       %_2715
                       (%_1188
                         %_2714
                         (list (%_1229
                                 (vector %_2715)
                                 (vector %_2714)
                                 (vector %_2713))))))
                   ((lambda (%_2716)
                      ((lambda (%_2717)
                         (if (annotation? %_2717)
                           (annotation-expression %_2717)
                           %_2717))
                       (if (%_1129 %_2716) (%_1130 %_2716) %_2716)))
                    %_2712)))))))
        (set! %_1293
          (lambda (%_2718 %_2719 %_2720)
            (if (null? %_2718)
              %_2720
              (%_1188
                (%_1189 %_2720)
                (cons ((lambda (%_2721)
                         ((lambda (%_2722)
                            ((lambda (%_2723 %_2724)
                               (begin
                                 (((lambda (%_2725)
                                     (begin
                                       (set! %_2725
                                         (lambda (%_2726 %_2727)
                                           (if (not (null? %_2726))
                                             (call-with-values
                                               (lambda ()
                                                 (%_1187 (car %_2726) %_2720))
                                               (lambda (%_2728 %_2729)
                                                 (begin
                                                   (vector-set!
                                                     %_2723
                                                     %_2727
                                                     %_2728)
                                                   (vector-set!
                                                     %_2724
                                                     %_2727
                                                     %_2729)
                                                   (%_2725
                                                     (cdr %_2726)
                                                     (+ %_2727 '1)))))
                                             (void))))
                                       %_2725))
                                   #f)
                                  %_2718
                                  '0)
                                 (%_1229 %_2723 %_2724 %_2721)))
                             (make-vector %_2722)
                             (make-vector %_2722)))
                          (vector-length %_2721)))
                       (list->vector %_2719))
                      (%_1190 %_2720))))))
        (set! %_1292
          (lambda (%_2730 %_2731 %_2732)
            ((lambda (%_2733)
               (if %_2733
                 (((lambda (%_2734)
                     (begin
                       (set! %_2734
                         (lambda (%_2735)
                           (if (pair? %_2735)
                             ((lambda (%_2736)
                                (if %_2736 %_2736 (%_2734 (cdr %_2735))))
                              (%_2734 (car %_2735)))
                             (if (%_1298 %_2732 (%_1189 (%_1131 %_2735)))
                               %_2735
                               '#f))))
                       %_2734))
                   #f)
                  %_2733)
                 '#f))
             (%_1015 %_2730 %_2731))))
        (set! %_1291
          (lambda (%_2737 %_2738)
            (%_1234
              %_2737
              (cons (%_1281 %_2738) (%_1231 %_2737)))))
        (set! %_1290
          (lambda (%_2739 %_2740)
            (begin
              (%_1234 %_2739 (cons %_1279 (%_1231 %_2739)))
              (%_1235
                %_2739
                (cons (%_1189 %_2740) (%_1232 %_2739))))))
        (set! %_1289
          (lambda (%_2741 %_2742)
            (%_1290 %_2741 (%_1131 %_2742))))
        (set! %_1288
          (lambda (%_2743 %_2744 %_2745)
            (begin
              (%_1234
                %_2743
                (cons ((lambda (%_2746)
                         (if (annotation? %_2746)
                           (annotation-expression %_2746)
                           %_2746))
                       (%_1130 %_2744))
                      (%_1231 %_2743)))
              (%_1235
                %_2743
                (cons (%_1189 (%_1131 %_2744)) (%_1232 %_2743)))
              (%_1236 %_2743 (cons %_2745 (%_1233 %_2743))))))
        (set! %_1283 cdr)
        (set! %_1282
          (lambda (%_2747)
            (if (pair? %_2747) (eq? (car %_2747) %_1280) '#f)))
        (set! %_1281
          (lambda (%_2748) (cons %_1280 %_2748)))
        (set! %_1280 'import-token)
        (set! %_1279 '#f)
        (set! %_1274
          (lambda (%_2749)
            (%_1188
              (cons '#f (%_1189 %_2749))
              (cons 'shift (%_1190 %_2749)))))
        (set! %_1236
          (lambda (%_2750 %_2751)
            (vector-set! %_2750 '3 %_2751)))
        (set! %_1235
          (lambda (%_2752 %_2753)
            (vector-set! %_2752 '2 %_2753)))
        (set! %_1234
          (lambda (%_2754 %_2755)
            (vector-set! %_2754 '1 %_2755)))
        (set! %_1233
          (lambda (%_2756) (vector-ref %_2756 '3)))
        (set! %_1232
          (lambda (%_2757) (vector-ref %_2757 '2)))
        (set! %_1231
          (lambda (%_2758) (vector-ref %_2758 '1)))
        (set! %_1230
          (lambda (%_2759)
            (if (vector? %_2759)
              (if (= (vector-length %_2759) '4)
                (eq? (vector-ref %_2759 '0) 'ribcage)
                '#f)
              '#f)))
        (set! %_1229
          (lambda (%_2760 %_2761 %_2762)
            (vector 'ribcage %_2760 %_2761 %_2762)))
        (set! %_1228 set-car!)
        (set! %_1227 car)
        (set! %_1226 pair?)
        (set! %_1225 (lambda () (list (%_1222))))
        (set! %_1224
          (lambda (%_2763)
            (if (null? %_2763)
              '()
              (cons (%_1222) (%_1224 (cdr %_2763))))))
        (set! %_1223
          (lambda (%_2764)
            ((lambda (%_2765)
               (if %_2765
                 %_2765
                 ((lambda (%_2766)
                    (if %_2766 %_2766 (%_1226 %_2764)))
                  (symbol? %_2764))))
             (string? %_2764))))
        (set! %_1222 (lambda () (string '#\i)))
        (set! %_1190 cdr)
        (set! %_1189 car)
        (set! %_1188 cons)
        (set! %_1187
          (lambda (%_2767 %_2768)
            (if (%_1129 %_2767)
              (values
                ((lambda (%_2770)
                   (if (annotation? %_2770)
                     (annotation-expression %_2770)
                     %_2770))
                 (%_1130 %_2767))
                (%_1297 (%_1189 %_2768) (%_1189 (%_1131 %_2767))))
              (values
                ((lambda (%_2769)
                   (if (annotation? %_2769)
                     (annotation-expression %_2769)
                     %_2769))
                 %_2767)
                (%_1189 %_2768)))))
        (set! %_1181
          (lambda (%_2771)
            (if (symbol? %_2771)
              '#t
              (if (%_1129 %_2771)
                (symbol?
                  ((lambda (%_2772)
                     (if (annotation? %_2772)
                       (annotation-expression %_2772)
                       %_2772))
                   (%_1130 %_2771)))
                (if (annotation? %_2771)
                  (symbol? (annotation-expression %_2771))
                  '#f)))))
        (set! %_1180
          (lambda (%_2773)
            (if (%_1129 %_2773)
              (symbol?
                ((lambda (%_2774)
                   (if (annotation? %_2774)
                     (annotation-expression %_2774)
                     %_2774))
                 (%_1130 %_2773)))
              '#f)))
        (set! %_1179
          (lambda (%_2775 %_2776 %_2777)
            (%_1013 %_2776 (%_1156 %_2775 %_2777))))
        (set! %_1178
          (lambda (%_2778 %_2779)
            ((lambda (%_2780)
               (begin
                 (set! %_2780
                   (lambda (%_2786 %_2787)
                     (begin
                       (%_1159 %_2786 (%_1157 %_2787))
                       (%_1160 %_2786 (%_1158 %_2787)))))
                 ((lambda (%_2781)
                    ((lambda (%_2782)
                       (if (memv %_2782 '(deferred))
                         (begin
                           (%_2780
                             %_2781
                             ((lambda (%_2783)
                                ((lambda (%_2784)
                                   (if %_2784
                                     %_2784
                                     (syntax-error
                                       %_2783
                                       '"invalid transformer")))
                                 (%_1177 %_2783)))
                              (%_1007 (%_1158 %_2781))))
                           ((lambda (%_2785) %_2781) (%_1157 %_2781)))
                         %_2781))
                     (%_1157 %_2781)))
                  (%_1176 %_2778 %_2779))))
             #f)))
        (set! %_1177
          (lambda (%_2788)
            (if (procedure? %_2788)
              (%_1156 'macro %_2788)
              (if (%_1161 %_2788)
                ((lambda (%_2789)
                   (if (memv %_2789 '(core macro macro!))
                     (if (procedure? (%_1158 %_2788)) %_2788 '#f)
                     (if (memv %_2789 '(module))
                       (if (%_1320 (%_1158 %_2788)) %_2788 '#f)
                       %_2788)))
                 (%_1157 %_2788))
                '#f))))
        (set! %_1176
          (lambda (%_2790 %_2791)
            ((lambda (%_2792)
               (if %_2792
                 (cdr %_2792)
                 (if (symbol? %_2790)
                   ((lambda (%_2793)
                      (if %_2793 %_2793 (%_1156 'global %_2790)))
                    (%_1014 %_2790))
                   (%_1156 'displaced-lexical '#f))))
             (assq %_2790 %_2791))))
        (set! %_1175
          (lambda (%_2794)
            (syntax-error
              %_2794
              (if (%_1302 %_2794 '(()))
                '"identifier out of context"
                '"identifier not visible"))))
        (set! %_1174
          (lambda (%_2795)
            (if (null? %_2795)
              '()
              ((lambda (%_2796)
                 (if (eq? (cadr %_2796) 'lexical)
                   (%_1174 (cdr %_2795))
                   (cons %_2796 (%_1174 (cdr %_2795)))))
               (car %_2795)))))
        (set! %_1173
          (lambda (%_2797 %_2798 %_2799)
            (if (null? %_2797)
              %_2799
              (%_1173
                (cdr %_2797)
                (cdr %_2798)
                (%_1171
                  (car %_2797)
                  (%_1156 'lexical (car %_2798))
                  %_2799)))))
        (set! %_1172
          (lambda (%_2800 %_2801 %_2802)
            (if (null? %_2800)
              %_2802
              (%_1172
                (cdr %_2800)
                (cdr %_2801)
                (%_1171 (car %_2800) (car %_2801) %_2802)))))
        (set! %_1171
          (lambda (%_2803 %_2804 %_2805)
            (cons (cons %_2803 %_2804) %_2805)))
        (set! %_1161
          (lambda (%_2806)
            (if (pair? %_2806) (symbol? (car %_2806)) '#f)))
        (set! %_1160 set-cdr!)
        (set! %_1159 set-car!)
        (set! %_1158 cdr)
        (set! %_1157 car)
        (set! %_1156
          (lambda (%_2807 %_2808) (cons %_2807 %_2808)))
        (set! %_1148
          (lambda (%_2809)
            (if (annotation? %_2809)
              (annotation-source %_2809)
              (if (%_1129 %_2809) (%_1148 (%_1130 %_2809)) '#f))))
        (set! %_1133
          (lambda (%_2810 %_2811)
            (vector-set! %_2810 '2 %_2811)))
        (set! %_1132
          (lambda (%_2812 %_2813)
            (vector-set! %_2812 '1 %_2813)))
        (set! %_1131
          (lambda (%_2814) (vector-ref %_2814 '2)))
        (set! %_1130
          (lambda (%_2815) (vector-ref %_2815 '1)))
        (set! %_1129
          (lambda (%_2816)
            (if (vector? %_2816)
              (if (= (vector-length %_2816) '3)
                (eq? (vector-ref %_2816 '0) 'syntax-object)
                '#f)
              '#f)))
        (set! %_1128
          (lambda (%_2817 %_2818)
            (vector 'syntax-object %_2817 %_2818)))
        (set! %_1116
          (lambda (%_2819 %_2820 %_2821 %_2822)
            (if (null? %_2820)
              (if %_2819
                (list 'make-annotation %_2822 %_2819)
                %_2822)
              (if %_2819
                (list 'make-annotation
                      (cons (list 'lambda
                                  %_2820
                                  (append
                                    (cons 'begin
                                          (map (lambda (%_2826 %_2827)
                                                 (list 'set! %_2826 %_2827))
                                               %_2820
                                               %_2821))
                                    (list %_2822)))
                            (map (lambda (%_2828) '#f) %_2820))
                      %_2819)
                (cons (list 'lambda
                            %_2820
                            (append
                              (cons 'begin
                                    (map (lambda (%_2823 %_2824)
                                           (list 'set! %_2823 %_2824))
                                         %_2820
                                         %_2821))
                              (list %_2822)))
                      (map (lambda (%_2825) '#f) %_2820))))))
        (set! %_1115
          (lambda (%_2829 %_2830)
            (if (null? (cdr %_2830))
              (if %_2829
                (list 'make-annotation (car %_2830) %_2829)
                (car %_2830))
              (if %_2829
                (list 'make-annotation
                      (cons 'begin %_2830)
                      %_2829)
                (cons 'begin %_2830)))))
        (set! %_1016
          ((lambda (%_2831)
             ((lambda (%_2834 %_2833 %_2832)
                (begin
                  (set! %_2834
                    (lambda (%_2838)
                      (((lambda (%_2839)
                          (begin
                            (set! %_2839
                              (lambda (%_2840 %_2841)
                                (if (< %_2840 %_2831)
                                  (list->string (cons (%_2833 %_2840) %_2841))
                                  ((lambda (%_2842 %_2843)
                                     (%_2839
                                       %_2843
                                       (cons (%_2833 %_2842) %_2841)))
                                   (modulo %_2840 %_2831)
                                   (quotient %_2840 %_2831)))))
                            %_2839))
                        #f)
                       %_2838
                       '())))
                  (set! %_2833
                    (lambda (%_2844)
                      (integer->char
                        (+ %_2844 (if (> %_2844 '9) '55 '48)))))
                  (set! %_2832 (lambda () '0))
                  ((lambda (%_2835 %_2836)
                     (lambda (%_2837)
                       (begin
                         (set! %_2836 (+ %_2836 '1))
                         (string->symbol
                           (string-append
                             (symbol->string %_2837)
                             '"#"
                             %_2835
                             (%_2834 %_2836))))))
                   (%_2834 (%_2832))
                   '-1)))
              #f
              #f
              #f))
           '36))
        (set! %_1015
          (lambda (%_2845 %_2846) (getprop %_2845 %_2846)))
        (set! %_1014
          (lambda (%_2847) (getprop %_2847 '*sc-expander*)))
        (set! %_1013
          (lambda (%_2848 %_2849)
            ($sc-put-cte %_2848 %_2849)))
        (set! %_1008
          (lambda (%_2850 %_2851 %_2852)
            (error %_2850 '"~a ~s" %_2851 %_2852)))
        (set! %_1007
          (lambda (%_2853) (eval (list %_969 %_2853))))
        (set! %_1006
          (lambda (%_2854) (eval (list %_969 %_2854))))
        (set! %_969 '"noexpand")
        (begin
          (set! $sc-put-cte
            (lambda (%_1373 %_1374)
              ((lambda (%_1377 %_1376 %_1375)
                 (begin
                   (set! %_1377
                     (lambda (%_1386 %_1387)
                       (begin
                         (%_1375 %_1386 '*top*)
                         ((lambda (%_1388)
                            (putprop %_1388 '*sc-expander* %_1387))
                          (if (symbol? %_1386)
                            %_1386
                            (%_1302 %_1386 '(())))))))
                   (set! %_1376
                     (lambda (%_1389 %_1390)
                       (%_1346
                         (lambda (%_1391) (%_1375 %_1391 %_1390))
                         %_1389)))
                   (set! %_1375
                     (lambda (%_1392 %_1393)
                       ((lambda (%_1395 %_1394)
                          (begin
                            (set! %_1395
                              (lambda (%_1400 %_1401)
                                (if (pair? %_1401)
                                  (if (%_1305 (car %_1401) %_1400)
                                    (%_1395 %_1400 (cdr %_1401))
                                    (%_1394
                                      (car %_1401)
                                      (%_1395 %_1400 (cdr %_1401))))
                                  (if ((lambda (%_1402)
                                         (if %_1402
                                           %_1402
                                           (%_1305 %_1401 %_1400)))
                                       (not %_1401))
                                    '#f
                                    %_1401))))
                            (set! %_1394
                              (lambda (%_1403 %_1404)
                                (if (not %_1404) %_1403 (cons %_1403 %_1404))))
                            ((lambda (%_1396)
                               ((lambda (%_1397)
                                  (if (if (not %_1397) (symbol? %_1392) '#f)
                                    (remprop %_1396 %_1393)
                                    (putprop
                                      %_1396
                                      %_1393
                                      (%_1394 %_1392 %_1397))))
                                (%_1395 %_1392 (getprop %_1396 %_1393))))
                             ((lambda (%_1398)
                                ((lambda (%_1399)
                                   (if (annotation? %_1399)
                                     (annotation-expression %_1399)
                                     %_1399))
                                 (if (%_1129 %_1398) (%_1130 %_1398) %_1398)))
                              %_1392))))
                        #f
                        #f)))
                   ((lambda (%_1378)
                      ((lambda (%_1379)
                         (if (memv %_1379 '(module))
                           (begin
                             ((lambda (%_1384)
                                (%_1376 (%_1321 %_1384) (%_1322 %_1384)))
                              (%_1158 %_1378))
                             (%_1377 %_1373 %_1378))
                           (if (memv %_1379 '(do-import))
                             ((lambda (%_1380)
                                ((lambda (%_1381)
                                   ((lambda (%_1382)
                                      (if (memv %_1382 '(module))
                                        ((lambda (%_1383)
                                           (begin
                                             (if (not (eq? (%_1322 %_1383)
                                                           %_1380))
                                               (syntax-error
                                                 %_1373
                                                 '"import mismatch for module")
                                               (void))
                                             (%_1376 (%_1321 %_1383) '*top*)))
                                         (%_1158 %_1381))
                                        (syntax-error
                                          %_1373
                                          '"import from unknown module")))
                                    (%_1157 %_1381)))
                                 (%_1178 (%_1302 %_1373 '(())) '())))
                              (%_1158 %_1374))
                             (%_1377 %_1373 %_1378))))
                       (%_1157 %_1378)))
                    ((lambda (%_1385)
                       (if %_1385
                         %_1385
                         (error 'define-syntax
                                '"invalid transformer ~s"
                                %_1374)))
                     (%_1177 %_1374)))))
               #f
               #f
               #f)))
          (%_1179 'local-syntax 'letrec-syntax '#t)
          (%_1179 'local-syntax 'let-syntax '#f)
          (%_1179
            'core
            'fluid-let-syntax
            (lambda (%_1405 %_1406 %_1407 %_1408)
              ((lambda (%_1409)
                 ((lambda (%_1410)
                    (if (if %_1410
                          (apply (lambda (%_1428 %_1429 %_1430 %_1431 %_1432)
                                   (%_1306 %_1429))
                                 %_1410)
                          '#f)
                      (apply (lambda (%_1412 %_1413 %_1414 %_1415 %_1416)
                               ((lambda (%_1417)
                                  (begin
                                    (for-each
                                      (lambda (%_1418 %_1419)
                                        ((lambda (%_1420)
                                           (if (memv %_1420
                                                     '(displaced-lexical))
                                             (%_1175 (%_1310 %_1418 %_1407))
                                             (void)))
                                         (%_1157 (%_1178 %_1419 %_1406))))
                                      %_1413
                                      %_1417)
                                    (%_1357
                                      (cons %_1415 %_1416)
                                      (%_1311 %_1405 %_1407 %_1408)
                                      (%_1172
                                        %_1417
                                        ((lambda (%_1423)
                                           (map (lambda (%_1424)
                                                  (%_1156
                                                    'deferred
                                                    (%_1352
                                                      %_1424
                                                      %_1423
                                                      %_1407)))
                                                %_1414))
                                         (%_1174 %_1406))
                                        %_1406)
                                      %_1407)))
                                (map (lambda (%_1426) (%_1302 %_1426 %_1407))
                                     %_1413)))
                             %_1410)
                      ((lambda (%_1411)
                         (syntax-error (%_1311 %_1405 %_1407 %_1408)))
                       %_1409)))
                  ($syntax-dispatch
                    %_1409
                    '(any #2(each (any any)) any . each-any))))
               %_1405)))
          (%_1179
            'core
            'quote
            (lambda (%_1434 %_1435 %_1436 %_1437)
              ((lambda (%_1438)
                 ((lambda (%_1439)
                    (if %_1439
                      (apply (lambda (%_1441 %_1442)
                               (list 'quote (%_1370 %_1442 %_1436)))
                             %_1439)
                      ((lambda (%_1440)
                         (syntax-error (%_1311 %_1434 %_1436 %_1437)))
                       %_1438)))
                  ($syntax-dispatch %_1438 '(any any))))
               %_1434)))
          (%_1179
            'core
            'syntax
            ((lambda ()
               ((lambda (%_1450
                         %_1449
                         %_1448
                         %_1447
                         %_1446
                         %_1445
                         %_1444
                         %_1443)
                  (begin
                    (set! %_1450
                      (lambda (%_1463)
                        ((lambda (%_1464)
                           (if (memv %_1464 '(ref))
                             (if '#f
                               (list 'make-annotation (cadr %_1463) '#f)
                               (cadr %_1463))
                             (if (memv %_1464 '(primitive))
                               (cadr %_1463)
                               (if (memv %_1464 '(quote))
                                 (list 'quote (cadr %_1463))
                                 (if (memv %_1464 '(lambda))
                                   (if '#f
                                     (list 'make-annotation
                                           (list 'lambda
                                                 (cadr %_1463)
                                                 (%_1450 (caddr %_1463)))
                                           '#f)
                                     (list 'lambda
                                           (cadr %_1463)
                                           (%_1450 (caddr %_1463))))
                                   (if (memv %_1464 '(map))
                                     ((lambda (%_1465)
                                        (if '#f
                                          (list 'make-annotation
                                                (cons (if (= (length %_1465)
                                                             '2)
                                                        'map
                                                        'map)
                                                      %_1465)
                                                '#f)
                                          (cons (if (= (length %_1465) '2)
                                                  'map
                                                  'map)
                                                %_1465)))
                                      (map %_1450 (cdr %_1463)))
                                     (if '#f
                                       (list 'make-annotation
                                             (cons (car %_1463)
                                                   (map %_1450 (cdr %_1463)))
                                             '#f)
                                       (cons (car %_1463)
                                             (map %_1450 (cdr %_1463))))))))))
                         (car %_1463))))
                    (set! %_1449
                      (lambda (%_1466 %_1467 %_1468)
                        (if (eq? (car %_1468) 'quote)
                          (if (eq? (cadr %_1468) %_1467)
                            (list 'quote %_1466)
                            (list 'quote (list->vector (cadr %_1468))))
                          (if (eq? (car %_1468) 'list)
                            (cons 'vector (cdr %_1468))
                            (list 'list->vector %_1468)))))
                    (set! %_1448
                      (lambda (%_1469 %_1470 %_1471 %_1472 %_1473)
                        ((lambda (%_1474)
                           (if (memv %_1474 '(quote))
                             (if (eq? (car %_1472) 'quote)
                               ((lambda (%_1475 %_1476)
                                  (if (if (eq? %_1475 %_1470)
                                        (eq? %_1476 %_1471)
                                        '#f)
                                    (list 'quote %_1469)
                                    (list 'quote (cons %_1475 %_1476))))
                                (cadr %_1472)
                                (cadr %_1473))
                               (if (eq? (cadr %_1473) '())
                                 (list 'list %_1472)
                                 (list 'cons %_1472 %_1473)))
                             (if (memv %_1474 '(list))
                               (cons 'list (cons %_1472 (cdr %_1473)))
                               (list 'cons %_1472 %_1473))))
                         (car %_1473))))
                    (set! %_1447
                      (lambda (%_1477 %_1478)
                        ((lambda (%_1479 %_1480)
                           (if (eq? (car %_1477) 'ref)
                             (car %_1480)
                             (if (andmap
                                   (lambda (%_1483)
                                     (if (eq? (car %_1483) 'ref)
                                       (memq (cadr %_1483) %_1479)
                                       '#f))
                                   (cdr %_1477))
                               (cons 'map
                                     (cons (list 'primitive (car %_1477))
                                           (map ((lambda (%_1481)
                                                   (lambda (%_1482)
                                                     (cdr (assq (cadr %_1482)
                                                                %_1481))))
                                                 (map cons %_1479 %_1480))
                                                (cdr %_1477))))
                               (cons 'map
                                     (cons (list 'lambda %_1479 %_1477)
                                           %_1480)))))
                         (map cdr %_1478)
                         (map (lambda (%_1484) (list 'ref (car %_1484)))
                              %_1478))))
                    (set! %_1446
                      (lambda (%_1485 %_1486)
                        (list 'apply
                              '(primitive append)
                              (%_1447 %_1485 %_1486))))
                    (set! %_1445
                      (lambda (%_1487 %_1488)
                        (if (equal? %_1488 ''())
                          %_1487
                          (list 'append %_1487 %_1488))))
                    (set! %_1444
                      (lambda (%_1489 %_1490 %_1491 %_1492)
                        (if (= %_1491 '0)
                          (values %_1490 %_1492)
                          (if (null? %_1492)
                            (syntax-error
                              %_1489
                              '"missing ellipsis in syntax form")
                            (call-with-values
                              (lambda ()
                                (%_1444
                                  %_1489
                                  %_1490
                                  (- %_1491 '1)
                                  (cdr %_1492)))
                              (lambda (%_1493 %_1494)
                                ((lambda (%_1495)
                                   (if %_1495
                                     (values (cdr %_1495) %_1492)
                                     ((lambda (%_1496)
                                        (values
                                          %_1496
                                          (cons (cons (cons %_1493 %_1496)
                                                      (car %_1492))
                                                %_1494)))
                                      (%_1371 'tmp))))
                                 (assq %_1493 (car %_1492)))))))))
                    (set! %_1443
                      (lambda (%_1497 %_1498 %_1499 %_1500 %_1501)
                        (if (%_1181 %_1498)
                          ((lambda (%_1551)
                             ((lambda (%_1552)
                                (if (eq? (%_1157 %_1552) 'syntax)
                                  (call-with-values
                                    (lambda ()
                                      ((lambda (%_1553)
                                         (%_1444
                                           %_1497
                                           (car %_1553)
                                           (cdr %_1553)
                                           %_1500))
                                       (%_1158 %_1552)))
                                    (lambda (%_1554 %_1555)
                                      (values (list 'ref %_1554) %_1555)))
                                  (if (%_1501 %_1498)
                                    (syntax-error
                                      %_1497
                                      '"misplaced ellipsis in syntax form")
                                    (values (list 'quote %_1498) %_1500))))
                              (%_1178 %_1551 %_1499)))
                           (%_1302 %_1498 '(())))
                          ((lambda (%_1502)
                             ((lambda (%_1503)
                                (if (if %_1503
                                      (apply (lambda (%_1549 %_1550)
                                               (%_1501 %_1549))
                                             %_1503)
                                      '#f)
                                  (apply (lambda (%_1546 %_1547)
                                           (%_1443
                                             %_1497
                                             %_1547
                                             %_1499
                                             %_1500
                                             (lambda (%_1548) '#f)))
                                         %_1503)
                                  ((lambda (%_1504)
                                     (if (if %_1504
                                           (apply (lambda (%_1543
                                                           %_1544
                                                           %_1545)
                                                    (%_1501 %_1544))
                                                  %_1504)
                                           '#f)
                                       (apply (lambda (%_1520 %_1521 %_1522)
                                                (((lambda (%_1523)
                                                    (begin
                                                      (set! %_1523
                                                        (lambda (%_1524 %_1525)
                                                          ((lambda (%_1526)
                                                             ((lambda (%_1527)
                                                                (if (if %_1527
                                                                      (apply (lambda (%_1538
                                                                                      %_1539)
                                                                               (%_1501
                                                                                 %_1538))
                                                                             %_1527)
                                                                      '#f)
                                                                  (apply (lambda (%_1533
                                                                                  %_1534)
                                                                           (%_1523
                                                                             %_1534
                                                                             (lambda (%_1535)
                                                                               (call-with-values
                                                                                 (lambda ()
                                                                                   (%_1525
                                                                                     (cons '()
                                                                                           %_1535)))
                                                                                 (lambda (%_1536
                                                                                          %_1537)
                                                                                   (if (null? (car %_1537))
                                                                                     (syntax-error
                                                                                       %_1497
                                                                                       '"extra ellipsis in syntax form")
                                                                                     (values
                                                                                       (%_1446
                                                                                         %_1536
                                                                                         (car %_1537))
                                                                                       (cdr %_1537))))))))
                                                                         %_1527)
                                                                  ((lambda (%_1528)
                                                                     (call-with-values
                                                                       (lambda ()
                                                                         (%_1443
                                                                           %_1497
                                                                           %_1524
                                                                           %_1499
                                                                           %_1500
                                                                           %_1501))
                                                                       (lambda (%_1529
                                                                                %_1530)
                                                                         (call-with-values
                                                                           (lambda ()
                                                                             (%_1525
                                                                               %_1530))
                                                                           (lambda (%_1531
                                                                                    %_1532)
                                                                             (values
                                                                               (%_1445
                                                                                 %_1531
                                                                                 %_1529)
                                                                               %_1532))))))
                                                                   %_1526)))
                                                              ($syntax-dispatch
                                                                %_1526
                                                                '(any . any))))
                                                           %_1524)))
                                                      %_1523))
                                                  #f)
                                                 %_1522
                                                 (lambda (%_1540)
                                                   (call-with-values
                                                     (lambda ()
                                                       (%_1443
                                                         %_1497
                                                         %_1520
                                                         %_1499
                                                         (cons '() %_1540)
                                                         %_1501))
                                                     (lambda (%_1541 %_1542)
                                                       (if (null? (car %_1542))
                                                         (syntax-error
                                                           %_1497
                                                           '"extra ellipsis in syntax form")
                                                         (values
                                                           (%_1447
                                                             %_1541
                                                             (car %_1542))
                                                           (cdr %_1542))))))))
                                              %_1504)
                                       ((lambda (%_1505)
                                          (if %_1505
                                            (apply (lambda (%_1514 %_1515)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_1443
                                                           %_1497
                                                           %_1514
                                                           %_1499
                                                           %_1500
                                                           %_1501))
                                                       (lambda (%_1516 %_1517)
                                                         (call-with-values
                                                           (lambda ()
                                                             (%_1443
                                                               %_1497
                                                               %_1515
                                                               %_1499
                                                               %_1517
                                                               %_1501))
                                                           (lambda (%_1518
                                                                    %_1519)
                                                             (values
                                                               (%_1448
                                                                 %_1498
                                                                 %_1514
                                                                 %_1515
                                                                 %_1516
                                                                 %_1518)
                                                               %_1519))))))
                                                   %_1505)
                                            ((lambda (%_1506)
                                               (if %_1506
                                                 (apply (lambda (%_1508 %_1509)
                                                          ((lambda (%_1510)
                                                             (call-with-values
                                                               (lambda ()
                                                                 (%_1443
                                                                   %_1497
                                                                   %_1510
                                                                   %_1499
                                                                   %_1500
                                                                   %_1501))
                                                               (lambda (%_1511
                                                                        %_1512)
                                                                 (values
                                                                   (%_1449
                                                                     %_1498
                                                                     %_1510
                                                                     %_1511)
                                                                   %_1512))))
                                                           (cons %_1508
                                                                 %_1509)))
                                                        %_1506)
                                                 ((lambda (%_1507)
                                                    (values
                                                      (list 'quote %_1498)
                                                      %_1500))
                                                  %_1502)))
                                             ($syntax-dispatch
                                               %_1502
                                               '#2(vector (any . each-any))))))
                                        ($syntax-dispatch
                                          %_1502
                                          '(any . any)))))
                                   ($syntax-dispatch
                                     %_1502
                                     '(any any . any)))))
                              ($syntax-dispatch %_1502 '(any any))))
                           %_1498))))
                    (lambda (%_1451 %_1452 %_1453 %_1454)
                      ((lambda (%_1455)
                         ((lambda (%_1456)
                            ((lambda (%_1457)
                               (if %_1457
                                 (apply (lambda (%_1459 %_1460)
                                          (call-with-values
                                            (lambda ()
                                              (%_1443
                                                %_1455
                                                %_1460
                                                %_1452
                                                '()
                                                %_1367))
                                            (lambda (%_1461 %_1462)
                                              (%_1450 %_1461))))
                                        %_1457)
                                 ((lambda (%_1458) (syntax-error %_1455))
                                  %_1456)))
                             ($syntax-dispatch %_1456 '(any any))))
                          %_1455))
                       (%_1311 %_1451 %_1453 %_1454)))))
                #f
                #f
                #f
                #f
                #f
                #f
                #f
                #f))))
          (%_1179
            'core
            'lambda
            (lambda (%_1556 %_1557 %_1558 %_1559)
              ((lambda (%_1560)
                 ((lambda (%_1561)
                    (if %_1561
                      (apply (lambda (%_1562 %_1563)
                               (%_1364
                                 (%_1311 %_1556 %_1558 %_1559)
                                 %_1563
                                 %_1557
                                 %_1558
                                 (lambda (%_1564 %_1565)
                                   (if %_1559
                                     (list 'make-annotation
                                           (list 'lambda %_1564 %_1565)
                                           %_1559)
                                     (list 'lambda %_1564 %_1565)))))
                             %_1561)
                      (syntax-error %_1560)))
                  ($syntax-dispatch %_1560 '(any . any))))
               %_1556)))
          (%_1179
            'core
            'letrec
            (lambda (%_1566 %_1567 %_1568 %_1569)
              ((lambda (%_1570)
                 ((lambda (%_1571)
                    (if %_1571
                      (apply (lambda (%_1573 %_1574 %_1575 %_1576 %_1577)
                               ((lambda (%_1578)
                                  (if (not (%_1306 %_1578))
                                    (%_1308
                                      (map (lambda (%_1586)
                                             (%_1310 %_1586 %_1568))
                                           %_1578)
                                      (%_1311 %_1566 %_1568 %_1569)
                                      '"bound variable")
                                    ((lambda (%_1579 %_1580)
                                       ((lambda (%_1581 %_1582)
                                          (%_1116
                                            %_1569
                                            %_1580
                                            (map (lambda (%_1583)
                                                   (%_1352
                                                     %_1583
                                                     %_1582
                                                     %_1581))
                                                 %_1575)
                                            (%_1357
                                              (cons %_1576 %_1577)
                                              (%_1311 %_1566 %_1581 %_1569)
                                              %_1582
                                              %_1581)))
                                        (%_1293 %_1578 %_1579 %_1568)
                                        (%_1173 %_1579 %_1580 %_1567)))
                                     (%_1224 %_1578)
                                     (map %_1371 %_1578))))
                                %_1574))
                             %_1571)
                      ((lambda (%_1572)
                         (syntax-error (%_1311 %_1566 %_1568 %_1569)))
                       %_1570)))
                  ($syntax-dispatch
                    %_1570
                    '(any #2(each (any any)) any . each-any))))
               %_1566)))
          (%_1179
            'core
            'if
            (lambda (%_1588 %_1589 %_1590 %_1591)
              ((lambda (%_1592)
                 ((lambda (%_1593)
                    (if %_1593
                      (apply (lambda (%_1600 %_1601 %_1602)
                               (if %_1591
                                 (list 'make-annotation
                                       (list 'if
                                             (%_1352 %_1601 %_1589 %_1590)
                                             (%_1352 %_1602 %_1589 %_1590)
                                             (%_1366))
                                       %_1591)
                                 (list 'if
                                       (%_1352 %_1601 %_1589 %_1590)
                                       (%_1352 %_1602 %_1589 %_1590)
                                       (%_1366))))
                             %_1593)
                      ((lambda (%_1594)
                         (if %_1594
                           (apply (lambda (%_1596 %_1597 %_1598 %_1599)
                                    (if %_1591
                                      (list 'make-annotation
                                            (list 'if
                                                  (%_1352 %_1597 %_1589 %_1590)
                                                  (%_1352 %_1598 %_1589 %_1590)
                                                  (%_1352
                                                    %_1599
                                                    %_1589
                                                    %_1590))
                                            %_1591)
                                      (list 'if
                                            (%_1352 %_1597 %_1589 %_1590)
                                            (%_1352 %_1598 %_1589 %_1590)
                                            (%_1352 %_1599 %_1589 %_1590))))
                                  %_1594)
                           ((lambda (%_1595)
                              (syntax-error (%_1311 %_1588 %_1590 %_1591)))
                            %_1592)))
                       ($syntax-dispatch %_1592 '(any any any any)))))
                  ($syntax-dispatch %_1592 '(any any any))))
               %_1588)))
          (%_1179 'set! 'set! '())
          (%_1179 'begin 'begin '())
          (%_1179 'module-key 'module '())
          (%_1179 'import 'import '#f)
          (%_1179 'import 'import-only '#t)
          (%_1179 'define 'define '())
          (%_1179 'define-syntax 'define-syntax '())
          (%_1179 'eval-when 'eval-when '())
          (%_1179
            'core
            'syntax-case
            ((lambda ()
               ((lambda (%_1606 %_1605 %_1604 %_1603)
                  (begin
                    (set! %_1606
                      (lambda (%_1629 %_1630 %_1631 %_1632)
                        (if (null? %_1631)
                          (if '#f
                            (list 'make-annotation
                                  (list 'syntax-error
                                        (if '#f
                                          (list 'make-annotation %_1629 '#f)
                                          %_1629))
                                  '#f)
                            (list 'syntax-error
                                  (if '#f
                                    (list 'make-annotation %_1629 '#f)
                                    %_1629)))
                          ((lambda (%_1633)
                             ((lambda (%_1634)
                                (if %_1634
                                  (apply (lambda (%_1640 %_1641)
                                           (if (if (%_1181 %_1640)
                                                 (if (not (%_1309
                                                            %_1640
                                                            %_1630))
                                                   (not (%_1367 %_1640))
                                                   '#f)
                                                 '#f)
                                             ((lambda (%_1642 %_1643)
                                                (if '#f
                                                  (list 'make-annotation
                                                        (list (if '#f
                                                                (list 'make-annotation
                                                                      (list 'lambda
                                                                            (list %_1643)
                                                                            (%_1352
                                                                              %_1641
                                                                              (%_1171
                                                                                %_1642
                                                                                (%_1156
                                                                                  'syntax
                                                                                  (cons %_1643
                                                                                        '0))
                                                                                %_1632)
                                                                              (%_1293
                                                                                (list %_1640)
                                                                                (list %_1642)
                                                                                '(()))))
                                                                      '#f)
                                                                (list 'lambda
                                                                      (list %_1643)
                                                                      (%_1352
                                                                        %_1641
                                                                        (%_1171
                                                                          %_1642
                                                                          (%_1156
                                                                            'syntax
                                                                            (cons %_1643
                                                                                  '0))
                                                                          %_1632)
                                                                        (%_1293
                                                                          (list %_1640)
                                                                          (list %_1642)
                                                                          '(())))))
                                                              (if '#f
                                                                (list 'make-annotation
                                                                      %_1629
                                                                      '#f)
                                                                %_1629))
                                                        '#f)
                                                  (list (if '#f
                                                          (list 'make-annotation
                                                                (list 'lambda
                                                                      (list %_1643)
                                                                      (%_1352
                                                                        %_1641
                                                                        (%_1171
                                                                          %_1642
                                                                          (%_1156
                                                                            'syntax
                                                                            (cons %_1643
                                                                                  '0))
                                                                          %_1632)
                                                                        (%_1293
                                                                          (list %_1640)
                                                                          (list %_1642)
                                                                          '(()))))
                                                                '#f)
                                                          (list 'lambda
                                                                (list %_1643)
                                                                (%_1352
                                                                  %_1641
                                                                  (%_1171
                                                                    %_1642
                                                                    (%_1156
                                                                      'syntax
                                                                      (cons %_1643
                                                                            '0))
                                                                    %_1632)
                                                                  (%_1293
                                                                    (list %_1640)
                                                                    (list %_1642)
                                                                    '(())))))
                                                        (if '#f
                                                          (list 'make-annotation
                                                                %_1629
                                                                '#f)
                                                          %_1629))))
                                              (%_1222)
                                              (%_1371 %_1640))
                                             (%_1605
                                               %_1629
                                               %_1630
                                               (cdr %_1631)
                                               %_1632
                                               %_1640
                                               '#t
                                               %_1641)))
                                         %_1634)
                                  ((lambda (%_1635)
                                     (if %_1635
                                       (apply (lambda (%_1637 %_1638 %_1639)
                                                (%_1605
                                                  %_1629
                                                  %_1630
                                                  (cdr %_1631)
                                                  %_1632
                                                  %_1637
                                                  %_1638
                                                  %_1639))
                                              %_1635)
                                       ((lambda (%_1636)
                                          (syntax-error
                                            (car %_1631)
                                            '"invalid syntax-case clause"))
                                        %_1633)))
                                   ($syntax-dispatch %_1633 '(any any any)))))
                              ($syntax-dispatch %_1633 '(any any))))
                           (car %_1631)))))
                    (set! %_1605
                      (lambda (%_1644
                               %_1645
                               %_1646
                               %_1647
                               %_1648
                               %_1649
                               %_1650)
                        (call-with-values
                          (lambda () (%_1603 %_1648 %_1645))
                          (lambda (%_1651 %_1652)
                            (if (not (%_1307 (map car %_1652)))
                              (%_1308
                                (map car %_1652)
                                %_1648
                                '"pattern variable")
                              (if (not (andmap
                                         (lambda (%_1714)
                                           (not (%_1367 (car %_1714))))
                                         %_1652))
                                (syntax-error
                                  %_1648
                                  '"misplaced ellipsis in syntax-case pattern")
                                ((lambda (%_1653)
                                   (if '#f
                                     (list 'make-annotation
                                           (list (if '#f
                                                   (list 'make-annotation
                                                         (list 'lambda
                                                               (list %_1653)
                                                               (if '#f
                                                                 (list 'make-annotation
                                                                       (list 'if
                                                                             ((lambda (%_1711)
                                                                                ((lambda (%_1712)
                                                                                   (if %_1712
                                                                                     (apply (lambda ()
                                                                                              (if '#f
                                                                                                (list 'make-annotation
                                                                                                      %_1653
                                                                                                      '#f)
                                                                                                %_1653))
                                                                                            %_1712)
                                                                                     ((lambda (%_1713)
                                                                                        (if '#f
                                                                                          (list 'make-annotation
                                                                                                (list 'if
                                                                                                      (if '#f
                                                                                                        (list 'make-annotation
                                                                                                              %_1653
                                                                                                              '#f)
                                                                                                        %_1653)
                                                                                                      (%_1604
                                                                                                        %_1652
                                                                                                        %_1649
                                                                                                        (if '#f
                                                                                                          (list 'make-annotation
                                                                                                                %_1653
                                                                                                                '#f)
                                                                                                          %_1653)
                                                                                                        %_1647)
                                                                                                      (list 'quote
                                                                                                            '#f))
                                                                                                '#f)
                                                                                          (list 'if
                                                                                                (if '#f
                                                                                                  (list 'make-annotation
                                                                                                        %_1653
                                                                                                        '#f)
                                                                                                  %_1653)
                                                                                                (%_1604
                                                                                                  %_1652
                                                                                                  %_1649
                                                                                                  (if '#f
                                                                                                    (list 'make-annotation
                                                                                                          %_1653
                                                                                                          '#f)
                                                                                                    %_1653)
                                                                                                  %_1647)
                                                                                                (list 'quote
                                                                                                      '#f))))
                                                                                      %_1711)))
                                                                                 ($syntax-dispatch
                                                                                   %_1711
                                                                                   '#2(atom
                                                                                       #t))))
                                                                              %_1649)
                                                                             (%_1604
                                                                               %_1652
                                                                               %_1650
                                                                               (if '#f
                                                                                 (list 'make-annotation
                                                                                       %_1653
                                                                                       '#f)
                                                                                 %_1653)
                                                                               %_1647)
                                                                             (%_1606
                                                                               %_1644
                                                                               %_1645
                                                                               %_1646
                                                                               %_1647))
                                                                       '#f)
                                                                 (list 'if
                                                                       ((lambda (%_1708)
                                                                          ((lambda (%_1709)
                                                                             (if %_1709
                                                                               (apply (lambda ()
                                                                                        (if '#f
                                                                                          (list 'make-annotation
                                                                                                %_1653
                                                                                                '#f)
                                                                                          %_1653))
                                                                                      %_1709)
                                                                               ((lambda (%_1710)
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          (list 'if
                                                                                                (if '#f
                                                                                                  (list 'make-annotation
                                                                                                        %_1653
                                                                                                        '#f)
                                                                                                  %_1653)
                                                                                                (%_1604
                                                                                                  %_1652
                                                                                                  %_1649
                                                                                                  (if '#f
                                                                                                    (list 'make-annotation
                                                                                                          %_1653
                                                                                                          '#f)
                                                                                                    %_1653)
                                                                                                  %_1647)
                                                                                                (list 'quote
                                                                                                      '#f))
                                                                                          '#f)
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_1653
                                                                                                  '#f)
                                                                                            %_1653)
                                                                                          (%_1604
                                                                                            %_1652
                                                                                            %_1649
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_1653
                                                                                                    '#f)
                                                                                              %_1653)
                                                                                            %_1647)
                                                                                          (list 'quote
                                                                                                '#f))))
                                                                                %_1708)))
                                                                           ($syntax-dispatch
                                                                             %_1708
                                                                             '#2(atom
                                                                                 #t))))
                                                                        %_1649)
                                                                       (%_1604
                                                                         %_1652
                                                                         %_1650
                                                                         (if '#f
                                                                           (list 'make-annotation
                                                                                 %_1653
                                                                                 '#f)
                                                                           %_1653)
                                                                         %_1647)
                                                                       (%_1606
                                                                         %_1644
                                                                         %_1645
                                                                         %_1646
                                                                         %_1647))))
                                                         '#f)
                                                   (list 'lambda
                                                         (list %_1653)
                                                         (if '#f
                                                           (list 'make-annotation
                                                                 (list 'if
                                                                       ((lambda (%_1696)
                                                                          ((lambda (%_1697)
                                                                             (if %_1697
                                                                               (apply (lambda ()
                                                                                        (if '#f
                                                                                          (list 'make-annotation
                                                                                                %_1653
                                                                                                '#f)
                                                                                          %_1653))
                                                                                      %_1697)
                                                                               ((lambda (%_1698)
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          (list 'if
                                                                                                (if '#f
                                                                                                  (list 'make-annotation
                                                                                                        %_1653
                                                                                                        '#f)
                                                                                                  %_1653)
                                                                                                (%_1604
                                                                                                  %_1652
                                                                                                  %_1649
                                                                                                  (if '#f
                                                                                                    (list 'make-annotation
                                                                                                          %_1653
                                                                                                          '#f)
                                                                                                    %_1653)
                                                                                                  %_1647)
                                                                                                (list 'quote
                                                                                                      '#f))
                                                                                          '#f)
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_1653
                                                                                                  '#f)
                                                                                            %_1653)
                                                                                          (%_1604
                                                                                            %_1652
                                                                                            %_1649
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_1653
                                                                                                    '#f)
                                                                                              %_1653)
                                                                                            %_1647)
                                                                                          (list 'quote
                                                                                                '#f))))
                                                                                %_1696)))
                                                                           ($syntax-dispatch
                                                                             %_1696
                                                                             '#2(atom
                                                                                 #t))))
                                                                        %_1649)
                                                                       (%_1604
                                                                         %_1652
                                                                         %_1650
                                                                         (if '#f
                                                                           (list 'make-annotation
                                                                                 %_1653
                                                                                 '#f)
                                                                           %_1653)
                                                                         %_1647)
                                                                       (%_1606
                                                                         %_1644
                                                                         %_1645
                                                                         %_1646
                                                                         %_1647))
                                                                 '#f)
                                                           (list 'if
                                                                 ((lambda (%_1693)
                                                                    ((lambda (%_1694)
                                                                       (if %_1694
                                                                         (apply (lambda ()
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          %_1653
                                                                                          '#f)
                                                                                    %_1653))
                                                                                %_1694)
                                                                         ((lambda (%_1695)
                                                                            (if '#f
                                                                              (list 'make-annotation
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_1653
                                                                                                  '#f)
                                                                                            %_1653)
                                                                                          (%_1604
                                                                                            %_1652
                                                                                            %_1649
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_1653
                                                                                                    '#f)
                                                                                              %_1653)
                                                                                            %_1647)
                                                                                          (list 'quote
                                                                                                '#f))
                                                                                    '#f)
                                                                              (list 'if
                                                                                    (if '#f
                                                                                      (list 'make-annotation
                                                                                            %_1653
                                                                                            '#f)
                                                                                      %_1653)
                                                                                    (%_1604
                                                                                      %_1652
                                                                                      %_1649
                                                                                      (if '#f
                                                                                        (list 'make-annotation
                                                                                              %_1653
                                                                                              '#f)
                                                                                        %_1653)
                                                                                      %_1647)
                                                                                    (list 'quote
                                                                                          '#f))))
                                                                          %_1693)))
                                                                     ($syntax-dispatch
                                                                       %_1693
                                                                       '#2(atom
                                                                           #t))))
                                                                  %_1649)
                                                                 (%_1604
                                                                   %_1652
                                                                   %_1650
                                                                   (if '#f
                                                                     (list 'make-annotation
                                                                           %_1653
                                                                           '#f)
                                                                     %_1653)
                                                                   %_1647)
                                                                 (%_1606
                                                                   %_1644
                                                                   %_1645
                                                                   %_1646
                                                                   %_1647)))))
                                                 (if (eq? %_1651 'any)
                                                   (if '#f
                                                     (list 'make-annotation
                                                           (list 'list
                                                                 (if 'value
                                                                   (cons 'make-annotation
                                                                         (cons %_1644
                                                                               '(value)))
                                                                   %_1644))
                                                           '#f)
                                                     (list 'list
                                                           (if 'value
                                                             (cons 'make-annotation
                                                                   (cons %_1644
                                                                         '(value)))
                                                             %_1644)))
                                                   (if '#f
                                                     (list 'make-annotation
                                                           (list '$syntax-dispatch
                                                                 (if 'value
                                                                   (cons 'make-annotation
                                                                         (cons %_1644
                                                                               '(value)))
                                                                   %_1644)
                                                                 (list 'quote
                                                                       %_1651))
                                                           '#f)
                                                     (list '$syntax-dispatch
                                                           (if 'value
                                                             (cons 'make-annotation
                                                                   (cons %_1644
                                                                         '(value)))
                                                             %_1644)
                                                           (list 'quote
                                                                 %_1651)))))
                                           '#f)
                                     (list (if '#f
                                             (list 'make-annotation
                                                   (list 'lambda
                                                         (list %_1653)
                                                         (if '#f
                                                           (list 'make-annotation
                                                                 (list 'if
                                                                       ((lambda (%_1681)
                                                                          ((lambda (%_1682)
                                                                             (if %_1682
                                                                               (apply (lambda ()
                                                                                        (if '#f
                                                                                          (list 'make-annotation
                                                                                                %_1653
                                                                                                '#f)
                                                                                          %_1653))
                                                                                      %_1682)
                                                                               ((lambda (%_1683)
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          (list 'if
                                                                                                (if '#f
                                                                                                  (list 'make-annotation
                                                                                                        %_1653
                                                                                                        '#f)
                                                                                                  %_1653)
                                                                                                (%_1604
                                                                                                  %_1652
                                                                                                  %_1649
                                                                                                  (if '#f
                                                                                                    (list 'make-annotation
                                                                                                          %_1653
                                                                                                          '#f)
                                                                                                    %_1653)
                                                                                                  %_1647)
                                                                                                (list 'quote
                                                                                                      '#f))
                                                                                          '#f)
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_1653
                                                                                                  '#f)
                                                                                            %_1653)
                                                                                          (%_1604
                                                                                            %_1652
                                                                                            %_1649
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_1653
                                                                                                    '#f)
                                                                                              %_1653)
                                                                                            %_1647)
                                                                                          (list 'quote
                                                                                                '#f))))
                                                                                %_1681)))
                                                                           ($syntax-dispatch
                                                                             %_1681
                                                                             '#2(atom
                                                                                 #t))))
                                                                        %_1649)
                                                                       (%_1604
                                                                         %_1652
                                                                         %_1650
                                                                         (if '#f
                                                                           (list 'make-annotation
                                                                                 %_1653
                                                                                 '#f)
                                                                           %_1653)
                                                                         %_1647)
                                                                       (%_1606
                                                                         %_1644
                                                                         %_1645
                                                                         %_1646
                                                                         %_1647))
                                                                 '#f)
                                                           (list 'if
                                                                 ((lambda (%_1678)
                                                                    ((lambda (%_1679)
                                                                       (if %_1679
                                                                         (apply (lambda ()
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          %_1653
                                                                                          '#f)
                                                                                    %_1653))
                                                                                %_1679)
                                                                         ((lambda (%_1680)
                                                                            (if '#f
                                                                              (list 'make-annotation
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_1653
                                                                                                  '#f)
                                                                                            %_1653)
                                                                                          (%_1604
                                                                                            %_1652
                                                                                            %_1649
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_1653
                                                                                                    '#f)
                                                                                              %_1653)
                                                                                            %_1647)
                                                                                          (list 'quote
                                                                                                '#f))
                                                                                    '#f)
                                                                              (list 'if
                                                                                    (if '#f
                                                                                      (list 'make-annotation
                                                                                            %_1653
                                                                                            '#f)
                                                                                      %_1653)
                                                                                    (%_1604
                                                                                      %_1652
                                                                                      %_1649
                                                                                      (if '#f
                                                                                        (list 'make-annotation
                                                                                              %_1653
                                                                                              '#f)
                                                                                        %_1653)
                                                                                      %_1647)
                                                                                    (list 'quote
                                                                                          '#f))))
                                                                          %_1678)))
                                                                     ($syntax-dispatch
                                                                       %_1678
                                                                       '#2(atom
                                                                           #t))))
                                                                  %_1649)
                                                                 (%_1604
                                                                   %_1652
                                                                   %_1650
                                                                   (if '#f
                                                                     (list 'make-annotation
                                                                           %_1653
                                                                           '#f)
                                                                     %_1653)
                                                                   %_1647)
                                                                 (%_1606
                                                                   %_1644
                                                                   %_1645
                                                                   %_1646
                                                                   %_1647))))
                                                   '#f)
                                             (list 'lambda
                                                   (list %_1653)
                                                   (if '#f
                                                     (list 'make-annotation
                                                           (list 'if
                                                                 ((lambda (%_1666)
                                                                    ((lambda (%_1667)
                                                                       (if %_1667
                                                                         (apply (lambda ()
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          %_1653
                                                                                          '#f)
                                                                                    %_1653))
                                                                                %_1667)
                                                                         ((lambda (%_1668)
                                                                            (if '#f
                                                                              (list 'make-annotation
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_1653
                                                                                                  '#f)
                                                                                            %_1653)
                                                                                          (%_1604
                                                                                            %_1652
                                                                                            %_1649
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_1653
                                                                                                    '#f)
                                                                                              %_1653)
                                                                                            %_1647)
                                                                                          (list 'quote
                                                                                                '#f))
                                                                                    '#f)
                                                                              (list 'if
                                                                                    (if '#f
                                                                                      (list 'make-annotation
                                                                                            %_1653
                                                                                            '#f)
                                                                                      %_1653)
                                                                                    (%_1604
                                                                                      %_1652
                                                                                      %_1649
                                                                                      (if '#f
                                                                                        (list 'make-annotation
                                                                                              %_1653
                                                                                              '#f)
                                                                                        %_1653)
                                                                                      %_1647)
                                                                                    (list 'quote
                                                                                          '#f))))
                                                                          %_1666)))
                                                                     ($syntax-dispatch
                                                                       %_1666
                                                                       '#2(atom
                                                                           #t))))
                                                                  %_1649)
                                                                 (%_1604
                                                                   %_1652
                                                                   %_1650
                                                                   (if '#f
                                                                     (list 'make-annotation
                                                                           %_1653
                                                                           '#f)
                                                                     %_1653)
                                                                   %_1647)
                                                                 (%_1606
                                                                   %_1644
                                                                   %_1645
                                                                   %_1646
                                                                   %_1647))
                                                           '#f)
                                                     (list 'if
                                                           ((lambda (%_1663)
                                                              ((lambda (%_1664)
                                                                 (if %_1664
                                                                   (apply (lambda ()
                                                                            (if '#f
                                                                              (list 'make-annotation
                                                                                    %_1653
                                                                                    '#f)
                                                                              %_1653))
                                                                          %_1664)
                                                                   ((lambda (%_1665)
                                                                      (if '#f
                                                                        (list 'make-annotation
                                                                              (list 'if
                                                                                    (if '#f
                                                                                      (list 'make-annotation
                                                                                            %_1653
                                                                                            '#f)
                                                                                      %_1653)
                                                                                    (%_1604
                                                                                      %_1652
                                                                                      %_1649
                                                                                      (if '#f
                                                                                        (list 'make-annotation
                                                                                              %_1653
                                                                                              '#f)
                                                                                        %_1653)
                                                                                      %_1647)
                                                                                    (list 'quote
                                                                                          '#f))
                                                                              '#f)
                                                                        (list 'if
                                                                              (if '#f
                                                                                (list 'make-annotation
                                                                                      %_1653
                                                                                      '#f)
                                                                                %_1653)
                                                                              (%_1604
                                                                                %_1652
                                                                                %_1649
                                                                                (if '#f
                                                                                  (list 'make-annotation
                                                                                        %_1653
                                                                                        '#f)
                                                                                  %_1653)
                                                                                %_1647)
                                                                              (list 'quote
                                                                                    '#f))))
                                                                    %_1663)))
                                                               ($syntax-dispatch
                                                                 %_1663
                                                                 '#2(atom
                                                                     #t))))
                                                            %_1649)
                                                           (%_1604
                                                             %_1652
                                                             %_1650
                                                             (if '#f
                                                               (list 'make-annotation
                                                                     %_1653
                                                                     '#f)
                                                               %_1653)
                                                             %_1647)
                                                           (%_1606
                                                             %_1644
                                                             %_1645
                                                             %_1646
                                                             %_1647)))))
                                           (if (eq? %_1651 'any)
                                             (if '#f
                                               (list 'make-annotation
                                                     (list 'list
                                                           (if 'value
                                                             (cons 'make-annotation
                                                                   (cons %_1644
                                                                         '(value)))
                                                             %_1644))
                                                     '#f)
                                               (list 'list
                                                     (if 'value
                                                       (cons 'make-annotation
                                                             (cons %_1644
                                                                   '(value)))
                                                       %_1644)))
                                             (if '#f
                                               (list 'make-annotation
                                                     (list '$syntax-dispatch
                                                           (if 'value
                                                             (cons 'make-annotation
                                                                   (cons %_1644
                                                                         '(value)))
                                                             %_1644)
                                                           (list 'quote
                                                                 %_1651))
                                                     '#f)
                                               (list '$syntax-dispatch
                                                     (if 'value
                                                       (cons 'make-annotation
                                                             (cons %_1644
                                                                   '(value)))
                                                       %_1644)
                                                     (list 'quote %_1651)))))))
                                 (%_1371 'tmp))))))))
                    (set! %_1604
                      (lambda (%_1715 %_1716 %_1717 %_1718)
                        ((lambda (%_1719 %_1720)
                           ((lambda (%_1721 %_1722)
                              (if '#f
                                (list 'make-annotation
                                      (list 'apply
                                            (if '#f
                                              (list 'make-annotation
                                                    (list 'lambda
                                                          %_1722
                                                          (%_1352
                                                            %_1716
                                                            (%_1172
                                                              %_1721
                                                              (map (lambda (%_1729
                                                                            %_1730)
                                                                     (%_1156
                                                                       'syntax
                                                                       (cons %_1729
                                                                             %_1730)))
                                                                   %_1722
                                                                   (map cdr
                                                                        %_1715))
                                                              %_1718)
                                                            (%_1293
                                                              %_1719
                                                              %_1721
                                                              '(()))))
                                                    '#f)
                                              (list 'lambda
                                                    %_1722
                                                    (%_1352
                                                      %_1716
                                                      (%_1172
                                                        %_1721
                                                        (map (lambda (%_1727
                                                                      %_1728)
                                                               (%_1156
                                                                 'syntax
                                                                 (cons %_1727
                                                                       %_1728)))
                                                             %_1722
                                                             (map cdr %_1715))
                                                        %_1718)
                                                      (%_1293
                                                        %_1719
                                                        %_1721
                                                        '(())))))
                                            %_1717)
                                      '#f)
                                (list 'apply
                                      (if '#f
                                        (list 'make-annotation
                                              (list 'lambda
                                                    %_1722
                                                    (%_1352
                                                      %_1716
                                                      (%_1172
                                                        %_1721
                                                        (map (lambda (%_1725
                                                                      %_1726)
                                                               (%_1156
                                                                 'syntax
                                                                 (cons %_1725
                                                                       %_1726)))
                                                             %_1722
                                                             (map cdr %_1715))
                                                        %_1718)
                                                      (%_1293
                                                        %_1719
                                                        %_1721
                                                        '(()))))
                                              '#f)
                                        (list 'lambda
                                              %_1722
                                              (%_1352
                                                %_1716
                                                (%_1172
                                                  %_1721
                                                  (map (lambda (%_1723 %_1724)
                                                         (%_1156
                                                           'syntax
                                                           (cons %_1723
                                                                 %_1724)))
                                                       %_1722
                                                       (map cdr %_1715))
                                                  %_1718)
                                                (%_1293 %_1719 %_1721 '(())))))
                                      %_1717)))
                            (%_1224 %_1719)
                            (map %_1371 %_1719)))
                         (map car %_1715)
                         (map cdr %_1715))))
                    (set! %_1603
                      (lambda (%_1731 %_1732)
                        (((lambda (%_1733)
                            (begin
                              (set! %_1733
                                (lambda (%_1734 %_1735 %_1736)
                                  (if (%_1181 %_1734)
                                    (if (%_1309 %_1734 %_1732)
                                      (values (vector 'free-id %_1734) %_1736)
                                      (values
                                        'any
                                        (cons (cons %_1734 %_1735) %_1736)))
                                    ((lambda (%_1737)
                                       ((lambda (%_1738)
                                          (if (if %_1738
                                                (apply (lambda (%_1757 %_1758)
                                                         (%_1367 %_1758))
                                                       %_1738)
                                                '#f)
                                            (apply (lambda (%_1753 %_1754)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_1733
                                                           %_1753
                                                           (+ %_1735 '1)
                                                           %_1736))
                                                       (lambda (%_1755 %_1756)
                                                         (values
                                                           (if (eq? %_1755
                                                                    'any)
                                                             'each-any
                                                             (vector
                                                               'each
                                                               %_1755))
                                                           %_1756))))
                                                   %_1738)
                                            ((lambda (%_1739)
                                               (if %_1739
                                                 (apply (lambda (%_1747 %_1748)
                                                          (call-with-values
                                                            (lambda ()
                                                              (%_1733
                                                                %_1748
                                                                %_1735
                                                                %_1736))
                                                            (lambda (%_1749
                                                                     %_1750)
                                                              (call-with-values
                                                                (lambda ()
                                                                  (%_1733
                                                                    %_1747
                                                                    %_1735
                                                                    %_1750))
                                                                (lambda (%_1751
                                                                         %_1752)
                                                                  (values
                                                                    (cons %_1751
                                                                          %_1749)
                                                                    %_1752))))))
                                                        %_1739)
                                                 ((lambda (%_1740)
                                                    (if %_1740
                                                      (apply (lambda ()
                                                               (values
                                                                 '()
                                                                 %_1736))
                                                             %_1740)
                                                      ((lambda (%_1741)
                                                         (if %_1741
                                                           (apply (lambda (%_1743)
                                                                    (call-with-values
                                                                      (lambda ()
                                                                        (%_1733
                                                                          %_1743
                                                                          %_1735
                                                                          %_1736))
                                                                      (lambda (%_1745
                                                                               %_1746)
                                                                        (values
                                                                          (vector
                                                                            'vector
                                                                            %_1745)
                                                                          %_1746))))
                                                                  %_1741)
                                                           ((lambda (%_1742)
                                                              (values
                                                                (vector
                                                                  'atom
                                                                  (%_1370
                                                                    %_1734
                                                                    '(())))
                                                                %_1736))
                                                            %_1737)))
                                                       ($syntax-dispatch
                                                         %_1737
                                                         '#2(vector
                                                             each-any)))))
                                                  ($syntax-dispatch
                                                    %_1737
                                                    '()))))
                                             ($syntax-dispatch
                                               %_1737
                                               '(any . any)))))
                                        ($syntax-dispatch %_1737 '(any any))))
                                     %_1734))))
                              %_1733))
                          #f)
                         %_1731
                         '0
                         '())))
                    (lambda (%_1607 %_1608 %_1609 %_1610)
                      ((lambda (%_1611)
                         ((lambda (%_1612)
                            ((lambda (%_1613)
                               (if %_1613
                                 (apply (lambda (%_1614 %_1615 %_1616 %_1617)
                                          (if (andmap
                                                (lambda (%_1627)
                                                  (if (%_1181 %_1627)
                                                    (not (%_1367 %_1627))
                                                    '#f))
                                                %_1616)
                                            ((lambda (%_1618)
                                               (if %_1610
                                                 (list 'make-annotation
                                                       (list (if '#f
                                                               (list 'make-annotation
                                                                     (list 'lambda
                                                                           (list %_1618)
                                                                           (%_1606
                                                                             %_1618
                                                                             %_1616
                                                                             %_1617
                                                                             %_1608))
                                                                     '#f)
                                                               (list 'lambda
                                                                     (list %_1618)
                                                                     (%_1606
                                                                       %_1618
                                                                       %_1616
                                                                       %_1617
                                                                       %_1608)))
                                                             (%_1352
                                                               %_1615
                                                               %_1608
                                                               '(())))
                                                       %_1610)
                                                 (list (if '#f
                                                         (list 'make-annotation
                                                               (list 'lambda
                                                                     (list %_1618)
                                                                     (%_1606
                                                                       %_1618
                                                                       %_1616
                                                                       %_1617
                                                                       %_1608))
                                                               '#f)
                                                         (list 'lambda
                                                               (list %_1618)
                                                               (%_1606
                                                                 %_1618
                                                                 %_1616
                                                                 %_1617
                                                                 %_1608)))
                                                       (%_1352
                                                         %_1615
                                                         %_1608
                                                         '(())))))
                                             (%_1371 'tmp))
                                            (syntax-error
                                              %_1611
                                              '"invalid literals list in")))
                                        %_1613)
                                 (syntax-error %_1612)))
                             ($syntax-dispatch
                               %_1612
                               '(any any each-any . each-any))))
                          %_1611))
                       (%_1311 %_1607 %_1609 %_1610)))))
                #f
                #f
                #f
                #f))))
          (set! sc-expand
            ((lambda (%_1759 %_1760 %_1761)
               ((lambda (%_1762)
                  (lambda (%_1763)
                    (if (if (pair? %_1763)
                          (equal? (car %_1763) %_969)
                          '#f)
                      (cadr %_1763)
                      (%_1317 %_1763 '() %_1762 %_1759 %_1760 %_1761))))
                (%_1188
                  (%_1189 '((top)))
                  (cons %_1761 (%_1190 '((top)))))))
             '(l c)
             '(l)
             ((lambda (%_1764)
                (begin (%_1291 %_1764 '*top*) %_1764))
              (%_1229 '() '() '()))))
          (set! identifier?
            (lambda (%_1765) (%_1180 %_1765)))
          (set! datum->syntax-object
            (lambda (%_1766 %_1767)
              (begin
                ((lambda (%_1768)
                   (if (not (%_1180 %_1768))
                     (%_1008
                       'datum->syntax-object
                       '"invalid argument"
                       %_1768)
                     (void)))
                 %_1766)
                (%_1128 %_1767 (%_1131 %_1766)))))
          (set! syntax-object->datum
            (lambda (%_1769) (%_1370 %_1769 '(()))))
          (set! generate-temporaries
            (lambda (%_1770)
              (begin
                ((lambda (%_1771)
                   (if (not (list? %_1771))
                     (%_1008
                       'generate-temporaries
                       '"invalid argument"
                       %_1771)
                     (void)))
                 %_1770)
                (map (lambda (%_1772) (%_1310 (gensym) '((top))))
                     %_1770))))
          (set! free-identifier=?
            (lambda (%_1773 %_1774)
              (begin
                ((lambda (%_1775)
                   (if (not (%_1180 %_1775))
                     (%_1008
                       'free-identifier=?
                       '"invalid argument"
                       %_1775)
                     (void)))
                 %_1773)
                ((lambda (%_1776)
                   (if (not (%_1180 %_1776))
                     (%_1008
                       'free-identifier=?
                       '"invalid argument"
                       %_1776)
                     (void)))
                 %_1774)
                (%_1303 %_1773 %_1774))))
          (set! bound-identifier=?
            (lambda (%_1777 %_1778)
              (begin
                ((lambda (%_1779)
                   (if (not (%_1180 %_1779))
                     (%_1008
                       'bound-identifier=?
                       '"invalid argument"
                       %_1779)
                     (void)))
                 %_1777)
                ((lambda (%_1780)
                   (if (not (%_1180 %_1780))
                     (%_1008
                       'bound-identifier=?
                       '"invalid argument"
                       %_1780)
                     (void)))
                 %_1778)
                (%_1305 %_1777 %_1778))))
          (set! literal-identifier=?
            (lambda (%_1781 %_1782)
              (begin
                ((lambda (%_1783)
                   (if (not (%_1180 %_1783))
                     (%_1008
                       'literal-identifier=?
                       '"invalid argument"
                       %_1783)
                     (void)))
                 %_1781)
                ((lambda (%_1784)
                   (if (not (%_1180 %_1784))
                     (%_1008
                       'literal-identifier=?
                       '"invalid argument"
                       %_1784)
                     (void)))
                 %_1782)
                (%_1304 %_1781 %_1782))))
          (set! syntax-error
            (lambda (%_1786 . %_1785)
              (begin
                (for-each
                  (lambda (%_1787)
                    ((lambda (%_1788)
                       (if (not (string? %_1788))
                         (%_1008 'syntax-error '"invalid argument" %_1788)
                         (void)))
                     %_1787))
                  %_1785)
                ((lambda (%_1789)
                   (%_1008 '#f %_1789 (%_1370 %_1786 '(()))))
                 (if (null? %_1785)
                   '"invalid syntax"
                   (apply string-append %_1785))))))
          ((lambda ()
             ((lambda (%_1794 %_1793 %_1792 %_1791 %_1790)
                (begin
                  (set! %_1794
                    (lambda (%_1799 %_1800 %_1801 %_1802)
                      (if (not %_1802)
                        '#f
                        (if (eq? %_1800 'any)
                          (cons (%_1310 %_1799 %_1801) %_1802)
                          (if (%_1129 %_1799)
                            (%_1793
                              ((lambda (%_1804)
                                 (if (annotation? %_1804)
                                   (annotation-expression %_1804)
                                   %_1804))
                               (%_1130 %_1799))
                              %_1800
                              (%_1296 %_1801 (%_1131 %_1799))
                              %_1802)
                            (%_1793
                              ((lambda (%_1803)
                                 (if (annotation? %_1803)
                                   (annotation-expression %_1803)
                                   %_1803))
                               %_1799)
                              %_1800
                              %_1801
                              %_1802))))))
                  (set! %_1793
                    (lambda (%_1805 %_1806 %_1807 %_1808)
                      (if (null? %_1806)
                        (if (null? %_1805) %_1808 '#f)
                        (if (pair? %_1806)
                          (if (pair? %_1805)
                            (%_1794
                              (car %_1805)
                              (car %_1806)
                              %_1807
                              (%_1794 (cdr %_1805) (cdr %_1806) %_1807 %_1808))
                            '#f)
                          (if (eq? %_1806 'each-any)
                            ((lambda (%_1813)
                               (if %_1813 (cons %_1813 %_1808) '#f))
                             (%_1791 %_1805 %_1807))
                            ((lambda (%_1809)
                               (if (memv %_1809 '(each))
                                 (if (null? %_1805)
                                   (%_1792 (vector-ref %_1806 '1) %_1808)
                                   ((lambda (%_1810)
                                      (if %_1810
                                        (((lambda (%_1811)
                                            (begin
                                              (set! %_1811
                                                (lambda (%_1812)
                                                  (if (null? (car %_1812))
                                                    %_1808
                                                    (cons (map car %_1812)
                                                          (%_1811
                                                            (map cdr
                                                                 %_1812))))))
                                              %_1811))
                                          #f)
                                         %_1810)
                                        '#f))
                                    (%_1790
                                      %_1805
                                      (vector-ref %_1806 '1)
                                      %_1807)))
                                 (if (memv %_1809 '(free-id))
                                   (if (%_1181 %_1805)
                                     (if (%_1304
                                           (%_1310 %_1805 %_1807)
                                           (vector-ref %_1806 '1))
                                       %_1808
                                       '#f)
                                     '#f)
                                   (if (memv %_1809 '(atom))
                                     (if (equal?
                                           (vector-ref %_1806 '1)
                                           (%_1370 %_1805 %_1807))
                                       %_1808
                                       '#f)
                                     (if (memv %_1809 '(vector))
                                       (if (vector? %_1805)
                                         (%_1794
                                           (vector->list %_1805)
                                           (vector-ref %_1806 '1)
                                           %_1807
                                           %_1808)
                                         '#f)
                                       (void))))))
                             (vector-ref %_1806 '0)))))))
                  (set! %_1792
                    (lambda (%_1814 %_1815)
                      (if (null? %_1814)
                        %_1815
                        (if (eq? %_1814 'any)
                          (cons '() %_1815)
                          (if (pair? %_1814)
                            (%_1792
                              (car %_1814)
                              (%_1792 (cdr %_1814) %_1815))
                            (if (eq? %_1814 'each-any)
                              (cons '() %_1815)
                              ((lambda (%_1816)
                                 (if (memv %_1816 '(each))
                                   (%_1792 (vector-ref %_1814 '1) %_1815)
                                   (if (memv %_1816 '(free-id atom))
                                     %_1815
                                     (if (memv %_1816 '(vector))
                                       (%_1792 (vector-ref %_1814 '1) %_1815)
                                       (void)))))
                               (vector-ref %_1814 '0))))))))
                  (set! %_1791
                    (lambda (%_1817 %_1818)
                      (if (annotation? %_1817)
                        (%_1791 (annotation-expression %_1817) %_1818)
                        (if (pair? %_1817)
                          ((lambda (%_1819)
                             (if %_1819
                               (cons (%_1310 (car %_1817) %_1818) %_1819)
                               '#f))
                           (%_1791 (cdr %_1817) %_1818))
                          (if (null? %_1817)
                            '()
                            (if (%_1129 %_1817)
                              (%_1791
                                (%_1130 %_1817)
                                (%_1296 %_1818 (%_1131 %_1817)))
                              '#f))))))
                  (set! %_1790
                    (lambda (%_1820 %_1821 %_1822)
                      (if (annotation? %_1820)
                        (%_1790
                          (annotation-expression %_1820)
                          %_1821
                          %_1822)
                        (if (pair? %_1820)
                          ((lambda (%_1823)
                             (if %_1823
                               ((lambda (%_1824)
                                  (if %_1824 (cons %_1823 %_1824) '#f))
                                (%_1790 (cdr %_1820) %_1821 %_1822))
                               '#f))
                           (%_1794 (car %_1820) %_1821 %_1822 '()))
                          (if (null? %_1820)
                            '()
                            (if (%_1129 %_1820)
                              (%_1790
                                (%_1130 %_1820)
                                %_1821
                                (%_1296 %_1822 (%_1131 %_1820)))
                              '#f))))))
                  (set! $syntax-dispatch
                    (lambda (%_1795 %_1796)
                      (if (eq? %_1796 'any)
                        (list %_1795)
                        (if (%_1129 %_1795)
                          (%_1793
                            ((lambda (%_1798)
                               (if (annotation? %_1798)
                                 (annotation-expression %_1798)
                                 %_1798))
                             (%_1130 %_1795))
                            %_1796
                            (%_1131 %_1795)
                            '())
                          (%_1793
                            ((lambda (%_1797)
                               (if (annotation? %_1797)
                                 (annotation-expression %_1797)
                                 %_1797))
                             %_1795)
                            %_1796
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
    #f)))
($sc-put-cte
  'with-syntax
  (lambda (%_2855)
    ((lambda (%_2856)
       ((lambda (%_2857)
          (if %_2857
            (apply (lambda (%_2874 %_2875 %_2876)
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
                           (cons %_2875 %_2876)))
                   %_2857)
            ((lambda (%_2858)
               (if %_2858
                 (apply (lambda (%_2868 %_2869 %_2870 %_2871 %_2872)
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
                                %_2870
                                '()
                                (list %_2869
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
                                            (cons %_2871 %_2872)))))
                        %_2858)
                 ((lambda (%_2859)
                    (if %_2859
                      (apply (lambda (%_2860 %_2861 %_2862 %_2863 %_2864)
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
                                           %_2862)
                                     '()
                                     (list %_2861
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
                                                 (cons %_2863 %_2864)))))
                             %_2859)
                      (syntax-error %_2856)))
                  ($syntax-dispatch
                    %_2856
                    '(any #2(each (any any)) any . each-any)))))
             ($syntax-dispatch
               %_2856
               '(any ((any any)) any . each-any)))))
        ($syntax-dispatch
          %_2856
          '(any () any . each-any))))
     %_2855)))
($sc-put-cte
  'syntax-rules
  (lambda (%_2878)
    ((lambda (%_2879)
       ((lambda (%_2880)
          (if %_2880
            (apply (lambda (%_2881 %_2882 %_2883 %_2884 %_2885)
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
                                       (cons %_2882
                                             (map (lambda (%_2888 %_2887)
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
                                                                %_2887)
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
                                                                %_2888)))
                                                  %_2885
                                                  %_2884))))))
                   %_2880)
            (syntax-error %_2879)))
        ($syntax-dispatch
          %_2879
          '(any each-any . #2(each ((any . any) any))))))
     %_2878)))
($sc-put-cte
  'or
  (lambda (%_2889)
    ((lambda (%_2890)
       ((lambda (%_2891)
          (if %_2891
            (apply (lambda (%_2901)
                     '#3(syntax-object
                         #f
                         ((top)
                          #4(ribcage #1(_) #1((top)) #1("i"))
                          #4(ribcage ())
                          #4(ribcage #1(x) #1((top)) #1("i"))
                          #4(ribcage ((import-token . *top*)) ()))))
                   %_2891)
            ((lambda (%_2892)
               (if %_2892
                 (apply (lambda (%_2899 %_2900) %_2900) %_2892)
                 ((lambda (%_2893)
                    (if %_2893
                      (apply (lambda (%_2894 %_2895 %_2896 %_2897)
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
                                                 %_2895))
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
                                                 (cons %_2896 %_2897)))))
                             %_2893)
                      (syntax-error %_2890)))
                  ($syntax-dispatch
                    %_2890
                    '(any any any . each-any)))))
             ($syntax-dispatch %_2890 '(any any)))))
        ($syntax-dispatch %_2890 '(any))))
     %_2889)))
($sc-put-cte
  'and
  (lambda (%_2902)
    ((lambda (%_2903)
       ((lambda (%_2904)
          (if %_2904
            (apply (lambda (%_2910 %_2911 %_2912 %_2913)
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
                           (cons %_2911
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
                                             (cons %_2912 %_2913))
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
                   %_2904)
            ((lambda (%_2905)
               (if %_2905
                 (apply (lambda (%_2908 %_2909) %_2909) %_2905)
                 ((lambda (%_2906)
                    (if %_2906
                      (apply (lambda (%_2907)
                               '#3(syntax-object
                                   #t
                                   ((top)
                                    #4(ribcage #1(_) #1((top)) #1("i"))
                                    #4(ribcage ())
                                    #4(ribcage #1(x) #1((top)) #1("i"))
                                    #4(ribcage ((import-token . *top*)) ()))))
                             %_2906)
                      (syntax-error %_2903)))
                  ($syntax-dispatch %_2903 '(any)))))
             ($syntax-dispatch %_2903 '(any any)))))
        ($syntax-dispatch
          %_2903
          '(any any any . each-any))))
     %_2902)))
($sc-put-cte
  'let
  (lambda (%_2915)
    ((lambda (%_2916)
       ((lambda (%_2917)
          (if (if %_2917
                (apply (lambda (%_2943 %_2944 %_2945 %_2946 %_2947)
                         (andmap identifier? %_2944))
                       %_2917)
                '#f)
            (apply (lambda (%_2935 %_2936 %_2937 %_2938 %_2939)
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
                                 (cons %_2936 (cons %_2938 %_2939)))
                           %_2937))
                   %_2917)
            ((lambda (%_2918)
               (if (if %_2918
                     (apply (lambda (%_2928 %_2929 %_2930 %_2931 %_2932 %_2933)
                              (andmap identifier? (cons %_2929 %_2930)))
                            %_2918)
                     '#f)
                 (apply (lambda (%_2919 %_2920 %_2921 %_2922 %_2923 %_2924)
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
                                      (list (list %_2920
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
                                                        (cons %_2921
                                                              (cons %_2923
                                                                    %_2924)))))
                                      %_2920)
                                %_2922))
                        %_2918)
                 (syntax-error %_2916)))
             ($syntax-dispatch
               %_2916
               '(any any #2(each (any any)) any . each-any)))))
        ($syntax-dispatch
          %_2916
          '(any #2(each (any any)) any . each-any))))
     %_2915)))
($sc-put-cte
  'let*
  (lambda (%_2949)
    ((lambda (%_2950)
       ((lambda (%_2951)
          (if (if %_2951
                (apply (lambda (%_2966 %_2967 %_2968 %_2969 %_2970)
                         (andmap identifier? %_2967))
                       %_2951)
                '#f)
            (apply (lambda (%_2952 %_2953 %_2954 %_2955 %_2956)
                     (((lambda (%_2957)
                         (begin
                           (set! %_2957
                             (lambda (%_2958)
                               (if (null? %_2958)
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
                                       (cons '() (cons %_2955 %_2956)))
                                 ((lambda (%_2959)
                                    ((lambda (%_2960)
                                       (if %_2960
                                         (apply (lambda (%_2961 %_2962)
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
                                                        (list %_2962)
                                                        %_2961))
                                                %_2960)
                                         (syntax-error %_2959)))
                                     ($syntax-dispatch %_2959 '(any any))))
                                  (list (%_2957 (cdr %_2958)) (car %_2958))))))
                           %_2957))
                       #f)
                      (map list %_2953 %_2954)))
                   %_2951)
            (syntax-error %_2950)))
        ($syntax-dispatch
          %_2950
          '(any #2(each (any any)) any . each-any))))
     %_2949)))
($sc-put-cte
  'cond
  (lambda (%_2972)
    ((lambda (%_2973)
       ((lambda (%_2974)
          (if %_2974
            (apply (lambda (%_2975 %_2976 %_2977)
                     (((lambda (%_2978)
                         (begin
                           (set! %_2978
                             (lambda (%_2979 %_2980)
                               (if (null? %_2980)
                                 ((lambda (%_2995)
                                    ((lambda (%_2996)
                                       (if %_2996
                                         (apply (lambda (%_3008 %_3009)
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
                                                        (cons %_3008 %_3009)))
                                                %_2996)
                                         ((lambda (%_2997)
                                            (if %_2997
                                              (apply (lambda (%_3007)
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
                                                                               %_3007))
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
                                                     %_2997)
                                              ((lambda (%_2998)
                                                 (if %_2998
                                                   (apply (lambda (%_3005
                                                                   %_3006)
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
                                                                              %_3005))
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
                                                                        (cons %_3006
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
                                                          %_2998)
                                                   ((lambda (%_2999)
                                                      (if %_2999
                                                        (apply (lambda (%_3001
                                                                        %_3002
                                                                        %_3003)
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
                                                                       %_3001
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
                                                                             (cons %_3002
                                                                                   %_3003))))
                                                               %_2999)
                                                        ((lambda (%_3000)
                                                           (syntax-error
                                                             %_2972))
                                                         %_2995)))
                                                    ($syntax-dispatch
                                                      %_2995
                                                      '(any any . each-any)))))
                                               ($syntax-dispatch
                                                 %_2995
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
                                          ($syntax-dispatch %_2995 '(any)))))
                                     ($syntax-dispatch
                                       %_2995
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
                                  %_2979)
                                 ((lambda (%_2981)
                                    ((lambda (%_2982)
                                       ((lambda (%_2983)
                                          ((lambda (%_2984)
                                             (if %_2984
                                               (apply (lambda (%_2994)
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
                                                                          %_2994))
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
                                                                    %_2982)))
                                                      %_2984)
                                               ((lambda (%_2985)
                                                  (if %_2985
                                                    (apply (lambda (%_2992
                                                                    %_2993)
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
                                                                               %_2992))
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
                                                                         (cons %_2993
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
                                                                         %_2982)))
                                                           %_2985)
                                                    ((lambda (%_2986)
                                                       (if %_2986
                                                         (apply (lambda (%_2988
                                                                         %_2989
                                                                         %_2990)
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
                                                                        %_2988
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
                                                                              (cons %_2989
                                                                                    %_2990))
                                                                        %_2982))
                                                                %_2986)
                                                         ((lambda (%_2987)
                                                            (syntax-error
                                                              %_2972))
                                                          %_2983)))
                                                     ($syntax-dispatch
                                                       %_2983
                                                       '(any any
                                                             .
                                                             each-any)))))
                                                ($syntax-dispatch
                                                  %_2983
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
                                           ($syntax-dispatch %_2983 '(any))))
                                        %_2979))
                                     %_2981))
                                  (%_2978 (car %_2980) (cdr %_2980))))))
                           %_2978))
                       #f)
                      %_2976
                      %_2977))
                   %_2974)
            (syntax-error %_2973)))
        ($syntax-dispatch %_2973 '(any any . each-any))))
     %_2972)))
($sc-put-cte
  'do
  (lambda (%_3012)
    ((lambda (%_3013)
       ((lambda (%_3014)
          (if %_3014
            (apply (lambda (%_3015
                            %_3016
                            %_3017
                            %_3018
                            %_3019
                            %_3020
                            %_3021)
                     ((lambda (%_3022)
                        ((lambda (%_3032)
                           (if %_3032
                             (apply (lambda (%_3033)
                                      ((lambda (%_3034)
                                         ((lambda (%_3036)
                                            (if %_3036
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
                                                                  %_3016
                                                                  %_3017)
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
                                                                         %_3019)
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
                                                                           %_3021
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
                                                                                       %_3033)))))))
                                                     %_3036)
                                              ((lambda (%_3037)
                                                 (if %_3037
                                                   (apply (lambda (%_3038
                                                                   %_3039)
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
                                                                       %_3016
                                                                       %_3017)
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
                                                                        %_3019
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
                                                                              (cons %_3038
                                                                                    %_3039))
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
                                                                                %_3021
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
                                                                                            %_3033)))))))
                                                          %_3037)
                                                   (syntax-error %_3034)))
                                               ($syntax-dispatch
                                                 %_3034
                                                 '(any . each-any)))))
                                          ($syntax-dispatch %_3034 '())))
                                       %_3020))
                                    %_3032)
                             (syntax-error %_3022)))
                         ($syntax-dispatch %_3022 'each-any)))
                      (map (lambda (%_3023 %_3024)
                             ((lambda (%_3025)
                                ((lambda (%_3026)
                                   (if %_3026
                                     (apply (lambda () %_3023) %_3026)
                                     ((lambda (%_3027)
                                        (if %_3027
                                          (apply (lambda (%_3029) %_3029)
                                                 %_3027)
                                          ((lambda (%_3028)
                                             (syntax-error %_3012))
                                           %_3025)))
                                      ($syntax-dispatch %_3025 '(any)))))
                                 ($syntax-dispatch %_3025 '())))
                              %_3024))
                           %_3016
                           %_3018)))
                   %_3014)
            (syntax-error %_3013)))
        ($syntax-dispatch
          %_3013
          '(any #2(each (any any . any))
                (any . each-any)
                .
                each-any))))
     %_3012)))
($sc-put-cte
  'quasiquote
  ((lambda (%_3049
            %_3050
            %_3051
            %_3052
            %_3053
            %_3054
            %_3055
            %_3056
            %_3057)
     (begin
       (set! %_3049
         (lambda (%_3063)
           (if (identifier? %_3063)
             (free-identifier=?
               %_3063
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
       (set! %_3050
         (lambda (%_3064)
           (if (identifier? %_3064)
             (free-identifier=?
               %_3064
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
       (set! %_3051
         (lambda (%_3065)
           (if (identifier? %_3065)
             (free-identifier=?
               %_3065
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
       (set! %_3052
         (lambda (%_3066)
           ((lambda (%_3067)
              ((lambda (%_3068)
                 (if %_3068
                   (apply (lambda (%_3070) (%_3049 %_3070)) %_3068)
                   ((lambda (%_3069) '#f) %_3067)))
               ($syntax-dispatch %_3067 '(any ()))))
            %_3066)))
       (set! %_3053
         (lambda (%_3071 %_3072)
           (((lambda (%_3073)
               (begin
                 (set! %_3073
                   (lambda (%_3074)
                     (if (null? %_3074)
                       %_3072
                       (%_3054 (car %_3074) (%_3073 (cdr %_3074))))))
                 %_3073))
             #f)
            %_3071)))
       (set! %_3054
         (lambda (%_3075 %_3076)
           ((lambda (%_3077)
              ((lambda (%_3078)
                 (if %_3078
                   (apply (lambda (%_3079 %_3080)
                            ((lambda (%_3081)
                               ((lambda (%_3082)
                                  (if (if %_3082
                                        (apply (lambda (%_3098 %_3099)
                                                 (%_3049 %_3098))
                                               %_3082)
                                        '#f)
                                    (apply (lambda (%_3089 %_3090)
                                             ((lambda (%_3091)
                                                ((lambda (%_3092)
                                                   (if (if %_3092
                                                         (apply (lambda (%_3096
                                                                         %_3097)
                                                                  (%_3049
                                                                    %_3096))
                                                                %_3092)
                                                         '#f)
                                                     (apply (lambda (%_3094
                                                                     %_3095)
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
                                                                    (cons %_3095
                                                                          %_3090)))
                                                            %_3092)
                                                     ((lambda (%_3093)
                                                        (if (null? %_3090)
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
                                                                %_3079)
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
                                                                %_3079
                                                                %_3080)))
                                                      %_3091)))
                                                 ($syntax-dispatch
                                                   %_3091
                                                   '(any any))))
                                              %_3079))
                                           %_3082)
                                    ((lambda (%_3083)
                                       (if (if %_3083
                                             (apply (lambda (%_3087 %_3088)
                                                      (%_3050 %_3087))
                                                    %_3083)
                                             '#f)
                                         (apply (lambda (%_3085 %_3086)
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
                                                        (cons %_3079 %_3086)))
                                                %_3083)
                                         ((lambda (%_3084)
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
                                                  %_3079
                                                  %_3080))
                                          %_3081)))
                                     ($syntax-dispatch %_3081 '(any . any)))))
                                ($syntax-dispatch %_3081 '(any any))))
                             %_3080))
                          %_3078)
                   (syntax-error %_3077)))
               ($syntax-dispatch %_3077 '(any any))))
            (list %_3075 %_3076))))
       (set! %_3055
         (lambda (%_3100 %_3101)
           ((lambda (%_3102)
              (if (null? %_3102)
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
                (if (null? (cdr %_3102))
                  (car %_3102)
                  ((lambda (%_3103)
                     ((lambda (%_3104)
                        (if %_3104
                          (apply (lambda (%_3105)
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
                                         %_3105))
                                 %_3104)
                          (syntax-error %_3103)))
                      ($syntax-dispatch %_3103 'each-any)))
                   %_3102))))
            (((lambda (%_3107)
                (begin
                  (set! %_3107
                    (lambda (%_3108)
                      (if (null? %_3108)
                        (if (%_3052 %_3101) '() (list %_3101))
                        (if (%_3052 (car %_3108))
                          (%_3107 (cdr %_3108))
                          (cons (car %_3108) (%_3107 (cdr %_3108)))))))
                  %_3107))
              #f)
             %_3100))))
       (set! %_3056
         (lambda (%_3109)
           ((lambda (%_3110)
              ((lambda (%_3111)
                 ((lambda (%_3112)
                    ((lambda (%_3113)
                       (if (if %_3113
                             (apply (lambda (%_3144 %_3145) (%_3049 %_3144))
                                    %_3113)
                             '#f)
                         (apply (lambda (%_3141 %_3142)
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
                                        (list->vector %_3142)))
                                %_3113)
                         ((lambda (%_3114)
                            (((lambda (%_3115)
                                (begin
                                  (set! %_3115
                                    (lambda (%_3116 %_3117)
                                      ((lambda (%_3118)
                                         ((lambda (%_3119)
                                            (if (if %_3119
                                                  (apply (lambda (%_3138
                                                                  %_3139)
                                                           (%_3049 %_3138))
                                                         %_3119)
                                                  '#f)
                                              (apply (lambda (%_3135 %_3136)
                                                       (%_3117
                                                         (map (lambda (%_3137)
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
                                                                      %_3137))
                                                              %_3136)))
                                                     %_3119)
                                              ((lambda (%_3120)
                                                 (if (if %_3120
                                                       (apply (lambda (%_3133
                                                                       %_3134)
                                                                (%_3050
                                                                  %_3133))
                                                              %_3120)
                                                       '#f)
                                                   (apply (lambda (%_3130
                                                                   %_3131)
                                                            (%_3117 %_3131))
                                                          %_3120)
                                                   ((lambda (%_3121)
                                                      (if (if %_3121
                                                            (apply (lambda (%_3127
                                                                            %_3128
                                                                            %_3129)
                                                                     (%_3051
                                                                       %_3127))
                                                                   %_3121)
                                                            '#f)
                                                        (apply (lambda (%_3123
                                                                        %_3124
                                                                        %_3125)
                                                                 (%_3115
                                                                   %_3125
                                                                   (lambda (%_3126)
                                                                     (%_3117
                                                                       (cons %_3124
                                                                             %_3126)))))
                                                               %_3121)
                                                        ((lambda (%_3122)
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
                                                                 %_3111))
                                                         %_3118)))
                                                    ($syntax-dispatch
                                                      %_3118
                                                      '(any any any)))))
                                               ($syntax-dispatch
                                                 %_3118
                                                 '(any . each-any)))))
                                          ($syntax-dispatch
                                            %_3118
                                            '(any each-any))))
                                       %_3116)))
                                  %_3115))
                              #f)
                             %_3109
                             (lambda (%_3140)
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
                                     %_3140))))
                          %_3112)))
                     ($syntax-dispatch %_3112 '(any each-any))))
                  %_3111))
               %_3110))
            %_3109)))
       (set! %_3057
         (lambda (%_3146 %_3147)
           ((lambda (%_3148)
              ((lambda (%_3149)
                 (if %_3149
                   (apply (lambda (%_3169)
                            (if (= %_3147 '0)
                              %_3169
                              (%_3054
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
                                (%_3057 (list %_3169) (- %_3147 '1)))))
                          %_3149)
                   ((lambda (%_3150)
                      (if %_3150
                        (apply (lambda (%_3165 %_3166)
                                 (if (= %_3147 '0)
                                   (%_3053 %_3165 (%_3057 %_3166 %_3147))
                                   (%_3054
                                     (%_3054
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
                                       (%_3057 %_3165 (- %_3147 '1)))
                                     (%_3057 %_3166 %_3147))))
                               %_3150)
                        ((lambda (%_3151)
                           (if %_3151
                             (apply (lambda (%_3161 %_3162)
                                      (if (= %_3147 '0)
                                        (%_3055 %_3161 (%_3057 %_3162 %_3147))
                                        (%_3054
                                          (%_3054
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
                                            (%_3057 %_3161 (- %_3147 '1)))
                                          (%_3057 %_3162 %_3147))))
                                    %_3151)
                             ((lambda (%_3152)
                                (if %_3152
                                  (apply (lambda (%_3160)
                                           (%_3054
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
                                             (%_3057
                                               (list %_3160)
                                               (+ %_3147 '1))))
                                         %_3152)
                                  ((lambda (%_3153)
                                     (if %_3153
                                       (apply (lambda (%_3158 %_3159)
                                                (%_3054
                                                  (%_3057 %_3158 %_3147)
                                                  (%_3057 %_3159 %_3147)))
                                              %_3153)
                                       ((lambda (%_3154)
                                          (if %_3154
                                            (apply (lambda (%_3156)
                                                     (%_3056
                                                       (%_3057 %_3156 %_3147)))
                                                   %_3154)
                                            ((lambda (%_3155)
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
                                                     %_3155))
                                             %_3148)))
                                        ($syntax-dispatch
                                          %_3148
                                          '#2(vector each-any)))))
                                   ($syntax-dispatch %_3148 '(any . any)))))
                              ($syntax-dispatch
                                %_3148
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
                           %_3148
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
                      %_3148
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
                 %_3148
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
            %_3146)))
       (lambda (%_3058)
         ((lambda (%_3059)
            ((lambda (%_3060)
               (if %_3060
                 (apply (lambda (%_3061 %_3062) (%_3057 %_3062 '0))
                        %_3060)
                 (syntax-error %_3059)))
             ($syntax-dispatch %_3059 '(any any))))
          %_3058))))
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
  (lambda (%_3170)
    ((lambda (%_3171)
       (begin
         (set! %_3171
           (lambda (%_3181 %_3182)
             ((lambda (%_3183)
                (((lambda (%_3184)
                    (begin
                      (set! %_3184
                        (lambda ()
                          ((lambda (%_3185)
                             (if (eof-object? %_3185)
                               (begin (close-input-port %_3183) '())
                               (cons (datum->syntax-object %_3182 %_3185)
                                     (%_3184))))
                           (read %_3183))))
                      %_3184))
                  #f)))
              (open-input-file %_3181))))
         ((lambda (%_3172)
            ((lambda (%_3173)
               (if %_3173
                 (apply (lambda (%_3174 %_3175)
                          ((lambda (%_3176)
                             ((lambda (%_3177)
                                ((lambda (%_3178)
                                   (if %_3178
                                     (apply (lambda (%_3179)
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
                                                    %_3179))
                                            %_3178)
                                     (syntax-error %_3177)))
                                 ($syntax-dispatch %_3177 'each-any)))
                              (%_3171 %_3176 %_3174)))
                           (syntax-object->datum %_3175)))
                        %_3173)
                 (syntax-error %_3172)))
             ($syntax-dispatch %_3172 '(any any))))
          %_3170)))
     #f)))
($sc-put-cte
  'unquote
  (lambda (%_3186)
    ((lambda (%_3187)
       ((lambda (%_3188)
          (if %_3188
            (apply (lambda (%_3189 %_3190)
                     (syntax-error
                       %_3186
                       '"expression not valid outside of quasiquote"))
                   %_3188)
            (syntax-error %_3187)))
        ($syntax-dispatch %_3187 '(any . each-any))))
     %_3186)))
($sc-put-cte
  'unquote-splicing
  (lambda (%_3191)
    ((lambda (%_3192)
       ((lambda (%_3193)
          (if %_3193
            (apply (lambda (%_3194 %_3195)
                     (syntax-error
                       %_3191
                       '"expression not valid outside of quasiquote"))
                   %_3193)
            (syntax-error %_3192)))
        ($syntax-dispatch %_3192 '(any . each-any))))
     %_3191)))
($sc-put-cte
  'case
  (lambda (%_3196)
    ((lambda (%_3197)
       ((lambda (%_3198)
          (if %_3198
            (apply (lambda (%_3199 %_3200 %_3201 %_3202)
                     ((lambda (%_3203)
                        ((lambda (%_3230)
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
                                             %_3200))
                                 %_3230))
                         %_3203))
                      (((lambda (%_3204)
                          (begin
                            (set! %_3204
                              (lambda (%_3205 %_3206)
                                (if (null? %_3206)
                                  ((lambda (%_3217)
                                     ((lambda (%_3218)
                                        (if %_3218
                                          (apply (lambda (%_3226 %_3227)
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
                                                         (cons %_3226 %_3227)))
                                                 %_3218)
                                          ((lambda (%_3219)
                                             (if %_3219
                                               (apply (lambda (%_3221
                                                               %_3222
                                                               %_3223)
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
                                                                          %_3221))
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
                                                                    (cons %_3222
                                                                          %_3223))))
                                                      %_3219)
                                               ((lambda (%_3220)
                                                  (syntax-error %_3196))
                                                %_3217)))
                                           ($syntax-dispatch
                                             %_3217
                                             '(each-any any . each-any)))))
                                      ($syntax-dispatch
                                        %_3217
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
                                   %_3205)
                                  ((lambda (%_3207)
                                     ((lambda (%_3208)
                                        ((lambda (%_3209)
                                           ((lambda (%_3210)
                                              (if %_3210
                                                (apply (lambda (%_3212
                                                                %_3213
                                                                %_3214)
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
                                                                           %_3212))
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
                                                                     (cons %_3213
                                                                           %_3214))
                                                               %_3208))
                                                       %_3210)
                                                ((lambda (%_3211)
                                                   (syntax-error %_3196))
                                                 %_3209)))
                                            ($syntax-dispatch
                                              %_3209
                                              '(each-any any . each-any))))
                                         %_3205))
                                      %_3207))
                                   (%_3204 (car %_3206) (cdr %_3206))))))
                            %_3204))
                        #f)
                       %_3201
                       %_3202)))
                   %_3198)
            (syntax-error %_3197)))
        ($syntax-dispatch
          %_3197
          '(any any any . each-any))))
     %_3196)))
($sc-put-cte
  'identifier-syntax
  (lambda (%_3231)
    ((lambda (%_3232)
       ((lambda (%_3233)
          (if %_3233
            (apply (lambda (%_3247 %_3248)
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
                                             %_3248))
                                 (list (cons %_3247
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
                                             (cons %_3248
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
                   %_3233)
            ((lambda (%_3234)
               (if (if %_3234
                     (apply (lambda (%_3241 %_3242 %_3243 %_3244 %_3245 %_3246)
                              (if (identifier? %_3242)
                                (identifier? %_3244)
                                '#f))
                            %_3234)
                     '#f)
                 (apply (lambda (%_3235 %_3236 %_3237 %_3238 %_3239 %_3240)
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
                                                        %_3238
                                                        %_3239)
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
                                                        %_3240))
                                            (list (cons %_3236
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
                                                        (cons %_3237
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
                                            (list %_3236
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
                                                              %_3236))
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
                                                        %_3237))))))
                        %_3234)
                 (syntax-error %_3232)))
             ($syntax-dispatch
               %_3232
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
        ($syntax-dispatch %_3232 '(any any))))
     %_3231)))
