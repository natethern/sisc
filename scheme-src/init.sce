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
        (normalize-url (current-url) (car %_1153))))))
(define load-expanded load)
((lambda (%_1154)
   ((lambda (%_1155 %_1156 %_1157)
      (begin
        (set! open-input-file (%_1155 open-input-file))
        (set! open-source-input-file
          (%_1155 open-source-input-file))
        (set! open-output-file (%_1155 open-output-file))
        (set! load
          (lambda (%_1158)
            (begin
              ((lambda (%_1159)
                 (begin
                   (current-url (normalize-url %_1159 %_1158))
                   (with-failure-continuation
                     (lambda (%_1160 %_1161)
                       (begin
                         (current-url %_1159)
                         (throw %_1160 %_1161)))
                     (lambda ()
                       ((%_1156 (string->symbol (%_1157 (current-url))))
                        (current-url))))
                   (current-url %_1159)))
               (current-url))
              (void))))))
    (lambda (%_1162)
      (lambda (%_1164 . %_1163)
        (apply %_1162
               (normalize-url (current-url) %_1164)
               %_1163)))
    (lambda (%_1165)
      ((lambda (%_1166)
         (if (memv %_1166 '(sce pp)) load-expanded %_1154))
       %_1165))
    (lambda (%_1167)
      ((letrec ((%_1168
                  (lambda (%_1169 %_1170)
                    (if (null? %_1169)
                      '#f
                      (if (equal? (car %_1169) '#\.)
                        (list->string %_1170)
                        (%_1168 (cdr %_1169) (cons (car %_1169) %_1170)))))))
         %_1168)
       (reverse (string->list %_1167))
       '()))))
 load)
(define load-module
  (lambda (%_1171)
    ((lambda (%_1172)
       ((lambda (%_1173)
          ((lambda ()
             (for-each
               (lambda (%_1174)
                 (putprop
                   %_1174
                   '*toplevel*
                   (native-library-binding %_1172 %_1174)))
               %_1173))))
        (native-library-binding-names %_1172)))
     (load-native-library %_1171))))
(define reverse
  (letrec ((%_1175
             (lambda (%_1177 %_1178)
               (if (null? %_1177)
                 %_1178
                 (%_1175 (cdr %_1177) (cons (car %_1177) %_1178))))))
    (lambda (%_1176) (%_1175 %_1176 '()))))
(define append
  (letrec ((%_1179
             (lambda (%_1182 . %_1181)
               (if (null? %_1181)
                 %_1182
                 (if (null? %_1182)
                   (apply %_1179 %_1181)
                   (apply %_1179
                          (cons (append2 %_1182 (car %_1181))
                                (cdr %_1181))))))))
    (lambda %_1180
      (if (null? %_1180)
        '()
        (if (null? (cdr %_1180))
          (car %_1180)
          (apply %_1179 (cons (car %_1180) (cdr %_1180))))))))
(define map
  (letrec ((%_1183 map)
           (%_1184
             (lambda (%_1188 %_1189 %_1190 %_1191)
               (if (null? (car %_1189))
                 (if (andmap null? %_1189)
                   %_1190
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_1192 %_1193)
                    (begin
                      (if (not (null? %_1191))
                        (set-cdr! %_1191 %_1192)
                        (void))
                      (if (null? %_1190)
                        (%_1184 %_1188 %_1193 %_1192 %_1192)
                        (%_1184 %_1188 %_1193 %_1190 %_1192))))
                  (cons (apply %_1188 (%_1183 car %_1189)) '())
                  (%_1183 cdr %_1189))))))
    (lambda (%_1187 %_1186 . %_1185)
      (if (null? %_1185)
        (%_1183 %_1187 %_1186)
        (%_1184 %_1187 (cons %_1186 %_1185) '() '())))))
(define proper-list?
  (lambda (%_1194)
    ((letrec ((%_1195
                (lambda (%_1196 %_1197)
                  (if (pair? %_1196)
                    ((lambda (%_1198)
                       (if (pair? %_1198)
                         ((lambda (%_1199 %_1200)
                            (if (not (eq? %_1199 %_1200))
                              (%_1195 %_1199 %_1200)
                              '#f))
                          (cdr %_1198)
                          (cdr %_1197))
                         (null? %_1198)))
                     (cdr %_1196))
                    (null? %_1196)))))
       %_1195)
     %_1194
     %_1194)))
(define circular?
  (lambda (%_1201)
    (letrec ((%_1202
               (lambda (%_1208)
                 ((lambda (%_1209)
                    (if %_1209
                      %_1209
                      ((lambda (%_1210)
                         (if %_1210
                           %_1210
                           (if (vector? %_1208)
                             (not (zero? (vector-length %_1208)))
                             '#f)))
                       (box? %_1208))))
                  (pair? %_1208))))
             (%_1203
               (lambda (%_1211)
                 (if (pair? %_1211)
                   '2
                   (if (box? %_1211) '1 (vector-length %_1211)))))
             (%_1204
               (lambda (%_1212 %_1213)
                 (if (vector? %_1212)
                   (vector-ref %_1212 %_1213)
                   (if (box? %_1212)
                     (unbox %_1212)
                     ((if (zero? %_1213) car cdr) %_1212)))))
             (%_1205
               (lambda (%_1214)
                 ((lambda (%_1215)
                    ((letrec ((%_1216
                                (lambda (%_1217 %_1218 %_1219)
                                  (if (>= %_1218 '0)
                                    ((lambda (%_1223)
                                       (if (%_1202 %_1223)
                                         (cons %_1223 (cons %_1218 %_1219))
                                         (%_1216 %_1217 (- %_1218 '1) %_1219)))
                                     (%_1204 %_1217 %_1218))
                                    ((lambda (%_1220)
                                       (if (pair? %_1220)
                                         ((lambda (%_1221 %_1222)
                                            (%_1216
                                              (car %_1222)
                                              (- %_1221 '1)
                                              %_1222))
                                          (car %_1220)
                                          (cdr %_1220))
                                         '#f))
                                     (cdr %_1219))))))
                       %_1216)
                     %_1215
                     (- (%_1203 %_1215) '1)
                     %_1214))
                  (car %_1214))))
             (%_1206
               (lambda (%_1224 %_1225)
                 (letrec ((%_1226
                            (lambda (%_1235 %_1236)
                              ((lambda (%_1237)
                                 (if %_1237
                                   (%_1206 (%_1205 %_1235) (%_1205 %_1237))
                                   '#f))
                               (%_1205 %_1236)))))
                   (if %_1225
                     (if (not (eq? (car %_1225) (car %_1224)))
                       (%_1226 %_1224 %_1225)
                       ((letrec ((%_1227
                                   (lambda (%_1228 %_1229)
                                     ((lambda (%_1230)
                                        (if %_1230
                                          %_1230
                                          (if (if (= (cadr %_1228)
                                                     (cadr %_1229))
                                                (eq? (caddr %_1228)
                                                     (caddr %_1229))
                                                '#f)
                                            (%_1227
                                              (cddr %_1228)
                                              (cddr %_1229))
                                            ((lambda (%_1231)
                                               ((letrec ((%_1232
                                                           (lambda (%_1233)
                                                             (if %_1233
                                                               ((lambda (%_1234)
                                                                  (if %_1234
                                                                    %_1234
                                                                    (%_1232
                                                                      (%_1205
                                                                        %_1233))))
                                                                (eq? (car %_1233)
                                                                     %_1231))
                                                               (%_1226
                                                                 %_1228
                                                                 %_1229)))))
                                                  %_1232)
                                                (%_1205 (list %_1231))))
                                             (car %_1228)))))
                                      (null? (cdr %_1228))))))
                          %_1227)
                        %_1224
                        %_1225))
                     '#f)))))
      (if (%_1202 %_1201)
        ((lambda (%_1207) (%_1206 %_1207 (%_1205 %_1207)))
         (list %_1201))
        '#f))))
(define list?
  (letrec ((%_1238
             (lambda (%_1241 %_1242)
               ((lambda (%_1243)
                  (if %_1243
                    %_1243
                    ((lambda (%_1244)
                       (if %_1244
                         %_1244
                         (if (pair? %_1242)
                           ((lambda (%_1245)
                              (if %_1245
                                %_1245
                                (if (not (eq? %_1241 %_1242))
                                  (%_1238 (cdr %_1241) (cddr %_1242))
                                  '#f)))
                            (null? (cdr %_1242)))
                           '#f)))
                     (null? %_1242))))
                (null? %_1241)))))
    (lambda (%_1239)
      ((lambda (%_1240)
         (if %_1240
           %_1240
           (if (pair? %_1239)
             (%_1238 %_1239 (cdr %_1239))
             '#f)))
       (null? %_1239)))))
(define expt
  (lambda (%_1246 %_1247)
    (if (if (integer? %_1247) (= %_1246 '2) '#f)
      (ashl '1 %_1247)
      ((letrec ((%_1248
                  (lambda (%_1249 %_1250 %_1251)
                    (if (zero? %_1249)
                      %_1250
                      (%_1248
                        (quotient %_1249 '2)
                        (if (odd? %_1249) (* %_1250 %_1251) %_1250)
                        (* %_1251 %_1251))))))
         %_1248)
       %_1247
       '1
       %_1246))))
(define modpow
  (lambda (%_1252 %_1253 %_1254)
    ((lambda (%_1255)
       (if (= %_1253 '1)
         (modulo %_1252 %_1254)
         (if (even? %_1253)
           ((lambda (%_1257)
              (modulo (* %_1257 %_1257) %_1254))
            (modpow %_1252 (/ %_1253 '2) %_1254))
           ((lambda (%_1256)
              (begin
                (set! %_1256 (modulo (* %_1256 %_1256) %_1254))
                (modulo (* %_1252 %_1256) %_1254)))
            (modpow %_1252 (/ (- %_1253 '1) '2) %_1254)))))
     '0)))
(define integer?
  ((lambda (%_1258)
     (lambda (%_1259)
       ((lambda (%_1260)
          (if %_1260
            %_1260
            (if (real? %_1259) (= (round %_1259) %_1259) '#f)))
        (%_1258 %_1259))))
   integer?))
(define real?
  ((lambda (%_1261)
     (lambda (%_1262)
       (if (number? %_1262) (not (%_1261 %_1262)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1263)
    (if (not (real? %_1263))
      ((lambda (%_1264 %_1265)
         (sqrt (+ (* %_1264 %_1264) (* %_1265 %_1265))))
       (real-part %_1263)
       (imag-part %_1263))
      (if (< %_1263 '0) (- %_1263) %_1263))))
(define min (void))
(define max (void))
(letrec ((%_1266
           (lambda (%_1271 %_1272 %_1273 %_1274)
             (if (null? %_1273)
               (if (if %_1274 (exact? %_1272) '#f)
                 (exact->inexact %_1272)
                 %_1272)
               (if (%_1271 (car %_1273) %_1272)
                 (%_1266
                   %_1271
                   (car %_1273)
                   (cdr %_1273)
                   ((lambda (%_1275)
                      (if %_1275 %_1275 (inexact? (car %_1273))))
                    %_1274))
                 (%_1266 %_1271 %_1272 (cdr %_1273) %_1274))))))
  (begin
    (set! min
      (lambda (%_1268 . %_1267)
        (if (null? %_1267)
          %_1268
          (%_1266 < %_1268 %_1267 (inexact? %_1268)))))
    (set! max
      (lambda (%_1270 . %_1269)
        (if (null? %_1269)
          %_1270
          (%_1266 > %_1270 %_1269 (inexact? %_1270)))))))
(define negative?
  (lambda (%_1276) (< %_1276 '0)))
(define positive?
  (lambda (%_1277) (> %_1277 '0)))
(define even?
  (lambda (%_1278) (= '0 (modulo %_1278 '2))))
(define odd?
  (lambda (%_1279) (not (even? %_1279))))
(define zero? (lambda (%_1280) (= %_1280 '0)))
(define add1 (lambda (%_1281) (+ %_1281 '1)))
(define sub1 (lambda (%_1282) (- %_1282 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1283 %_1284)
   (begin
     (set! <=
       (%_1283
         (lambda (%_1285 %_1286)
           ((lambda (%_1287)
              (if %_1287 %_1287 (= %_1285 %_1286)))
            (< %_1285 %_1286)))
         %_1284
         '#t))
     (set! >=
       (%_1283
         (lambda (%_1288 %_1289)
           ((lambda (%_1290)
              (if %_1290 %_1290 (= %_1288 %_1289)))
            (> %_1288 %_1289)))
         %_1284
         '#t))))
 (lambda (%_1291 %_1292 %_1293)
   (lambda %_1294
     ((letrec ((%_1295
                 (lambda (%_1296)
                   (if (null? %_1296)
                     %_1293
                     (if (null? (cdr %_1296))
                       %_1293
                       (%_1292
                         (%_1291 (car %_1296) (cadr %_1296))
                         (%_1295 (cdr %_1296))))))))
        %_1295)
      %_1294)))
 (lambda (%_1297 %_1298) (if %_1297 %_1298 '#f)))
((lambda (%_1299)
   (begin
     (set! >= (%_1299 > >=))
     (set! <= (%_1299 < <=))))
 (lambda (%_1300 %_1301)
   (lambda %_1302
     ((lambda (%_1303)
        (if %_1303
          %_1303
          ((lambda (%_1304)
             (if %_1304
               %_1304
               (if ((lambda (%_1305)
                      (if %_1305
                        %_1305
                        (%_1300 (car %_1302) (cadr %_1302))))
                    (= (car %_1302) (cadr %_1302)))
                 (apply %_1301 (cdr %_1302))
                 '#f)))
           (null? (cdr %_1302)))))
      (null? %_1302)))))
(define gcd
  (lambda %_1306
    (if (null? %_1306)
      '0
      (if (null? (cdr %_1306))
        (car %_1306)
        (_gcd (car %_1306) (cadr %_1306))))))
(define lcm
  (lambda %_1307
    (if (null? %_1307)
      '1
      (if (null? (cdr %_1307))
        (car %_1307)
        (_lcm (car %_1307) (cadr %_1307))))))
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
  (lambda %_1308
    (if (null? %_1308)
      '""
      (if (null? (cdr %_1308))
        (car %_1308)
        (apply string-append
               (_string-append (car %_1308) (cadr %_1308))
               (cddr %_1308))))))
(define char-downcase
  ((lambda (%_1309)
     ((lambda (%_1310)
        ((lambda (%_1311)
           ((lambda ()
              (lambda (%_1312)
                ((lambda (%_1313)
                   (if (if (>= %_1313 %_1309) (<= %_1313 %_1310) '#f)
                     (integer->char (+ %_1313 %_1311))
                     %_1312))
                 (char->integer %_1312))))))
         (- (char->integer '#\a) %_1309)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1314)
     ((lambda (%_1315)
        ((lambda (%_1316)
           ((lambda ()
              (lambda (%_1317)
                ((lambda (%_1318)
                   (if (if (>= %_1318 %_1314) (<= %_1318 %_1315) '#f)
                     (integer->char (- %_1318 %_1316))
                     %_1317))
                 (char->integer %_1317))))))
         (- %_1314 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1319 %_1320)
    (> (char->integer %_1319) (char->integer %_1320))))
(define char<?
  (lambda (%_1321 %_1322)
    (< (char->integer %_1321) (char->integer %_1322))))
(define char=? eq?)
(define char>=?
  (lambda (%_1323 %_1324)
    ((lambda (%_1325)
       (if %_1325 %_1325 (char=? %_1323 %_1324)))
     (char>? %_1323 %_1324))))
(define char<=?
  (lambda (%_1326 %_1327)
    ((lambda (%_1328)
       (if %_1328 %_1328 (char=? %_1326 %_1327)))
     (char<? %_1326 %_1327))))
(define char-ci>?
  (lambda (%_1329 %_1330)
    (char>?
      (char-downcase %_1329)
      (char-downcase %_1330))))
(define char-ci<?
  (lambda (%_1331 %_1332)
    (char<?
      (char-downcase %_1331)
      (char-downcase %_1332))))
(define char-ci=?
  (lambda (%_1333 %_1334)
    (char=?
      (char-downcase %_1333)
      (char-downcase %_1334))))
(define char-ci>=?
  (lambda (%_1335 %_1336)
    ((lambda (%_1337)
       (if %_1337 %_1337 (char-ci=? %_1335 %_1336)))
     (char-ci>? %_1335 %_1336))))
(define char-ci<=?
  (lambda (%_1338 %_1339)
    ((lambda (%_1340)
       (if %_1340 %_1340 (char-ci=? %_1338 %_1339)))
     (char-ci<? %_1338 %_1339))))
(define char-alphabetic?
  (lambda (%_1341)
    (if (char-ci>=? %_1341 '#\a)
      (char-ci<=? %_1341 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1342)
    (if (char-ci>=? %_1342 '#\0)
      (char-ci<=? %_1342 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1343)
    (if (memq %_1343 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1344)
    (if (char-alphabetic? %_1344)
      (char>? %_1344 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1345)
    (if (char-alphabetic? %_1345)
      (char>? %_1345 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_1346
           (lambda (%_1351 %_1352 %_1353 %_1354 %_1355)
             (if (< %_1354 %_1355)
               (begin
                 (string-set!
                   %_1352
                   %_1354
                   (%_1353 (string-ref %_1351 %_1354)))
                 (%_1346
                   %_1351
                   %_1352
                   %_1353
                   (+ %_1354 '1)
                   %_1355))
               %_1352))))
  (begin
    (set! string-downcase
      (lambda (%_1347)
        ((lambda (%_1348)
           (%_1346
             %_1347
             %_1348
             char-downcase
             '0
             (string-length %_1347)))
         (make-string (string-length %_1347)))))
    (set! string-upcase
      (lambda (%_1349)
        ((lambda (%_1350)
           (%_1346
             %_1349
             %_1350
             char-upcase
             '0
             (string-length %_1349)))
         (make-string (string-length %_1349)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_1356
             (lambda (%_1359 %_1360)
               (if (null? %_1359)
                 (not (null? %_1360))
                 (if (null? %_1360)
                   '#f
                   ((lambda (%_1361 %_1362)
                      (if (char<? %_1361 %_1362)
                        '#t
                        (if (char>? %_1361 %_1362)
                          '#f
                          (%_1356 (cdr %_1359) (cdr %_1360)))))
                    (car %_1359)
                    (car %_1360)))))))
    (lambda (%_1357 %_1358)
      (%_1356
        (string->list %_1357)
        (string->list %_1358)))))
(define string>?
  (letrec ((%_1363
             (lambda (%_1366 %_1367)
               (if (null? %_1367)
                 (not (null? %_1366))
                 (if (null? %_1366)
                   '#f
                   ((lambda (%_1368 %_1369)
                      (if (char>? %_1368 %_1369)
                        '#t
                        (if (char<? %_1368 %_1369)
                          '#f
                          (%_1363 (cdr %_1366) (cdr %_1367)))))
                    (car %_1366)
                    (car %_1367)))))))
    (lambda (%_1364 %_1365)
      (%_1363
        (string->list %_1364)
        (string->list %_1365)))))
(define string<=?
  (lambda (%_1370 %_1371)
    ((lambda (%_1372)
       (if %_1372 %_1372 (string=? %_1370 %_1371)))
     (string<? %_1370 %_1371))))
(define string>=?
  (lambda (%_1373 %_1374)
    ((lambda (%_1375)
       (if %_1375 %_1375 (string=? %_1373 %_1374)))
     (string>? %_1373 %_1374))))
(define string-ci=?
  (lambda (%_1376 %_1377)
    (string=?
      (string-downcase %_1376)
      (string-downcase %_1377))))
(define string-ci<?
  (lambda (%_1378 %_1379)
    (string<?
      (string-downcase %_1378)
      (string-downcase %_1379))))
(define string-ci>?
  (lambda (%_1380 %_1381)
    (string>?
      (string-downcase %_1380)
      (string-downcase %_1381))))
(define string-ci>=?
  (lambda (%_1382 %_1383)
    (string>=?
      (string-downcase %_1382)
      (string-downcase %_1383))))
(define string-ci<=?
  (lambda (%_1384 %_1385)
    (string<=?
      (string-downcase %_1384)
      (string-downcase %_1385))))
(define substring
  (letrec ((%_1386
             (lambda (%_1391 %_1392 %_1393 %_1394 %_1395)
               (if (< %_1394 %_1395)
                 (begin
                   (string-set!
                     %_1392
                     %_1393
                     (string-ref %_1391 %_1394))
                   (%_1386
                     %_1391
                     %_1392
                     (+ %_1393 '1)
                     (+ %_1394 '1)
                     %_1395))
                 (void)))))
    (lambda (%_1387 %_1388 %_1389)
      ((lambda (%_1390)
         (begin
           (%_1386 %_1387 %_1390 '0 %_1388 %_1389)
           %_1390))
       (make-string (- %_1389 %_1388))))))
(define format
  (lambda (%_1397 . %_1396)
    ((lambda (%_1398)
       ((letrec ((%_1399
                   (lambda (%_1400 %_1401)
                     (if (null? %_1400)
                       (get-output-string %_1398)
                       (if (char=? (car %_1400) '#\~)
                         (if (null? (cdr %_1400))
                           (error 'format '"Incomplete escape sequence")
                           ((lambda (%_1402)
                              (if (memv %_1402 '(#\a))
                                (if (null? %_1401)
                                  (error 'format
                                         '"No value for escape sequence")
                                  (begin
                                    (display (car %_1401) %_1398)
                                    (%_1399 (cddr %_1400) (cdr %_1401))))
                                (if (memv %_1402 '(#\s))
                                  (if (null? %_1401)
                                    (error 'format
                                           '"No value for escape sequence")
                                    (begin
                                      (write (car %_1401) %_1398)
                                      (%_1399 (cddr %_1400) (cdr %_1401))))
                                  (if (memv %_1402 '(#\%))
                                    (begin
                                      (display '#\newline %_1398)
                                      (%_1399 (cddr %_1400) %_1401))
                                    (if (memv %_1402 '(#\~))
                                      (begin
                                        (display '#\~ %_1398)
                                        (%_1399 (cddr %_1400) %_1401))
                                      (error 'format
                                             '"Unrecognized escape sequence"))))))
                            (cadr %_1400)))
                         (begin
                           (display (car %_1400) %_1398)
                           (%_1399 (cdr %_1400) %_1401)))))))
          %_1399)
        (string->list %_1397)
        %_1396))
     (open-output-string))))
(define list-ref
  (lambda (%_1403 %_1404)
    (if (zero? %_1404)
      (car %_1403)
      (list-ref (cdr %_1403) (- %_1404 '1)))))
(define values
  (lambda %_1405
    (call-with-current-continuation
      (lambda (%_1406) (apply %_1406 %_1405)))))
