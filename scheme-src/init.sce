(define for-each
  (lambda (%_1088 . %_1087)
    (if (null? %_1087)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_1087)))
        (begin
          (apply %_1088 (map car %_1087))
          (apply for-each (cons %_1088 (map cdr %_1087))))
        (void)))))
(define eof-object?
  (lambda (%_1089) (eq? %_1089 '#!eof)))
(define not
  (lambda (%_1090) (if %_1090 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_1091
    (apply display (cons '#\newline %_1091))))
(define map (void))
(letrec ((%_1092
           (letrec ((%_1093
                      (lambda (%_1097 %_1098 %_1099 %_1100)
                        (if (null? %_1100)
                          %_1098
                          (begin
                            (set-cdr!
                              %_1099
                              (cons (%_1097 (car %_1100)) '()))
                            (%_1093
                              %_1097
                              %_1098
                              (cdr %_1099)
                              (cdr %_1100)))))))
             (lambda (%_1094 %_1095)
               (if (null? %_1095)
                 '()
                 ((lambda (%_1096)
                    (%_1093 %_1094 %_1096 %_1096 (cdr %_1095)))
                  (cons (%_1094 (car %_1095)) '())))))))
  (set! map %_1092))
(define compose
  (lambda %_1101
    (if (null? %_1101)
      (lambda (%_1105) %_1105)
      ((lambda (%_1102 %_1103)
         (lambda (%_1104) (%_1102 (%_1103 %_1104))))
       (car %_1101)
       (apply compose (cdr %_1101))))))
(define compose2
  (lambda (%_1106 %_1107)
    (lambda (%_1108) (%_1106 (%_1107 %_1108)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((%_1109
           (lambda (%_1123 %_1124 %_1125)
             (if (null? %_1125)
               '#f
               (if (%_1123 (caar %_1125) %_1124)
                 (car %_1125)
                 (%_1109 %_1123 %_1124 (cdr %_1125))))))
         (%_1110
           (lambda (%_1126 %_1127 %_1128)
             (if (null? %_1128)
               '#f
               (if (%_1126 (car %_1128) %_1127)
                 %_1128
                 (%_1110 %_1126 %_1127 (cdr %_1128)))))))
  (begin
    (set! assq
      (lambda (%_1111 %_1112)
        (%_1109 eq? %_1111 %_1112)))
    (set! assv
      (lambda (%_1113 %_1114)
        (%_1109 eqv? %_1113 %_1114)))
    (set! assoc
      (lambda (%_1115 %_1116)
        (%_1109 equal? %_1115 %_1116)))
    (set! memq
      (lambda (%_1117 %_1118)
        (%_1110 eq? %_1117 %_1118)))
    (set! memv
      (lambda (%_1119 %_1120)
        (%_1110 eqv? %_1119 %_1120)))
    (set! member
      (lambda (%_1121 %_1122)
        (%_1110 equal? %_1121 %_1122)))))
(define cadr (compose2 car cdr))
(define cdar (compose2 cdr car))
(define cddr (compose2 cdr cdr))
(define caar (compose2 car car))
(define caaar (compose2 car caar))
(define caadr (compose2 car cadr))
(define cadar (compose2 car cdar))
(define caddr (compose2 car cddr))
(define cdaar (compose2 cdr caar))
(define cdadr (compose2 cdr cadr))
(define cddar (compose2 cdr cdar))
(define cdddr (compose2 cdr cddr))
(define caaaar (compose2 car caaar))
(define caaadr (compose2 car caadr))
(define caadar (compose2 car cadar))
(define caaddr (compose2 car caddr))
(define cadaar (compose2 car cdaar))
(define cadadr (compose2 car cdadr))
(define caddar (compose2 car cddar))
(define cadddr (compose2 car cdddr))
(define cdaaar (compose2 cdr caaar))
(define cdaadr (compose2 cdr caadr))
(define cdadar (compose2 cdr cadar))
(define cdaddr (compose2 cdr caddr))
(define cddaar (compose2 cdr cdaar))
(define cddadr (compose2 cdr cdadr))
(define cdddar (compose2 cdr cddar))
(define cddddr (compose2 cdr cdddr))
(define append2
  (lambda (%_1129 %_1130)
    (if (null? %_1129)
      %_1130
      (cons (car %_1129) (append2 (cdr %_1129) %_1130)))))
(define append append2)
(define list->string
  (lambda (%_1131)
    (letrec ((%_1132
               (lambda (%_1133 %_1134 %_1135)
                 (if (null? %_1133)
                   %_1134
                   (begin
                     (string-set! %_1134 %_1135 (car %_1133))
                     (%_1132 (cdr %_1133) %_1134 (+ %_1135 '1)))))))
      (%_1132 %_1131 (make-string (length %_1131)) '0))))
(define string->list
  (letrec ((%_1136
             (lambda (%_1138 %_1139 %_1140)
               (if (< %_1140 '0)
                 %_1139
                 (%_1136
                   %_1138
                   (cons (string-ref %_1138 %_1140) %_1139)
                   (- %_1140 '1))))))
    (lambda (%_1137)
      (%_1136 %_1137 '() (- (string-length %_1137) '1)))))
(define list->vector
  (letrec ((%_1141
             (lambda (%_1143 %_1144 %_1145)
               (if (null? %_1143)
                 %_1144
                 (begin
                   (vector-set! %_1144 %_1145 (car %_1143))
                   (%_1141 (cdr %_1143) %_1144 (+ %_1145 '1)))))))
    (lambda (%_1142)
      (if (proper-list? %_1142)
        (%_1141 %_1142 (make-vector (length %_1142)) '0)
        (error 'list->vector
               '"can only convert a proper list."
               %_1142)))))
(define vector
  (lambda %_1146 (list->vector %_1146)))
(define string
  (lambda %_1147 (list->string %_1147)))
(define throw
  (lambda (%_1149 . %_1148)
    (call-with-failure-continuation
      (lambda (%_1150)
        (if (null? %_1148)
          (call-with-current-continuation
            (lambda (%_1151) (%_1150 %_1149 %_1151)))
          (%_1150 %_1149 (car %_1148)))))))
(define detect-os
  (lambda ()
    ((lambda (%_1152)
       (if (> (string-length %_1152) '3)
         (if (equal? (substring %_1152 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_1152 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_1152 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_1152 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_1152 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_1152 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_1152 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_1153
    (if (null? %_1153)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url
          (current-url)
          ((lambda (%_1154)
             ((lambda (%_1155)
                ((lambda ()
                   (if (eq? (string-ref %_1154 (- %_1155 '1)) '#\/)
                     %_1154
                     (string-append %_1154 '"/")))))
              (string-length %_1154)))
           (car %_1153)))))))
(define load-expanded load)
((lambda (%_1156)
   ((lambda (%_1157 %_1158 %_1159)
      (begin
        (set! open-input-file (%_1157 open-input-file))
        (set! open-source-input-file
          (%_1157 open-source-input-file))
        (set! open-output-file (%_1157 open-output-file))
        (set! load
          (lambda (%_1160)
            (begin
              ((lambda (%_1161)
                 (begin
                   (current-url (normalize-url %_1161 %_1160))
                   (with-failure-continuation
                     (lambda (%_1162 %_1163)
                       (begin
                         (current-url %_1161)
                         (throw %_1162 %_1163)))
                     (lambda ()
                       ((%_1158 (string->symbol (%_1159 (current-url))))
                        (current-url))))
                   (current-url %_1161)))
               (current-url))
              (void))))))
    (lambda (%_1164)
      (lambda (%_1166 . %_1165)
        (apply %_1164
               (normalize-url (current-url) %_1166)
               %_1165)))
    (lambda (%_1167)
      ((lambda (%_1168)
         (if (memv %_1168 '(sce pp)) load-expanded %_1156))
       %_1167))
    (lambda (%_1169)
      ((letrec ((%_1170
                  (lambda (%_1171 %_1172)
                    (if (null? %_1171)
                      '#f
                      (if (equal? (car %_1171) '#\.)
                        (list->string %_1172)
                        (%_1170 (cdr %_1171) (cons (car %_1171) %_1172)))))))
         %_1170)
       (reverse (string->list %_1169))
       '()))))
 load)
(define load-module
  (lambda (%_1173)
    ((lambda (%_1174)
       ((lambda (%_1175)
          ((lambda ()
             (for-each
               (lambda (%_1176)
                 (putprop
                   %_1176
                   '*toplevel*
                   (native-library-binding %_1174 %_1176)))
               %_1175))))
        (native-library-binding-names %_1174)))
     (load-native-library %_1173))))
(define reverse
  (letrec ((%_1177
             (lambda (%_1179 %_1180)
               (if (null? %_1179)
                 %_1180
                 (%_1177 (cdr %_1179) (cons (car %_1179) %_1180))))))
    (lambda (%_1178) (%_1177 %_1178 '()))))
(define append
  (letrec ((%_1181
             (lambda (%_1184 . %_1183)
               (if (null? %_1183)
                 %_1184
                 (if (null? %_1184)
                   (apply %_1181 %_1183)
                   (apply %_1181
                          (cons (append2 %_1184 (car %_1183))
                                (cdr %_1183))))))))
    (lambda %_1182
      (if (null? %_1182)
        '()
        (if (null? (cdr %_1182))
          (car %_1182)
          (apply %_1181 (cons (car %_1182) (cdr %_1182))))))))
(define map
  (letrec ((%_1185 map)
           (%_1186
             (lambda (%_1190 %_1191 %_1192 %_1193)
               (if (null? (car %_1191))
                 (if (andmap null? %_1191)
                   %_1192
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_1194 %_1195)
                    (begin
                      (if (not (null? %_1193))
                        (set-cdr! %_1193 %_1194)
                        (void))
                      (if (null? %_1192)
                        (%_1186 %_1190 %_1195 %_1194 %_1194)
                        (%_1186 %_1190 %_1195 %_1192 %_1194))))
                  (cons (apply %_1190 (%_1185 car %_1191)) '())
                  (%_1185 cdr %_1191))))))
    (lambda (%_1189 %_1188 . %_1187)
      (if (null? %_1187)
        (%_1185 %_1189 %_1188)
        (%_1186 %_1189 (cons %_1188 %_1187) '() '())))))
(define proper-list?
  (lambda (%_1196)
    ((letrec ((%_1197
                (lambda (%_1198 %_1199)
                  (if (pair? %_1198)
                    ((lambda (%_1200)
                       (if (pair? %_1200)
                         ((lambda (%_1201 %_1202)
                            (if (not (eq? %_1201 %_1202))
                              (%_1197 %_1201 %_1202)
                              '#f))
                          (cdr %_1200)
                          (cdr %_1199))
                         (null? %_1200)))
                     (cdr %_1198))
                    (null? %_1198)))))
       %_1197)
     %_1196
     %_1196)))
(define circular?
  (lambda (%_1203)
    (letrec ((%_1204
               (lambda (%_1210)
                 ((lambda (%_1211)
                    (if %_1211
                      %_1211
                      ((lambda (%_1212)
                         (if %_1212
                           %_1212
                           (if (vector? %_1210)
                             (not (zero? (vector-length %_1210)))
                             '#f)))
                       (box? %_1210))))
                  (pair? %_1210))))
             (%_1205
               (lambda (%_1213)
                 (if (pair? %_1213)
                   '2
                   (if (box? %_1213) '1 (vector-length %_1213)))))
             (%_1206
               (lambda (%_1214 %_1215)
                 (if (vector? %_1214)
                   (vector-ref %_1214 %_1215)
                   (if (box? %_1214)
                     (unbox %_1214)
                     ((if (zero? %_1215) car cdr) %_1214)))))
             (%_1207
               (lambda (%_1216)
                 ((lambda (%_1217)
                    ((letrec ((%_1218
                                (lambda (%_1219 %_1220 %_1221)
                                  (if (>= %_1220 '0)
                                    ((lambda (%_1225)
                                       (if (%_1204 %_1225)
                                         (cons %_1225 (cons %_1220 %_1221))
                                         (%_1218 %_1219 (- %_1220 '1) %_1221)))
                                     (%_1206 %_1219 %_1220))
                                    ((lambda (%_1222)
                                       (if (pair? %_1222)
                                         ((lambda (%_1223 %_1224)
                                            (%_1218
                                              (car %_1224)
                                              (- %_1223 '1)
                                              %_1224))
                                          (car %_1222)
                                          (cdr %_1222))
                                         '#f))
                                     (cdr %_1221))))))
                       %_1218)
                     %_1217
                     (- (%_1205 %_1217) '1)
                     %_1216))
                  (car %_1216))))
             (%_1208
               (lambda (%_1226 %_1227)
                 (letrec ((%_1228
                            (lambda (%_1237 %_1238)
                              ((lambda (%_1239)
                                 (if %_1239
                                   (%_1208 (%_1207 %_1237) (%_1207 %_1239))
                                   '#f))
                               (%_1207 %_1238)))))
                   (if %_1227
                     (if (not (eq? (car %_1227) (car %_1226)))
                       (%_1228 %_1226 %_1227)
                       ((letrec ((%_1229
                                   (lambda (%_1230 %_1231)
                                     ((lambda (%_1232)
                                        (if %_1232
                                          %_1232
                                          (if (if (= (cadr %_1230)
                                                     (cadr %_1231))
                                                (eq? (caddr %_1230)
                                                     (caddr %_1231))
                                                '#f)
                                            (%_1229
                                              (cddr %_1230)
                                              (cddr %_1231))
                                            ((lambda (%_1233)
                                               ((letrec ((%_1234
                                                           (lambda (%_1235)
                                                             (if %_1235
                                                               ((lambda (%_1236)
                                                                  (if %_1236
                                                                    %_1236
                                                                    (%_1234
                                                                      (%_1207
                                                                        %_1235))))
                                                                (eq? (car %_1235)
                                                                     %_1233))
                                                               (%_1228
                                                                 %_1230
                                                                 %_1231)))))
                                                  %_1234)
                                                (%_1207 (list %_1233))))
                                             (car %_1230)))))
                                      (null? (cdr %_1230))))))
                          %_1229)
                        %_1226
                        %_1227))
                     '#f)))))
      (if (%_1204 %_1203)
        ((lambda (%_1209) (%_1208 %_1209 (%_1207 %_1209)))
         (list %_1203))
        '#f))))
(define list?
  (letrec ((%_1240
             (lambda (%_1243 %_1244)
               ((lambda (%_1245)
                  (if %_1245
                    %_1245
                    ((lambda (%_1246)
                       (if %_1246
                         %_1246
                         (if (pair? %_1244)
                           ((lambda (%_1247)
                              (if %_1247
                                %_1247
                                (if (not (eq? %_1243 %_1244))
                                  (%_1240 (cdr %_1243) (cddr %_1244))
                                  '#f)))
                            (null? (cdr %_1244)))
                           '#f)))
                     (null? %_1244))))
                (null? %_1243)))))
    (lambda (%_1241)
      ((lambda (%_1242)
         (if %_1242
           %_1242
           (if (pair? %_1241)
             (%_1240 %_1241 (cdr %_1241))
             '#f)))
       (null? %_1241)))))
(define expt
  (lambda (%_1248 %_1249)
    (if (if (integer? %_1249) (= %_1248 '2) '#f)
      (ashl '1 %_1249)
      ((letrec ((%_1250
                  (lambda (%_1251 %_1252 %_1253)
                    (if (zero? %_1251)
                      %_1252
                      (%_1250
                        (quotient %_1251 '2)
                        (if (odd? %_1251) (* %_1252 %_1253) %_1252)
                        (* %_1253 %_1253))))))
         %_1250)
       %_1249
       '1
       %_1248))))
(define modpow
  (lambda (%_1254 %_1255 %_1256)
    ((lambda (%_1257)
       (if (= %_1255 '1)
         (modulo %_1254 %_1256)
         (if (even? %_1255)
           ((lambda (%_1259)
              (modulo (* %_1259 %_1259) %_1256))
            (modpow %_1254 (/ %_1255 '2) %_1256))
           ((lambda (%_1258)
              (begin
                (set! %_1258 (modulo (* %_1258 %_1258) %_1256))
                (modulo (* %_1254 %_1258) %_1256)))
            (modpow %_1254 (/ (- %_1255 '1) '2) %_1256)))))
     '0)))
(define integer?
  ((lambda (%_1260)
     (lambda (%_1261)
       ((lambda (%_1262)
          (if %_1262
            %_1262
            (if (real? %_1261) (= (round %_1261) %_1261) '#f)))
        (%_1260 %_1261))))
   integer?))
(define real?
  ((lambda (%_1263)
     (lambda (%_1264)
       (if (number? %_1264) (not (%_1263 %_1264)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1265)
    (if (not (real? %_1265))
      ((lambda (%_1266 %_1267)
         (sqrt (+ (* %_1266 %_1266) (* %_1267 %_1267))))
       (real-part %_1265)
       (imag-part %_1265))
      (if (< %_1265 '0) (- %_1265) %_1265))))
(define min (void))
(define max (void))
(letrec ((%_1268
           (lambda (%_1273 %_1274 %_1275 %_1276)
             (if (null? %_1275)
               (if (if %_1276 (exact? %_1274) '#f)
                 (exact->inexact %_1274)
                 %_1274)
               (if (%_1273 (car %_1275) %_1274)
                 (%_1268
                   %_1273
                   (car %_1275)
                   (cdr %_1275)
                   ((lambda (%_1277)
                      (if %_1277 %_1277 (inexact? (car %_1275))))
                    %_1276))
                 (%_1268 %_1273 %_1274 (cdr %_1275) %_1276))))))
  (begin
    (set! min
      (lambda (%_1270 . %_1269)
        (if (null? %_1269)
          %_1270
          (%_1268 < %_1270 %_1269 (inexact? %_1270)))))
    (set! max
      (lambda (%_1272 . %_1271)
        (if (null? %_1271)
          %_1272
          (%_1268 > %_1272 %_1271 (inexact? %_1272)))))))
(define negative?
  (lambda (%_1278) (< %_1278 '0)))
(define positive?
  (lambda (%_1279) (> %_1279 '0)))
(define even?
  (lambda (%_1280) (= '0 (modulo %_1280 '2))))
(define odd?
  (lambda (%_1281) (not (even? %_1281))))
(define zero? (lambda (%_1282) (= %_1282 '0)))
(define add1 (lambda (%_1283) (+ %_1283 '1)))
(define sub1 (lambda (%_1284) (- %_1284 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1285 %_1286)
   (begin
     (set! <=
       (%_1285
         (lambda (%_1287 %_1288)
           ((lambda (%_1289)
              (if %_1289 %_1289 (= %_1287 %_1288)))
            (< %_1287 %_1288)))
         %_1286
         '#t))
     (set! >=
       (%_1285
         (lambda (%_1290 %_1291)
           ((lambda (%_1292)
              (if %_1292 %_1292 (= %_1290 %_1291)))
            (> %_1290 %_1291)))
         %_1286
         '#t))))
 (lambda (%_1293 %_1294 %_1295)
   (lambda %_1296
     ((letrec ((%_1297
                 (lambda (%_1298)
                   (if (null? %_1298)
                     %_1295
                     (if (null? (cdr %_1298))
                       %_1295
                       (%_1294
                         (%_1293 (car %_1298) (cadr %_1298))
                         (%_1297 (cdr %_1298))))))))
        %_1297)
      %_1296)))
 (lambda (%_1299 %_1300) (if %_1299 %_1300 '#f)))
((lambda (%_1301)
   (begin
     (set! >= (%_1301 > >=))
     (set! <= (%_1301 < <=))))
 (lambda (%_1302 %_1303)
   (lambda %_1304
     ((lambda (%_1305)
        (if %_1305
          %_1305
          ((lambda (%_1306)
             (if %_1306
               %_1306
               (if ((lambda (%_1307)
                      (if %_1307
                        %_1307
                        (%_1302 (car %_1304) (cadr %_1304))))
                    (= (car %_1304) (cadr %_1304)))
                 (apply %_1303 (cdr %_1304))
                 '#f)))
           (null? (cdr %_1304)))))
      (null? %_1304)))))
(define gcd
  (lambda %_1308
    (if (null? %_1308)
      '0
      (if (null? (cdr %_1308))
        (car %_1308)
        (_gcd (car %_1308) (cadr %_1308))))))
(define lcm
  (lambda %_1309
    (if (null? %_1309)
      '1
      (if (null? (cdr %_1309))
        (car %_1309)
        (_lcm (car %_1309) (cadr %_1309))))))
(max-precision '1500)
(define pi-10 (string->number '"3.1415926536"))
(define pi-70
  (string->number
    '"3.1415926535897932384626433832795028841971693993751058209749445923078164"))
(define pi-1000
  (string->number
    '"3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989"))
(define pi pi-10)
(define e-10 (string->number '"2.7182818285"))
(define e-70
  (string->number
    '"2.7182818284590452353602874713526624977572470936999595749669676277240766"))
(define e-1000
  (string->number
    '"2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190115738341879307021540891499348841675092447614606680822648001684774118537423454424371075390777449920695517027618386062613313845830007520449338265602976067371132007093287091274437470472306969772093101416928368190255151086574637721112523897844250569536967707854499699679468644549059879316368892300987931277361782154249992295763514822082698951936680331825288693984964651058209392398294887933203625094431173012381970684161403970198376793206832823764648042953118023287825098194558153017567173613320698112509961818815930416903515988885193458072738667385894228792284998920868058257492796104841984443634632449684875602336248270419786232090021609902353043699418491463140934317381436405462531520961836908887070167683964243781405927145635490613031072085103837505101157477041718986106873969655212671546889570350354"))
(define e e-10)
(max-precision '32)
(define string-append
  (lambda %_1310
    (if (null? %_1310)
      '""
      (if (null? (cdr %_1310))
        (car %_1310)
        (apply string-append
               (_string-append (car %_1310) (cadr %_1310))
               (cddr %_1310))))))
(define char-downcase
  ((lambda (%_1311)
     ((lambda (%_1312)
        ((lambda (%_1313)
           ((lambda ()
              (lambda (%_1314)
                ((lambda (%_1315)
                   (if (if (>= %_1315 %_1311) (<= %_1315 %_1312) '#f)
                     (integer->char (+ %_1315 %_1313))
                     %_1314))
                 (char->integer %_1314))))))
         (- (char->integer '#\a) %_1311)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1316)
     ((lambda (%_1317)
        ((lambda (%_1318)
           ((lambda ()
              (lambda (%_1319)
                ((lambda (%_1320)
                   (if (if (>= %_1320 %_1316) (<= %_1320 %_1317) '#f)
                     (integer->char (- %_1320 %_1318))
                     %_1319))
                 (char->integer %_1319))))))
         (- %_1316 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1321 %_1322)
    (> (char->integer %_1321) (char->integer %_1322))))
(define char<?
  (lambda (%_1323 %_1324)
    (< (char->integer %_1323) (char->integer %_1324))))
(define char=? eq?)
(define char>=?
  (lambda (%_1325 %_1326)
    ((lambda (%_1327)
       (if %_1327 %_1327 (char=? %_1325 %_1326)))
     (char>? %_1325 %_1326))))
(define char<=?
  (lambda (%_1328 %_1329)
    ((lambda (%_1330)
       (if %_1330 %_1330 (char=? %_1328 %_1329)))
     (char<? %_1328 %_1329))))
(define char-ci>?
  (lambda (%_1331 %_1332)
    (char>?
      (char-downcase %_1331)
      (char-downcase %_1332))))
(define char-ci<?
  (lambda (%_1333 %_1334)
    (char<?
      (char-downcase %_1333)
      (char-downcase %_1334))))
(define char-ci=?
  (lambda (%_1335 %_1336)
    (char=?
      (char-downcase %_1335)
      (char-downcase %_1336))))
(define char-ci>=?
  (lambda (%_1337 %_1338)
    ((lambda (%_1339)
       (if %_1339 %_1339 (char-ci=? %_1337 %_1338)))
     (char-ci>? %_1337 %_1338))))
(define char-ci<=?
  (lambda (%_1340 %_1341)
    ((lambda (%_1342)
       (if %_1342 %_1342 (char-ci=? %_1340 %_1341)))
     (char-ci<? %_1340 %_1341))))
(define char-alphabetic?
  (lambda (%_1343)
    (if (char-ci>=? %_1343 '#\a)
      (char-ci<=? %_1343 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1344)
    (if (char-ci>=? %_1344 '#\0)
      (char-ci<=? %_1344 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1345)
    (if (memq %_1345 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1346)
    (if (char-alphabetic? %_1346)
      (char>? %_1346 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1347)
    (if (char-alphabetic? %_1347)
      (char>? %_1347 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_1348
           (lambda (%_1353 %_1354 %_1355 %_1356 %_1357)
             (if (< %_1356 %_1357)
               (begin
                 (string-set!
                   %_1354
                   %_1356
                   (%_1355 (string-ref %_1353 %_1356)))
                 (%_1348
                   %_1353
                   %_1354
                   %_1355
                   (+ %_1356 '1)
                   %_1357))
               %_1354))))
  (begin
    (set! string-downcase
      (lambda (%_1349)
        ((lambda (%_1350)
           (%_1348
             %_1349
             %_1350
             char-downcase
             '0
             (string-length %_1349)))
         (make-string (string-length %_1349)))))
    (set! string-upcase
      (lambda (%_1351)
        ((lambda (%_1352)
           (%_1348
             %_1351
             %_1352
             char-upcase
             '0
             (string-length %_1351)))
         (make-string (string-length %_1351)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_1358
             (lambda (%_1361 %_1362)
               (if (null? %_1361)
                 (not (null? %_1362))
                 (if (null? %_1362)
                   '#f
                   ((lambda (%_1363 %_1364)
                      (if (char<? %_1363 %_1364)
                        '#t
                        (if (char>? %_1363 %_1364)
                          '#f
                          (%_1358 (cdr %_1361) (cdr %_1362)))))
                    (car %_1361)
                    (car %_1362)))))))
    (lambda (%_1359 %_1360)
      (%_1358
        (string->list %_1359)
        (string->list %_1360)))))
(define string>?
  (letrec ((%_1365
             (lambda (%_1368 %_1369)
               (if (null? %_1369)
                 (not (null? %_1368))
                 (if (null? %_1368)
                   '#f
                   ((lambda (%_1370 %_1371)
                      (if (char>? %_1370 %_1371)
                        '#t
                        (if (char<? %_1370 %_1371)
                          '#f
                          (%_1365 (cdr %_1368) (cdr %_1369)))))
                    (car %_1368)
                    (car %_1369)))))))
    (lambda (%_1366 %_1367)
      (%_1365
        (string->list %_1366)
        (string->list %_1367)))))
(define string<=?
  (lambda (%_1372 %_1373)
    ((lambda (%_1374)
       (if %_1374 %_1374 (string=? %_1372 %_1373)))
     (string<? %_1372 %_1373))))
(define string>=?
  (lambda (%_1375 %_1376)
    ((lambda (%_1377)
       (if %_1377 %_1377 (string=? %_1375 %_1376)))
     (string>? %_1375 %_1376))))
(define string-ci=?
  (lambda (%_1378 %_1379)
    (string=?
      (string-downcase %_1378)
      (string-downcase %_1379))))
(define string-ci<?
  (lambda (%_1380 %_1381)
    (string<?
      (string-downcase %_1380)
      (string-downcase %_1381))))
(define string-ci>?
  (lambda (%_1382 %_1383)
    (string>?
      (string-downcase %_1382)
      (string-downcase %_1383))))
(define string-ci>=?
  (lambda (%_1384 %_1385)
    (string>=?
      (string-downcase %_1384)
      (string-downcase %_1385))))
(define string-ci<=?
  (lambda (%_1386 %_1387)
    (string<=?
      (string-downcase %_1386)
      (string-downcase %_1387))))
(define substring
  (letrec ((%_1388
             (lambda (%_1393 %_1394 %_1395 %_1396 %_1397)
               (if (< %_1396 %_1397)
                 (begin
                   (string-set!
                     %_1394
                     %_1395
                     (string-ref %_1393 %_1396))
                   (%_1388
                     %_1393
                     %_1394
                     (+ %_1395 '1)
                     (+ %_1396 '1)
                     %_1397))
                 (void)))))
    (lambda (%_1389 %_1390 %_1391)
      ((lambda (%_1392)
         (begin
           (%_1388 %_1389 %_1392 '0 %_1390 %_1391)
           %_1392))
       (make-string (- %_1391 %_1390))))))
(define format
  (lambda (%_1399 . %_1398)
    ((lambda (%_1400)
       ((letrec ((%_1401
                   (lambda (%_1402 %_1403)
                     (if (null? %_1402)
                       (get-output-string %_1400)
                       (if (char=? (car %_1402) '#\~)
                         (if (null? (cdr %_1402))
                           (error 'format '"Incomplete escape sequence")
                           ((lambda (%_1404)
                              (if (memv %_1404 '(#\a))
                                (if (null? %_1403)
                                  (error 'format
                                         '"No value for escape sequence")
                                  (begin
                                    (display (car %_1403) %_1400)
                                    (%_1401 (cddr %_1402) (cdr %_1403))))
                                (if (memv %_1404 '(#\s))
                                  (if (null? %_1403)
                                    (error 'format
                                           '"No value for escape sequence")
                                    (begin
                                      (write (car %_1403) %_1400)
                                      (%_1401 (cddr %_1402) (cdr %_1403))))
                                  (if (memv %_1404 '(#\%))
                                    (begin
                                      (display '#\newline %_1400)
                                      (%_1401 (cddr %_1402) %_1403))
                                    (if (memv %_1404 '(#\~))
                                      (begin
                                        (display '#\~ %_1400)
                                        (%_1401 (cddr %_1402) %_1403))
                                      (error 'format
                                             '"Unrecognized escape sequence"))))))
                            (cadr %_1402)))
                         (begin
                           (display (car %_1402) %_1400)
                           (%_1401 (cdr %_1402) %_1403)))))))
          %_1401)
        (string->list %_1399)
        %_1398))
     (open-output-string))))
(define list-ref
  (lambda (%_1405 %_1406)
    (if (zero? %_1406)
      (car %_1405)
      (list-ref (cdr %_1405) (- %_1406 '1)))))
(define values
  (lambda %_1407
    (call-with-current-continuation
      (lambda (%_1408) (apply %_1408 %_1407)))))
