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
   ((lambda (%_1353
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
             %_1270
             %_1269
             %_1264
             %_1263
             %_1262
             %_1261
             %_1260
             %_1255
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
             %_1204
             %_1203
             %_1171
             %_1170
             %_1169
             %_1168
             %_1162
             %_1161
             %_1160
             %_1159
             %_1158
             %_1157
             %_1156
             %_1155
             %_1154
             %_1153
             %_1152
             %_1142
             %_1141
             %_1140
             %_1139
             %_1138
             %_1137
             %_1129
             %_1114
             %_1113
             %_1112
             %_1111
             %_1110
             %_1109
             %_1097
             %_1096
             %_997
             %_996
             %_995
             %_994
             %_989
             %_988
             %_987
             %_950)
      (begin
        (set! %_1353
          (lambda (%_1354)
            (((lambda (%_1355)
                (begin
                  (set! %_1355
                    (lambda (%_1356 %_1357 %_1358)
                      (if (pair? %_1356)
                        (%_1355
                          (cdr %_1356)
                          (cons (%_1291 (car %_1356) %_1358) %_1357)
                          %_1358)
                        (if (%_1162 %_1356)
                          (cons (%_1291 %_1356 %_1358) %_1357)
                          (if (null? %_1356)
                            %_1357
                            (if (%_1110 %_1356)
                              (%_1355
                                (%_1111 %_1356)
                                %_1357
                                (%_1277 %_1358 (%_1112 %_1356)))
                              (if (annotation? %_1356)
                                (%_1355
                                  (annotation-expression %_1356)
                                  %_1357
                                  %_1358)
                                (cons %_1356 %_1357))))))))
                  %_1355))
              #f)
             %_1354
             '()
             '(()))))
        (set! %_1352
          (lambda (%_1359)
            ((lambda (%_1360)
               (if (annotation? %_1360)
                 (if (annotation-source %_1360)
                   (list 'make-annotation
                         (gensym)
                         (annotation-source %_1360))
                   (gensym))
                 (if '#f
                   (list 'make-annotation (gensym) '#f)
                   (gensym))))
             (if (%_1110 %_1359) (%_1111 %_1359) %_1359))))
        (set! %_1351
          (lambda (%_1361 %_1362)
            (%_1350
              %_1361
              %_1362
              (lambda (%_1363)
                (if ((lambda (%_1364)
                       (if %_1364
                         %_1364
                         (if (pair? %_1363)
                           (annotation? (car %_1363))
                           '#f)))
                     (annotation? %_1363))
                  (%_1349 %_1363 '#f)
                  %_1363)))))
        (set! %_1350
          (lambda (%_1365 %_1366 %_1367)
            (if (memq 'top (%_1170 %_1366))
              (%_1367 %_1365)
              (((lambda (%_1368)
                  (begin
                    (set! %_1368
                      (lambda (%_1369)
                        (if (%_1110 %_1369)
                          (%_1350 (%_1111 %_1369) (%_1112 %_1369) %_1367)
                          (if (pair? %_1369)
                            ((lambda (%_1370 %_1371)
                               (if (if (eq? %_1370 (car %_1369))
                                     (eq? %_1371 (cdr %_1369))
                                     '#f)
                                 %_1369
                                 (cons %_1370 %_1371)))
                             (%_1368 (car %_1369))
                             (%_1368 (cdr %_1369)))
                            (if (vector? %_1369)
                              ((lambda (%_1372)
                                 ((lambda (%_1373)
                                    (if (andmap eq? %_1372 %_1373)
                                      %_1369
                                      (list->vector %_1373)))
                                  (map %_1368 %_1372)))
                               (vector->list %_1369))
                              %_1369)))))
                    %_1368))
                #f)
               %_1365))))
        (set! %_1349
          (lambda (%_1374 %_1375)
            (if (annotation? %_1374)
              ((lambda (%_1376)
                 (if %_1376
                   %_1376
                   (%_1349
                     (annotation-expression %_1374)
                     %_1374)))
               (annotation-stripped %_1374))
              (if (pair? %_1374)
                ((lambda (%_1377)
                   (begin
                     (if %_1375
                       (set-annotation-stripped! %_1375 %_1377)
                       (void))
                     (set-car! %_1377 (%_1349 (car %_1374) '#f))
                     (set-cdr! %_1377 (%_1349 (cdr %_1374) '#f))
                     %_1377))
                 (cons '#f '#f))
                (if (vector? %_1374)
                  ((lambda (%_1378)
                     (begin
                       (if %_1375
                         (set-annotation-stripped! %_1375 %_1378)
                         (void))
                       (((lambda (%_1379)
                           (begin
                             (set! %_1379
                               (lambda (%_1380)
                                 (if (not (< %_1380 '0))
                                   (begin
                                     (vector-set!
                                       %_1378
                                       %_1380
                                       (%_1349 (vector-ref %_1374 %_1380) '#f))
                                     (%_1379 (- %_1380 '1)))
                                   (void))))
                             %_1379))
                         #f)
                        (- (vector-length %_1374) '1))
                       %_1378))
                   (make-vector (vector-length %_1374)))
                  %_1374)))))
        (set! %_1348
          (lambda (%_1381)
            (if (%_1161 %_1381)
              (%_1285
                %_1381
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
        (set! %_1347
          (lambda ()
            (if '#f
              (list 'make-annotation (list 'void) '#f)
              (list 'void))))
        (set! %_1346
          (lambda (%_1382 %_1383 %_1384 %_1385 %_1386 %_1387)
            ((lambda (%_1388)
               ((lambda (%_1389)
                  (if %_1389
                    (apply (lambda (%_1390 %_1391 %_1392 %_1393 %_1394)
                             ((lambda (%_1395)
                                (if (not (%_1287 %_1395))
                                  (%_1289
                                    (map (lambda (%_1396)
                                           (%_1291 %_1396 %_1385))
                                         %_1395)
                                    (%_1292 %_1383 %_1385 %_1386)
                                    '"keyword")
                                  ((lambda (%_1397)
                                     ((lambda (%_1398)
                                        (%_1387
                                          (cons %_1393 %_1394)
                                          (%_1153
                                            %_1397
                                            ((lambda (%_1400 %_1401)
                                               (map (lambda (%_1402)
                                                      (%_1137
                                                        'deferred
                                                        (%_1333
                                                          %_1402
                                                          %_1401
                                                          %_1400)))
                                                    %_1392))
                                             (if %_1382 %_1398 %_1385)
                                             (%_1155 %_1384))
                                            %_1384)
                                          %_1398
                                          %_1386))
                                      (%_1274 %_1395 %_1397 %_1385)))
                                   (%_1205 %_1395))))
                              %_1391))
                           %_1389)
                    ((lambda (%_1405)
                       (syntax-error (%_1292 %_1383 %_1385 %_1386)))
                     %_1388)))
                ($syntax-dispatch
                  (make-annotation %_1388 value)
                  '(any #2(each (any any)) any . each-any))))
             %_1383)))
        (set! %_1345
          (lambda (%_1406 %_1407 %_1408 %_1409 %_1410)
            ((lambda (%_1411)
               ((lambda (%_1412)
                  (if %_1412
                    (apply (lambda (%_1413 %_1414 %_1415)
                             ((lambda (%_1416)
                                (if (not (%_1287 %_1416))
                                  (syntax-error
                                    %_1406
                                    '"invalid parameter list in")
                                  ((lambda (%_1417 %_1418)
                                     (%_1410
                                       %_1418
                                       (%_1338
                                         (cons %_1414 %_1415)
                                         %_1406
                                         (%_1154 %_1417 %_1418 %_1408)
                                         (%_1274 %_1416 %_1417 %_1409))))
                                   (%_1205 %_1416)
                                   (map %_1352 %_1416))))
                              %_1413))
                           %_1412)
                    ((lambda (%_1421)
                       (if %_1421
                         (apply (lambda (%_1422 %_1423 %_1424)
                                  ((lambda (%_1425)
                                     (if (not (%_1287 %_1425))
                                       (syntax-error
                                         %_1406
                                         '"invalid parameter list in")
                                       ((lambda (%_1426 %_1427)
                                          (%_1410
                                            (((lambda (%_1428)
                                                (begin
                                                  (set! %_1428
                                                    (lambda (%_1429 %_1430)
                                                      (if (null? %_1429)
                                                        %_1430
                                                        (%_1428
                                                          (cdr %_1429)
                                                          (cons (car %_1429)
                                                                %_1430)))))
                                                  %_1428))
                                              #f)
                                             (cdr %_1427)
                                             (car %_1427))
                                            (%_1338
                                              (cons %_1423 %_1424)
                                              %_1406
                                              (%_1154 %_1426 %_1427 %_1408)
                                              (%_1274 %_1425 %_1426 %_1409))))
                                        (%_1205 %_1425)
                                        (map %_1352 %_1425))))
                                   (%_1353 %_1422)))
                                %_1421)
                         ((lambda (%_1432) (syntax-error %_1406)) %_1411)))
                     ($syntax-dispatch
                       (make-annotation %_1411 value)
                       '(any any . each-any)))))
                ($syntax-dispatch
                  (make-annotation %_1411 value)
                  '(each-any any . each-any))))
             %_1407)))
        (set! %_1344
          (lambda (%_1433 %_1434 %_1435 %_1436)
            ((lambda (%_1437)
               ((lambda (%_1438)
                  (if (if %_1438
                        (apply (lambda (%_1439 %_1440 %_1441) (%_1162 %_1440))
                               %_1438)
                        '#f)
                    (apply (lambda (%_1442 %_1443 %_1444)
                             (%_1436 %_1443 %_1444 %_1434))
                           %_1438)
                    ((lambda (%_1445)
                       (syntax-error (%_1292 %_1433 %_1434 %_1435)))
                     %_1437)))
                ($syntax-dispatch
                  (make-annotation %_1437 value)
                  '(any any any))))
             %_1433)))
        (set! %_1343
          (lambda (%_1446 %_1447 %_1448 %_1449)
            ((lambda (%_1450)
               ((lambda (%_1451)
                  (if (if %_1451
                        (apply (lambda (%_1452 %_1453 %_1454) (%_1162 %_1453))
                               %_1451)
                        '#f)
                    (apply (lambda (%_1455 %_1456 %_1457)
                             (%_1449 %_1456 %_1457 %_1447))
                           %_1451)
                    ((lambda (%_1458)
                       (if (if %_1458
                             (apply (lambda (%_1459
                                             %_1460
                                             %_1461
                                             %_1462
                                             %_1463)
                                      (if (%_1162 %_1460)
                                        (%_1287 (%_1353 %_1461))
                                        '#f))
                                    %_1458)
                             '#f)
                         (apply (lambda (%_1464 %_1465 %_1466 %_1467 %_1468)
                                  (%_1449
                                    (%_1291 %_1465 %_1447)
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
                                          (%_1291
                                            (cons %_1466 (cons %_1467 %_1468))
                                            %_1447))
                                    '(())))
                                %_1458)
                         ((lambda (%_1470)
                            (if (if %_1470
                                  (apply (lambda (%_1471 %_1472)
                                           (%_1162 %_1472))
                                         %_1470)
                                  '#f)
                              (apply (lambda (%_1473 %_1474)
                                       (%_1449
                                         (%_1291 %_1474 %_1447)
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
                                     %_1470)
                              ((lambda (%_1475)
                                 (syntax-error (%_1292 %_1446 %_1447 %_1448)))
                               %_1450)))
                          ($syntax-dispatch
                            (make-annotation %_1450 value)
                            '(any any)))))
                     ($syntax-dispatch
                       (make-annotation %_1450 value)
                       '(any (any . any) any . each-any)))))
                ($syntax-dispatch
                  (make-annotation %_1450 value)
                  '(any any any))))
             %_1446)))
        (set! %_1342
          (lambda (%_1476 %_1477 %_1478 %_1479)
            ((lambda (%_1480)
               ((lambda (%_1481)
                  (if (if %_1481
                        (apply (lambda (%_1482 %_1483) (%_1162 %_1483))
                               %_1481)
                        '#f)
                    (apply (lambda (%_1484 %_1485)
                             (%_1479 (%_1291 %_1485 %_1477)))
                           %_1481)
                    ((lambda (%_1486)
                       (syntax-error (%_1292 %_1476 %_1477 %_1478)))
                     %_1480)))
                ($syntax-dispatch
                  (make-annotation %_1480 value)
                  '(any any))))
             %_1476)))
        (set! %_1341
          (lambda (%_1487 %_1488 %_1489 %_1490 %_1491)
            ((lambda (%_1493 %_1492)
               (begin
                 (set! %_1493
                   (lambda (%_1494 %_1495 %_1496)
                     (%_1491
                       %_1494
                       (%_1492 %_1495)
                       (map (lambda (%_1497) (%_1291 %_1497 %_1490))
                            %_1496))))
                 (set! %_1492
                   (lambda (%_1498)
                     (if (null? %_1498)
                       '()
                       (cons ((lambda (%_1499)
                                ((lambda (%_1500)
                                   (if %_1500
                                     (apply (lambda (%_1501) (%_1492 %_1501))
                                            %_1500)
                                     ((lambda (%_1503)
                                        (if (%_1162 %_1503)
                                          (%_1291 %_1503 %_1490)
                                          (syntax-error
                                            (%_1292 %_1487 %_1488 %_1489)
                                            '"invalid exports list in")))
                                      %_1499)))
                                 ($syntax-dispatch
                                   (make-annotation %_1499 value)
                                   'each-any)))
                              (car %_1498))
                             (%_1492 (cdr %_1498))))))
                 ((lambda (%_1504)
                    ((lambda (%_1505)
                       (if %_1505
                         (apply (lambda (%_1506 %_1507 %_1508)
                                  (%_1493 '#f %_1507 %_1508))
                                %_1505)
                         ((lambda (%_1511)
                            (if (if %_1511
                                  (apply (lambda (%_1512 %_1513 %_1514 %_1515)
                                           (%_1162 %_1513))
                                         %_1511)
                                  '#f)
                              (apply (lambda (%_1516 %_1517 %_1518 %_1519)
                                       (%_1493
                                         (%_1291 %_1517 %_1488)
                                         %_1518
                                         %_1519))
                                     %_1511)
                              ((lambda (%_1522)
                                 (syntax-error (%_1292 %_1487 %_1488 %_1489)))
                               %_1504)))
                          ($syntax-dispatch
                            (make-annotation %_1504 value)
                            '(any any each-any . each-any)))))
                     ($syntax-dispatch
                       (make-annotation %_1504 value)
                       '(any each-any . each-any))))
                  %_1487)))
             #f
             #f)))
        (set! %_1340
          (lambda (%_1523 %_1524)
            ((lambda (%_1525)
               (if %_1525
                 (%_1272 %_1524 %_1525)
                 (%_1327
                   (lambda (%_1526)
                     ((lambda (%_1527)
                        (begin
                          (if (not %_1527)
                            (syntax-error
                              %_1526
                              '"exported identifier not visible")
                            (void))
                          (%_1269 %_1524 %_1526 %_1527)))
                      (%_1282 %_1526 '(()))))
                   (%_1302 %_1523))))
             (%_1303 %_1523))))
        (set! %_1339
          (lambda (%_1528 %_1529 %_1530 %_1531 %_1532)
            ((lambda (%_1533)
               (begin
                 (set! %_1533
                   (lambda (%_1534 %_1535 %_1536 %_1537 %_1538)
                     (begin
                       (%_1324 %_1529 %_1535)
                       (%_1532 %_1534 %_1535 %_1536 %_1537 %_1538))))
                 (((lambda (%_1539)
                     (begin
                       (set! %_1539
                         (lambda (%_1540 %_1541 %_1542 %_1543 %_1544)
                           (if (null? %_1540)
                             (%_1533 %_1540 %_1541 %_1542 %_1543 %_1544)
                             ((lambda (%_1545 %_1546)
                                (call-with-values
                                  (lambda ()
                                    (%_1296 %_1545 %_1546 '(()) '#f %_1528))
                                  (lambda (%_1547 %_1548 %_1549 %_1550 %_1551)
                                    ((lambda (%_1552)
                                       (if (memv %_1552 '(define-form))
                                         (%_1343
                                           %_1549
                                           %_1550
                                           %_1551
                                           (lambda (%_1553 %_1554 %_1555)
                                             ((lambda (%_1556 %_1557)
                                                ((lambda (%_1558)
                                                   (begin
                                                     (%_1269
                                                       %_1528
                                                       %_1556
                                                       %_1557)
                                                     (%_1322
                                                       %_1531
                                                       %_1557
                                                       (%_1137
                                                         'lexical
                                                         %_1558))
                                                     (%_1539
                                                       (cdr %_1540)
                                                       (cons %_1556 %_1541)
                                                       (cons %_1558 %_1542)
                                                       (cons (cons %_1546
                                                                   (%_1291
                                                                     %_1554
                                                                     %_1555))
                                                             %_1543)
                                                       %_1544)))
                                                 (%_1352 %_1556)))
                                              (%_1291 %_1553 %_1555)
                                              (%_1203))))
                                         (if (memv %_1552
                                                   '(define-syntax-form))
                                           (%_1344
                                             %_1549
                                             %_1550
                                             %_1551
                                             (lambda (%_1559 %_1560 %_1561)
                                               ((lambda (%_1562 %_1563 %_1564)
                                                  (begin
                                                    (%_1269
                                                      %_1528
                                                      %_1562
                                                      %_1563)
                                                    (%_1322
                                                      %_1531
                                                      %_1563
                                                      (%_1137
                                                        'deferred
                                                        %_1564))
                                                    (%_1539
                                                      (cdr %_1540)
                                                      (cons %_1562 %_1541)
                                                      %_1542
                                                      %_1543
                                                      %_1544)))
                                                (%_1291 %_1559 %_1561)
                                                (%_1203)
                                                (%_1333
                                                  %_1560
                                                  (%_1155 %_1546)
                                                  %_1561))))
                                           (if (memv %_1552 '(module-form))
                                             ((lambda (%_1565)
                                                ((lambda (%_1566)
                                                   ((lambda ()
                                                      (%_1341
                                                        %_1549
                                                        %_1550
                                                        %_1551
                                                        %_1566
                                                        (lambda (%_1567
                                                                 %_1568
                                                                 %_1569)
                                                          (%_1339
                                                            %_1565
                                                            (%_1292
                                                              %_1549
                                                              %_1550
                                                              %_1551)
                                                            (map (lambda (%_1570)
                                                                   (cons %_1546
                                                                         %_1570))
                                                                 %_1569)
                                                            %_1531
                                                            (lambda (%_1571
                                                                     %_1572
                                                                     %_1573
                                                                     %_1574
                                                                     %_1575)
                                                              (begin
                                                                (%_1323
                                                                  %_1529
                                                                  (%_1299
                                                                    %_1568)
                                                                  %_1572)
                                                                ((lambda (%_1576
                                                                          %_1577
                                                                          %_1578
                                                                          %_1579)
                                                                   (if %_1567
                                                                     ((lambda (%_1580)
                                                                        (begin
                                                                          (%_1269
                                                                            %_1528
                                                                            %_1567
                                                                            %_1580)
                                                                          (%_1322
                                                                            %_1531
                                                                            %_1580
                                                                            (%_1137
                                                                              'module
                                                                              %_1576))
                                                                          (%_1539
                                                                            (cdr %_1540)
                                                                            (cons %_1567
                                                                                  %_1541)
                                                                            %_1577
                                                                            %_1578
                                                                            %_1579)))
                                                                      (%_1203))
                                                                     ((lambda ()
                                                                        (begin
                                                                          (%_1340
                                                                            %_1576
                                                                            %_1528)
                                                                          (%_1539
                                                                            (cdr %_1540)
                                                                            (cons %_1576
                                                                                  %_1541)
                                                                            %_1577
                                                                            %_1578
                                                                            %_1579))))))
                                                                 (%_1306
                                                                   %_1568)
                                                                 (append
                                                                   %_1573
                                                                   %_1542)
                                                                 (append
                                                                   %_1574
                                                                   %_1543)
                                                                 (append
                                                                   %_1544
                                                                   %_1575
                                                                   %_1571))))))))))
                                                 (%_1169
                                                   (%_1170 %_1550)
                                                   (cons %_1565
                                                         (%_1171 %_1550)))))
                                              (%_1210 '() '() '()))
                                             (if (memv %_1552 '(import-form))
                                               (%_1342
                                                 %_1549
                                                 %_1550
                                                 %_1551
                                                 (lambda (%_1581)
                                                   ((lambda (%_1582)
                                                      ((lambda (%_1583)
                                                         ((lambda (%_1584)
                                                            (if (memv %_1584
                                                                      '(module))
                                                              ((lambda (%_1585)
                                                                 (begin
                                                                   (if %_1548
                                                                     (%_1270
                                                                       %_1528
                                                                       %_1548)
                                                                     (void))
                                                                   (%_1340
                                                                     %_1585
                                                                     %_1528)
                                                                   (%_1539
                                                                     (cdr %_1540)
                                                                     (cons %_1585
                                                                           %_1541)
                                                                     %_1542
                                                                     %_1543
                                                                     %_1544)))
                                                               (cdr %_1583))
                                                              (if (memv %_1584
                                                                        '(displaced-lexical))
                                                                (%_1156 %_1581)
                                                                (syntax-error
                                                                  %_1581
                                                                  '"import from unknown module"))))
                                                          (car %_1583)))
                                                       (%_1159 %_1582 %_1531)))
                                                    (%_1283 %_1581 '(())))))
                                               (if (memv %_1552 '(begin-form))
                                                 ((lambda (%_1586)
                                                    ((lambda (%_1587)
                                                       (if %_1587
                                                         (apply (lambda (%_1588
                                                                         %_1589)
                                                                  (%_1539
                                                                    (((lambda (%_1590)
                                                                        (begin
                                                                          (set! %_1590
                                                                            (lambda (%_1591)
                                                                              (if (null? %_1591)
                                                                                (cdr %_1540)
                                                                                (cons (cons %_1546
                                                                                            (%_1291
                                                                                              (car %_1591)
                                                                                              %_1550))
                                                                                      (%_1590
                                                                                        (cdr %_1591))))))
                                                                          %_1590))
                                                                      #f)
                                                                     %_1589)
                                                                    %_1541
                                                                    %_1542
                                                                    %_1543
                                                                    %_1544))
                                                                %_1587)
                                                         (syntax-error
                                                           %_1586)))
                                                     ($syntax-dispatch
                                                       (make-annotation
                                                         %_1586
                                                         value)
                                                       '(any . each-any))))
                                                  %_1549)
                                                 (if (memv %_1552
                                                           '(eval-when-form))
                                                   ((lambda (%_1593)
                                                      ((lambda (%_1594)
                                                         (if %_1594
                                                           (apply (lambda (%_1595
                                                                           %_1596
                                                                           %_1597)
                                                                    (%_1539
                                                                      (if (memq 'eval
                                                                                (%_1295
                                                                                  %_1596
                                                                                  %_1550))
                                                                        (((lambda (%_1599)
                                                                            (begin
                                                                              (set! %_1599
                                                                                (lambda (%_1600)
                                                                                  (if (null? %_1600)
                                                                                    (cdr %_1540)
                                                                                    (cons (cons %_1546
                                                                                                (%_1291
                                                                                                  (car %_1600)
                                                                                                  %_1550))
                                                                                          (%_1599
                                                                                            (cdr %_1600))))))
                                                                              %_1599))
                                                                          #f)
                                                                         %_1597)
                                                                        (cdr %_1540))
                                                                      %_1541
                                                                      %_1542
                                                                      %_1543
                                                                      %_1544))
                                                                  %_1594)
                                                           (syntax-error
                                                             %_1593)))
                                                       ($syntax-dispatch
                                                         (make-annotation
                                                           %_1593
                                                           value)
                                                         '(any each-any
                                                               .
                                                               each-any))))
                                                    %_1549)
                                                   (if (memv %_1552
                                                             '(local-syntax-form))
                                                     (%_1346
                                                       %_1548
                                                       %_1549
                                                       %_1546
                                                       %_1550
                                                       %_1551
                                                       (lambda (%_1602
                                                                %_1603
                                                                %_1604
                                                                %_1605)
                                                         (%_1539
                                                           (((lambda (%_1606)
                                                               (begin
                                                                 (set! %_1606
                                                                   (lambda (%_1607)
                                                                     (if (null? %_1607)
                                                                       (cdr %_1540)
                                                                       (cons (cons %_1603
                                                                                   (%_1291
                                                                                     (car %_1607)
                                                                                     %_1604))
                                                                             (%_1606
                                                                               (cdr %_1607))))))
                                                                 %_1606))
                                                             #f)
                                                            %_1602)
                                                           %_1541
                                                           %_1542
                                                           %_1543
                                                           %_1544)))
                                                     (%_1533
                                                       (cons (cons %_1546
                                                                   (%_1292
                                                                     %_1549
                                                                     %_1550
                                                                     %_1551))
                                                             (cdr %_1540))
                                                       %_1541
                                                       %_1542
                                                       %_1543
                                                       %_1544)))))))))
                                     %_1547))))
                              (cdar %_1540)
                              (caar %_1540)))))
                       %_1539))
                   #f)
                  %_1530
                  '()
                  '()
                  '()
                  '())))
             #f)))
        (set! %_1338
          (lambda (%_1608 %_1609 %_1610 %_1611)
            ((lambda (%_1612)
               ((lambda (%_1613)
                  ((lambda (%_1614)
                     ((lambda (%_1615)
                        ((lambda ()
                           (%_1339
                             %_1613
                             %_1609
                             %_1615
                             %_1612
                             (lambda (%_1616 %_1617 %_1618 %_1619 %_1620)
                               (begin
                                 (if (null? %_1616)
                                   (syntax-error
                                     %_1609
                                     '"no expressions in body")
                                   (void))
                                 (%_1097
                                   '#f
                                   %_1618
                                   (map (lambda (%_1621)
                                          (%_1333
                                            (cdr %_1621)
                                            (car %_1621)
                                            '(())))
                                        %_1619)
                                   (%_1096
                                     '#f
                                     (map (lambda (%_1622)
                                            (%_1333
                                              (cdr %_1622)
                                              (car %_1622)
                                              '(())))
                                          (append %_1620 %_1616))))))))))
                      (map (lambda (%_1623)
                             (cons %_1612 (%_1291 %_1623 %_1614)))
                           %_1608)))
                   (%_1169
                     (%_1170 %_1611)
                     (cons %_1613 (%_1171 %_1611)))))
                (%_1210 '() '() '())))
             (cons '("placeholder" placeholder) %_1610))))
        (set! %_1337
          (lambda (%_1624 %_1625 %_1626 %_1627 %_1628 %_1629)
            ((lambda (%_1630)
               (begin
                 (set! %_1630
                   (lambda (%_1631 %_1632)
                     (if (pair? %_1631)
                       (cons (%_1630 (car %_1631) %_1632)
                             (%_1630 (cdr %_1631) %_1632))
                       (if (%_1110 %_1631)
                         ((lambda (%_1633)
                            ((lambda (%_1634 %_1635)
                               (%_1109
                                 (%_1111 %_1631)
                                 (if (if (pair? %_1634)
                                       (eq? (car %_1634) '#f)
                                       '#f)
                                   (%_1169
                                     (cdr %_1634)
                                     (if %_1629
                                       (cons %_1629 (cdr %_1635))
                                       (cdr %_1635)))
                                   (%_1169
                                     (cons %_1632 %_1634)
                                     (if %_1629
                                       (cons %_1629 (cons 'shift %_1635))
                                       (cons 'shift %_1635))))))
                             (%_1170 %_1633)
                             (%_1171 %_1633)))
                          (%_1112 %_1631))
                         (if (vector? %_1631)
                           ((lambda (%_1636)
                              ((lambda (%_1637)
                                 ((lambda ()
                                    (((lambda (%_1638)
                                        (begin
                                          (set! %_1638
                                            (lambda (%_1639)
                                              (if (= %_1639 %_1636)
                                                %_1637
                                                (begin
                                                  (vector-set!
                                                    %_1637
                                                    %_1639
                                                    (%_1630
                                                      (vector-ref
                                                        %_1631
                                                        %_1639)
                                                      %_1632))
                                                  (%_1638 (+ %_1639 '1))))))
                                          %_1638))
                                      #f)
                                     '0))))
                               (make-vector %_1636)))
                            (vector-length %_1631))
                           (if (symbol? %_1631)
                             (syntax-error
                               (%_1292 %_1625 %_1627 %_1628)
                               '"encountered raw symbol "
                               (format '"~s" %_1631)
                               '" in output of macro")
                             %_1631))))))
                 (%_1630
                   ((lambda (%_1640)
                      (if (procedure? %_1640)
                        (%_1640
                          (lambda (%_1641)
                            (begin
                              (if (not (identifier? %_1641))
                                (syntax-error
                                  %_1641
                                  '"environment argument is not an identifier")
                                (void))
                              (%_1159 (%_1283 %_1641 '(())) %_1626))))
                        %_1640))
                    (%_1624 (%_1292 %_1625 (%_1255 %_1627) %_1628)))
                   (string '#\m))))
             #f)))
        (set! %_1336
          (lambda (%_1642 %_1643 %_1644 %_1645 %_1646)
            ((lambda (%_1647)
               ((lambda (%_1648)
                  (if (if %_1648
                        (apply (lambda (%_1649 %_1650 %_1651) (%_1162 %_1650))
                               %_1648)
                        '#f)
                    (apply (lambda (%_1652 %_1653 %_1654)
                             ((lambda (%_1655)
                                ((lambda (%_1656)
                                   ((lambda (%_1657)
                                      (if (memv %_1657 '(macro!))
                                        ((lambda (%_1658 %_1659)
                                           (%_1296
                                             (%_1337
                                               (%_1139 %_1656)
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
                                                     %_1658
                                                     %_1659)
                                               %_1643
                                               '(())
                                               %_1645
                                               %_1646)
                                             %_1643
                                             '(())
                                             %_1645
                                             %_1646))
                                         (%_1291 %_1653 %_1644)
                                         (%_1291 %_1654 %_1644))
                                        (values
                                          'core
                                          (lambda (%_1660 %_1661 %_1662 %_1663)
                                            ((lambda (%_1664 %_1665)
                                               ((lambda (%_1666)
                                                  ((lambda (%_1667)
                                                     (if (memv %_1667
                                                               '(lexical))
                                                       (if %_1663
                                                         (list 'make-annotation
                                                               (list 'set!
                                                                     (%_1139
                                                                       %_1666)
                                                                     %_1664)
                                                               %_1663)
                                                         (list 'set!
                                                               (%_1139 %_1666)
                                                               %_1664))
                                                       (if (memv %_1667
                                                                 '(global))
                                                         (if %_1663
                                                           (list 'make-annotation
                                                                 (list 'set!
                                                                       (%_1139
                                                                         %_1666)
                                                                       %_1664)
                                                                 %_1663)
                                                           (list 'set!
                                                                 (%_1139
                                                                   %_1666)
                                                                 %_1664))
                                                         (if (memv %_1667
                                                                   '(displaced-lexical))
                                                           (syntax-error
                                                             (%_1291
                                                               %_1653
                                                               %_1662)
                                                             '"identifier out of context")
                                                           (syntax-error
                                                             (%_1292
                                                               %_1660
                                                               %_1662
                                                               %_1663))))))
                                                   (%_1138 %_1666)))
                                                (%_1159 %_1665 %_1661)))
                                             (%_1333 %_1654 %_1661 %_1662)
                                             (%_1283 %_1653 %_1662)))
                                          %_1642
                                          %_1644
                                          %_1645)))
                                    (%_1138 %_1656)))
                                 (%_1159 %_1655 %_1643)))
                              (%_1283 %_1653 %_1644)))
                           %_1648)
                    ((lambda (%_1668)
                       (syntax-error (%_1292 %_1642 %_1644 %_1645)))
                     %_1647)))
                ($syntax-dispatch
                  (make-annotation %_1647 value)
                  '(any any any))))
             %_1642)))
        (set! %_1335
          (lambda (%_1669 %_1670 %_1671 %_1672 %_1673)
            ((lambda (%_1674)
               ((lambda (%_1675)
                  (if %_1675
                    (apply (lambda (%_1676 %_1677)
                             (if %_1673
                               (list 'make-annotation
                                     (cons %_1669
                                           (map (lambda (%_1678)
                                                  (%_1333
                                                    %_1678
                                                    %_1671
                                                    %_1672))
                                                %_1677))
                                     %_1673)
                               (cons %_1669
                                     (map (lambda (%_1680)
                                            (%_1333 %_1680 %_1671 %_1672))
                                          %_1677))))
                           %_1675)
                    ((lambda (%_1682)
                       (syntax-error (%_1292 %_1670 %_1672 %_1673)))
                     %_1674)))
                ($syntax-dispatch
                  (make-annotation %_1674 value)
                  '(any . each-any))))
             %_1670)))
        (set! %_1334
          (lambda (%_1683 %_1684 %_1685 %_1686 %_1687 %_1688)
            ((lambda (%_1689)
               (if (memv %_1689 '(lexical))
                 (if %_1688
                   (list 'make-annotation %_1684 %_1688)
                   %_1684)
                 (if (memv %_1689 '(core))
                   (%_1684 %_1685 %_1686 %_1687 %_1688)
                   (if (memv %_1689 '(lexical-call))
                     (%_1335
                       (if (%_1129 (car %_1685))
                         (list 'make-annotation
                               %_1684
                               (%_1129 (car %_1685)))
                         %_1684)
                       %_1685
                       %_1686
                       %_1687
                       %_1688)
                     (if (memv %_1689 '(constant))
                       (list 'quote
                             (%_1351 (%_1292 %_1685 %_1687 %_1688) '(())))
                       (if (memv %_1689 '(global))
                         (if %_1688
                           (list 'make-annotation %_1684 %_1688)
                           %_1684)
                         (if (memv %_1689 '(call))
                           (%_1335
                             (%_1333 (car %_1685) %_1686 %_1687)
                             %_1685
                             %_1686
                             %_1687
                             %_1688)
                           (if (memv %_1689 '(begin-form))
                             ((lambda (%_1690)
                                ((lambda (%_1691)
                                   (if %_1691
                                     (apply (lambda (%_1692 %_1693 %_1694)
                                              (%_1293
                                                (cons %_1693 %_1694)
                                                %_1686
                                                %_1687
                                                %_1688))
                                            %_1691)
                                     (syntax-error %_1690)))
                                 ($syntax-dispatch
                                   (make-annotation %_1690 value)
                                   '(any any . each-any))))
                              %_1685)
                             (if (memv %_1689 '(local-syntax-form))
                               (%_1346
                                 %_1684
                                 %_1685
                                 %_1686
                                 %_1687
                                 %_1688
                                 %_1293)
                               (if (memv %_1689 '(eval-when-form))
                                 ((lambda (%_1696)
                                    ((lambda (%_1697)
                                       (if %_1697
                                         (apply (lambda (%_1698
                                                         %_1699
                                                         %_1700
                                                         %_1701)
                                                  (if (memq 'eval
                                                            (%_1295
                                                              %_1699
                                                              %_1687))
                                                    (%_1293
                                                      (cons %_1700 %_1701)
                                                      %_1686
                                                      %_1687
                                                      %_1688)
                                                    (%_1347)))
                                                %_1697)
                                         (syntax-error %_1696)))
                                     ($syntax-dispatch
                                       (make-annotation %_1696 value)
                                       '(any each-any any . each-any))))
                                  %_1685)
                                 (if (memv %_1689
                                           '(define-form
                                              define-syntax-form
                                              module-form
                                              import-form))
                                   (syntax-error
                                     (%_1292 %_1685 %_1687 %_1688)
                                     '"invalid context for definition")
                                   (if (memv %_1689 '(syntax))
                                     (syntax-error
                                       (%_1292 %_1685 %_1687 %_1688)
                                       '"reference to pattern variable outside syntax form")
                                     (if (memv %_1689 '(displaced-lexical))
                                       (%_1156 (%_1292 %_1685 %_1687 %_1688))
                                       (syntax-error
                                         (%_1292
                                           %_1685
                                           %_1687
                                           %_1688)))))))))))))))
             %_1683)))
        (set! %_1333
          (lambda (%_1704 %_1705 %_1706)
            (call-with-values
              (lambda () (%_1296 %_1704 %_1705 %_1706 '#f '#f))
              (lambda (%_1707 %_1708 %_1709 %_1710 %_1711)
                (%_1334
                  %_1707
                  %_1708
                  %_1709
                  %_1705
                  %_1710
                  %_1711)))))
        (set! %_1332
          (lambda (%_1712 %_1713)
            (if (memq 'e %_1712)
              (begin (%_987 (%_1713)) (%_1347))
              ((lambda (%_1714)
                 (if (memq 'r %_1712)
                   (if ((lambda (%_1715)
                          (if %_1715 %_1715 (memq 'v %_1712)))
                        (memq 'l %_1712))
                     (%_1714)
                     (%_1714))
                   (if ((lambda (%_1716)
                          (if %_1716 %_1716 (memq 'v %_1712)))
                        (memq 'l %_1712))
                     (%_1714)
                     (%_1347))))
               (if (memq 'c %_1712)
                 ((lambda (%_1717)
                    (begin (%_987 %_1717) (lambda () %_1717)))
                  (%_1713))
                 %_1713)))))
        (set! %_1331
          (lambda (%_1718 %_1719)
            (if (memq 'e %_1718)
              (%_1719)
              ((lambda (%_1720)
                 (if (memq 'v %_1718)
                   (if ((lambda (%_1721)
                          (if %_1721 %_1721 (memq 'r %_1718)))
                        (memq 'l %_1718))
                     (%_1720)
                     (%_1720))
                   (if ((lambda (%_1722)
                          (if %_1722 %_1722 (memq 'r %_1718)))
                        (memq 'l %_1718))
                     (%_1720)
                     (%_1347))))
               (if (memq 'c %_1718)
                 ((lambda (%_1723)
                    (begin (%_987 %_1723) (lambda () %_1723)))
                  (%_1719))
                 %_1719)))))
        (set! %_1330
          (lambda (%_1724 %_1725)
            (apply append
                   (map (lambda (%_1726)
                          (if %_1725
                            ((lambda (%_1727)
                               (if (memv %_1727 '(compile))
                                 '(c)
                                 (if (memv %_1727 '(load))
                                   '(l)
                                   (if (memv %_1727 '(visit))
                                     '(v)
                                     (if (memv %_1727 '(revisit)) '(r) '())))))
                             %_1726)
                            ((lambda (%_1728)
                               (if (memv %_1728 '(eval)) '(e) '()))
                             %_1726)))
                        %_1724))))
        (set! %_1329
          ((lambda (%_1729)
             (lambda (%_1730 %_1731)
               (remq '-
                     (apply append
                            (map (lambda (%_1732)
                                   ((lambda (%_1733)
                                      (map (lambda (%_1734)
                                             (cdr (assq %_1734 %_1733)))
                                           %_1730))
                                    (cdr (assq %_1732 %_1729))))
                                 %_1731)))))
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
        (set! %_1328
          (lambda (%_1735 %_1736)
            (list '$sc-put-cte
                  (list 'quote %_1735)
                  (list 'quote (%_1137 'do-import %_1736)))))
        (set! %_1327
          (lambda (%_1737 %_1738)
            ((lambda (%_1739)
               (((lambda (%_1740)
                   (begin
                     (set! %_1740
                       (lambda (%_1741)
                         (if (not (= %_1741 %_1739))
                           (begin
                             (%_1737 (vector-ref %_1738 %_1741))
                             (%_1740 (+ %_1741 '1)))
                           (void))))
                     %_1740))
                 #f)
                '0))
             (vector-length %_1738))))
        (set! %_1326
          (lambda (%_1742 %_1743)
            (((lambda (%_1744)
                (begin
                  (set! %_1744
                    (lambda (%_1745 %_1746)
                      (if (< %_1745 '0)
                        %_1746
                        (%_1744
                          (- %_1745 '1)
                          (cons (%_1742 (vector-ref %_1743 %_1745)) %_1746)))))
                  %_1744))
              #f)
             (- (vector-length %_1743) '1)
             '())))
        (set! %_1325
          (lambda (%_1747
                   %_1748
                   %_1749
                   %_1750
                   %_1751
                   %_1752
                   %_1753
                   %_1754
                   %_1755)
            ((lambda (%_1758 %_1757 %_1756)
               (begin
                 (set! %_1758
                   (lambda (%_1759 %_1760)
                     ((lambda (%_1761)
                        (map (lambda (%_1762)
                               ((lambda (%_1763)
                                  (if (not (%_1290 %_1763 %_1761))
                                    %_1762
                                    (%_1308
                                      (%_1310 %_1762)
                                      %_1763
                                      (%_1312 %_1762)
                                      (append (%_1757 %_1763) (%_1313 %_1762))
                                      (%_1314 %_1762))))
                                (%_1311 %_1762)))
                             %_1759))
                      (map (lambda (%_1764)
                             (if (pair? %_1764) (car %_1764) %_1764))
                           %_1760))))
                 (set! %_1757
                   (lambda (%_1765)
                     (((lambda (%_1766)
                         (begin
                           (set! %_1766
                             (lambda (%_1767)
                               (if (null? %_1767)
                                 '()
                                 (if (if (pair? (car %_1767))
                                       (%_1286 %_1765 (caar %_1767))
                                       '#f)
                                   (%_1299 (cdar %_1767))
                                   (%_1766 (cdr %_1767))))))
                           %_1766))
                       #f)
                      %_1751)))
                 (set! %_1756
                   (lambda (%_1768 %_1769 %_1770)
                     (begin
                       (%_1324 %_1748 %_1769)
                       (%_1323 %_1748 %_1752 %_1769)
                       (%_1755 %_1768 %_1770))))
                 (((lambda (%_1771)
                     (begin
                       (set! %_1771
                         (lambda (%_1772 %_1773 %_1774 %_1775)
                           (if (null? %_1772)
                             (%_1756 %_1774 %_1773 %_1775)
                             ((lambda (%_1776 %_1777)
                                (call-with-values
                                  (lambda ()
                                    (%_1296 %_1776 %_1777 '(()) '#f %_1747))
                                  (lambda (%_1778 %_1779 %_1780 %_1781 %_1782)
                                    ((lambda (%_1783)
                                       (if (memv %_1783 '(define-form))
                                         (%_1343
                                           %_1780
                                           %_1781
                                           %_1782
                                           (lambda (%_1784 %_1785 %_1786)
                                             ((lambda (%_1787)
                                                ((lambda (%_1788)
                                                   ((lambda (%_1789)
                                                      ((lambda ()
                                                         (begin
                                                           (%_1269
                                                             %_1747
                                                             %_1787
                                                             %_1788)
                                                           (%_1771
                                                             (cdr %_1772)
                                                             (cons %_1787
                                                                   %_1773)
                                                             (cons (%_1308
                                                                     %_1778
                                                                     %_1787
                                                                     %_1788
                                                                     %_1789
                                                                     (cons %_1777
                                                                           (%_1291
                                                                             %_1785
                                                                             %_1786)))
                                                                   %_1774)
                                                             %_1775)))))
                                                    (%_1757 %_1787)))
                                                 (%_1206)))
                                              (%_1291 %_1784 %_1786))))
                                         (if (memv %_1783
                                                   '(define-syntax-form))
                                           (%_1344
                                             %_1780
                                             %_1781
                                             %_1782
                                             (lambda (%_1790 %_1791 %_1792)
                                               ((lambda (%_1793)
                                                  ((lambda (%_1794)
                                                     ((lambda (%_1795)
                                                        ((lambda (%_1796)
                                                           ((lambda ()
                                                              (begin
                                                                (%_1322
                                                                  %_1750
                                                                  (%_1208
                                                                    %_1794)
                                                                  (cons 'deferred
                                                                        %_1796))
                                                                (%_1269
                                                                  %_1747
                                                                  %_1793
                                                                  %_1794)
                                                                (%_1771
                                                                  (cdr %_1772)
                                                                  (cons %_1793
                                                                        %_1773)
                                                                  (cons (%_1308
                                                                          %_1778
                                                                          %_1793
                                                                          %_1794
                                                                          %_1795
                                                                          %_1796)
                                                                        %_1774)
                                                                  %_1775)))))
                                                         (%_1333
                                                           %_1791
                                                           (%_1155 %_1777)
                                                           %_1792)))
                                                      (%_1757 %_1793)))
                                                   (%_1206)))
                                                (%_1291 %_1790 %_1792))))
                                           (if (memv %_1783 '(module-form))
                                             ((lambda (%_1797)
                                                ((lambda (%_1798)
                                                   ((lambda ()
                                                      (%_1341
                                                        %_1780
                                                        %_1781
                                                        %_1782
                                                        %_1798
                                                        (lambda (%_1799
                                                                 %_1800
                                                                 %_1801)
                                                          (%_1325
                                                            %_1797
                                                            (%_1292
                                                              %_1780
                                                              %_1781
                                                              %_1782)
                                                            (map (lambda (%_1802)
                                                                   (cons %_1777
                                                                         %_1802))
                                                                 %_1801)
                                                            %_1750
                                                            %_1800
                                                            (%_1299 %_1800)
                                                            %_1753
                                                            %_1754
                                                            (lambda (%_1803
                                                                     %_1804)
                                                              ((lambda (%_1805)
                                                                 ((lambda (%_1806)
                                                                    ((lambda (%_1807)
                                                                       ((lambda ()
                                                                          (if %_1799
                                                                            ((lambda (%_1808
                                                                                      %_1809)
                                                                               (begin
                                                                                 (%_1322
                                                                                   %_1750
                                                                                   (%_1208
                                                                                     %_1808)
                                                                                   (%_1137
                                                                                     'module
                                                                                     %_1805))
                                                                                 (%_1269
                                                                                   %_1747
                                                                                   %_1799
                                                                                   %_1808)
                                                                                 (%_1771
                                                                                   (cdr %_1772)
                                                                                   (cons %_1799
                                                                                         %_1773)
                                                                                   (cons (%_1308
                                                                                           %_1778
                                                                                           %_1799
                                                                                           %_1808
                                                                                           %_1809
                                                                                           %_1800)
                                                                                         %_1806)
                                                                                   %_1807)))
                                                                             (%_1206)
                                                                             (%_1757
                                                                               %_1799))
                                                                            ((lambda ()
                                                                               (begin
                                                                                 (%_1340
                                                                                   %_1805
                                                                                   %_1747)
                                                                                 (%_1771
                                                                                   (cdr %_1772)
                                                                                   (cons %_1805
                                                                                         %_1773)
                                                                                   %_1806
                                                                                   %_1807))))))))
                                                                     (append
                                                                       %_1775
                                                                       %_1804)))
                                                                  (append
                                                                    (if %_1799
                                                                      %_1803
                                                                      (%_1758
                                                                        %_1803
                                                                        %_1800))
                                                                    %_1774)))
                                                               (%_1306
                                                                 %_1800)))))))))
                                                 (%_1169
                                                   (%_1170 %_1781)
                                                   (cons %_1797
                                                         (%_1171 %_1781)))))
                                              (%_1210 '() '() '()))
                                             (if (memv %_1783 '(import-form))
                                               (%_1342
                                                 %_1780
                                                 %_1781
                                                 %_1782
                                                 (lambda (%_1810)
                                                   ((lambda (%_1811)
                                                      ((lambda (%_1812)
                                                         ((lambda (%_1813)
                                                            (if (memv %_1813
                                                                      '(module))
                                                              ((lambda (%_1814)
                                                                 (begin
                                                                   (if %_1779
                                                                     (%_1270
                                                                       %_1747
                                                                       %_1779)
                                                                     (void))
                                                                   (%_1340
                                                                     %_1814
                                                                     %_1747)
                                                                   (%_1771
                                                                     (cdr %_1772)
                                                                     (cons %_1814
                                                                           %_1773)
                                                                     (%_1758
                                                                       %_1774
                                                                       (vector->list
                                                                         (%_1302
                                                                           %_1814)))
                                                                     %_1775)))
                                                               (%_1139 %_1812))
                                                              (if (memv %_1813
                                                                        '(displaced-lexical))
                                                                (%_1156 %_1810)
                                                                (syntax-error
                                                                  %_1810
                                                                  '"import from unknown module"))))
                                                          (%_1138 %_1812)))
                                                       (%_1159 %_1811 %_1750)))
                                                    (%_1283 %_1810 '(())))))
                                               (if (memv %_1783 '(begin-form))
                                                 ((lambda (%_1815)
                                                    ((lambda (%_1816)
                                                       (if %_1816
                                                         (apply (lambda (%_1817
                                                                         %_1818)
                                                                  (%_1771
                                                                    (((lambda (%_1819)
                                                                        (begin
                                                                          (set! %_1819
                                                                            (lambda (%_1820)
                                                                              (if (null? %_1820)
                                                                                (cdr %_1772)
                                                                                (cons (cons %_1777
                                                                                            (%_1291
                                                                                              (car %_1820)
                                                                                              %_1781))
                                                                                      (%_1819
                                                                                        (cdr %_1820))))))
                                                                          %_1819))
                                                                      #f)
                                                                     %_1818)
                                                                    %_1773
                                                                    %_1774
                                                                    %_1775))
                                                                %_1816)
                                                         (syntax-error
                                                           %_1815)))
                                                     ($syntax-dispatch
                                                       (make-annotation
                                                         %_1815
                                                         value)
                                                       '(any . each-any))))
                                                  %_1780)
                                                 (if (memv %_1783
                                                           '(eval-when-form))
                                                   ((lambda (%_1822)
                                                      ((lambda (%_1823)
                                                         (if %_1823
                                                           (apply (lambda (%_1824
                                                                           %_1825
                                                                           %_1826)
                                                                    (%_1771
                                                                      (if (memq 'eval
                                                                                (%_1295
                                                                                  %_1825
                                                                                  %_1781))
                                                                        (((lambda (%_1828)
                                                                            (begin
                                                                              (set! %_1828
                                                                                (lambda (%_1829)
                                                                                  (if (null? %_1829)
                                                                                    (cdr %_1772)
                                                                                    (cons (cons %_1777
                                                                                                (%_1291
                                                                                                  (car %_1829)
                                                                                                  %_1781))
                                                                                          (%_1828
                                                                                            (cdr %_1829))))))
                                                                              %_1828))
                                                                          #f)
                                                                         %_1826)
                                                                        (cdr %_1772))
                                                                      %_1773
                                                                      %_1774
                                                                      %_1775))
                                                                  %_1823)
                                                           (syntax-error
                                                             %_1822)))
                                                       ($syntax-dispatch
                                                         (make-annotation
                                                           %_1822
                                                           value)
                                                         '(any each-any
                                                               .
                                                               each-any))))
                                                    %_1780)
                                                   (if (memv %_1783
                                                             '(local-syntax-form))
                                                     (%_1346
                                                       %_1779
                                                       %_1780
                                                       %_1777
                                                       %_1781
                                                       %_1782
                                                       (lambda (%_1831
                                                                %_1832
                                                                %_1833
                                                                %_1834)
                                                         (%_1771
                                                           (((lambda (%_1835)
                                                               (begin
                                                                 (set! %_1835
                                                                   (lambda (%_1836)
                                                                     (if (null? %_1836)
                                                                       (cdr %_1772)
                                                                       (cons (cons %_1832
                                                                                   (%_1291
                                                                                     (car %_1836)
                                                                                     %_1833))
                                                                             (%_1835
                                                                               (cdr %_1836))))))
                                                                 %_1835))
                                                             #f)
                                                            %_1831)
                                                           %_1773
                                                           %_1774
                                                           %_1775)))
                                                     (%_1756
                                                       %_1774
                                                       %_1773
                                                       (append
                                                         %_1775
                                                         (cons (cons %_1777
                                                                     (%_1292
                                                                       %_1780
                                                                       %_1781
                                                                       %_1782))
                                                               (cdr %_1772))))))))))))
                                     %_1778))))
                              (cdar %_1772)
                              (caar %_1772)))))
                       %_1771))
                   #f)
                  %_1749
                  '()
                  '()
                  '())))
             #f
             #f
             #f)))
        (set! %_1324
          (lambda (%_1837 %_1838)
            ((lambda (%_1842 %_1841 %_1840 %_1839)
               (begin
                 (set! %_1842
                   (lambda (%_1843 %_1844 %_1845)
                     ((lambda (%_1846)
                        (if %_1846
                          (if (%_1273
                                ((lambda (%_1847)
                                   ((lambda (%_1848)
                                      (if (annotation? %_1848)
                                        (annotation-expression %_1848)
                                        %_1848))
                                    (if (%_1110 %_1847)
                                      (%_1111 %_1847)
                                      %_1847)))
                                 %_1843)
                                %_1846
                                (if (symbol? %_1843)
                                  (%_1170 '((top)))
                                  (%_1170 (%_1112 %_1843))))
                            (cons %_1843 %_1845)
                            %_1845)
                          (%_1840
                            (%_1302 %_1844)
                            (lambda (%_1849 %_1850)
                              (if (%_1839 %_1849 %_1843)
                                (cons %_1849 %_1850)
                                %_1850))
                            %_1845)))
                      (%_1303 %_1844))))
                 (set! %_1841
                   (lambda (%_1851 %_1852 %_1853)
                     (if (%_1301 %_1851)
                       (if (%_1301 %_1852)
                         (call-with-values
                           (lambda ()
                             ((lambda (%_1854 %_1855)
                                (if (fx> (vector-length %_1854)
                                         (vector-length %_1855))
                                  (values %_1851 %_1855)
                                  (values %_1852 %_1854)))
                              (%_1302 %_1851)
                              (%_1302 %_1852)))
                           (lambda (%_1856 %_1857)
                             (%_1840
                               %_1857
                               (lambda (%_1858 %_1859)
                                 (%_1842 %_1858 %_1856 %_1859))
                               %_1853)))
                         (%_1842 %_1852 %_1851 %_1853))
                       (if (%_1301 %_1852)
                         (%_1842 %_1851 %_1852 %_1853)
                         (if (%_1839 %_1851 %_1852)
                           (cons %_1851 %_1853)
                           %_1853)))))
                 (set! %_1840
                   (lambda (%_1860 %_1861 %_1862)
                     ((lambda (%_1863)
                        (((lambda (%_1864)
                            (begin
                              (set! %_1864
                                (lambda (%_1865 %_1866)
                                  (if (= %_1865 %_1863)
                                    %_1866
                                    (%_1864
                                      (+ %_1865 '1)
                                      (%_1861
                                        (vector-ref %_1860 %_1865)
                                        %_1866)))))
                              %_1864))
                          #f)
                         '0
                         %_1862))
                      (vector-length %_1860))))
                 (set! %_1839
                   (lambda (%_1867 %_1868)
                     (if (symbol? %_1867)
                       (if (symbol? %_1868)
                         (eq? %_1867 %_1868)
                         (if (eq? %_1867
                                  ((lambda (%_1869)
                                     ((lambda (%_1870)
                                        (if (annotation? %_1870)
                                          (annotation-expression %_1870)
                                          %_1870))
                                      (if (%_1110 %_1869)
                                        (%_1111 %_1869)
                                        %_1869)))
                                   %_1868))
                           (%_1279
                             (%_1170 (%_1112 %_1868))
                             (%_1170 '((top))))
                           '#f))
                       (if (symbol? %_1868)
                         (if (eq? %_1868
                                  ((lambda (%_1871)
                                     ((lambda (%_1872)
                                        (if (annotation? %_1872)
                                          (annotation-expression %_1872)
                                          %_1872))
                                      (if (%_1110 %_1871)
                                        (%_1111 %_1871)
                                        %_1871)))
                                   %_1867))
                           (%_1279
                             (%_1170 (%_1112 %_1867))
                             (%_1170 '((top))))
                           '#f)
                         (%_1286 %_1867 %_1868)))))
                 (if (not (null? %_1838))
                   (((lambda (%_1873)
                       (begin
                         (set! %_1873
                           (lambda (%_1874 %_1875 %_1876)
                             (if (null? %_1875)
                               (if (not (null? %_1876))
                                 ((lambda (%_1877)
                                    (syntax-error
                                      %_1837
                                      '"duplicate definition for "
                                      (symbol->string (car %_1877))
                                      '" in"))
                                  (syntax-object->datum %_1876))
                                 (void))
                               (((lambda (%_1878)
                                   (begin
                                     (set! %_1878
                                       (lambda (%_1879 %_1880)
                                         (if (null? %_1879)
                                           (%_1873
                                             (car %_1875)
                                             (cdr %_1875)
                                             %_1880)
                                           (%_1878
                                             (cdr %_1879)
                                             (%_1841
                                               %_1874
                                               (car %_1879)
                                               %_1880)))))
                                     %_1878))
                                 #f)
                                %_1875
                                %_1876))))
                         %_1873))
                     #f)
                    (car %_1838)
                    (cdr %_1838)
                    '())
                   (void))))
             #f
             #f
             #f
             #f)))
        (set! %_1323
          (lambda (%_1881 %_1882 %_1883)
            ((lambda (%_1884)
               (begin
                 (set! %_1884
                   (lambda (%_1885 %_1886)
                     (ormap (lambda (%_1887)
                              (if (%_1301 %_1887)
                                ((lambda (%_1888)
                                   (if %_1888
                                     (%_1273
                                       ((lambda (%_1889)
                                          ((lambda (%_1890)
                                             (if (annotation? %_1890)
                                               (annotation-expression
                                                 %_1890)
                                               %_1890))
                                           (if (%_1110 %_1889)
                                             (%_1111 %_1889)
                                             %_1889)))
                                        %_1885)
                                       %_1888
                                       (%_1170 (%_1112 %_1885)))
                                     ((lambda (%_1891)
                                        (((lambda (%_1892)
                                            (begin
                                              (set! %_1892
                                                (lambda (%_1893)
                                                  (if (fx>= %_1893 '0)
                                                    ((lambda (%_1894)
                                                       (if %_1894
                                                         %_1894
                                                         (%_1892
                                                           (- %_1893 '1))))
                                                     (%_1286
                                                       %_1885
                                                       (vector-ref
                                                         %_1891
                                                         %_1893)))
                                                    '#f)))
                                              %_1892))
                                          #f)
                                         (- (vector-length %_1891) '1)))
                                      (%_1302 %_1887))))
                                 (%_1303 %_1887))
                                (%_1286 %_1885 %_1887)))
                            %_1886)))
                 (((lambda (%_1895)
                     (begin
                       (set! %_1895
                         (lambda (%_1896 %_1897)
                           (if (null? %_1896)
                             (if (not (null? %_1897))
                               (syntax-error
                                 %_1897
                                 '"missing definition for export(s)")
                               (void))
                             ((lambda (%_1898 %_1899)
                                (if (%_1884 %_1898 %_1883)
                                  (%_1895 %_1899 %_1897)
                                  (%_1895 %_1899 (cons %_1898 %_1897))))
                              (car %_1896)
                              (cdr %_1896)))))
                       %_1895))
                   #f)
                  %_1882
                  '())))
             #f)))
        (set! %_1322
          (lambda (%_1900 %_1901 %_1902)
            (set-cdr!
              %_1900
              (%_1152 %_1901 %_1902 (cdr %_1900)))))
        (set! %_1321
          (lambda (%_1903 %_1904)
            (if (null? %_1903)
              '()
              (if (%_1290 (car %_1903) %_1904)
                (%_1321 (cdr %_1903) %_1904)
                (cons (car %_1903) (%_1321 (cdr %_1903) %_1904))))))
        (set! %_1320
          (lambda (%_1905
                   %_1906
                   %_1907
                   %_1908
                   %_1909
                   %_1910
                   %_1911
                   %_1912
                   %_1913
                   %_1914)
            ((lambda (%_1915)
               (%_1325
                 %_1907
                 (%_1292 %_1905 %_1908 %_1909)
                 (map (lambda (%_1916) (cons %_1906 %_1916))
                      %_1914)
                 %_1906
                 %_1913
                 %_1915
                 %_1910
                 %_1911
                 (lambda (%_1917 %_1918)
                   (((lambda (%_1919)
                       (begin
                         (set! %_1919
                           (lambda (%_1920 %_1921 %_1922 %_1923 %_1924)
                             (if (null? %_1920)
                               (((lambda (%_1925)
                                   (begin
                                     (set! %_1925
                                       (lambda (%_1926 %_1927 %_1928)
                                         (if (null? %_1926)
                                           ((lambda (%_1929 %_1930 %_1931)
                                              (begin
                                                (for-each
                                                  (lambda (%_1932)
                                                    (apply (lambda (%_1933
                                                                    %_1934
                                                                    %_1935
                                                                    %_1936)
                                                             (if %_1934
                                                               (%_1209
                                                                 %_1934
                                                                 %_1935)
                                                               (void)))
                                                           %_1932))
                                                  %_1924)
                                                (%_1096
                                                  '#f
                                                  (list (%_1332
                                                          %_1910
                                                          (lambda ()
                                                            (if (null? %_1924)
                                                              (%_1347)
                                                              (%_1096
                                                                '#f
                                                                (map (lambda (%_1937)
                                                                       (apply (lambda (%_1938
                                                                                       %_1939
                                                                                       %_1940
                                                                                       %_1941)
                                                                                (list '$sc-put-cte
                                                                                      (list 'quote
                                                                                            %_1940)
                                                                                      (if (eq? %_1938
                                                                                               'define-syntax-form)
                                                                                        %_1941
                                                                                        (list 'quote
                                                                                              (%_1137
                                                                                                'module
                                                                                                (%_1307
                                                                                                  %_1941
                                                                                                  %_1940))))))
                                                                              %_1937))
                                                                     %_1924)))))
                                                        (%_1332
                                                          %_1910
                                                          (lambda ()
                                                            ((lambda (%_1942)
                                                               ((lambda (%_1943)
                                                                  ((lambda (%_1944)
                                                                     ((lambda ()
                                                                        (if %_1942
                                                                          (list '$sc-put-cte
                                                                                (list 'quote
                                                                                      (if (%_1279
                                                                                            (%_1170
                                                                                              (%_1112
                                                                                                %_1912))
                                                                                            (%_1170
                                                                                              '((top))))
                                                                                        %_1942
                                                                                        ((lambda (%_1945)
                                                                                           (%_1109
                                                                                             %_1942
                                                                                             (%_1169
                                                                                               %_1945
                                                                                               (list (%_1210
                                                                                                       (vector
                                                                                                         %_1942)
                                                                                                       (vector
                                                                                                         %_1945)
                                                                                                       (vector
                                                                                                         (%_997 %_1942)))))))
                                                                                         (%_1170
                                                                                           (%_1112
                                                                                             %_1912)))))
                                                                                %_1944)
                                                                          ((lambda (%_1946)
                                                                             (%_1096
                                                                               '#f
                                                                               (list (list '$sc-put-cte
                                                                                           (list 'quote
                                                                                                 %_1946)
                                                                                           %_1944)
                                                                                     (%_1328
                                                                                       %_1946
                                                                                       %_1943))))
                                                                           (%_997 'tmp))))))
                                                                   (list 'quote
                                                                         (%_1137
                                                                           'module
                                                                           (%_1307
                                                                             %_1913
                                                                             %_1943)))))
                                                                (%_997 %_1942)))
                                                             (if %_1912
                                                               ((lambda (%_1947)
                                                                  ((lambda (%_1948)
                                                                     (if (annotation?
                                                                           %_1948)
                                                                       (annotation-expression
                                                                         %_1948)
                                                                       %_1948))
                                                                   (if (%_1110
                                                                         %_1947)
                                                                     (%_1111
                                                                       %_1947)
                                                                     %_1947)))
                                                                %_1912)
                                                               '#f))))
                                                        (if (null? %_1922)
                                                          (%_1347)
                                                          (%_1096
                                                            '#f
                                                            (map (lambda (%_1949)
                                                                   (if '#f
                                                                     (list 'make-annotation
                                                                           (list 'define
                                                                                 %_1949
                                                                                 (%_1347))
                                                                           '#f)
                                                                     (list 'define
                                                                           %_1949
                                                                           (%_1347))))
                                                                 %_1922)))
                                                        (%_1097
                                                          '#f
                                                          %_1927
                                                          %_1930
                                                          (%_1096
                                                            '#f
                                                            (list (if (null? %_1922)
                                                                    (%_1347)
                                                                    (%_1096
                                                                      '#f
                                                                      (map (lambda (%_1950
                                                                                    %_1951)
                                                                             (if '#f
                                                                               (list 'make-annotation
                                                                                     (list 'set!
                                                                                           %_1950
                                                                                           %_1951)
                                                                                     '#f)
                                                                               (list 'set!
                                                                                     %_1950
                                                                                     %_1951)))
                                                                           %_1922
                                                                           %_1929)))
                                                                  (if (null? %_1931)
                                                                    (%_1347)
                                                                    (%_1096
                                                                      '#f
                                                                      %_1931)))))
                                                        (%_1347)))))
                                            (map (lambda (%_1952)
                                                   (%_1333
                                                     (cdr %_1952)
                                                     (car %_1952)
                                                     '(())))
                                                 %_1923)
                                            (map (lambda (%_1953)
                                                   (%_1333
                                                     (cdr %_1953)
                                                     (car %_1953)
                                                     '(())))
                                                 %_1928)
                                            (map (lambda (%_1954)
                                                   (%_1333
                                                     (cdr %_1954)
                                                     (car %_1954)
                                                     '(())))
                                                 %_1918))
                                           ((lambda (%_1955)
                                              ((lambda (%_1956)
                                                 (if (memv %_1956
                                                           '(define-form))
                                                   ((lambda (%_1957)
                                                      (begin
                                                        (%_1322
                                                          %_1906
                                                          (%_1208
                                                            (%_1312 %_1955))
                                                          (%_1137
                                                            'lexical
                                                            %_1957))
                                                        (%_1925
                                                          (cdr %_1926)
                                                          (cons %_1957 %_1927)
                                                          (cons (%_1314 %_1955)
                                                                %_1928))))
                                                    (%_1352 (%_1311 %_1955)))
                                                   (if (memv %_1956
                                                             '(define-syntax-form
                                                                module-form))
                                                     (%_1925
                                                       (cdr %_1926)
                                                       %_1927
                                                       %_1928)
                                                     (error 'sc-expand-internal
                                                            '"unexpected module binding type"))))
                                               (%_1310 %_1955)))
                                            (car %_1926)))))
                                     %_1925))
                                 #f)
                                %_1921
                                '()
                                '())
                               ((lambda (%_1958 %_1959)
                                  ((lambda (%_1960)
                                     (begin
                                       (set! %_1960
                                         (lambda (%_1961 %_1962 %_1963 %_1964)
                                           (((lambda (%_1965)
                                               (begin
                                                 (set! %_1965
                                                   (lambda (%_1966 %_1967)
                                                     (if (null? %_1966)
                                                       (%_1964)
                                                       (if (%_1286
                                                             (%_1311
                                                               (car %_1966))
                                                             %_1961)
                                                         (%_1963
                                                           (car %_1966)
                                                           (%_1276
                                                             (reverse %_1967)
                                                             (cdr %_1966)))
                                                         (%_1965
                                                           (cdr %_1966)
                                                           (cons (car %_1966)
                                                                 %_1967))))))
                                                 %_1965))
                                             #f)
                                            %_1962
                                            '())))
                                       (%_1960
                                         %_1958
                                         %_1921
                                         (lambda (%_1968 %_1969)
                                           ((lambda (%_1970 %_1971 %_1972)
                                              ((lambda (%_1973 %_1974)
                                                 ((lambda (%_1975)
                                                    (if (memv %_1975
                                                              '(define-form))
                                                      (begin
                                                        (%_1209 %_1971 %_1974)
                                                        (%_1919
                                                          %_1973
                                                          %_1969
                                                          (cons %_1974 %_1922)
                                                          (cons (%_1314 %_1968)
                                                                %_1923)
                                                          %_1924))
                                                      (if (memv %_1975
                                                                '(define-syntax-form))
                                                        (%_1919
                                                          %_1973
                                                          %_1969
                                                          %_1922
                                                          %_1923
                                                          (cons (list %_1970
                                                                      %_1971
                                                                      %_1974
                                                                      (%_1314
                                                                        %_1968))
                                                                %_1924))
                                                        (if (memv %_1975
                                                                  '(module-form))
                                                          ((lambda (%_1976)
                                                             (%_1919
                                                               (append
                                                                 (%_1299
                                                                   %_1976)
                                                                 %_1973)
                                                               %_1969
                                                               %_1922
                                                               %_1923
                                                               (cons (list %_1970
                                                                           %_1971
                                                                           %_1974
                                                                           %_1976)
                                                                     %_1924)))
                                                           (%_1314 %_1968))
                                                          (error 'sc-expand-internal
                                                                 '"unexpected module binding type")))))
                                                  %_1970))
                                               (append %_1972 %_1959)
                                               (%_997 ((lambda (%_1977)
                                                         ((lambda (%_1978)
                                                            (if (annotation?
                                                                  %_1978)
                                                              (annotation-expression
                                                                %_1978)
                                                              %_1978))
                                                          (if (%_1110 %_1977)
                                                            (%_1111 %_1977)
                                                            %_1977)))
                                                       %_1958))))
                                            (%_1310 %_1968)
                                            (%_1312 %_1968)
                                            (%_1313 %_1968)))
                                         (lambda ()
                                           (%_1919
                                             %_1959
                                             %_1921
                                             %_1922
                                             %_1923
                                             %_1924)))))
                                   #f))
                                (car %_1920)
                                (cdr %_1920)))))
                         %_1919))
                     #f)
                    %_1915
                    %_1917
                    '()
                    '()
                    '()))))
             (%_1299 %_1913))))
        (set! %_1319
          (lambda (%_1979 %_1980)
            (vector-set! %_1979 '5 %_1980)))
        (set! %_1318
          (lambda (%_1981 %_1982)
            (vector-set! %_1981 '4 %_1982)))
        (set! %_1317
          (lambda (%_1983 %_1984)
            (vector-set! %_1983 '3 %_1984)))
        (set! %_1316
          (lambda (%_1985 %_1986)
            (vector-set! %_1985 '2 %_1986)))
        (set! %_1315
          (lambda (%_1987 %_1988)
            (vector-set! %_1987 '1 %_1988)))
        (set! %_1314
          (lambda (%_1989) (vector-ref %_1989 '5)))
        (set! %_1313
          (lambda (%_1990) (vector-ref %_1990 '4)))
        (set! %_1312
          (lambda (%_1991) (vector-ref %_1991 '3)))
        (set! %_1311
          (lambda (%_1992) (vector-ref %_1992 '2)))
        (set! %_1310
          (lambda (%_1993) (vector-ref %_1993 '1)))
        (set! %_1309
          (lambda (%_1994)
            (if (vector? %_1994)
              (if (= (vector-length %_1994) '6)
                (eq? (vector-ref %_1994 '0) 'module-binding)
                '#f)
              '#f)))
        (set! %_1308
          (lambda (%_1995 %_1996 %_1997 %_1998 %_1999)
            (vector
              'module-binding
              %_1995
              %_1996
              %_1997
              %_1998
              %_1999)))
        (set! %_1307
          (lambda (%_2000 %_2001)
            (%_1300
              (list->vector
                (map (lambda (%_2002)
                       (%_1275 (if (pair? %_2002) (car %_2002) %_2002)))
                     %_2000))
              %_2001)))
        (set! %_1306
          (lambda (%_2003)
            (%_1300
              (list->vector
                (map (lambda (%_2004)
                       (if (pair? %_2004) (car %_2004) %_2004))
                     %_2003))
              '#f)))
        (set! %_1305
          (lambda (%_2005 %_2006)
            (vector-set! %_2005 '2 %_2006)))
        (set! %_1304
          (lambda (%_2007 %_2008)
            (vector-set! %_2007 '1 %_2008)))
        (set! %_1303
          (lambda (%_2009) (vector-ref %_2009 '2)))
        (set! %_1302
          (lambda (%_2010) (vector-ref %_2010 '1)))
        (set! %_1301
          (lambda (%_2011)
            (if (vector? %_2011)
              (if (= (vector-length %_2011) '3)
                (eq? (vector-ref %_2011 '0) 'interface)
                '#f)
              '#f)))
        (set! %_1300
          (lambda (%_2012 %_2013)
            (vector 'interface %_2012 %_2013)))
        (set! %_1299
          (lambda (%_2014)
            (((lambda (%_2015)
                (begin
                  (set! %_2015
                    (lambda (%_2016 %_2017)
                      (if (null? %_2016)
                        %_2017
                        (%_2015
                          (cdr %_2016)
                          (if (pair? (car %_2016))
                            (%_2015 (car %_2016) %_2017)
                            (cons (car %_2016) %_2017))))))
                  %_2015))
              #f)
             %_2014
             '())))
        (set! %_1298
          (lambda (%_2018 %_2019 %_2020 %_2021 %_2022 %_2023)
            (call-with-values
              (lambda ()
                (%_1296 %_2018 %_2019 %_2020 '#f %_2023))
              (lambda (%_2024 %_2025 %_2026 %_2027 %_2028)
                ((lambda (%_2029)
                   (if (memv %_2029 '(begin-form))
                     ((lambda (%_2030)
                        ((lambda (%_2031)
                           (if %_2031
                             (apply (lambda (%_2032) (%_1347)) %_2031)
                             ((lambda (%_2033)
                                (if %_2033
                                  (apply (lambda (%_2034 %_2035 %_2036)
                                           (%_1294
                                             (cons %_2035 %_2036)
                                             %_2019
                                             %_2027
                                             %_2028
                                             %_2021
                                             %_2022
                                             %_2023))
                                         %_2033)
                                  (syntax-error %_2030)))
                              ($syntax-dispatch
                                (make-annotation %_2030 value)
                                '(any any . each-any)))))
                         ($syntax-dispatch
                           (make-annotation %_2030 value)
                           '(any))))
                      %_2026)
                     (if (memv %_2029 '(local-syntax-form))
                       (%_1346
                         %_2025
                         %_2026
                         %_2019
                         %_2027
                         %_2028
                         (lambda (%_2038 %_2039 %_2040 %_2041)
                           (%_1294
                             %_2038
                             %_2039
                             %_2040
                             %_2041
                             %_2021
                             %_2022
                             %_2023)))
                       (if (memv %_2029 '(eval-when-form))
                         ((lambda (%_2042)
                            ((lambda (%_2043)
                               (if %_2043
                                 (apply (lambda (%_2044 %_2045 %_2046 %_2047)
                                          ((lambda (%_2048 %_2049)
                                             ((lambda (%_2050 %_2051)
                                                (if (if (null? %_2050)
                                                      (null? %_2051)
                                                      '#f)
                                                  (%_1347)
                                                  (%_1294
                                                    %_2049
                                                    %_2019
                                                    %_2027
                                                    %_2028
                                                    %_2050
                                                    %_2051
                                                    %_2023)))
                                              (%_1329 %_2048 %_2021)
                                              (%_1329 %_2048 %_2022)))
                                           (%_1295 %_2045 %_2027)
                                           (cons %_2046 %_2047)))
                                        %_2043)
                                 (syntax-error %_2042)))
                             ($syntax-dispatch
                               (make-annotation %_2042 value)
                               '(any each-any any . each-any))))
                          %_2026)
                         (if (memv %_2029 '(define-syntax-form))
                           (%_1344
                             %_2026
                             %_2027
                             %_2028
                             (lambda (%_2054 %_2055 %_2056)
                               ((lambda (%_2057)
                                  (begin
                                    ((lambda (%_2058)
                                       ((lambda (%_2059)
                                          ((lambda (%_2060)
                                             (if (memv %_2060
                                                       '(displaced-lexical))
                                               (%_1156 %_2057)
                                               (void)))
                                           (%_1138 %_2059)))
                                        (%_1159 %_2058 %_2019)))
                                     (%_1283 %_2057 '(())))
                                    (%_1332
                                      %_2021
                                      (lambda ()
                                        (list '$sc-put-cte
                                              (list 'quote
                                                    ((lambda (%_2061)
                                                       (if (%_1279
                                                             (%_1170
                                                               (%_1112 %_2057))
                                                             (%_1170 '((top))))
                                                         %_2061
                                                         ((lambda (%_2062)
                                                            (%_1109
                                                              %_2061
                                                              (%_1169
                                                                %_2062
                                                                (list (%_1210
                                                                        (vector
                                                                          %_2061)
                                                                        (vector
                                                                          %_2062)
                                                                        (vector
                                                                          (%_997 %_2061)))))))
                                                          (%_1170
                                                            (%_1112 %_2057)))))
                                                     ((lambda (%_2063)
                                                        ((lambda (%_2064)
                                                           (if (annotation?
                                                                 %_2064)
                                                             (annotation-expression
                                                               %_2064)
                                                             %_2064))
                                                         (if (%_1110 %_2063)
                                                           (%_1111 %_2063)
                                                           %_2063)))
                                                      %_2057)))
                                              (%_1333
                                                %_2055
                                                (%_1155 %_2019)
                                                %_2056))))))
                                (%_1291 %_2054 %_2056))))
                           (if (memv %_2029 '(define-form))
                             (%_1343
                               %_2026
                               %_2027
                               %_2028
                               (lambda (%_2065 %_2066 %_2067)
                                 ((lambda (%_2068)
                                    (begin
                                      ((lambda (%_2069)
                                         ((lambda (%_2070)
                                            ((lambda (%_2071)
                                               (if (memv %_2071
                                                         '(displaced-lexical))
                                                 (%_1156 %_2068)
                                                 (void)))
                                             (%_1138 %_2070)))
                                          (%_1159 %_2069 %_2019)))
                                       (%_1283 %_2068 '(())))
                                      ((lambda (%_2072)
                                         ((lambda (%_2073)
                                            (%_1096
                                              '#f
                                              (list (%_1332
                                                      %_2021
                                                      (lambda ()
                                                        (list '$sc-put-cte
                                                              (list 'quote
                                                                    (if (eq? %_2072
                                                                             %_2073)
                                                                      %_2072
                                                                      ((lambda (%_2074)
                                                                         (%_1109
                                                                           %_2072
                                                                           (%_1169
                                                                             %_2074
                                                                             (list (%_1210
                                                                                     (vector
                                                                                       %_2072)
                                                                                     (vector
                                                                                       %_2074)
                                                                                     (vector
                                                                                       %_2073))))))
                                                                       (%_1170
                                                                         (%_1112
                                                                           %_2068)))))
                                                              (list 'quote
                                                                    (%_1137
                                                                      'global
                                                                      %_2073)))))
                                                    (%_1331
                                                      %_2022
                                                      (lambda ()
                                                        (if %_2028
                                                          (list 'make-annotation
                                                                (list 'define
                                                                      %_2073
                                                                      (%_1333
                                                                        %_2066
                                                                        %_2019
                                                                        %_2067))
                                                                %_2028)
                                                          (list 'define
                                                                %_2073
                                                                (%_1333
                                                                  %_2066
                                                                  %_2019
                                                                  %_2067))))))))
                                          (if (%_1279
                                                (%_1170 (%_1112 %_2068))
                                                (%_1170 '((top))))
                                            %_2072
                                            (%_997 %_2072))))
                                       ((lambda (%_2075)
                                          ((lambda (%_2076)
                                             (if (annotation? %_2076)
                                               (annotation-expression
                                                 %_2076)
                                               %_2076))
                                           (if (%_1110 %_2075)
                                             (%_1111 %_2075)
                                             %_2075)))
                                        %_2068))))
                                  (%_1291 %_2065 %_2067))))
                             (if (memv %_2029 '(module-form))
                               ((lambda (%_2077 %_2078)
                                  (%_1341
                                    %_2026
                                    %_2027
                                    %_2028
                                    (%_1169
                                      (%_1170 %_2027)
                                      (cons %_2078 (%_1171 %_2027)))
                                    (lambda (%_2079 %_2080 %_2081)
                                      (if %_2079
                                        (begin
                                          ((lambda (%_2082)
                                             ((lambda (%_2083)
                                                ((lambda (%_2084)
                                                   (if (memv %_2084
                                                             '(displaced-lexical))
                                                     (%_1156
                                                       (%_1291 %_2079 %_2027))
                                                     (void)))
                                                 (%_1138 %_2083)))
                                              (%_1159 %_2082 %_2077)))
                                           (%_1283 %_2079 '(())))
                                          (%_1320
                                            %_2026
                                            %_2077
                                            %_2078
                                            %_2027
                                            %_2028
                                            %_2021
                                            %_2022
                                            %_2079
                                            %_2080
                                            %_2081))
                                        (%_1320
                                          %_2026
                                          %_2077
                                          %_2078
                                          %_2027
                                          %_2028
                                          %_2021
                                          %_2022
                                          '#f
                                          %_2080
                                          %_2081)))))
                                (cons '("top-level module placeholder"
                                        placeholder)
                                      %_2019)
                                (%_1210 '() '() '()))
                               (if (memv %_2029 '(import-form))
                                 (%_1342
                                   %_2026
                                   %_2027
                                   %_2028
                                   (lambda (%_2085)
                                     (%_1332
                                       %_2021
                                       (lambda ()
                                         (begin
                                           (if %_2025
                                             (syntax-error
                                               (%_1292 %_2026 %_2027 %_2028)
                                               '"not valid at top-level")
                                             (void))
                                           ((lambda (%_2086)
                                              ((lambda (%_2087)
                                                 (if (memv %_2087 '(module))
                                                   (%_1328
                                                     %_2085
                                                     (%_1303 (%_1139 %_2086)))
                                                   (if (memv %_2087
                                                             '(displaced-lexical))
                                                     (%_1156 %_2085)
                                                     (syntax-error
                                                       %_2085
                                                       '"import from unknown module"))))
                                               (%_1138 %_2086)))
                                            (%_1159
                                              (%_1283 %_2085 '(()))
                                              '())))))))
                                 (%_1331
                                   %_2022
                                   (lambda ()
                                     (%_1334
                                       %_2024
                                       %_2025
                                       %_2026
                                       %_2019
                                       %_2027
                                       %_2028)))))))))))
                 %_2024)))))
        (set! %_1297
          (lambda (%_2088 %_2089 %_2090 %_2091)
            (call-with-values
              (lambda ()
                (%_1296 %_2088 %_2089 %_2090 '#f %_2091))
              (lambda (%_2092 %_2093 %_2094 %_2095 %_2096)
                (%_1334
                  %_2092
                  %_2093
                  %_2094
                  %_2089
                  %_2095
                  %_2096)))))
        (set! %_1296
          (lambda (%_2097 %_2098 %_2099 %_2100 %_2101)
            (if (symbol? %_2097)
              ((lambda (%_2102)
                 ((lambda (%_2103)
                    ((lambda (%_2104)
                       ((lambda ()
                          ((lambda (%_2105)
                             (if (memv %_2105 '(lexical))
                               (values
                                 %_2104
                                 (%_1139 %_2103)
                                 %_2097
                                 %_2099
                                 %_2100)
                               (if (memv %_2105 '(global))
                                 (values
                                   %_2104
                                   (%_1139 %_2103)
                                   %_2097
                                   %_2099
                                   %_2100)
                                 (if (memv %_2105 '(macro macro!))
                                   (%_1296
                                     (%_1337
                                       (%_1139 %_2103)
                                       %_2097
                                       %_2098
                                       %_2099
                                       %_2100
                                       %_2101)
                                     %_2098
                                     '(())
                                     '#f
                                     %_2101)
                                   (values
                                     %_2104
                                     (%_1139 %_2103)
                                     %_2097
                                     %_2099
                                     %_2100)))))
                           %_2104))))
                     (%_1138 %_2103)))
                  (%_1159 %_2102 %_2098)))
               (%_1283 %_2097 %_2099))
              (if (pair? %_2097)
                ((lambda (%_2106)
                   (if (%_1162 %_2106)
                     ((lambda (%_2107)
                        ((lambda (%_2108)
                           ((lambda (%_2109)
                              ((lambda ()
                                 ((lambda (%_2110)
                                    (if (memv %_2110 '(lexical))
                                      (values
                                        'lexical-call
                                        (%_1139 %_2108)
                                        %_2097
                                        %_2099
                                        %_2100)
                                      (if (memv %_2110 '(macro macro!))
                                        (%_1296
                                          (%_1337
                                            (%_1139 %_2108)
                                            %_2097
                                            %_2098
                                            %_2099
                                            %_2100
                                            %_2101)
                                          %_2098
                                          '(())
                                          '#f
                                          %_2101)
                                        (if (memv %_2110 '(core))
                                          (values
                                            %_2109
                                            (%_1139 %_2108)
                                            %_2097
                                            %_2099
                                            %_2100)
                                          (if (memv %_2110 '(local-syntax))
                                            (values
                                              'local-syntax-form
                                              (%_1139 %_2108)
                                              %_2097
                                              %_2099
                                              %_2100)
                                            (if (memv %_2110 '(begin))
                                              (values
                                                'begin-form
                                                '#f
                                                %_2097
                                                %_2099
                                                %_2100)
                                              (if (memv %_2110 '(eval-when))
                                                (values
                                                  'eval-when-form
                                                  '#f
                                                  %_2097
                                                  %_2099
                                                  %_2100)
                                                (if (memv %_2110 '(define))
                                                  (values
                                                    'define-form
                                                    '#f
                                                    %_2097
                                                    %_2099
                                                    %_2100)
                                                  (if (memv %_2110
                                                            '(define-syntax))
                                                    (values
                                                      'define-syntax-form
                                                      '#f
                                                      %_2097
                                                      %_2099
                                                      %_2100)
                                                    (if (memv %_2110
                                                              '(module-key))
                                                      (values
                                                        'module-form
                                                        '#f
                                                        %_2097
                                                        %_2099
                                                        %_2100)
                                                      (if (memv %_2110
                                                                '(import))
                                                        (values
                                                          'import-form
                                                          (if (%_1139 %_2108)
                                                            (%_1291
                                                              %_2106
                                                              %_2099)
                                                            '#f)
                                                          %_2097
                                                          %_2099
                                                          %_2100)
                                                        (if (memv %_2110
                                                                  '(set!))
                                                          (%_1336
                                                            %_2097
                                                            %_2098
                                                            %_2099
                                                            %_2100
                                                            %_2101)
                                                          (values
                                                            'call
                                                            '#f
                                                            %_2097
                                                            %_2099
                                                            %_2100)))))))))))))
                                  %_2109))))
                            (%_1138 %_2108)))
                         (%_1159 %_2107 %_2098)))
                      (%_1283 %_2106 %_2099))
                     (values 'call '#f %_2097 %_2099 %_2100)))
                 (car %_2097))
                (if (%_1110 %_2097)
                  (%_1296
                    (%_1111 %_2097)
                    %_2098
                    (%_1277 %_2099 (%_1112 %_2097))
                    '#f
                    %_2101)
                  (if (annotation? %_2097)
                    (%_1296
                      (annotation-expression %_2097)
                      %_2098
                      %_2099
                      (annotation-source %_2097)
                      %_2101)
                    (if ((lambda (%_2111) (not (pair? %_2111))) %_2097)
                      (values 'constant '#f %_2097 %_2099 %_2100)
                      (values 'other '#f %_2097 %_2099 %_2100))))))))
        (set! %_1295
          (lambda (%_2112 %_2113)
            (map (lambda (%_2114)
                   (if (%_1285
                         %_2114
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
                     (if (%_1285
                           %_2114
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
                       (if (%_1285
                             %_2114
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
                         (if (%_1285
                               %_2114
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
                           (if (%_1285
                                 %_2114
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
                               (%_1291 %_2114 %_2113)
                               '"invalid eval-when situation")))))))
                 %_2112)))
        (set! %_1294
          (lambda (%_2115
                   %_2116
                   %_2117
                   %_2118
                   %_2119
                   %_2120
                   %_2121)
            (%_1096
              %_2118
              (((lambda (%_2122)
                  (begin
                    (set! %_2122
                      (lambda (%_2123 %_2124 %_2125 %_2126 %_2127)
                        (if (null? %_2123)
                          '()
                          ((lambda (%_2128)
                             (cons %_2128
                                   (%_2122
                                     (cdr %_2123)
                                     %_2124
                                     %_2125
                                     %_2126
                                     %_2127)))
                           (%_1298
                             (car %_2123)
                             %_2124
                             %_2125
                             %_2126
                             %_2127
                             %_2121)))))
                    %_2122))
                #f)
               %_2115
               %_2116
               %_2117
               %_2119
               %_2120))))
        (set! %_1293
          (lambda (%_2129 %_2130 %_2131 %_2132)
            (%_1096
              %_2132
              (((lambda (%_2133)
                  (begin
                    (set! %_2133
                      (lambda (%_2134 %_2135 %_2136)
                        (if (null? %_2134)
                          '()
                          ((lambda (%_2137)
                             (cons %_2137 (%_2133 (cdr %_2134) %_2135 %_2136)))
                           (%_1333 (car %_2134) %_2135 %_2136)))))
                    %_2133))
                #f)
               %_2129
               %_2130
               %_2131))))
        (set! %_1292
          (lambda (%_2138 %_2139 %_2140)
            (%_1291
              (if %_2140
                (make-annotation %_2138 %_2140 '#f)
                %_2138)
              %_2139)))
        (set! %_1291
          (lambda (%_2141 %_2142)
            (if (if (null? (%_1170 %_2142))
                  (null? (%_1171 %_2142))
                  '#f)
              %_2141
              (if (%_1110 %_2141)
                (%_1109
                  (%_1111 %_2141)
                  (%_1277 %_2142 (%_1112 %_2141)))
                (if (null? %_2141) %_2141 (%_1109 %_2141 %_2142))))))
        (set! %_1290
          (lambda (%_2143 %_2144)
            (if (not (null? %_2144))
              ((lambda (%_2145)
                 (if %_2145 %_2145 (%_1290 %_2143 (cdr %_2144))))
               (%_1286 %_2143 (car %_2144)))
              '#f)))
        (set! %_1289
          (lambda (%_2146 %_2147 %_2148)
            (((lambda (%_2149)
                (begin
                  (set! %_2149
                    (lambda (%_2150 %_2151)
                      (if (null? %_2150)
                        (syntax-error %_2147)
                        (if (%_1162 (car %_2150))
                          (if (%_1290 (car %_2150) %_2151)
                            (syntax-error (car %_2150) '"duplicate " %_2148)
                            (%_2149 (cdr %_2150) (cons (car %_2150) %_2151)))
                          (syntax-error (car %_2150) '"invalid " %_2148)))))
                  %_2149))
              #f)
             %_2146
             '())))
        (set! %_1288
          (lambda (%_2152)
            (((lambda (%_2153)
                (begin
                  (set! %_2153
                    (lambda (%_2154)
                      ((lambda (%_2155)
                         (if %_2155
                           %_2155
                           (if (not (%_1290 (car %_2154) (cdr %_2154)))
                             (%_2153 (cdr %_2154))
                             '#f)))
                       (null? %_2154))))
                  %_2153))
              #f)
             %_2152)))
        (set! %_1287
          (lambda (%_2156)
            (if (((lambda (%_2157)
                    (begin
                      (set! %_2157
                        (lambda (%_2158)
                          ((lambda (%_2159)
                             (if %_2159
                               %_2159
                               (if (%_1162 (car %_2158))
                                 (%_2157 (cdr %_2158))
                                 '#f)))
                           (null? %_2158))))
                      %_2157))
                  #f)
                 %_2156)
              (%_1288 %_2156)
              '#f)))
        (set! %_1286
          (lambda (%_2160 %_2161)
            (if (if (%_1110 %_2160) (%_1110 %_2161) '#f)
              (if (eq? ((lambda (%_2162)
                          (if (annotation? %_2162)
                            (annotation-expression %_2162)
                            %_2162))
                        (%_1111 %_2160))
                       ((lambda (%_2163)
                          (if (annotation? %_2163)
                            (annotation-expression %_2163)
                            %_2163))
                        (%_1111 %_2161)))
                (%_1279
                  (%_1170 (%_1112 %_2160))
                  (%_1170 (%_1112 %_2161)))
                '#f)
              (eq? ((lambda (%_2164)
                      (if (annotation? %_2164)
                        (annotation-expression %_2164)
                        %_2164))
                    %_2160)
                   ((lambda (%_2165)
                      (if (annotation? %_2165)
                        (annotation-expression %_2165)
                        %_2165))
                    %_2161)))))
        (set! %_1285
          (lambda (%_2166 %_2167)
            (if (eq? ((lambda (%_2168)
                        ((lambda (%_2169)
                           (if (annotation? %_2169)
                             (annotation-expression %_2169)
                             %_2169))
                         (if (%_1110 %_2168) (%_1111 %_2168) %_2168)))
                      %_2166)
                     ((lambda (%_2170)
                        ((lambda (%_2171)
                           (if (annotation? %_2171)
                             (annotation-expression %_2171)
                             %_2171))
                         (if (%_1110 %_2170) (%_1111 %_2170) %_2170)))
                      %_2167))
              ((lambda (%_2172 %_2173)
                 ((lambda (%_2174)
                    (if %_2174
                      %_2174
                      (if ((lambda (%_2175)
                             (if %_2175 %_2175 (symbol? %_2172)))
                           (not %_2172))
                        ((lambda (%_2176)
                           (if %_2176 %_2176 (symbol? %_2173)))
                         (not %_2173))
                        '#f)))
                  (eq? %_2172 %_2173)))
               (%_1283 %_2166 '(()))
               (%_1283 %_2167 '(())))
              '#f)))
        (set! %_1284
          (lambda (%_2177 %_2178)
            (if (eq? ((lambda (%_2179)
                        ((lambda (%_2180)
                           (if (annotation? %_2180)
                             (annotation-expression %_2180)
                             %_2180))
                         (if (%_1110 %_2179) (%_1111 %_2179) %_2179)))
                      %_2177)
                     ((lambda (%_2181)
                        ((lambda (%_2182)
                           (if (annotation? %_2182)
                             (annotation-expression %_2182)
                             %_2182))
                         (if (%_1110 %_2181) (%_1111 %_2181) %_2181)))
                      %_2178))
              (eq? (%_1283 %_2177 '(())) (%_1283 %_2178 '(())))
              '#f)))
        (set! %_1283
          (lambda (%_2183 %_2184)
            (call-with-values
              (lambda () (%_1280 %_2183 %_2184))
              (lambda (%_2185 %_2186)
                (if (%_1207 %_2185) (%_1208 %_2185) %_2185)))))
        (set! %_1282
          (lambda (%_2187 %_2188)
            (call-with-values
              (lambda () (%_1280 %_2187 %_2188))
              (lambda (%_2189 %_2190) %_2189))))
        (set! %_1281
          (lambda (%_2191 %_2192)
            (call-with-values
              (lambda () (%_1280 %_2191 %_2192))
              (lambda (%_2193 %_2194)
                (values
                  (if (%_1207 %_2193) (%_1208 %_2193) %_2193)
                  %_2194)))))
        (set! %_1280
          (lambda (%_2195 %_2196)
            ((lambda (%_2199 %_2198 %_2197)
               (begin
                 (set! %_2199
                   (lambda (%_2200 %_2201 %_2202 %_2203 %_2204)
                     ((lambda (%_2205)
                        (((lambda (%_2206)
                            (begin
                              (set! %_2206
                                (lambda (%_2207)
                                  (if (= %_2207 %_2205)
                                    (%_2197 %_2200 (cdr %_2201) %_2202)
                                    (if (if (eq? (vector-ref %_2203 %_2207)
                                                 %_2200)
                                          (%_1279
                                            %_2202
                                            (vector-ref
                                              (%_1213 %_2204)
                                              %_2207))
                                          '#f)
                                      (values
                                        (vector-ref (%_1214 %_2204) %_2207)
                                        %_2202)
                                      (%_2206 (+ %_2207 '1))))))
                              %_2206))
                          #f)
                         '0))
                      (vector-length %_2203))))
                 (set! %_2198
                   (lambda (%_2208 %_2209 %_2210 %_2211 %_2212)
                     (((lambda (%_2213)
                         (begin
                           (set! %_2213
                             (lambda (%_2214 %_2215)
                               (if (null? %_2214)
                                 (%_2197 %_2208 (cdr %_2209) %_2210)
                                 (if (if (eq? (car %_2214) %_2208)
                                       (%_1279
                                         %_2210
                                         (list-ref (%_1213 %_2212) %_2215))
                                       '#f)
                                   (values
                                     (list-ref (%_1214 %_2212) %_2215)
                                     %_2210)
                                   (if (%_1263 (car %_2214))
                                     ((lambda (%_2216)
                                        (if %_2216
                                          ((lambda (%_2217)
                                             (if (symbol? %_2217)
                                               (values %_2217 %_2210)
                                               (%_1281 %_2217 '(()))))
                                           %_2216)
                                          (%_2213 (cdr %_2214) %_2215)))
                                      (%_1273
                                        %_2208
                                        (%_1264 (car %_2214))
                                        %_2210))
                                     (if (if (eq? (car %_2214) %_1260)
                                           (%_1279
                                             %_2210
                                             (list-ref (%_1213 %_2212) %_2215))
                                           '#f)
                                       (values '#f %_2210)
                                       (%_2213
                                         (cdr %_2214)
                                         (+ %_2215 '1))))))))
                           %_2213))
                       #f)
                      %_2211
                      '0)))
                 (set! %_2197
                   (lambda (%_2218 %_2219 %_2220)
                     (if (null? %_2219)
                       (values %_2218 %_2220)
                       ((lambda (%_2221)
                          (if (eq? %_2221 'shift)
                            (%_2197 %_2218 (cdr %_2219) (cdr %_2220))
                            ((lambda (%_2222)
                               (if (vector? %_2222)
                                 (%_2199 %_2218 %_2219 %_2220 %_2222 %_2221)
                                 (%_2198 %_2218 %_2219 %_2220 %_2222 %_2221)))
                             (%_1212 %_2221))))
                        (car %_2219)))))
                 (if (symbol? %_2195)
                   (%_2197 %_2195 (%_1171 %_2196) (%_1170 %_2196))
                   (if (%_1110 %_2195)
                     ((lambda (%_2223 %_2224)
                        ((lambda (%_2225)
                           (call-with-values
                             (lambda ()
                               (%_2197 %_2223 (%_1171 %_2196) %_2225))
                             (lambda (%_2226 %_2227)
                               (if (eq? %_2226 %_2223)
                                 (%_2197 %_2223 (%_1171 %_2224) %_2227)
                                 (values %_2226 %_2227)))))
                         (%_1278 (%_1170 %_2196) (%_1170 %_2224))))
                      ((lambda (%_2228)
                         (if (annotation? %_2228)
                           (annotation-expression %_2228)
                           %_2228))
                       (%_1111 %_2195))
                      (%_1112 %_2195))
                     (if (annotation? %_2195)
                       (%_2197
                         ((lambda (%_2229)
                            (if (annotation? %_2229)
                              (annotation-expression %_2229)
                              %_2229))
                          %_2195)
                         (%_1171 %_2196)
                         (%_1170 %_2196))
                       (%_989 'id-var-name '"invalid id" %_2195))))))
             #f
             #f
             #f)))
        (set! %_1279
          (lambda (%_2230 %_2231)
            ((lambda (%_2232)
               (if %_2232
                 %_2232
                 (if (not (null? %_2230))
                   (if (not (null? %_2231))
                     (if (eq? (car %_2230) (car %_2231))
                       (%_1279 (cdr %_2230) (cdr %_2231))
                       '#f)
                     '#f)
                   '#f)))
             (eq? %_2230 %_2231))))
        (set! %_1278
          (lambda (%_2233 %_2234) (%_1276 %_2233 %_2234)))
        (set! %_1277
          (lambda (%_2235 %_2236)
            ((lambda (%_2237 %_2238)
               (if (null? %_2237)
                 (if (null? %_2238)
                   %_2236
                   (%_1169
                     (%_1170 %_2236)
                     (%_1276 %_2238 (%_1171 %_2236))))
                 (%_1169
                   (%_1276 %_2237 (%_1170 %_2236))
                   (%_1276 %_2238 (%_1171 %_2236)))))
             (%_1170 %_2235)
             (%_1171 %_2235))))
        (set! %_1276
          (lambda (%_2239 %_2240)
            (if (null? %_2240) %_2239 (append %_2239 %_2240))))
        (set! %_1275
          (lambda (%_2241)
            (call-with-values
              (lambda () (%_1281 %_2241 '(())))
              (lambda (%_2242 %_2243)
                (begin
                  (if (not %_2242)
                    (syntax-error
                      %_2241
                      '"identifier not visible for export")
                    (void))
                  ((lambda (%_2244)
                     (%_1109
                       %_2244
                       (%_1169
                         %_2243
                         (list (%_1210
                                 (vector %_2244)
                                 (vector %_2243)
                                 (vector %_2242))))))
                   ((lambda (%_2245)
                      ((lambda (%_2246)
                         (if (annotation? %_2246)
                           (annotation-expression %_2246)
                           %_2246))
                       (if (%_1110 %_2245) (%_1111 %_2245) %_2245)))
                    %_2241)))))))
        (set! %_1274
          (lambda (%_2247 %_2248 %_2249)
            (if (null? %_2247)
              %_2249
              (%_1169
                (%_1170 %_2249)
                (cons ((lambda (%_2250)
                         ((lambda (%_2251)
                            ((lambda (%_2252 %_2253)
                               (begin
                                 (((lambda (%_2254)
                                     (begin
                                       (set! %_2254
                                         (lambda (%_2255 %_2256)
                                           (if (not (null? %_2255))
                                             (call-with-values
                                               (lambda ()
                                                 (%_1168 (car %_2255) %_2249))
                                               (lambda (%_2257 %_2258)
                                                 (begin
                                                   (vector-set!
                                                     %_2252
                                                     %_2256
                                                     %_2257)
                                                   (vector-set!
                                                     %_2253
                                                     %_2256
                                                     %_2258)
                                                   (%_2254
                                                     (cdr %_2255)
                                                     (+ %_2256 '1)))))
                                             (void))))
                                       %_2254))
                                   #f)
                                  %_2247
                                  '0)
                                 (%_1210 %_2252 %_2253 %_2250)))
                             (make-vector %_2251)
                             (make-vector %_2251)))
                          (vector-length %_2250)))
                       (list->vector %_2248))
                      (%_1171 %_2249))))))
        (set! %_1273
          (lambda (%_2259 %_2260 %_2261)
            ((lambda (%_2262)
               (if %_2262
                 (((lambda (%_2263)
                     (begin
                       (set! %_2263
                         (lambda (%_2264)
                           (if (pair? %_2264)
                             ((lambda (%_2265)
                                (if %_2265 %_2265 (%_2263 (cdr %_2264))))
                              (%_2263 (car %_2264)))
                             (if (%_1279 %_2261 (%_1170 (%_1112 %_2264)))
                               %_2264
                               '#f))))
                       %_2263))
                   #f)
                  %_2262)
                 '#f))
             (%_996 %_2259 %_2260))))
        (set! %_1272
          (lambda (%_2266 %_2267)
            (%_1215
              %_2266
              (cons (%_1262 %_2267) (%_1212 %_2266)))))
        (set! %_1271
          (lambda (%_2268 %_2269)
            (begin
              (%_1215 %_2268 (cons %_1260 (%_1212 %_2268)))
              (%_1216
                %_2268
                (cons (%_1170 %_2269) (%_1213 %_2268))))))
        (set! %_1270
          (lambda (%_2270 %_2271)
            (%_1271 %_2270 (%_1112 %_2271))))
        (set! %_1269
          (lambda (%_2272 %_2273 %_2274)
            (begin
              (%_1215
                %_2272
                (cons ((lambda (%_2275)
                         (if (annotation? %_2275)
                           (annotation-expression %_2275)
                           %_2275))
                       (%_1111 %_2273))
                      (%_1212 %_2272)))
              (%_1216
                %_2272
                (cons (%_1170 (%_1112 %_2273)) (%_1213 %_2272)))
              (%_1217 %_2272 (cons %_2274 (%_1214 %_2272))))))
        (set! %_1264 cdr)
        (set! %_1263
          (lambda (%_2276)
            (if (pair? %_2276) (eq? (car %_2276) %_1261) '#f)))
        (set! %_1262
          (lambda (%_2277) (cons %_1261 %_2277)))
        (set! %_1261 'import-token)
        (set! %_1260 '#f)
        (set! %_1255
          (lambda (%_2278)
            (%_1169
              (cons '#f (%_1170 %_2278))
              (cons 'shift (%_1171 %_2278)))))
        (set! %_1217
          (lambda (%_2279 %_2280)
            (vector-set! %_2279 '3 %_2280)))
        (set! %_1216
          (lambda (%_2281 %_2282)
            (vector-set! %_2281 '2 %_2282)))
        (set! %_1215
          (lambda (%_2283 %_2284)
            (vector-set! %_2283 '1 %_2284)))
        (set! %_1214
          (lambda (%_2285) (vector-ref %_2285 '3)))
        (set! %_1213
          (lambda (%_2286) (vector-ref %_2286 '2)))
        (set! %_1212
          (lambda (%_2287) (vector-ref %_2287 '1)))
        (set! %_1211
          (lambda (%_2288)
            (if (vector? %_2288)
              (if (= (vector-length %_2288) '4)
                (eq? (vector-ref %_2288 '0) 'ribcage)
                '#f)
              '#f)))
        (set! %_1210
          (lambda (%_2289 %_2290 %_2291)
            (vector 'ribcage %_2289 %_2290 %_2291)))
        (set! %_1209 set-car!)
        (set! %_1208 car)
        (set! %_1207 pair?)
        (set! %_1206 (lambda () (list (%_1203))))
        (set! %_1205
          (lambda (%_2292)
            (if (null? %_2292)
              '()
              (cons (%_1203) (%_1205 (cdr %_2292))))))
        (set! %_1204
          (lambda (%_2293)
            ((lambda (%_2294)
               (if %_2294
                 %_2294
                 ((lambda (%_2295)
                    (if %_2295 %_2295 (%_1207 %_2293)))
                  (symbol? %_2293))))
             (string? %_2293))))
        (set! %_1203 (lambda () (string '#\i)))
        (set! %_1171 cdr)
        (set! %_1170 car)
        (set! %_1169 cons)
        (set! %_1168
          (lambda (%_2296 %_2297)
            (if (%_1110 %_2296)
              (values
                ((lambda (%_2298)
                   (if (annotation? %_2298)
                     (annotation-expression %_2298)
                     %_2298))
                 (%_1111 %_2296))
                (%_1278 (%_1170 %_2297) (%_1170 (%_1112 %_2296))))
              (values
                ((lambda (%_2299)
                   (if (annotation? %_2299)
                     (annotation-expression %_2299)
                     %_2299))
                 %_2296)
                (%_1170 %_2297)))))
        (set! %_1162
          (lambda (%_2300)
            (if (symbol? %_2300)
              '#t
              (if (%_1110 %_2300)
                (symbol?
                  ((lambda (%_2301)
                     (if (annotation? %_2301)
                       (annotation-expression %_2301)
                       %_2301))
                   (%_1111 %_2300)))
                (if (annotation? %_2300)
                  (symbol? (annotation-expression %_2300))
                  '#f)))))
        (set! %_1161
          (lambda (%_2302)
            (if (%_1110 %_2302)
              (symbol?
                ((lambda (%_2303)
                   (if (annotation? %_2303)
                     (annotation-expression %_2303)
                     %_2303))
                 (%_1111 %_2302)))
              '#f)))
        (set! %_1160
          (lambda (%_2304 %_2305 %_2306)
            (%_994 %_2305 (%_1137 %_2304 %_2306))))
        (set! %_1159
          (lambda (%_2307 %_2308)
            ((lambda (%_2309)
               (begin
                 (set! %_2309
                   (lambda (%_2310 %_2311)
                     (begin
                       (%_1140 %_2310 (%_1138 %_2311))
                       (%_1141 %_2310 (%_1139 %_2311)))))
                 ((lambda (%_2312)
                    ((lambda (%_2313)
                       (if (memv %_2313 '(deferred))
                         (begin
                           (%_2309
                             %_2312
                             ((lambda (%_2314)
                                ((lambda (%_2315)
                                   (if %_2315
                                     %_2315
                                     (syntax-error
                                       %_2314
                                       '"invalid transformer")))
                                 (%_1158 %_2314)))
                              (%_988 (%_1139 %_2312))))
                           ((lambda (%_2316) %_2312) (%_1138 %_2312)))
                         %_2312))
                     (%_1138 %_2312)))
                  (%_1157 %_2307 %_2308))))
             #f)))
        (set! %_1158
          (lambda (%_2317)
            (if (procedure? %_2317)
              (%_1137 'macro %_2317)
              (if (%_1142 %_2317)
                ((lambda (%_2318)
                   (if (memv %_2318 '(core macro macro!))
                     (if (procedure? (%_1139 %_2317)) %_2317 '#f)
                     (if (memv %_2318 '(module))
                       (if (%_1301 (%_1139 %_2317)) %_2317 '#f)
                       %_2317)))
                 (%_1138 %_2317))
                '#f))))
        (set! %_1157
          (lambda (%_2319 %_2320)
            ((lambda (%_2321)
               (if %_2321
                 (cdr %_2321)
                 (if (symbol? %_2319)
                   ((lambda (%_2322)
                      (if %_2322 %_2322 (%_1137 'global %_2319)))
                    (%_995 %_2319))
                   (%_1137 'displaced-lexical '#f))))
             (assq %_2319 %_2320))))
        (set! %_1156
          (lambda (%_2323)
            (syntax-error
              %_2323
              (if (%_1283 %_2323 '(()))
                '"identifier out of context"
                '"identifier not visible"))))
        (set! %_1155
          (lambda (%_2324)
            (if (null? %_2324)
              '()
              ((lambda (%_2325)
                 (if (eq? (cadr %_2325) 'lexical)
                   (%_1155 (cdr %_2324))
                   (cons %_2325 (%_1155 (cdr %_2324)))))
               (car %_2324)))))
        (set! %_1154
          (lambda (%_2326 %_2327 %_2328)
            (if (null? %_2326)
              %_2328
              (%_1154
                (cdr %_2326)
                (cdr %_2327)
                (%_1152
                  (car %_2326)
                  (%_1137 'lexical (car %_2327))
                  %_2328)))))
        (set! %_1153
          (lambda (%_2329 %_2330 %_2331)
            (if (null? %_2329)
              %_2331
              (%_1153
                (cdr %_2329)
                (cdr %_2330)
                (%_1152 (car %_2329) (car %_2330) %_2331)))))
        (set! %_1152
          (lambda (%_2332 %_2333 %_2334)
            (cons (cons %_2332 %_2333) %_2334)))
        (set! %_1142
          (lambda (%_2335)
            (if (pair? %_2335) (symbol? (car %_2335)) '#f)))
        (set! %_1141 set-cdr!)
        (set! %_1140 set-car!)
        (set! %_1139 cdr)
        (set! %_1138 car)
        (set! %_1137
          (lambda (%_2336 %_2337) (cons %_2336 %_2337)))
        (set! %_1129
          (lambda (%_2338)
            (if (annotation? %_2338)
              (annotation-source %_2338)
              (if (%_1110 %_2338) (%_1129 (%_1111 %_2338)) '#f))))
        (set! %_1114
          (lambda (%_2339 %_2340)
            (vector-set! %_2339 '2 %_2340)))
        (set! %_1113
          (lambda (%_2341 %_2342)
            (vector-set! %_2341 '1 %_2342)))
        (set! %_1112
          (lambda (%_2343) (vector-ref %_2343 '2)))
        (set! %_1111
          (lambda (%_2344) (vector-ref %_2344 '1)))
        (set! %_1110
          (lambda (%_2345)
            (if (vector? %_2345)
              (if (= (vector-length %_2345) '3)
                (eq? (vector-ref %_2345 '0) 'syntax-object)
                '#f)
              '#f)))
        (set! %_1109
          (lambda (%_2346 %_2347)
            (vector 'syntax-object %_2346 %_2347)))
        (set! %_1097
          (lambda (%_2348 %_2349 %_2350 %_2351)
            (if (null? %_2349)
              (if %_2348
                (list 'make-annotation %_2351 %_2348)
                %_2351)
              (if %_2348
                (list 'make-annotation
                      (cons (list 'lambda
                                  %_2349
                                  (append
                                    (cons 'begin
                                          (map (lambda (%_2352 %_2353)
                                                 (list 'set! %_2352 %_2353))
                                               %_2349
                                               %_2350))
                                    (list %_2351)))
                            (map (lambda (%_2354) '#f) %_2349))
                      %_2348)
                (cons (list 'lambda
                            %_2349
                            (append
                              (cons 'begin
                                    (map (lambda (%_2355 %_2356)
                                           (list 'set! %_2355 %_2356))
                                         %_2349
                                         %_2350))
                              (list %_2351)))
                      (map (lambda (%_2357) '#f) %_2349))))))
        (set! %_1096
          (lambda (%_2358 %_2359)
            (if (null? (cdr %_2359))
              (if %_2358
                (list 'make-annotation (car %_2359) %_2358)
                (car %_2359))
              (if %_2358
                (list 'make-annotation
                      (cons 'begin %_2359)
                      %_2358)
                (cons 'begin %_2359)))))
        (set! %_997
          ((lambda (%_2360)
             ((lambda (%_2363 %_2362 %_2361)
                (begin
                  (set! %_2363
                    (lambda (%_2364)
                      (((lambda (%_2365)
                          (begin
                            (set! %_2365
                              (lambda (%_2366 %_2367)
                                (if (< %_2366 %_2360)
                                  (list->string (cons (%_2362 %_2366) %_2367))
                                  ((lambda (%_2368 %_2369)
                                     (%_2365
                                       %_2369
                                       (cons (%_2362 %_2368) %_2367)))
                                   (modulo %_2366 %_2360)
                                   (quotient %_2366 %_2360)))))
                            %_2365))
                        #f)
                       %_2364
                       '())))
                  (set! %_2362
                    (lambda (%_2370)
                      (integer->char
                        (+ %_2370 (if (> %_2370 '9) '55 '48)))))
                  (set! %_2361 (lambda () '0))
                  ((lambda (%_2371 %_2372)
                     (lambda (%_2373)
                       (begin
                         (set! %_2372 (+ %_2372 '1))
                         (string->symbol
                           (string-append
                             (symbol->string %_2373)
                             '"#"
                             %_2371
                             (%_2363 %_2372))))))
                   (%_2363 (%_2361))
                   '-1)))
              #f
              #f
              #f))
           '36))
        (set! %_996
          (lambda (%_2374 %_2375) (getprop %_2374 %_2375)))
        (set! %_995
          (lambda (%_2376) (getprop %_2376 '*sc-expander*)))
        (set! %_994
          (lambda (%_2377 %_2378)
            ($sc-put-cte %_2377 %_2378)))
        (set! %_989
          (lambda (%_2379 %_2380 %_2381)
            (error %_2379 '"~a ~s" %_2380 %_2381)))
        (set! %_988
          (lambda (%_2382) (eval (list %_950 %_2382))))
        (set! %_987
          (lambda (%_2383) (eval (list %_950 %_2383))))
        (set! %_950 '"noexpand")
        (begin
          (set! $sc-put-cte
            (lambda (%_2384 %_2385)
              ((lambda (%_2388 %_2387 %_2386)
                 (begin
                   (set! %_2388
                     (lambda (%_2389 %_2390)
                       (begin
                         (%_2386 %_2389 '*top*)
                         ((lambda (%_2391)
                            (putprop %_2391 '*sc-expander* %_2390))
                          (if (symbol? %_2389)
                            %_2389
                            (%_1283 %_2389 '(())))))))
                   (set! %_2387
                     (lambda (%_2392 %_2393)
                       (%_1327
                         (lambda (%_2394) (%_2386 %_2394 %_2393))
                         %_2392)))
                   (set! %_2386
                     (lambda (%_2395 %_2396)
                       ((lambda (%_2398 %_2397)
                          (begin
                            (set! %_2398
                              (lambda (%_2399 %_2400)
                                (if (pair? %_2400)
                                  (if (%_1286 (car %_2400) %_2399)
                                    (%_2398 %_2399 (cdr %_2400))
                                    (%_2397
                                      (car %_2400)
                                      (%_2398 %_2399 (cdr %_2400))))
                                  (if ((lambda (%_2401)
                                         (if %_2401
                                           %_2401
                                           (%_1286 %_2400 %_2399)))
                                       (not %_2400))
                                    '#f
                                    %_2400))))
                            (set! %_2397
                              (lambda (%_2402 %_2403)
                                (if (not %_2403) %_2402 (cons %_2402 %_2403))))
                            ((lambda (%_2404)
                               ((lambda (%_2405)
                                  (if (if (not %_2405) (symbol? %_2395) '#f)
                                    (remprop %_2404 %_2396)
                                    (putprop
                                      %_2404
                                      %_2396
                                      (%_2397 %_2395 %_2405))))
                                (%_2398 %_2395 (getprop %_2404 %_2396))))
                             ((lambda (%_2406)
                                ((lambda (%_2407)
                                   (if (annotation? %_2407)
                                     (annotation-expression %_2407)
                                     %_2407))
                                 (if (%_1110 %_2406) (%_1111 %_2406) %_2406)))
                              %_2395))))
                        #f
                        #f)))
                   ((lambda (%_2408)
                      ((lambda (%_2409)
                         (if (memv %_2409 '(module))
                           (begin
                             ((lambda (%_2410)
                                (%_2387 (%_1302 %_2410) (%_1303 %_2410)))
                              (%_1139 %_2408))
                             (%_2388 %_2384 %_2408))
                           (if (memv %_2409 '(do-import))
                             ((lambda (%_2411)
                                ((lambda (%_2412)
                                   ((lambda (%_2413)
                                      (if (memv %_2413 '(module))
                                        ((lambda (%_2414)
                                           (begin
                                             (if (not (eq? (%_1303 %_2414)
                                                           %_2411))
                                               (syntax-error
                                                 %_2384
                                                 '"import mismatch for module")
                                               (void))
                                             (%_2387 (%_1302 %_2414) '*top*)))
                                         (%_1139 %_2412))
                                        (syntax-error
                                          %_2384
                                          '"import from unknown module")))
                                    (%_1138 %_2412)))
                                 (%_1159 (%_1283 %_2384 '(())) '())))
                              (%_1139 %_2385))
                             (%_2388 %_2384 %_2408))))
                       (%_1138 %_2408)))
                    ((lambda (%_2415)
                       (if %_2415
                         %_2415
                         (error 'define-syntax
                                '"invalid transformer ~s"
                                %_2385)))
                     (%_1158 %_2385)))))
               #f
               #f
               #f)))
          (%_1160 'local-syntax 'letrec-syntax '#t)
          (%_1160 'local-syntax 'let-syntax '#f)
          (%_1160
            'core
            'fluid-let-syntax
            (lambda (%_2416 %_2417 %_2418 %_2419)
              ((lambda (%_2420)
                 ((lambda (%_2421)
                    (if (if %_2421
                          (apply (lambda (%_2422 %_2423 %_2424 %_2425 %_2426)
                                   (%_1287 %_2423))
                                 %_2421)
                          '#f)
                      (apply (lambda (%_2428 %_2429 %_2430 %_2431 %_2432)
                               ((lambda (%_2433)
                                  (begin
                                    (for-each
                                      (lambda (%_2434 %_2435)
                                        ((lambda (%_2436)
                                           (if (memv %_2436
                                                     '(displaced-lexical))
                                             (%_1156 (%_1291 %_2434 %_2418))
                                             (void)))
                                         (%_1138 (%_1159 %_2435 %_2417))))
                                      %_2429
                                      %_2433)
                                    (%_1338
                                      (cons %_2431 %_2432)
                                      (%_1292 %_2416 %_2418 %_2419)
                                      (%_1153
                                        %_2433
                                        ((lambda (%_2439)
                                           (map (lambda (%_2440)
                                                  (%_1137
                                                    'deferred
                                                    (%_1333
                                                      %_2440
                                                      %_2439
                                                      %_2418)))
                                                %_2430))
                                         (%_1155 %_2417))
                                        %_2417)
                                      %_2418)))
                                (map (lambda (%_2442) (%_1283 %_2442 %_2418))
                                     %_2429)))
                             %_2421)
                      ((lambda (%_2444)
                         (syntax-error (%_1292 %_2416 %_2418 %_2419)))
                       %_2420)))
                  ($syntax-dispatch
                    (make-annotation %_2420 value)
                    '(any #2(each (any any)) any . each-any))))
               %_2416)))
          (%_1160
            'core
            'quote
            (lambda (%_2445 %_2446 %_2447 %_2448)
              ((lambda (%_2449)
                 ((lambda (%_2450)
                    (if %_2450
                      (apply (lambda (%_2451 %_2452)
                               (list 'quote (%_1351 %_2452 %_2447)))
                             %_2450)
                      ((lambda (%_2453)
                         (syntax-error (%_1292 %_2445 %_2447 %_2448)))
                       %_2449)))
                  ($syntax-dispatch
                    (make-annotation %_2449 value)
                    '(any any))))
               %_2445)))
          (%_1160
            'core
            'syntax
            ((lambda ()
               ((lambda (%_2461
                         %_2460
                         %_2459
                         %_2458
                         %_2457
                         %_2456
                         %_2455
                         %_2454)
                  (begin
                    (set! %_2461
                      (lambda (%_2462)
                        ((lambda (%_2463)
                           (if (memv %_2463 '(ref))
                             (if '#f
                               (list 'make-annotation (cadr %_2462) '#f)
                               (cadr %_2462))
                             (if (memv %_2463 '(primitive))
                               (cadr %_2462)
                               (if (memv %_2463 '(quote))
                                 (list 'quote (cadr %_2462))
                                 (if (memv %_2463 '(lambda))
                                   (if '#f
                                     (list 'make-annotation
                                           (list 'lambda
                                                 (cadr %_2462)
                                                 (%_2461 (caddr %_2462)))
                                           '#f)
                                     (list 'lambda
                                           (cadr %_2462)
                                           (%_2461 (caddr %_2462))))
                                   (if (memv %_2463 '(map))
                                     ((lambda (%_2464)
                                        (if '#f
                                          (list 'make-annotation
                                                (cons (if (= (length %_2464)
                                                             '2)
                                                        'map
                                                        'map)
                                                      %_2464)
                                                '#f)
                                          (cons (if (= (length %_2464) '2)
                                                  'map
                                                  'map)
                                                %_2464)))
                                      (map %_2461 (cdr %_2462)))
                                     (if '#f
                                       (list 'make-annotation
                                             (cons (car %_2462)
                                                   (map %_2461 (cdr %_2462)))
                                             '#f)
                                       (cons (car %_2462)
                                             (map %_2461 (cdr %_2462))))))))))
                         (car %_2462))))
                    (set! %_2460
                      (lambda (%_2465 %_2466 %_2467)
                        (if (eq? (car %_2467) 'quote)
                          (if (eq? (cadr %_2467) %_2466)
                            (list 'quote %_2465)
                            (list 'quote (list->vector (cadr %_2467))))
                          (if (eq? (car %_2467) 'list)
                            (cons 'vector (cdr %_2467))
                            (list 'list->vector %_2467)))))
                    (set! %_2459
                      (lambda (%_2468 %_2469 %_2470 %_2471 %_2472)
                        ((lambda (%_2473)
                           (if (memv %_2473 '(quote))
                             (if (eq? (car %_2471) 'quote)
                               ((lambda (%_2474 %_2475)
                                  (if (if (eq? %_2474 %_2469)
                                        (eq? %_2475 %_2470)
                                        '#f)
                                    (list 'quote %_2468)
                                    (list 'quote (cons %_2474 %_2475))))
                                (cadr %_2471)
                                (cadr %_2472))
                               (if (eq? (cadr %_2472) '())
                                 (list 'list %_2471)
                                 (list 'cons %_2471 %_2472)))
                             (if (memv %_2473 '(list))
                               (cons 'list (cons %_2471 (cdr %_2472)))
                               (list 'cons %_2471 %_2472))))
                         (car %_2472))))
                    (set! %_2458
                      (lambda (%_2476 %_2477)
                        ((lambda (%_2478 %_2479)
                           (if (eq? (car %_2476) 'ref)
                             (car %_2479)
                             (if (andmap
                                   (lambda (%_2480)
                                     (if (eq? (car %_2480) 'ref)
                                       (memq (cadr %_2480) %_2478)
                                       '#f))
                                   (cdr %_2476))
                               (cons 'map
                                     (cons (list 'primitive (car %_2476))
                                           (map ((lambda (%_2481)
                                                   (lambda (%_2482)
                                                     (cdr (assq (cadr %_2482)
                                                                %_2481))))
                                                 (map cons %_2478 %_2479))
                                                (cdr %_2476))))
                               (cons 'map
                                     (cons (list 'lambda %_2478 %_2476)
                                           %_2479)))))
                         (map cdr %_2477)
                         (map (lambda (%_2483) (list 'ref (car %_2483)))
                              %_2477))))
                    (set! %_2457
                      (lambda (%_2484 %_2485)
                        (list 'apply
                              '(primitive append)
                              (%_2458 %_2484 %_2485))))
                    (set! %_2456
                      (lambda (%_2486 %_2487)
                        (if (equal? %_2487 ''())
                          %_2486
                          (list 'append %_2486 %_2487))))
                    (set! %_2455
                      (lambda (%_2488 %_2489 %_2490 %_2491)
                        (if (= %_2490 '0)
                          (values %_2489 %_2491)
                          (if (null? %_2491)
                            (syntax-error
                              %_2488
                              '"missing ellipsis in syntax form")
                            (call-with-values
                              (lambda ()
                                (%_2455
                                  %_2488
                                  %_2489
                                  (- %_2490 '1)
                                  (cdr %_2491)))
                              (lambda (%_2492 %_2493)
                                ((lambda (%_2494)
                                   (if %_2494
                                     (values (cdr %_2494) %_2491)
                                     ((lambda (%_2495)
                                        (values
                                          %_2495
                                          (cons (cons (cons %_2492 %_2495)
                                                      (car %_2491))
                                                %_2493)))
                                      (%_1352 'tmp))))
                                 (assq %_2492 (car %_2491)))))))))
                    (set! %_2454
                      (lambda (%_2496 %_2497 %_2498 %_2499 %_2500)
                        (if (%_1162 %_2497)
                          ((lambda (%_2501)
                             ((lambda (%_2502)
                                (if (eq? (%_1138 %_2502) 'syntax)
                                  (call-with-values
                                    (lambda ()
                                      ((lambda (%_2503)
                                         (%_2455
                                           %_2496
                                           (car %_2503)
                                           (cdr %_2503)
                                           %_2499))
                                       (%_1139 %_2502)))
                                    (lambda (%_2504 %_2505)
                                      (values (list 'ref %_2504) %_2505)))
                                  (if (%_2500 %_2497)
                                    (syntax-error
                                      %_2496
                                      '"misplaced ellipsis in syntax form")
                                    (values (list 'quote %_2497) %_2499))))
                              (%_1159 %_2501 %_2498)))
                           (%_1283 %_2497 '(())))
                          ((lambda (%_2506)
                             ((lambda (%_2507)
                                (if (if %_2507
                                      (apply (lambda (%_2508 %_2509)
                                               (%_2500 %_2508))
                                             %_2507)
                                      '#f)
                                  (apply (lambda (%_2510 %_2511)
                                           (%_2454
                                             %_2496
                                             %_2511
                                             %_2498
                                             %_2499
                                             (lambda (%_2512) '#f)))
                                         %_2507)
                                  ((lambda (%_2513)
                                     (if (if %_2513
                                           (apply (lambda (%_2514
                                                           %_2515
                                                           %_2516)
                                                    (%_2500 %_2515))
                                                  %_2513)
                                           '#f)
                                       (apply (lambda (%_2517 %_2518 %_2519)
                                                (((lambda (%_2520)
                                                    (begin
                                                      (set! %_2520
                                                        (lambda (%_2521 %_2522)
                                                          ((lambda (%_2523)
                                                             ((lambda (%_2524)
                                                                (if (if %_2524
                                                                      (apply (lambda (%_2525
                                                                                      %_2526)
                                                                               (%_2500
                                                                                 %_2525))
                                                                             %_2524)
                                                                      '#f)
                                                                  (apply (lambda (%_2527
                                                                                  %_2528)
                                                                           (%_2520
                                                                             %_2528
                                                                             (lambda (%_2529)
                                                                               (call-with-values
                                                                                 (lambda ()
                                                                                   (%_2522
                                                                                     (cons '()
                                                                                           %_2529)))
                                                                                 (lambda (%_2530
                                                                                          %_2531)
                                                                                   (if (null? (car %_2531))
                                                                                     (syntax-error
                                                                                       %_2496
                                                                                       '"extra ellipsis in syntax form")
                                                                                     (values
                                                                                       (%_2457
                                                                                         %_2530
                                                                                         (car %_2531))
                                                                                       (cdr %_2531))))))))
                                                                         %_2524)
                                                                  ((lambda (%_2532)
                                                                     (call-with-values
                                                                       (lambda ()
                                                                         (%_2454
                                                                           %_2496
                                                                           %_2521
                                                                           %_2498
                                                                           %_2499
                                                                           %_2500))
                                                                       (lambda (%_2533
                                                                                %_2534)
                                                                         (call-with-values
                                                                           (lambda ()
                                                                             (%_2522
                                                                               %_2534))
                                                                           (lambda (%_2535
                                                                                    %_2536)
                                                                             (values
                                                                               (%_2456
                                                                                 %_2535
                                                                                 %_2533)
                                                                               %_2536))))))
                                                                   %_2523)))
                                                              ($syntax-dispatch
                                                                (make-annotation
                                                                  %_2523
                                                                  value)
                                                                '(any . any))))
                                                           %_2521)))
                                                      %_2520))
                                                  #f)
                                                 %_2519
                                                 (lambda (%_2537)
                                                   (call-with-values
                                                     (lambda ()
                                                       (%_2454
                                                         %_2496
                                                         %_2517
                                                         %_2498
                                                         (cons '() %_2537)
                                                         %_2500))
                                                     (lambda (%_2538 %_2539)
                                                       (if (null? (car %_2539))
                                                         (syntax-error
                                                           %_2496
                                                           '"extra ellipsis in syntax form")
                                                         (values
                                                           (%_2458
                                                             %_2538
                                                             (car %_2539))
                                                           (cdr %_2539))))))))
                                              %_2513)
                                       ((lambda (%_2540)
                                          (if %_2540
                                            (apply (lambda (%_2541 %_2542)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_2454
                                                           %_2496
                                                           %_2541
                                                           %_2498
                                                           %_2499
                                                           %_2500))
                                                       (lambda (%_2543 %_2544)
                                                         (call-with-values
                                                           (lambda ()
                                                             (%_2454
                                                               %_2496
                                                               %_2542
                                                               %_2498
                                                               %_2544
                                                               %_2500))
                                                           (lambda (%_2545
                                                                    %_2546)
                                                             (values
                                                               (%_2459
                                                                 %_2497
                                                                 %_2541
                                                                 %_2542
                                                                 %_2543
                                                                 %_2545)
                                                               %_2546))))))
                                                   %_2540)
                                            ((lambda (%_2547)
                                               (if %_2547
                                                 (apply (lambda (%_2548 %_2549)
                                                          ((lambda (%_2550)
                                                             (call-with-values
                                                               (lambda ()
                                                                 (%_2454
                                                                   %_2496
                                                                   %_2550
                                                                   %_2498
                                                                   %_2499
                                                                   %_2500))
                                                               (lambda (%_2551
                                                                        %_2552)
                                                                 (values
                                                                   (%_2460
                                                                     %_2497
                                                                     %_2550
                                                                     %_2551)
                                                                   %_2552))))
                                                           (cons %_2548
                                                                 %_2549)))
                                                        %_2547)
                                                 ((lambda (%_2554)
                                                    (values
                                                      (list 'quote %_2497)
                                                      %_2499))
                                                  %_2506)))
                                             ($syntax-dispatch
                                               (make-annotation %_2506 value)
                                               '#2(vector (any . each-any))))))
                                        ($syntax-dispatch
                                          (make-annotation %_2506 value)
                                          '(any . any)))))
                                   ($syntax-dispatch
                                     (make-annotation %_2506 value)
                                     '(any any . any)))))
                              ($syntax-dispatch
                                (make-annotation %_2506 value)
                                '(any any))))
                           %_2497))))
                    (lambda (%_2555 %_2556 %_2557 %_2558)
                      ((lambda (%_2559)
                         ((lambda (%_2560)
                            ((lambda (%_2561)
                               (if %_2561
                                 (apply (lambda (%_2562 %_2563)
                                          (call-with-values
                                            (lambda ()
                                              (%_2454
                                                %_2559
                                                %_2563
                                                %_2556
                                                '()
                                                %_1348))
                                            (lambda (%_2564 %_2565)
                                              (%_2461 %_2564))))
                                        %_2561)
                                 ((lambda (%_2566) (syntax-error %_2559))
                                  %_2560)))
                             ($syntax-dispatch
                               (make-annotation %_2560 value)
                               '(any any))))
                          %_2559))
                       (%_1292 %_2555 %_2557 %_2558)))))
                #f
                #f
                #f
                #f
                #f
                #f
                #f
                #f))))
          (%_1160
            'core
            'lambda
            (lambda (%_2567 %_2568 %_2569 %_2570)
              ((lambda (%_2571)
                 ((lambda (%_2572)
                    (if %_2572
                      (apply (lambda (%_2573 %_2574)
                               (%_1345
                                 (%_1292 %_2567 %_2569 %_2570)
                                 %_2574
                                 %_2568
                                 %_2569
                                 (lambda (%_2575 %_2576)
                                   (if %_2570
                                     (list 'make-annotation
                                           (list 'lambda %_2575 %_2576)
                                           %_2570)
                                     (list 'lambda %_2575 %_2576)))))
                             %_2572)
                      (syntax-error %_2571)))
                  ($syntax-dispatch
                    (make-annotation %_2571 value)
                    '(any . any))))
               %_2567)))
          (%_1160
            'core
            'letrec
            (lambda (%_2577 %_2578 %_2579 %_2580)
              ((lambda (%_2581)
                 ((lambda (%_2582)
                    (if %_2582
                      (apply (lambda (%_2583 %_2584 %_2585 %_2586 %_2587)
                               ((lambda (%_2588)
                                  (if (not (%_1287 %_2588))
                                    (%_1289
                                      (map (lambda (%_2589)
                                             (%_1291 %_2589 %_2579))
                                           %_2588)
                                      (%_1292 %_2577 %_2579 %_2580)
                                      '"bound variable")
                                    ((lambda (%_2590 %_2591)
                                       ((lambda (%_2592 %_2593)
                                          (%_1097
                                            %_2580
                                            %_2591
                                            (map (lambda (%_2594)
                                                   (%_1333
                                                     %_2594
                                                     %_2593
                                                     %_2592))
                                                 %_2585)
                                            (%_1338
                                              (cons %_2586 %_2587)
                                              (%_1292 %_2577 %_2592 %_2580)
                                              %_2593
                                              %_2592)))
                                        (%_1274 %_2588 %_2590 %_2579)
                                        (%_1154 %_2590 %_2591 %_2578)))
                                     (%_1205 %_2588)
                                     (map %_1352 %_2588))))
                                %_2584))
                             %_2582)
                      ((lambda (%_2598)
                         (syntax-error (%_1292 %_2577 %_2579 %_2580)))
                       %_2581)))
                  ($syntax-dispatch
                    (make-annotation %_2581 value)
                    '(any #2(each (any any)) any . each-any))))
               %_2577)))
          (%_1160
            'core
            'if
            (lambda (%_2599 %_2600 %_2601 %_2602)
              ((lambda (%_2603)
                 ((lambda (%_2604)
                    (if %_2604
                      (apply (lambda (%_2605 %_2606 %_2607)
                               (if %_2602
                                 (list 'make-annotation
                                       (list 'if
                                             (%_1333 %_2606 %_2600 %_2601)
                                             (%_1333 %_2607 %_2600 %_2601)
                                             (%_1347))
                                       %_2602)
                                 (list 'if
                                       (%_1333 %_2606 %_2600 %_2601)
                                       (%_1333 %_2607 %_2600 %_2601)
                                       (%_1347))))
                             %_2604)
                      ((lambda (%_2608)
                         (if %_2608
                           (apply (lambda (%_2609 %_2610 %_2611 %_2612)
                                    (if %_2602
                                      (list 'make-annotation
                                            (list 'if
                                                  (%_1333 %_2610 %_2600 %_2601)
                                                  (%_1333 %_2611 %_2600 %_2601)
                                                  (%_1333
                                                    %_2612
                                                    %_2600
                                                    %_2601))
                                            %_2602)
                                      (list 'if
                                            (%_1333 %_2610 %_2600 %_2601)
                                            (%_1333 %_2611 %_2600 %_2601)
                                            (%_1333 %_2612 %_2600 %_2601))))
                                  %_2608)
                           ((lambda (%_2613)
                              (syntax-error (%_1292 %_2599 %_2601 %_2602)))
                            %_2603)))
                       ($syntax-dispatch
                         (make-annotation %_2603 value)
                         '(any any any any)))))
                  ($syntax-dispatch
                    (make-annotation %_2603 value)
                    '(any any any))))
               %_2599)))
          (%_1160 'set! 'set! '())
          (%_1160 'begin 'begin '())
          (%_1160 'module-key 'module '())
          (%_1160 'import 'import '#f)
          (%_1160 'import 'import-only '#t)
          (%_1160 'define 'define '())
          (%_1160 'define-syntax 'define-syntax '())
          (%_1160 'eval-when 'eval-when '())
          (%_1160
            'core
            'syntax-case
            ((lambda ()
               ((lambda (%_2617 %_2616 %_2615 %_2614)
                  (begin
                    (set! %_2617
                      (lambda (%_2618 %_2619 %_2620 %_2621)
                        (if (null? %_2620)
                          (if '#f
                            (list 'make-annotation
                                  (list 'syntax-error
                                        (if '#f
                                          (list 'make-annotation %_2618 '#f)
                                          %_2618))
                                  '#f)
                            (list 'syntax-error
                                  (if '#f
                                    (list 'make-annotation %_2618 '#f)
                                    %_2618)))
                          ((lambda (%_2622)
                             ((lambda (%_2623)
                                (if %_2623
                                  (apply (lambda (%_2624 %_2625)
                                           (if (if (%_1162 %_2624)
                                                 (if (not (%_1290
                                                            %_2624
                                                            %_2619))
                                                   (not (%_1348 %_2624))
                                                   '#f)
                                                 '#f)
                                             ((lambda (%_2626 %_2627)
                                                (if '#f
                                                  (list 'make-annotation
                                                        (list (if '#f
                                                                (list 'make-annotation
                                                                      (list 'lambda
                                                                            (list %_2627)
                                                                            (%_1333
                                                                              %_2625
                                                                              (%_1152
                                                                                %_2626
                                                                                (%_1137
                                                                                  'syntax
                                                                                  (cons %_2627
                                                                                        '0))
                                                                                %_2621)
                                                                              (%_1274
                                                                                (list %_2624)
                                                                                (list %_2626)
                                                                                '(()))))
                                                                      '#f)
                                                                (list 'lambda
                                                                      (list %_2627)
                                                                      (%_1333
                                                                        %_2625
                                                                        (%_1152
                                                                          %_2626
                                                                          (%_1137
                                                                            'syntax
                                                                            (cons %_2627
                                                                                  '0))
                                                                          %_2621)
                                                                        (%_1274
                                                                          (list %_2624)
                                                                          (list %_2626)
                                                                          '(())))))
                                                              (if '#f
                                                                (list 'make-annotation
                                                                      %_2618
                                                                      '#f)
                                                                %_2618))
                                                        '#f)
                                                  (list (if '#f
                                                          (list 'make-annotation
                                                                (list 'lambda
                                                                      (list %_2627)
                                                                      (%_1333
                                                                        %_2625
                                                                        (%_1152
                                                                          %_2626
                                                                          (%_1137
                                                                            'syntax
                                                                            (cons %_2627
                                                                                  '0))
                                                                          %_2621)
                                                                        (%_1274
                                                                          (list %_2624)
                                                                          (list %_2626)
                                                                          '(()))))
                                                                '#f)
                                                          (list 'lambda
                                                                (list %_2627)
                                                                (%_1333
                                                                  %_2625
                                                                  (%_1152
                                                                    %_2626
                                                                    (%_1137
                                                                      'syntax
                                                                      (cons %_2627
                                                                            '0))
                                                                    %_2621)
                                                                  (%_1274
                                                                    (list %_2624)
                                                                    (list %_2626)
                                                                    '(())))))
                                                        (if '#f
                                                          (list 'make-annotation
                                                                %_2618
                                                                '#f)
                                                          %_2618))))
                                              (%_1203)
                                              (%_1352 %_2624))
                                             (%_2616
                                               %_2618
                                               %_2619
                                               (cdr %_2620)
                                               %_2621
                                               %_2624
                                               '#t
                                               %_2625)))
                                         %_2623)
                                  ((lambda (%_2628)
                                     (if %_2628
                                       (apply (lambda (%_2629 %_2630 %_2631)
                                                (%_2616
                                                  %_2618
                                                  %_2619
                                                  (cdr %_2620)
                                                  %_2621
                                                  %_2629
                                                  %_2630
                                                  %_2631))
                                              %_2628)
                                       ((lambda (%_2632)
                                          (syntax-error
                                            (car %_2620)
                                            '"invalid syntax-case clause"))
                                        %_2622)))
                                   ($syntax-dispatch
                                     (make-annotation %_2622 value)
                                     '(any any any)))))
                              ($syntax-dispatch
                                (make-annotation %_2622 value)
                                '(any any))))
                           (car %_2620)))))
                    (set! %_2616
                      (lambda (%_2633
                               %_2634
                               %_2635
                               %_2636
                               %_2637
                               %_2638
                               %_2639)
                        (call-with-values
                          (lambda () (%_2614 %_2637 %_2634))
                          (lambda (%_2640 %_2641)
                            (if (not (%_1288 (map car %_2641)))
                              (%_1289
                                (map car %_2641)
                                %_2637
                                '"pattern variable")
                              (if (not (andmap
                                         (lambda (%_2642)
                                           (not (%_1348 (car %_2642))))
                                         %_2641))
                                (syntax-error
                                  %_2637
                                  '"misplaced ellipsis in syntax-case pattern")
                                ((lambda (%_2643)
                                   (if '#f
                                     (list 'make-annotation
                                           (list (if '#f
                                                   (list 'make-annotation
                                                         (list 'lambda
                                                               (list %_2643)
                                                               (if '#f
                                                                 (list 'make-annotation
                                                                       (list 'if
                                                                             ((lambda (%_2653)
                                                                                ((lambda (%_2654)
                                                                                   (if %_2654
                                                                                     (apply (lambda ()
                                                                                              (if '#f
                                                                                                (list 'make-annotation
                                                                                                      %_2643
                                                                                                      '#f)
                                                                                                %_2643))
                                                                                            %_2654)
                                                                                     ((lambda (%_2655)
                                                                                        (if '#f
                                                                                          (list 'make-annotation
                                                                                                (list 'if
                                                                                                      (if '#f
                                                                                                        (list 'make-annotation
                                                                                                              %_2643
                                                                                                              '#f)
                                                                                                        %_2643)
                                                                                                      (%_2615
                                                                                                        %_2641
                                                                                                        %_2638
                                                                                                        (if '#f
                                                                                                          (list 'make-annotation
                                                                                                                %_2643
                                                                                                                '#f)
                                                                                                          %_2643)
                                                                                                        %_2636)
                                                                                                      (list 'quote
                                                                                                            '#f))
                                                                                                '#f)
                                                                                          (list 'if
                                                                                                (if '#f
                                                                                                  (list 'make-annotation
                                                                                                        %_2643
                                                                                                        '#f)
                                                                                                  %_2643)
                                                                                                (%_2615
                                                                                                  %_2641
                                                                                                  %_2638
                                                                                                  (if '#f
                                                                                                    (list 'make-annotation
                                                                                                          %_2643
                                                                                                          '#f)
                                                                                                    %_2643)
                                                                                                  %_2636)
                                                                                                (list 'quote
                                                                                                      '#f))))
                                                                                      %_2653)))
                                                                                 ($syntax-dispatch
                                                                                   (make-annotation
                                                                                     %_2653
                                                                                     value)
                                                                                   '#2(atom
                                                                                       #t))))
                                                                              %_2638)
                                                                             (%_2615
                                                                               %_2641
                                                                               %_2639
                                                                               (if '#f
                                                                                 (list 'make-annotation
                                                                                       %_2643
                                                                                       '#f)
                                                                                 %_2643)
                                                                               %_2636)
                                                                             (%_2617
                                                                               %_2633
                                                                               %_2634
                                                                               %_2635
                                                                               %_2636))
                                                                       '#f)
                                                                 (list 'if
                                                                       ((lambda (%_2656)
                                                                          ((lambda (%_2657)
                                                                             (if %_2657
                                                                               (apply (lambda ()
                                                                                        (if '#f
                                                                                          (list 'make-annotation
                                                                                                %_2643
                                                                                                '#f)
                                                                                          %_2643))
                                                                                      %_2657)
                                                                               ((lambda (%_2658)
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          (list 'if
                                                                                                (if '#f
                                                                                                  (list 'make-annotation
                                                                                                        %_2643
                                                                                                        '#f)
                                                                                                  %_2643)
                                                                                                (%_2615
                                                                                                  %_2641
                                                                                                  %_2638
                                                                                                  (if '#f
                                                                                                    (list 'make-annotation
                                                                                                          %_2643
                                                                                                          '#f)
                                                                                                    %_2643)
                                                                                                  %_2636)
                                                                                                (list 'quote
                                                                                                      '#f))
                                                                                          '#f)
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_2643
                                                                                                  '#f)
                                                                                            %_2643)
                                                                                          (%_2615
                                                                                            %_2641
                                                                                            %_2638
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_2643
                                                                                                    '#f)
                                                                                              %_2643)
                                                                                            %_2636)
                                                                                          (list 'quote
                                                                                                '#f))))
                                                                                %_2656)))
                                                                           ($syntax-dispatch
                                                                             (make-annotation
                                                                               %_2656
                                                                               value)
                                                                             '#2(atom
                                                                                 #t))))
                                                                        %_2638)
                                                                       (%_2615
                                                                         %_2641
                                                                         %_2639
                                                                         (if '#f
                                                                           (list 'make-annotation
                                                                                 %_2643
                                                                                 '#f)
                                                                           %_2643)
                                                                         %_2636)
                                                                       (%_2617
                                                                         %_2633
                                                                         %_2634
                                                                         %_2635
                                                                         %_2636))))
                                                         '#f)
                                                   (list 'lambda
                                                         (list %_2643)
                                                         (if '#f
                                                           (list 'make-annotation
                                                                 (list 'if
                                                                       ((lambda (%_2668)
                                                                          ((lambda (%_2669)
                                                                             (if %_2669
                                                                               (apply (lambda ()
                                                                                        (if '#f
                                                                                          (list 'make-annotation
                                                                                                %_2643
                                                                                                '#f)
                                                                                          %_2643))
                                                                                      %_2669)
                                                                               ((lambda (%_2670)
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          (list 'if
                                                                                                (if '#f
                                                                                                  (list 'make-annotation
                                                                                                        %_2643
                                                                                                        '#f)
                                                                                                  %_2643)
                                                                                                (%_2615
                                                                                                  %_2641
                                                                                                  %_2638
                                                                                                  (if '#f
                                                                                                    (list 'make-annotation
                                                                                                          %_2643
                                                                                                          '#f)
                                                                                                    %_2643)
                                                                                                  %_2636)
                                                                                                (list 'quote
                                                                                                      '#f))
                                                                                          '#f)
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_2643
                                                                                                  '#f)
                                                                                            %_2643)
                                                                                          (%_2615
                                                                                            %_2641
                                                                                            %_2638
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_2643
                                                                                                    '#f)
                                                                                              %_2643)
                                                                                            %_2636)
                                                                                          (list 'quote
                                                                                                '#f))))
                                                                                %_2668)))
                                                                           ($syntax-dispatch
                                                                             (make-annotation
                                                                               %_2668
                                                                               value)
                                                                             '#2(atom
                                                                                 #t))))
                                                                        %_2638)
                                                                       (%_2615
                                                                         %_2641
                                                                         %_2639
                                                                         (if '#f
                                                                           (list 'make-annotation
                                                                                 %_2643
                                                                                 '#f)
                                                                           %_2643)
                                                                         %_2636)
                                                                       (%_2617
                                                                         %_2633
                                                                         %_2634
                                                                         %_2635
                                                                         %_2636))
                                                                 '#f)
                                                           (list 'if
                                                                 ((lambda (%_2671)
                                                                    ((lambda (%_2672)
                                                                       (if %_2672
                                                                         (apply (lambda ()
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          %_2643
                                                                                          '#f)
                                                                                    %_2643))
                                                                                %_2672)
                                                                         ((lambda (%_2673)
                                                                            (if '#f
                                                                              (list 'make-annotation
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_2643
                                                                                                  '#f)
                                                                                            %_2643)
                                                                                          (%_2615
                                                                                            %_2641
                                                                                            %_2638
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_2643
                                                                                                    '#f)
                                                                                              %_2643)
                                                                                            %_2636)
                                                                                          (list 'quote
                                                                                                '#f))
                                                                                    '#f)
                                                                              (list 'if
                                                                                    (if '#f
                                                                                      (list 'make-annotation
                                                                                            %_2643
                                                                                            '#f)
                                                                                      %_2643)
                                                                                    (%_2615
                                                                                      %_2641
                                                                                      %_2638
                                                                                      (if '#f
                                                                                        (list 'make-annotation
                                                                                              %_2643
                                                                                              '#f)
                                                                                        %_2643)
                                                                                      %_2636)
                                                                                    (list 'quote
                                                                                          '#f))))
                                                                          %_2671)))
                                                                     ($syntax-dispatch
                                                                       (make-annotation
                                                                         %_2671
                                                                         value)
                                                                       '#2(atom
                                                                           #t))))
                                                                  %_2638)
                                                                 (%_2615
                                                                   %_2641
                                                                   %_2639
                                                                   (if '#f
                                                                     (list 'make-annotation
                                                                           %_2643
                                                                           '#f)
                                                                     %_2643)
                                                                   %_2636)
                                                                 (%_2617
                                                                   %_2633
                                                                   %_2634
                                                                   %_2635
                                                                   %_2636)))))
                                                 (if (eq? %_2640 'any)
                                                   (if '#f
                                                     (list 'make-annotation
                                                           (list 'list
                                                                 (if 'value
                                                                   (cons 'make-annotation
                                                                         (cons %_2633
                                                                               '(value)))
                                                                   %_2633))
                                                           '#f)
                                                     (list 'list
                                                           (if 'value
                                                             (cons 'make-annotation
                                                                   (cons %_2633
                                                                         '(value)))
                                                             %_2633)))
                                                   (if '#f
                                                     (list 'make-annotation
                                                           (list '$syntax-dispatch
                                                                 (if 'value
                                                                   (cons 'make-annotation
                                                                         (cons %_2633
                                                                               '(value)))
                                                                   %_2633)
                                                                 (list 'quote
                                                                       %_2640))
                                                           '#f)
                                                     (list '$syntax-dispatch
                                                           (if 'value
                                                             (cons 'make-annotation
                                                                   (cons %_2633
                                                                         '(value)))
                                                             %_2633)
                                                           (list 'quote
                                                                 %_2640)))))
                                           '#f)
                                     (list (if '#f
                                             (list 'make-annotation
                                                   (list 'lambda
                                                         (list %_2643)
                                                         (if '#f
                                                           (list 'make-annotation
                                                                 (list 'if
                                                                       ((lambda (%_2683)
                                                                          ((lambda (%_2684)
                                                                             (if %_2684
                                                                               (apply (lambda ()
                                                                                        (if '#f
                                                                                          (list 'make-annotation
                                                                                                %_2643
                                                                                                '#f)
                                                                                          %_2643))
                                                                                      %_2684)
                                                                               ((lambda (%_2685)
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          (list 'if
                                                                                                (if '#f
                                                                                                  (list 'make-annotation
                                                                                                        %_2643
                                                                                                        '#f)
                                                                                                  %_2643)
                                                                                                (%_2615
                                                                                                  %_2641
                                                                                                  %_2638
                                                                                                  (if '#f
                                                                                                    (list 'make-annotation
                                                                                                          %_2643
                                                                                                          '#f)
                                                                                                    %_2643)
                                                                                                  %_2636)
                                                                                                (list 'quote
                                                                                                      '#f))
                                                                                          '#f)
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_2643
                                                                                                  '#f)
                                                                                            %_2643)
                                                                                          (%_2615
                                                                                            %_2641
                                                                                            %_2638
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_2643
                                                                                                    '#f)
                                                                                              %_2643)
                                                                                            %_2636)
                                                                                          (list 'quote
                                                                                                '#f))))
                                                                                %_2683)))
                                                                           ($syntax-dispatch
                                                                             (make-annotation
                                                                               %_2683
                                                                               value)
                                                                             '#2(atom
                                                                                 #t))))
                                                                        %_2638)
                                                                       (%_2615
                                                                         %_2641
                                                                         %_2639
                                                                         (if '#f
                                                                           (list 'make-annotation
                                                                                 %_2643
                                                                                 '#f)
                                                                           %_2643)
                                                                         %_2636)
                                                                       (%_2617
                                                                         %_2633
                                                                         %_2634
                                                                         %_2635
                                                                         %_2636))
                                                                 '#f)
                                                           (list 'if
                                                                 ((lambda (%_2686)
                                                                    ((lambda (%_2687)
                                                                       (if %_2687
                                                                         (apply (lambda ()
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          %_2643
                                                                                          '#f)
                                                                                    %_2643))
                                                                                %_2687)
                                                                         ((lambda (%_2688)
                                                                            (if '#f
                                                                              (list 'make-annotation
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_2643
                                                                                                  '#f)
                                                                                            %_2643)
                                                                                          (%_2615
                                                                                            %_2641
                                                                                            %_2638
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_2643
                                                                                                    '#f)
                                                                                              %_2643)
                                                                                            %_2636)
                                                                                          (list 'quote
                                                                                                '#f))
                                                                                    '#f)
                                                                              (list 'if
                                                                                    (if '#f
                                                                                      (list 'make-annotation
                                                                                            %_2643
                                                                                            '#f)
                                                                                      %_2643)
                                                                                    (%_2615
                                                                                      %_2641
                                                                                      %_2638
                                                                                      (if '#f
                                                                                        (list 'make-annotation
                                                                                              %_2643
                                                                                              '#f)
                                                                                        %_2643)
                                                                                      %_2636)
                                                                                    (list 'quote
                                                                                          '#f))))
                                                                          %_2686)))
                                                                     ($syntax-dispatch
                                                                       (make-annotation
                                                                         %_2686
                                                                         value)
                                                                       '#2(atom
                                                                           #t))))
                                                                  %_2638)
                                                                 (%_2615
                                                                   %_2641
                                                                   %_2639
                                                                   (if '#f
                                                                     (list 'make-annotation
                                                                           %_2643
                                                                           '#f)
                                                                     %_2643)
                                                                   %_2636)
                                                                 (%_2617
                                                                   %_2633
                                                                   %_2634
                                                                   %_2635
                                                                   %_2636))))
                                                   '#f)
                                             (list 'lambda
                                                   (list %_2643)
                                                   (if '#f
                                                     (list 'make-annotation
                                                           (list 'if
                                                                 ((lambda (%_2698)
                                                                    ((lambda (%_2699)
                                                                       (if %_2699
                                                                         (apply (lambda ()
                                                                                  (if '#f
                                                                                    (list 'make-annotation
                                                                                          %_2643
                                                                                          '#f)
                                                                                    %_2643))
                                                                                %_2699)
                                                                         ((lambda (%_2700)
                                                                            (if '#f
                                                                              (list 'make-annotation
                                                                                    (list 'if
                                                                                          (if '#f
                                                                                            (list 'make-annotation
                                                                                                  %_2643
                                                                                                  '#f)
                                                                                            %_2643)
                                                                                          (%_2615
                                                                                            %_2641
                                                                                            %_2638
                                                                                            (if '#f
                                                                                              (list 'make-annotation
                                                                                                    %_2643
                                                                                                    '#f)
                                                                                              %_2643)
                                                                                            %_2636)
                                                                                          (list 'quote
                                                                                                '#f))
                                                                                    '#f)
                                                                              (list 'if
                                                                                    (if '#f
                                                                                      (list 'make-annotation
                                                                                            %_2643
                                                                                            '#f)
                                                                                      %_2643)
                                                                                    (%_2615
                                                                                      %_2641
                                                                                      %_2638
                                                                                      (if '#f
                                                                                        (list 'make-annotation
                                                                                              %_2643
                                                                                              '#f)
                                                                                        %_2643)
                                                                                      %_2636)
                                                                                    (list 'quote
                                                                                          '#f))))
                                                                          %_2698)))
                                                                     ($syntax-dispatch
                                                                       (make-annotation
                                                                         %_2698
                                                                         value)
                                                                       '#2(atom
                                                                           #t))))
                                                                  %_2638)
                                                                 (%_2615
                                                                   %_2641
                                                                   %_2639
                                                                   (if '#f
                                                                     (list 'make-annotation
                                                                           %_2643
                                                                           '#f)
                                                                     %_2643)
                                                                   %_2636)
                                                                 (%_2617
                                                                   %_2633
                                                                   %_2634
                                                                   %_2635
                                                                   %_2636))
                                                           '#f)
                                                     (list 'if
                                                           ((lambda (%_2701)
                                                              ((lambda (%_2702)
                                                                 (if %_2702
                                                                   (apply (lambda ()
                                                                            (if '#f
                                                                              (list 'make-annotation
                                                                                    %_2643
                                                                                    '#f)
                                                                              %_2643))
                                                                          %_2702)
                                                                   ((lambda (%_2703)
                                                                      (if '#f
                                                                        (list 'make-annotation
                                                                              (list 'if
                                                                                    (if '#f
                                                                                      (list 'make-annotation
                                                                                            %_2643
                                                                                            '#f)
                                                                                      %_2643)
                                                                                    (%_2615
                                                                                      %_2641
                                                                                      %_2638
                                                                                      (if '#f
                                                                                        (list 'make-annotation
                                                                                              %_2643
                                                                                              '#f)
                                                                                        %_2643)
                                                                                      %_2636)
                                                                                    (list 'quote
                                                                                          '#f))
                                                                              '#f)
                                                                        (list 'if
                                                                              (if '#f
                                                                                (list 'make-annotation
                                                                                      %_2643
                                                                                      '#f)
                                                                                %_2643)
                                                                              (%_2615
                                                                                %_2641
                                                                                %_2638
                                                                                (if '#f
                                                                                  (list 'make-annotation
                                                                                        %_2643
                                                                                        '#f)
                                                                                  %_2643)
                                                                                %_2636)
                                                                              (list 'quote
                                                                                    '#f))))
                                                                    %_2701)))
                                                               ($syntax-dispatch
                                                                 (make-annotation
                                                                   %_2701
                                                                   value)
                                                                 '#2(atom
                                                                     #t))))
                                                            %_2638)
                                                           (%_2615
                                                             %_2641
                                                             %_2639
                                                             (if '#f
                                                               (list 'make-annotation
                                                                     %_2643
                                                                     '#f)
                                                               %_2643)
                                                             %_2636)
                                                           (%_2617
                                                             %_2633
                                                             %_2634
                                                             %_2635
                                                             %_2636)))))
                                           (if (eq? %_2640 'any)
                                             (if '#f
                                               (list 'make-annotation
                                                     (list 'list
                                                           (if 'value
                                                             (cons 'make-annotation
                                                                   (cons %_2633
                                                                         '(value)))
                                                             %_2633))
                                                     '#f)
                                               (list 'list
                                                     (if 'value
                                                       (cons 'make-annotation
                                                             (cons %_2633
                                                                   '(value)))
                                                       %_2633)))
                                             (if '#f
                                               (list 'make-annotation
                                                     (list '$syntax-dispatch
                                                           (if 'value
                                                             (cons 'make-annotation
                                                                   (cons %_2633
                                                                         '(value)))
                                                             %_2633)
                                                           (list 'quote
                                                                 %_2640))
                                                     '#f)
                                               (list '$syntax-dispatch
                                                     (if 'value
                                                       (cons 'make-annotation
                                                             (cons %_2633
                                                                   '(value)))
                                                       %_2633)
                                                     (list 'quote %_2640)))))))
                                 (%_1352 'tmp))))))))
                    (set! %_2615
                      (lambda (%_2704 %_2705 %_2706 %_2707)
                        ((lambda (%_2708 %_2709)
                           ((lambda (%_2710 %_2711)
                              (if '#f
                                (list 'make-annotation
                                      (list 'apply
                                            (if '#f
                                              (list 'make-annotation
                                                    (list 'lambda
                                                          %_2711
                                                          (%_1333
                                                            %_2705
                                                            (%_1153
                                                              %_2710
                                                              (map (lambda (%_2712
                                                                            %_2713)
                                                                     (%_1137
                                                                       'syntax
                                                                       (cons %_2712
                                                                             %_2713)))
                                                                   %_2711
                                                                   (map cdr
                                                                        %_2704))
                                                              %_2707)
                                                            (%_1274
                                                              %_2708
                                                              %_2710
                                                              '(()))))
                                                    '#f)
                                              (list 'lambda
                                                    %_2711
                                                    (%_1333
                                                      %_2705
                                                      (%_1153
                                                        %_2710
                                                        (map (lambda (%_2714
                                                                      %_2715)
                                                               (%_1137
                                                                 'syntax
                                                                 (cons %_2714
                                                                       %_2715)))
                                                             %_2711
                                                             (map cdr %_2704))
                                                        %_2707)
                                                      (%_1274
                                                        %_2708
                                                        %_2710
                                                        '(())))))
                                            %_2706)
                                      '#f)
                                (list 'apply
                                      (if '#f
                                        (list 'make-annotation
                                              (list 'lambda
                                                    %_2711
                                                    (%_1333
                                                      %_2705
                                                      (%_1153
                                                        %_2710
                                                        (map (lambda (%_2716
                                                                      %_2717)
                                                               (%_1137
                                                                 'syntax
                                                                 (cons %_2716
                                                                       %_2717)))
                                                             %_2711
                                                             (map cdr %_2704))
                                                        %_2707)
                                                      (%_1274
                                                        %_2708
                                                        %_2710
                                                        '(()))))
                                              '#f)
                                        (list 'lambda
                                              %_2711
                                              (%_1333
                                                %_2705
                                                (%_1153
                                                  %_2710
                                                  (map (lambda (%_2718 %_2719)
                                                         (%_1137
                                                           'syntax
                                                           (cons %_2718
                                                                 %_2719)))
                                                       %_2711
                                                       (map cdr %_2704))
                                                  %_2707)
                                                (%_1274 %_2708 %_2710 '(())))))
                                      %_2706)))
                            (%_1205 %_2708)
                            (map %_1352 %_2708)))
                         (map car %_2704)
                         (map cdr %_2704))))
                    (set! %_2614
                      (lambda (%_2720 %_2721)
                        (((lambda (%_2722)
                            (begin
                              (set! %_2722
                                (lambda (%_2723 %_2724 %_2725)
                                  (if (%_1162 %_2723)
                                    (if (%_1290 %_2723 %_2721)
                                      (values (vector 'free-id %_2723) %_2725)
                                      (values
                                        'any
                                        (cons (cons %_2723 %_2724) %_2725)))
                                    ((lambda (%_2726)
                                       ((lambda (%_2727)
                                          (if (if %_2727
                                                (apply (lambda (%_2728 %_2729)
                                                         (%_1348 %_2729))
                                                       %_2727)
                                                '#f)
                                            (apply (lambda (%_2730 %_2731)
                                                     (call-with-values
                                                       (lambda ()
                                                         (%_2722
                                                           %_2730
                                                           (+ %_2724 '1)
                                                           %_2725))
                                                       (lambda (%_2732 %_2733)
                                                         (values
                                                           (if (eq? %_2732
                                                                    'any)
                                                             'each-any
                                                             (vector
                                                               'each
                                                               %_2732))
                                                           %_2733))))
                                                   %_2727)
                                            ((lambda (%_2734)
                                               (if %_2734
                                                 (apply (lambda (%_2735 %_2736)
                                                          (call-with-values
                                                            (lambda ()
                                                              (%_2722
                                                                %_2736
                                                                %_2724
                                                                %_2725))
                                                            (lambda (%_2737
                                                                     %_2738)
                                                              (call-with-values
                                                                (lambda ()
                                                                  (%_2722
                                                                    %_2735
                                                                    %_2724
                                                                    %_2738))
                                                                (lambda (%_2739
                                                                         %_2740)
                                                                  (values
                                                                    (cons %_2739
                                                                          %_2737)
                                                                    %_2740))))))
                                                        %_2734)
                                                 ((lambda (%_2741)
                                                    (if %_2741
                                                      (apply (lambda ()
                                                               (values
                                                                 '()
                                                                 %_2725))
                                                             %_2741)
                                                      ((lambda (%_2742)
                                                         (if %_2742
                                                           (apply (lambda (%_2743)
                                                                    (call-with-values
                                                                      (lambda ()
                                                                        (%_2722
                                                                          %_2743
                                                                          %_2724
                                                                          %_2725))
                                                                      (lambda (%_2745
                                                                               %_2746)
                                                                        (values
                                                                          (vector
                                                                            'vector
                                                                            %_2745)
                                                                          %_2746))))
                                                                  %_2742)
                                                           ((lambda (%_2747)
                                                              (values
                                                                (vector
                                                                  'atom
                                                                  (%_1351
                                                                    %_2723
                                                                    '(())))
                                                                %_2725))
                                                            %_2726)))
                                                       ($syntax-dispatch
                                                         (make-annotation
                                                           %_2726
                                                           value)
                                                         '#2(vector
                                                             each-any)))))
                                                  ($syntax-dispatch
                                                    (make-annotation
                                                      %_2726
                                                      value)
                                                    '()))))
                                             ($syntax-dispatch
                                               (make-annotation %_2726 value)
                                               '(any . any)))))
                                        ($syntax-dispatch
                                          (make-annotation %_2726 value)
                                          '(any any))))
                                     %_2723))))
                              %_2722))
                          #f)
                         %_2720
                         '0
                         '())))
                    (lambda (%_2748 %_2749 %_2750 %_2751)
                      ((lambda (%_2752)
                         ((lambda (%_2753)
                            ((lambda (%_2754)
                               (if %_2754
                                 (apply (lambda (%_2755 %_2756 %_2757 %_2758)
                                          (if (andmap
                                                (lambda (%_2759)
                                                  (if (%_1162 %_2759)
                                                    (not (%_1348 %_2759))
                                                    '#f))
                                                %_2757)
                                            ((lambda (%_2761)
                                               (if %_2751
                                                 (list 'make-annotation
                                                       (list (if '#f
                                                               (list 'make-annotation
                                                                     (list 'lambda
                                                                           (list %_2761)
                                                                           (%_2617
                                                                             %_2761
                                                                             %_2757
                                                                             %_2758
                                                                             %_2749))
                                                                     '#f)
                                                               (list 'lambda
                                                                     (list %_2761)
                                                                     (%_2617
                                                                       %_2761
                                                                       %_2757
                                                                       %_2758
                                                                       %_2749)))
                                                             (%_1333
                                                               %_2756
                                                               %_2749
                                                               '(())))
                                                       %_2751)
                                                 (list (if '#f
                                                         (list 'make-annotation
                                                               (list 'lambda
                                                                     (list %_2761)
                                                                     (%_2617
                                                                       %_2761
                                                                       %_2757
                                                                       %_2758
                                                                       %_2749))
                                                               '#f)
                                                         (list 'lambda
                                                               (list %_2761)
                                                               (%_2617
                                                                 %_2761
                                                                 %_2757
                                                                 %_2758
                                                                 %_2749)))
                                                       (%_1333
                                                         %_2756
                                                         %_2749
                                                         '(())))))
                                             (%_1352 'tmp))
                                            (syntax-error
                                              %_2752
                                              '"invalid literals list in")))
                                        %_2754)
                                 (syntax-error %_2753)))
                             ($syntax-dispatch
                               (make-annotation %_2753 value)
                               '(any any each-any . each-any))))
                          %_2752))
                       (%_1292 %_2748 %_2750 %_2751)))))
                #f
                #f
                #f
                #f))))
          (set! sc-expand
            ((lambda (%_2770 %_2771 %_2772)
               ((lambda (%_2773)
                  (lambda (%_2774)
                    (if (if (pair? %_2774)
                          (equal? (car %_2774) %_950)
                          '#f)
                      (cadr %_2774)
                      (%_1298 %_2774 '() %_2773 %_2770 %_2771 %_2772))))
                (%_1169
                  (%_1170 '((top)))
                  (cons %_2772 (%_1171 '((top)))))))
             '(l c)
             '(l)
             ((lambda (%_2775)
                (begin (%_1272 %_2775 '*top*) %_2775))
              (%_1210 '() '() '()))))
          (set! identifier?
            (lambda (%_2776) (%_1161 %_2776)))
          (set! datum->syntax-object
            (lambda (%_2777 %_2778)
              (begin
                ((lambda (%_2779)
                   (if (not (%_1161 %_2779))
                     (%_989 'datum->syntax-object
                            '"invalid argument"
                            %_2779)
                     (void)))
                 %_2777)
                (%_1109 %_2778 (%_1112 %_2777)))))
          (set! syntax-object->datum
            (lambda (%_2780) (%_1351 %_2780 '(()))))
          (set! generate-temporaries
            (lambda (%_2781)
              (begin
                ((lambda (%_2782)
                   (if (not (list? %_2782))
                     (%_989 'generate-temporaries
                            '"invalid argument"
                            %_2782)
                     (void)))
                 %_2781)
                (map (lambda (%_2783) (%_1291 (gensym) '((top))))
                     %_2781))))
          (set! free-identifier=?
            (lambda (%_2784 %_2785)
              (begin
                ((lambda (%_2786)
                   (if (not (%_1161 %_2786))
                     (%_989 'free-identifier=?
                            '"invalid argument"
                            %_2786)
                     (void)))
                 %_2784)
                ((lambda (%_2787)
                   (if (not (%_1161 %_2787))
                     (%_989 'free-identifier=?
                            '"invalid argument"
                            %_2787)
                     (void)))
                 %_2785)
                (%_1284 %_2784 %_2785))))
          (set! bound-identifier=?
            (lambda (%_2788 %_2789)
              (begin
                ((lambda (%_2790)
                   (if (not (%_1161 %_2790))
                     (%_989 'bound-identifier=?
                            '"invalid argument"
                            %_2790)
                     (void)))
                 %_2788)
                ((lambda (%_2791)
                   (if (not (%_1161 %_2791))
                     (%_989 'bound-identifier=?
                            '"invalid argument"
                            %_2791)
                     (void)))
                 %_2789)
                (%_1286 %_2788 %_2789))))
          (set! literal-identifier=?
            (lambda (%_2792 %_2793)
              (begin
                ((lambda (%_2794)
                   (if (not (%_1161 %_2794))
                     (%_989 'literal-identifier=?
                            '"invalid argument"
                            %_2794)
                     (void)))
                 %_2792)
                ((lambda (%_2795)
                   (if (not (%_1161 %_2795))
                     (%_989 'literal-identifier=?
                            '"invalid argument"
                            %_2795)
                     (void)))
                 %_2793)
                (%_1285 %_2792 %_2793))))
          (set! syntax-error
            (lambda (%_2797 . %_2796)
              (begin
                (for-each
                  (lambda (%_2798)
                    ((lambda (%_2799)
                       (if (not (string? %_2799))
                         (%_989 'syntax-error '"invalid argument" %_2799)
                         (void)))
                     %_2798))
                  %_2796)
                ((lambda (%_2800)
                   (%_989 '#f %_2800 (%_1351 %_2797 '(()))))
                 (if (null? %_2796)
                   '"invalid syntax"
                   (apply string-append %_2796))))))
          ((lambda ()
             ((lambda (%_2805 %_2804 %_2803 %_2802 %_2801)
                (begin
                  (set! %_2805
                    (lambda (%_2806 %_2807 %_2808 %_2809)
                      (if (not %_2809)
                        '#f
                        (if (eq? %_2807 'any)
                          (cons (%_1291 %_2806 %_2808) %_2809)
                          (if (%_1110 %_2806)
                            (%_2804
                              ((lambda (%_2810)
                                 (if (annotation? %_2810)
                                   (annotation-expression %_2810)
                                   %_2810))
                               (%_1111 %_2806))
                              %_2807
                              (%_1277 %_2808 (%_1112 %_2806))
                              %_2809)
                            (%_2804
                              ((lambda (%_2811)
                                 (if (annotation? %_2811)
                                   (annotation-expression %_2811)
                                   %_2811))
                               %_2806)
                              %_2807
                              %_2808
                              %_2809))))))
                  (set! %_2804
                    (lambda (%_2812 %_2813 %_2814 %_2815)
                      (if (null? %_2813)
                        (if (null? %_2812) %_2815 '#f)
                        (if (pair? %_2813)
                          (if (pair? %_2812)
                            (%_2805
                              (car %_2812)
                              (car %_2813)
                              %_2814
                              (%_2805 (cdr %_2812) (cdr %_2813) %_2814 %_2815))
                            '#f)
                          (if (eq? %_2813 'each-any)
                            ((lambda (%_2816)
                               (if %_2816 (cons %_2816 %_2815) '#f))
                             (%_2802 %_2812 %_2814))
                            ((lambda (%_2817)
                               (if (memv %_2817 '(each))
                                 (if (null? %_2812)
                                   (%_2803 (vector-ref %_2813 '1) %_2815)
                                   ((lambda (%_2818)
                                      (if %_2818
                                        (((lambda (%_2819)
                                            (begin
                                              (set! %_2819
                                                (lambda (%_2820)
                                                  (if (null? (car %_2820))
                                                    %_2815
                                                    (cons (map car %_2820)
                                                          (%_2819
                                                            (map cdr
                                                                 %_2820))))))
                                              %_2819))
                                          #f)
                                         %_2818)
                                        '#f))
                                    (%_2801
                                      %_2812
                                      (vector-ref %_2813 '1)
                                      %_2814)))
                                 (if (memv %_2817 '(free-id))
                                   (if (%_1162 %_2812)
                                     (if (%_1285
                                           (%_1291 %_2812 %_2814)
                                           (vector-ref %_2813 '1))
                                       %_2815
                                       '#f)
                                     '#f)
                                   (if (memv %_2817 '(atom))
                                     (if (equal?
                                           (vector-ref %_2813 '1)
                                           (%_1351 %_2812 %_2814))
                                       %_2815
                                       '#f)
                                     (if (memv %_2817 '(vector))
                                       (if (vector? %_2812)
                                         (%_2805
                                           (vector->list %_2812)
                                           (vector-ref %_2813 '1)
                                           %_2814
                                           %_2815)
                                         '#f)
                                       (void))))))
                             (vector-ref %_2813 '0)))))))
                  (set! %_2803
                    (lambda (%_2821 %_2822)
                      (if (null? %_2821)
                        %_2822
                        (if (eq? %_2821 'any)
                          (cons '() %_2822)
                          (if (pair? %_2821)
                            (%_2803
                              (car %_2821)
                              (%_2803 (cdr %_2821) %_2822))
                            (if (eq? %_2821 'each-any)
                              (cons '() %_2822)
                              ((lambda (%_2823)
                                 (if (memv %_2823 '(each))
                                   (%_2803 (vector-ref %_2821 '1) %_2822)
                                   (if (memv %_2823 '(free-id atom))
                                     %_2822
                                     (if (memv %_2823 '(vector))
                                       (%_2803 (vector-ref %_2821 '1) %_2822)
                                       (void)))))
                               (vector-ref %_2821 '0))))))))
                  (set! %_2802
                    (lambda (%_2824 %_2825)
                      (if (annotation? %_2824)
                        (%_2802
                          (annotation-expression %_2824)
                          %_2825)
                        (if (pair? %_2824)
                          ((lambda (%_2826)
                             (if %_2826
                               (cons (%_1291 (car %_2824) %_2825) %_2826)
                               '#f))
                           (%_2802 (cdr %_2824) %_2825))
                          (if (null? %_2824)
                            '()
                            (if (%_1110 %_2824)
                              (%_2802
                                (%_1111 %_2824)
                                (%_1277 %_2825 (%_1112 %_2824)))
                              '#f))))))
                  (set! %_2801
                    (lambda (%_2827 %_2828 %_2829)
                      (if (annotation? %_2827)
                        (%_2801
                          (annotation-expression %_2827)
                          %_2828
                          %_2829)
                        (if (pair? %_2827)
                          ((lambda (%_2830)
                             (if %_2830
                               ((lambda (%_2831)
                                  (if %_2831 (cons %_2830 %_2831) '#f))
                                (%_2801 (cdr %_2827) %_2828 %_2829))
                               '#f))
                           (%_2805 (car %_2827) %_2828 %_2829 '()))
                          (if (null? %_2827)
                            '()
                            (if (%_1110 %_2827)
                              (%_2801
                                (%_1111 %_2827)
                                %_2828
                                (%_1277 %_2829 (%_1112 %_2827)))
                              '#f))))))
                  (set! $syntax-dispatch
                    (lambda (%_2832 %_2833)
                      (if (eq? %_2833 'any)
                        (list %_2832)
                        (if (%_1110 %_2832)
                          (%_2804
                            ((lambda (%_2834)
                               (if (annotation? %_2834)
                                 (annotation-expression %_2834)
                                 %_2834))
                             (%_1111 %_2832))
                            %_2833
                            (%_1112 %_2832)
                            '())
                          (%_2804
                            ((lambda (%_2835)
                               (if (annotation? %_2835)
                                 (annotation-expression %_2835)
                                 %_2835))
                             %_2832)
                            %_2833
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
  (lambda (%_2836)
    ((lambda (%_2837)
       ((lambda (%_2838)
          (if %_2838
            (apply (lambda (%_2839 %_2840 %_2841)
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
                           (cons %_2840 %_2841)))
                   %_2838)
            ((lambda (%_2843)
               (if %_2843
                 (apply (lambda (%_2844 %_2845 %_2846 %_2847 %_2848)
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
                                %_2846
                                '()
                                (list %_2845
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
                                            (cons %_2847 %_2848)))))
                        %_2843)
                 ((lambda (%_2850)
                    (if %_2850
                      (apply (lambda (%_2851 %_2852 %_2853 %_2854 %_2855)
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
                                           %_2853)
                                     '()
                                     (list %_2852
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
                                                 (cons %_2854 %_2855)))))
                             %_2850)
                      (syntax-error %_2837)))
                  ($syntax-dispatch
                    (make-annotation %_2837 value)
                    '(any #2(each (any any)) any . each-any)))))
             ($syntax-dispatch
               (make-annotation %_2837 value)
               '(any ((any any)) any . each-any)))))
        ($syntax-dispatch
          (make-annotation %_2837 value)
          '(any () any . each-any))))
     %_2836)))
($sc-put-cte
  'syntax-rules
  (lambda (%_2859)
    ((lambda (%_2860)
       ((lambda (%_2861)
          (if %_2861
            (apply (lambda (%_2862 %_2863 %_2864 %_2865 %_2866)
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
                                       (cons %_2863
                                             (map (lambda (%_2869 %_2868)
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
                                                                %_2868)
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
                                                                %_2869)))
                                                  %_2866
                                                  %_2865))))))
                   %_2861)
            (syntax-error %_2860)))
        ($syntax-dispatch
          (make-annotation %_2860 value)
          '(any each-any . #2(each ((any . any) any))))))
     %_2859)))
($sc-put-cte
  'or
  (lambda (%_2870)
    ((lambda (%_2871)
       ((lambda (%_2872)
          (if %_2872
            (apply (lambda (%_2873)
                     '#3(syntax-object
                         #f
                         ((top)
                          #4(ribcage #1(_) #1((top)) #1("i"))
                          #4(ribcage ())
                          #4(ribcage #1(x) #1((top)) #1("i"))
                          #4(ribcage ((import-token . *top*)) ()))))
                   %_2872)
            ((lambda (%_2874)
               (if %_2874
                 (apply (lambda (%_2875 %_2876) %_2876) %_2874)
                 ((lambda (%_2877)
                    (if %_2877
                      (apply (lambda (%_2878 %_2879 %_2880 %_2881)
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
                                                 %_2879))
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
                                                 (cons %_2880 %_2881)))))
                             %_2877)
                      (syntax-error %_2871)))
                  ($syntax-dispatch
                    (make-annotation %_2871 value)
                    '(any any any . each-any)))))
             ($syntax-dispatch
               (make-annotation %_2871 value)
               '(any any)))))
        ($syntax-dispatch
          (make-annotation %_2871 value)
          '(any))))
     %_2870)))
($sc-put-cte
  'and
  (lambda (%_2883)
    ((lambda (%_2884)
       ((lambda (%_2885)
          (if %_2885
            (apply (lambda (%_2886 %_2887 %_2888 %_2889)
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
                           (cons %_2887
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
                                             (cons %_2888 %_2889))
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
                   %_2885)
            ((lambda (%_2891)
               (if %_2891
                 (apply (lambda (%_2892 %_2893) %_2893) %_2891)
                 ((lambda (%_2894)
                    (if %_2894
                      (apply (lambda (%_2895)
                               '#3(syntax-object
                                   #t
                                   ((top)
                                    #4(ribcage #1(_) #1((top)) #1("i"))
                                    #4(ribcage ())
                                    #4(ribcage #1(x) #1((top)) #1("i"))
                                    #4(ribcage ((import-token . *top*)) ()))))
                             %_2894)
                      (syntax-error %_2884)))
                  ($syntax-dispatch
                    (make-annotation %_2884 value)
                    '(any)))))
             ($syntax-dispatch
               (make-annotation %_2884 value)
               '(any any)))))
        ($syntax-dispatch
          (make-annotation %_2884 value)
          '(any any any . each-any))))
     %_2883)))
($sc-put-cte
  'let
  (lambda (%_2896)
    ((lambda (%_2897)
       ((lambda (%_2898)
          (if (if %_2898
                (apply (lambda (%_2899 %_2900 %_2901 %_2902 %_2903)
                         (andmap identifier? %_2900))
                       %_2898)
                '#f)
            (apply (lambda (%_2905 %_2906 %_2907 %_2908 %_2909)
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
                                 (cons %_2906 (cons %_2908 %_2909)))
                           %_2907))
                   %_2898)
            ((lambda (%_2913)
               (if (if %_2913
                     (apply (lambda (%_2914 %_2915 %_2916 %_2917 %_2918 %_2919)
                              (andmap identifier? (cons %_2915 %_2916)))
                            %_2913)
                     '#f)
                 (apply (lambda (%_2921 %_2922 %_2923 %_2924 %_2925 %_2926)
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
                                      (list (list %_2922
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
                                                        (cons %_2923
                                                              (cons %_2925
                                                                    %_2926)))))
                                      %_2922)
                                %_2924))
                        %_2913)
                 (syntax-error %_2897)))
             ($syntax-dispatch
               (make-annotation %_2897 value)
               '(any any #2(each (any any)) any . each-any)))))
        ($syntax-dispatch
          (make-annotation %_2897 value)
          '(any #2(each (any any)) any . each-any))))
     %_2896)))
($sc-put-cte
  'let*
  (lambda (%_2930)
    ((lambda (%_2931)
       ((lambda (%_2932)
          (if (if %_2932
                (apply (lambda (%_2933 %_2934 %_2935 %_2936 %_2937)
                         (andmap identifier? %_2934))
                       %_2932)
                '#f)
            (apply (lambda (%_2939 %_2940 %_2941 %_2942 %_2943)
                     (((lambda (%_2944)
                         (begin
                           (set! %_2944
                             (lambda (%_2945)
                               (if (null? %_2945)
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
                                       (cons '() (cons %_2942 %_2943)))
                                 ((lambda (%_2947)
                                    ((lambda (%_2948)
                                       (if %_2948
                                         (apply (lambda (%_2949 %_2950)
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
                                                        (list %_2950)
                                                        %_2949))
                                                %_2948)
                                         (syntax-error %_2947)))
                                     ($syntax-dispatch
                                       (make-annotation %_2947 value)
                                       '(any any))))
                                  (list (%_2944 (cdr %_2945)) (car %_2945))))))
                           %_2944))
                       #f)
                      (map list %_2940 %_2941)))
                   %_2932)
            (syntax-error %_2931)))
        ($syntax-dispatch
          (make-annotation %_2931 value)
          '(any #2(each (any any)) any . each-any))))
     %_2930)))
($sc-put-cte
  'cond
  (lambda (%_2953)
    ((lambda (%_2954)
       ((lambda (%_2955)
          (if %_2955
            (apply (lambda (%_2956 %_2957 %_2958)
                     (((lambda (%_2959)
                         (begin
                           (set! %_2959
                             (lambda (%_2960 %_2961)
                               (if (null? %_2961)
                                 ((lambda (%_2962)
                                    ((lambda (%_2963)
                                       (if %_2963
                                         (apply (lambda (%_2964 %_2965)
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
                                                        (cons %_2964 %_2965)))
                                                %_2963)
                                         ((lambda (%_2967)
                                            (if %_2967
                                              (apply (lambda (%_2968)
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
                                                                               %_2968))
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
                                                     %_2967)
                                              ((lambda (%_2969)
                                                 (if %_2969
                                                   (apply (lambda (%_2970
                                                                   %_2971)
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
                                                                              %_2970))
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
                                                                        (cons %_2971
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
                                                          %_2969)
                                                   ((lambda (%_2972)
                                                      (if %_2972
                                                        (apply (lambda (%_2973
                                                                        %_2974
                                                                        %_2975)
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
                                                                       %_2973
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
                                                                             (cons %_2974
                                                                                   %_2975))))
                                                               %_2972)
                                                        ((lambda (%_2977)
                                                           (syntax-error
                                                             %_2953))
                                                         %_2962)))
                                                    ($syntax-dispatch
                                                      (make-annotation
                                                        %_2962
                                                        value)
                                                      '(any any . each-any)))))
                                               ($syntax-dispatch
                                                 (make-annotation %_2962 value)
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
                                          ($syntax-dispatch
                                            (make-annotation %_2962 value)
                                            '(any)))))
                                     ($syntax-dispatch
                                       (make-annotation %_2962 value)
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
                                  %_2960)
                                 ((lambda (%_2978)
                                    ((lambda (%_2979)
                                       ((lambda (%_2980)
                                          ((lambda (%_2981)
                                             (if %_2981
                                               (apply (lambda (%_2982)
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
                                                                          %_2982))
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
                                                                    %_2979)))
                                                      %_2981)
                                               ((lambda (%_2983)
                                                  (if %_2983
                                                    (apply (lambda (%_2984
                                                                    %_2985)
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
                                                                               %_2984))
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
                                                                         (cons %_2985
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
                                                                         %_2979)))
                                                           %_2983)
                                                    ((lambda (%_2986)
                                                       (if %_2986
                                                         (apply (lambda (%_2987
                                                                         %_2988
                                                                         %_2989)
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
                                                                        %_2987
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
                                                                              (cons %_2988
                                                                                    %_2989))
                                                                        %_2979))
                                                                %_2986)
                                                         ((lambda (%_2991)
                                                            (syntax-error
                                                              %_2953))
                                                          %_2980)))
                                                     ($syntax-dispatch
                                                       (make-annotation
                                                         %_2980
                                                         value)
                                                       '(any any
                                                             .
                                                             each-any)))))
                                                ($syntax-dispatch
                                                  (make-annotation
                                                    %_2980
                                                    value)
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
                                           ($syntax-dispatch
                                             (make-annotation %_2980 value)
                                             '(any))))
                                        %_2960))
                                     %_2978))
                                  (%_2959 (car %_2961) (cdr %_2961))))))
                           %_2959))
                       #f)
                      %_2957
                      %_2958))
                   %_2955)
            (syntax-error %_2954)))
        ($syntax-dispatch
          (make-annotation %_2954 value)
          '(any any . each-any))))
     %_2953)))
($sc-put-cte
  'do
  (lambda (%_2993)
    ((lambda (%_2994)
       ((lambda (%_2995)
          (if %_2995
            (apply (lambda (%_2996
                            %_2997
                            %_2998
                            %_2999
                            %_3000
                            %_3001
                            %_3002)
                     ((lambda (%_3003)
                        ((lambda (%_3004)
                           (if %_3004
                             (apply (lambda (%_3005)
                                      ((lambda (%_3006)
                                         ((lambda (%_3007)
                                            (if %_3007
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
                                                                  %_2997
                                                                  %_2998)
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
                                                                         %_3000)
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
                                                                           %_3002
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
                                                                                       %_3005)))))))
                                                     %_3007)
                                              ((lambda (%_3012)
                                                 (if %_3012
                                                   (apply (lambda (%_3013
                                                                   %_3014)
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
                                                                       %_2997
                                                                       %_2998)
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
                                                                        %_3000
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
                                                                              (cons %_3013
                                                                                    %_3014))
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
                                                                                %_3002
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
                                                                                            %_3005)))))))
                                                          %_3012)
                                                   (syntax-error %_3006)))
                                               ($syntax-dispatch
                                                 (make-annotation %_3006 value)
                                                 '(any . each-any)))))
                                          ($syntax-dispatch
                                            (make-annotation %_3006 value)
                                            '())))
                                       %_3001))
                                    %_3004)
                             (syntax-error %_3003)))
                         ($syntax-dispatch
                           (make-annotation %_3003 value)
                           'each-any)))
                      (map (lambda (%_3021 %_3022)
                             ((lambda (%_3023)
                                ((lambda (%_3024)
                                   (if %_3024
                                     (apply (lambda () %_3021) %_3024)
                                     ((lambda (%_3025)
                                        (if %_3025
                                          (apply (lambda (%_3026) %_3026)
                                                 %_3025)
                                          ((lambda (%_3027)
                                             (syntax-error %_2993))
                                           %_3023)))
                                      ($syntax-dispatch
                                        (make-annotation %_3023 value)
                                        '(any)))))
                                 ($syntax-dispatch
                                   (make-annotation %_3023 value)
                                   '())))
                              %_3022))
                           %_2997
                           %_2999)))
                   %_2995)
            (syntax-error %_2994)))
        ($syntax-dispatch
          (make-annotation %_2994 value)
          '(any #2(each (any any . any))
                (any . each-any)
                .
                each-any))))
     %_2993)))
($sc-put-cte
  'quasiquote
  ((lambda (%_3030
            %_3031
            %_3032
            %_3033
            %_3034
            %_3035
            %_3036
            %_3037
            %_3038)
     (begin
       (set! %_3030
         (lambda (%_3039)
           (if (identifier? %_3039)
             (free-identifier=?
               %_3039
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
       (set! %_3031
         (lambda (%_3040)
           (if (identifier? %_3040)
             (free-identifier=?
               %_3040
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
       (set! %_3032
         (lambda (%_3041)
           (if (identifier? %_3041)
             (free-identifier=?
               %_3041
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
       (set! %_3033
         (lambda (%_3042)
           ((lambda (%_3043)
              ((lambda (%_3044)
                 (if %_3044
                   (apply (lambda (%_3045) (%_3030 %_3045)) %_3044)
                   ((lambda (%_3046) '#f) %_3043)))
               ($syntax-dispatch
                 (make-annotation %_3043 value)
                 '(any ()))))
            %_3042)))
       (set! %_3034
         (lambda (%_3047 %_3048)
           (((lambda (%_3049)
               (begin
                 (set! %_3049
                   (lambda (%_3050)
                     (if (null? %_3050)
                       %_3048
                       (%_3035 (car %_3050) (%_3049 (cdr %_3050))))))
                 %_3049))
             #f)
            %_3047)))
       (set! %_3035
         (lambda (%_3051 %_3052)
           ((lambda (%_3053)
              ((lambda (%_3054)
                 (if %_3054
                   (apply (lambda (%_3055 %_3056)
                            ((lambda (%_3057)
                               ((lambda (%_3058)
                                  (if (if %_3058
                                        (apply (lambda (%_3059 %_3060)
                                                 (%_3030 %_3059))
                                               %_3058)
                                        '#f)
                                    (apply (lambda (%_3061 %_3062)
                                             ((lambda (%_3063)
                                                ((lambda (%_3064)
                                                   (if (if %_3064
                                                         (apply (lambda (%_3065
                                                                         %_3066)
                                                                  (%_3030
                                                                    %_3065))
                                                                %_3064)
                                                         '#f)
                                                     (apply (lambda (%_3067
                                                                     %_3068)
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
                                                                    (cons %_3068
                                                                          %_3062)))
                                                            %_3064)
                                                     ((lambda (%_3069)
                                                        (if (null? %_3062)
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
                                                                %_3055)
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
                                                                %_3055
                                                                %_3056)))
                                                      %_3063)))
                                                 ($syntax-dispatch
                                                   (make-annotation
                                                     %_3063
                                                     value)
                                                   '(any any))))
                                              %_3055))
                                           %_3058)
                                    ((lambda (%_3070)
                                       (if (if %_3070
                                             (apply (lambda (%_3071 %_3072)
                                                      (%_3031 %_3071))
                                                    %_3070)
                                             '#f)
                                         (apply (lambda (%_3073 %_3074)
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
                                                        (cons %_3055 %_3074)))
                                                %_3070)
                                         ((lambda (%_3075)
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
                                                  %_3055
                                                  %_3056))
                                          %_3057)))
                                     ($syntax-dispatch
                                       (make-annotation %_3057 value)
                                       '(any . any)))))
                                ($syntax-dispatch
                                  (make-annotation %_3057 value)
                                  '(any any))))
                             %_3056))
                          %_3054)
                   (syntax-error %_3053)))
               ($syntax-dispatch
                 (make-annotation %_3053 value)
                 '(any any))))
            (list %_3051 %_3052))))
       (set! %_3036
         (lambda (%_3076 %_3077)
           ((lambda (%_3078)
              (if (null? %_3078)
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
                (if (null? (cdr %_3078))
                  (car %_3078)
                  ((lambda (%_3079)
                     ((lambda (%_3080)
                        (if %_3080
                          (apply (lambda (%_3081)
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
                                         %_3081))
                                 %_3080)
                          (syntax-error %_3079)))
                      ($syntax-dispatch
                        (make-annotation %_3079 value)
                        'each-any)))
                   %_3078))))
            (((lambda (%_3083)
                (begin
                  (set! %_3083
                    (lambda (%_3084)
                      (if (null? %_3084)
                        (if (%_3033 %_3077) '() (list %_3077))
                        (if (%_3033 (car %_3084))
                          (%_3083 (cdr %_3084))
                          (cons (car %_3084) (%_3083 (cdr %_3084)))))))
                  %_3083))
              #f)
             %_3076))))
       (set! %_3037
         (lambda (%_3085)
           ((lambda (%_3086)
              ((lambda (%_3087)
                 ((lambda (%_3088)
                    ((lambda (%_3089)
                       (if (if %_3089
                             (apply (lambda (%_3090 %_3091) (%_3030 %_3090))
                                    %_3089)
                             '#f)
                         (apply (lambda (%_3092 %_3093)
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
                                        (list->vector %_3093)))
                                %_3089)
                         ((lambda (%_3095)
                            (((lambda (%_3096)
                                (begin
                                  (set! %_3096
                                    (lambda (%_3097 %_3098)
                                      ((lambda (%_3099)
                                         ((lambda (%_3100)
                                            (if (if %_3100
                                                  (apply (lambda (%_3101
                                                                  %_3102)
                                                           (%_3030 %_3101))
                                                         %_3100)
                                                  '#f)
                                              (apply (lambda (%_3103 %_3104)
                                                       (%_3098
                                                         (map (lambda (%_3105)
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
                                                                      %_3105))
                                                              %_3104)))
                                                     %_3100)
                                              ((lambda (%_3106)
                                                 (if (if %_3106
                                                       (apply (lambda (%_3107
                                                                       %_3108)
                                                                (%_3031
                                                                  %_3107))
                                                              %_3106)
                                                       '#f)
                                                   (apply (lambda (%_3109
                                                                   %_3110)
                                                            (%_3098 %_3110))
                                                          %_3106)
                                                   ((lambda (%_3112)
                                                      (if (if %_3112
                                                            (apply (lambda (%_3113
                                                                            %_3114
                                                                            %_3115)
                                                                     (%_3032
                                                                       %_3113))
                                                                   %_3112)
                                                            '#f)
                                                        (apply (lambda (%_3116
                                                                        %_3117
                                                                        %_3118)
                                                                 (%_3096
                                                                   %_3118
                                                                   (lambda (%_3119)
                                                                     (%_3098
                                                                       (cons %_3117
                                                                             %_3119)))))
                                                               %_3112)
                                                        ((lambda (%_3120)
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
                                                                 %_3087))
                                                         %_3099)))
                                                    ($syntax-dispatch
                                                      (make-annotation
                                                        %_3099
                                                        value)
                                                      '(any any any)))))
                                               ($syntax-dispatch
                                                 (make-annotation %_3099 value)
                                                 '(any . each-any)))))
                                          ($syntax-dispatch
                                            (make-annotation %_3099 value)
                                            '(any each-any))))
                                       %_3097)))
                                  %_3096))
                              #f)
                             %_3085
                             (lambda (%_3121)
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
                                     %_3121))))
                          %_3088)))
                     ($syntax-dispatch
                       (make-annotation %_3088 value)
                       '(any each-any))))
                  %_3087))
               %_3086))
            %_3085)))
       (set! %_3038
         (lambda (%_3122 %_3123)
           ((lambda (%_3124)
              ((lambda (%_3125)
                 (if %_3125
                   (apply (lambda (%_3126)
                            (if (= %_3123 '0)
                              %_3126
                              (%_3035
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
                                (%_3038 (list %_3126) (- %_3123 '1)))))
                          %_3125)
                   ((lambda (%_3127)
                      (if %_3127
                        (apply (lambda (%_3128 %_3129)
                                 (if (= %_3123 '0)
                                   (%_3034 %_3128 (%_3038 %_3129 %_3123))
                                   (%_3035
                                     (%_3035
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
                                       (%_3038 %_3128 (- %_3123 '1)))
                                     (%_3038 %_3129 %_3123))))
                               %_3127)
                        ((lambda (%_3132)
                           (if %_3132
                             (apply (lambda (%_3133 %_3134)
                                      (if (= %_3123 '0)
                                        (%_3036 %_3133 (%_3038 %_3134 %_3123))
                                        (%_3035
                                          (%_3035
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
                                            (%_3038 %_3133 (- %_3123 '1)))
                                          (%_3038 %_3134 %_3123))))
                                    %_3132)
                             ((lambda (%_3137)
                                (if %_3137
                                  (apply (lambda (%_3138)
                                           (%_3035
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
                                             (%_3038
                                               (list %_3138)
                                               (+ %_3123 '1))))
                                         %_3137)
                                  ((lambda (%_3139)
                                     (if %_3139
                                       (apply (lambda (%_3140 %_3141)
                                                (%_3035
                                                  (%_3038 %_3140 %_3123)
                                                  (%_3038 %_3141 %_3123)))
                                              %_3139)
                                       ((lambda (%_3142)
                                          (if %_3142
                                            (apply (lambda (%_3143)
                                                     (%_3037
                                                       (%_3038 %_3143 %_3123)))
                                                   %_3142)
                                            ((lambda (%_3145)
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
                                                     %_3145))
                                             %_3124)))
                                        ($syntax-dispatch
                                          (make-annotation %_3124 value)
                                          '#2(vector each-any)))))
                                   ($syntax-dispatch
                                     (make-annotation %_3124 value)
                                     '(any . any)))))
                              ($syntax-dispatch
                                (make-annotation %_3124 value)
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
                           (make-annotation %_3124 value)
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
                      (make-annotation %_3124 value)
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
                 (make-annotation %_3124 value)
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
            %_3122)))
       (lambda (%_3146)
         ((lambda (%_3147)
            ((lambda (%_3148)
               (if %_3148
                 (apply (lambda (%_3149 %_3150) (%_3038 %_3150 '0))
                        %_3148)
                 (syntax-error %_3147)))
             ($syntax-dispatch
               (make-annotation %_3147 value)
               '(any any))))
          %_3146))))
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
  (lambda (%_3151)
    ((lambda (%_3152)
       (begin
         (set! %_3152
           (lambda (%_3153 %_3154)
             ((lambda (%_3155)
                (((lambda (%_3156)
                    (begin
                      (set! %_3156
                        (lambda (%_3157)
                          ((lambda (%_3158)
                             (if (eof-object? %_3158)
                               (begin
                                 (close-input-port %_3155)
                                 (reverse %_3157))
                               (%_3156
                                 (cons (datum->syntax-object %_3154 %_3158)
                                       %_3157))))
                           (read-with-annotations %_3155))))
                      %_3156))
                  #f)
                 '()))
              (open-source-input-file %_3153))))
         ((lambda (%_3159)
            ((lambda (%_3160)
               (if %_3160
                 (apply (lambda (%_3161 %_3162)
                          ((lambda (%_3163)
                             ((lambda (%_3164)
                                ((lambda (%_3165)
                                   (if %_3165
                                     (apply (lambda (%_3166)
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
                                                    %_3166))
                                            %_3165)
                                     (syntax-error %_3164)))
                                 ($syntax-dispatch
                                   (make-annotation %_3164 value)
                                   'each-any)))
                              (%_3152 %_3163 %_3161)))
                           (syntax-object->datum %_3162)))
                        %_3160)
                 (syntax-error %_3159)))
             ($syntax-dispatch
               (make-annotation %_3159 value)
               '(any any))))
          %_3151)))
     #f)))
($sc-put-cte
  'unquote
  (lambda (%_3168)
    ((lambda (%_3169)
       ((lambda (%_3170)
          (if %_3170
            (apply (lambda (%_3171 %_3172)
                     (syntax-error
                       %_3168
                       '"expression not valid outside of quasiquote"))
                   %_3170)
            (syntax-error %_3169)))
        ($syntax-dispatch
          (make-annotation %_3169 value)
          '(any . each-any))))
     %_3168)))
($sc-put-cte
  'unquote-splicing
  (lambda (%_3173)
    ((lambda (%_3174)
       ((lambda (%_3175)
          (if %_3175
            (apply (lambda (%_3176 %_3177)
                     (syntax-error
                       %_3173
                       '"expression not valid outside of quasiquote"))
                   %_3175)
            (syntax-error %_3174)))
        ($syntax-dispatch
          (make-annotation %_3174 value)
          '(any . each-any))))
     %_3173)))
($sc-put-cte
  'case
  (lambda (%_3178)
    ((lambda (%_3179)
       ((lambda (%_3180)
          (if %_3180
            (apply (lambda (%_3181 %_3182 %_3183 %_3184)
                     ((lambda (%_3185)
                        ((lambda (%_3186)
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
                                             %_3182))
                                 %_3186))
                         %_3185))
                      (((lambda (%_3187)
                          (begin
                            (set! %_3187
                              (lambda (%_3188 %_3189)
                                (if (null? %_3189)
                                  ((lambda (%_3190)
                                     ((lambda (%_3191)
                                        (if %_3191
                                          (apply (lambda (%_3192 %_3193)
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
                                                         (cons %_3192 %_3193)))
                                                 %_3191)
                                          ((lambda (%_3195)
                                             (if %_3195
                                               (apply (lambda (%_3196
                                                               %_3197
                                                               %_3198)
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
                                                                          %_3196))
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
                                                                    (cons %_3197
                                                                          %_3198))))
                                                      %_3195)
                                               ((lambda (%_3201)
                                                  (syntax-error %_3178))
                                                %_3190)))
                                           ($syntax-dispatch
                                             (make-annotation %_3190 value)
                                             '(each-any any . each-any)))))
                                      ($syntax-dispatch
                                        (make-annotation %_3190 value)
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
                                   %_3188)
                                  ((lambda (%_3202)
                                     ((lambda (%_3203)
                                        ((lambda (%_3204)
                                           ((lambda (%_3205)
                                              (if %_3205
                                                (apply (lambda (%_3206
                                                                %_3207
                                                                %_3208)
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
                                                                           %_3206))
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
                                                                     (cons %_3207
                                                                           %_3208))
                                                               %_3203))
                                                       %_3205)
                                                ((lambda (%_3211)
                                                   (syntax-error %_3178))
                                                 %_3204)))
                                            ($syntax-dispatch
                                              (make-annotation %_3204 value)
                                              '(each-any any . each-any))))
                                         %_3188))
                                      %_3202))
                                   (%_3187 (car %_3189) (cdr %_3189))))))
                            %_3187))
                        #f)
                       %_3183
                       %_3184)))
                   %_3180)
            (syntax-error %_3179)))
        ($syntax-dispatch
          (make-annotation %_3179 value)
          '(any any any . each-any))))
     %_3178)))
($sc-put-cte
  'identifier-syntax
  (lambda (%_3213)
    ((lambda (%_3214)
       ((lambda (%_3215)
          (if %_3215
            (apply (lambda (%_3216 %_3217)
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
                                             %_3217))
                                 (list (cons %_3216
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
                                             (cons %_3217
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
                   %_3215)
            ((lambda (%_3218)
               (if (if %_3218
                     (apply (lambda (%_3219 %_3220 %_3221 %_3222 %_3223 %_3224)
                              (if (identifier? %_3220)
                                (identifier? %_3222)
                                '#f))
                            %_3218)
                     '#f)
                 (apply (lambda (%_3225 %_3226 %_3227 %_3228 %_3229 %_3230)
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
                                                        %_3228
                                                        %_3229)
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
                                                        %_3230))
                                            (list (cons %_3226
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
                                                        (cons %_3227
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
                                            (list %_3226
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
                                                              %_3226))
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
                                                        %_3227))))))
                        %_3218)
                 (syntax-error %_3214)))
             ($syntax-dispatch
               (make-annotation %_3214 value)
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
        ($syntax-dispatch
          (make-annotation %_3214 value)
          '(any any))))
     %_3213)))
