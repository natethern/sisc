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
                       ((lambda (%_1164)
                          ((%_1158 (if %_1164 %_1164 '"scm"))
                           (current-url)))
                        (%_1159 (current-url)))))
                   (current-url %_1161)))
               (current-url))
              (void))))))
    (lambda (%_1165)
      (lambda (%_1167 . %_1166)
        (apply %_1165
               (normalize-url (current-url) %_1167)
               %_1166)))
    (lambda (%_1168)
      ((lambda (%_1169)
         (if (memv %_1169 '(sce pp)) load-expanded %_1156))
       %_1168))
    (lambda (%_1170)
      ((letrec ((%_1171
                  (lambda (%_1172 %_1173)
                    (if (null? %_1172)
                      '#f
                      (if (equal? (car %_1172) '#\.)
                        (list->string %_1173)
                        (%_1171 (cdr %_1172) (cons (car %_1172) %_1173)))))))
         %_1171)
       (reverse (string->list %_1170))
       '()))))
 load)
(define load-module
  (lambda (%_1174)
    ((lambda (%_1175)
       ((lambda (%_1176)
          ((lambda ()
             (for-each
               (lambda (%_1177)
                 (putprop
                   %_1177
                   '*toplevel*
                   (native-library-binding %_1175 %_1177)))
               %_1176))))
        (native-library-binding-names %_1175)))
     (load-native-library %_1174))))
(define reverse
  (letrec ((%_1178
             (lambda (%_1180 %_1181)
               (if (null? %_1180)
                 %_1181
                 (%_1178 (cdr %_1180) (cons (car %_1180) %_1181))))))
    (lambda (%_1179) (%_1178 %_1179 '()))))
(define append
  (letrec ((%_1182
             (lambda (%_1185 . %_1184)
               (if (null? %_1184)
                 %_1185
                 (if (null? %_1185)
                   (apply %_1182 %_1184)
                   (apply %_1182
                          (cons (append2 %_1185 (car %_1184))
                                (cdr %_1184))))))))
    (lambda %_1183
      (if (null? %_1183)
        '()
        (if (null? (cdr %_1183))
          (car %_1183)
          (apply %_1182 (cons (car %_1183) (cdr %_1183))))))))
(define map
  (letrec ((%_1186 map)
           (%_1187
             (lambda (%_1191 %_1192 %_1193 %_1194)
               (if (null? (car %_1192))
                 (if (andmap null? %_1192)
                   %_1193
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_1195 %_1196)
                    (begin
                      (if (not (null? %_1194))
                        (set-cdr! %_1194 %_1195)
                        (void))
                      (if (null? %_1193)
                        (%_1187 %_1191 %_1196 %_1195 %_1195)
                        (%_1187 %_1191 %_1196 %_1193 %_1195))))
                  (cons (apply %_1191 (%_1186 car %_1192)) '())
                  (%_1186 cdr %_1192))))))
    (lambda (%_1190 %_1189 . %_1188)
      (if (null? %_1188)
        (%_1186 %_1190 %_1189)
        (%_1187 %_1190 (cons %_1189 %_1188) '() '())))))
(define proper-list?
  (lambda (%_1197)
    ((letrec ((%_1198
                (lambda (%_1199 %_1200)
                  (if (pair? %_1199)
                    ((lambda (%_1201)
                       (if (pair? %_1201)
                         ((lambda (%_1202 %_1203)
                            (if (not (eq? %_1202 %_1203))
                              (%_1198 %_1202 %_1203)
                              '#f))
                          (cdr %_1201)
                          (cdr %_1200))
                         (null? %_1201)))
                     (cdr %_1199))
                    (null? %_1199)))))
       %_1198)
     %_1197
     %_1197)))
(define circular?
  (lambda (%_1204)
    (letrec ((%_1205
               (lambda (%_1211)
                 ((lambda (%_1212)
                    (if %_1212
                      %_1212
                      ((lambda (%_1213)
                         (if %_1213
                           %_1213
                           (if (vector? %_1211)
                             (not (zero? (vector-length %_1211)))
                             '#f)))
                       (box? %_1211))))
                  (pair? %_1211))))
             (%_1206
               (lambda (%_1214)
                 (if (pair? %_1214)
                   '2
                   (if (box? %_1214) '1 (vector-length %_1214)))))
             (%_1207
               (lambda (%_1215 %_1216)
                 (if (vector? %_1215)
                   (vector-ref %_1215 %_1216)
                   (if (box? %_1215)
                     (unbox %_1215)
                     ((if (zero? %_1216) car cdr) %_1215)))))
             (%_1208
               (lambda (%_1217)
                 ((lambda (%_1218)
                    ((letrec ((%_1219
                                (lambda (%_1220 %_1221 %_1222)
                                  (if (>= %_1221 '0)
                                    ((lambda (%_1226)
                                       (if (%_1205 %_1226)
                                         (cons %_1226 (cons %_1221 %_1222))
                                         (%_1219 %_1220 (- %_1221 '1) %_1222)))
                                     (%_1207 %_1220 %_1221))
                                    ((lambda (%_1223)
                                       (if (pair? %_1223)
                                         ((lambda (%_1224 %_1225)
                                            (%_1219
                                              (car %_1225)
                                              (- %_1224 '1)
                                              %_1225))
                                          (car %_1223)
                                          (cdr %_1223))
                                         '#f))
                                     (cdr %_1222))))))
                       %_1219)
                     %_1218
                     (- (%_1206 %_1218) '1)
                     %_1217))
                  (car %_1217))))
             (%_1209
               (lambda (%_1227 %_1228)
                 (letrec ((%_1229
                            (lambda (%_1238 %_1239)
                              ((lambda (%_1240)
                                 (if %_1240
                                   (%_1209 (%_1208 %_1238) (%_1208 %_1240))
                                   '#f))
                               (%_1208 %_1239)))))
                   (if %_1228
                     (if (not (eq? (car %_1228) (car %_1227)))
                       (%_1229 %_1227 %_1228)
                       ((letrec ((%_1230
                                   (lambda (%_1231 %_1232)
                                     ((lambda (%_1233)
                                        (if %_1233
                                          %_1233
                                          (if (if (= (cadr %_1231)
                                                     (cadr %_1232))
                                                (eq? (caddr %_1231)
                                                     (caddr %_1232))
                                                '#f)
                                            (%_1230
                                              (cddr %_1231)
                                              (cddr %_1232))
                                            ((lambda (%_1234)
                                               ((letrec ((%_1235
                                                           (lambda (%_1236)
                                                             (if %_1236
                                                               ((lambda (%_1237)
                                                                  (if %_1237
                                                                    %_1237
                                                                    (%_1235
                                                                      (%_1208
                                                                        %_1236))))
                                                                (eq? (car %_1236)
                                                                     %_1234))
                                                               (%_1229
                                                                 %_1231
                                                                 %_1232)))))
                                                  %_1235)
                                                (%_1208 (list %_1234))))
                                             (car %_1231)))))
                                      (null? (cdr %_1231))))))
                          %_1230)
                        %_1227
                        %_1228))
                     '#f)))))
      (if (%_1205 %_1204)
        ((lambda (%_1210) (%_1209 %_1210 (%_1208 %_1210)))
         (list %_1204))
        '#f))))
(define list?
  (letrec ((%_1241
             (lambda (%_1244 %_1245)
               ((lambda (%_1246)
                  (if %_1246
                    %_1246
                    ((lambda (%_1247)
                       (if %_1247
                         %_1247
                         (if (pair? %_1245)
                           ((lambda (%_1248)
                              (if %_1248
                                %_1248
                                (if (not (eq? %_1244 %_1245))
                                  (%_1241 (cdr %_1244) (cddr %_1245))
                                  '#f)))
                            (null? (cdr %_1245)))
                           '#f)))
                     (null? %_1245))))
                (null? %_1244)))))
    (lambda (%_1242)
      ((lambda (%_1243)
         (if %_1243
           %_1243
           (if (pair? %_1242)
             (%_1241 %_1242 (cdr %_1242))
             '#f)))
       (null? %_1242)))))
(define expt
  (lambda (%_1249 %_1250)
    (if (if (integer? %_1250) (= %_1249 '2) '#f)
      (ashl '1 %_1250)
      ((letrec ((%_1251
                  (lambda (%_1252 %_1253 %_1254)
                    (if (zero? %_1252)
                      %_1253
                      (%_1251
                        (quotient %_1252 '2)
                        (if (odd? %_1252) (* %_1253 %_1254) %_1253)
                        (* %_1254 %_1254))))))
         %_1251)
       %_1250
       '1
       %_1249))))
(define modpow
  (lambda (%_1255 %_1256 %_1257)
    ((lambda (%_1258)
       (if (= %_1256 '1)
         (modulo %_1255 %_1257)
         (if (even? %_1256)
           ((lambda (%_1260)
              (modulo (* %_1260 %_1260) %_1257))
            (modpow %_1255 (/ %_1256 '2) %_1257))
           ((lambda (%_1259)
              (begin
                (set! %_1259 (modulo (* %_1259 %_1259) %_1257))
                (modulo (* %_1255 %_1259) %_1257)))
            (modpow %_1255 (/ (- %_1256 '1) '2) %_1257)))))
     '0)))
(define integer?
  ((lambda (%_1261)
     (lambda (%_1262)
       ((lambda (%_1263)
          (if %_1263
            %_1263
            (if (real? %_1262) (= (round %_1262) %_1262) '#f)))
        (%_1261 %_1262))))
   integer?))
(define real?
  ((lambda (%_1264)
     (lambda (%_1265)
       (if (number? %_1265) (not (%_1264 %_1265)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1266)
    (if (not (real? %_1266))
      ((lambda (%_1267 %_1268)
         (sqrt (+ (* %_1267 %_1267) (* %_1268 %_1268))))
       (real-part %_1266)
       (imag-part %_1266))
      (if (< %_1266 '0) (- %_1266) %_1266))))
(define min (void))
(define max (void))
(letrec ((%_1269
           (lambda (%_1274 %_1275 %_1276 %_1277)
             (if (null? %_1276)
               (if (if %_1277 (exact? %_1275) '#f)
                 (exact->inexact %_1275)
                 %_1275)
               (if (%_1274 (car %_1276) %_1275)
                 (%_1269
                   %_1274
                   (car %_1276)
                   (cdr %_1276)
                   ((lambda (%_1278)
                      (if %_1278 %_1278 (inexact? (car %_1276))))
                    %_1277))
                 (%_1269 %_1274 %_1275 (cdr %_1276) %_1277))))))
  (begin
    (set! min
      (lambda (%_1271 . %_1270)
        (if (null? %_1270)
          %_1271
          (%_1269 < %_1271 %_1270 (inexact? %_1271)))))
    (set! max
      (lambda (%_1273 . %_1272)
        (if (null? %_1272)
          %_1273
          (%_1269 > %_1273 %_1272 (inexact? %_1273)))))))
(define negative?
  (lambda (%_1279) (< %_1279 '0)))
(define positive?
  (lambda (%_1280) (> %_1280 '0)))
(define even?
  (lambda (%_1281) (= '0 (modulo %_1281 '2))))
(define odd?
  (lambda (%_1282) (not (even? %_1282))))
(define zero? (lambda (%_1283) (= %_1283 '0)))
(define add1 (lambda (%_1284) (+ %_1284 '1)))
(define sub1 (lambda (%_1285) (- %_1285 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1286 %_1287)
   (begin
     (set! <=
       (%_1286
         (lambda (%_1288 %_1289)
           ((lambda (%_1290)
              (if %_1290 %_1290 (= %_1288 %_1289)))
            (< %_1288 %_1289)))
         %_1287
         '#t))
     (set! >=
       (%_1286
         (lambda (%_1291 %_1292)
           ((lambda (%_1293)
              (if %_1293 %_1293 (= %_1291 %_1292)))
            (> %_1291 %_1292)))
         %_1287
         '#t))))
 (lambda (%_1294 %_1295 %_1296)
   (lambda %_1297
     ((letrec ((%_1298
                 (lambda (%_1299)
                   (if (null? %_1299)
                     %_1296
                     (if (null? (cdr %_1299))
                       %_1296
                       (%_1295
                         (%_1294 (car %_1299) (cadr %_1299))
                         (%_1298 (cdr %_1299))))))))
        %_1298)
      %_1297)))
 (lambda (%_1300 %_1301) (if %_1300 %_1301 '#f)))
((lambda (%_1302)
   (begin
     (set! >= (%_1302 > >=))
     (set! <= (%_1302 < <=))))
 (lambda (%_1303 %_1304)
   (lambda %_1305
     ((lambda (%_1306)
        (if %_1306
          %_1306
          ((lambda (%_1307)
             (if %_1307
               %_1307
               (if ((lambda (%_1308)
                      (if %_1308
                        %_1308
                        (%_1303 (car %_1305) (cadr %_1305))))
                    (= (car %_1305) (cadr %_1305)))
                 (apply %_1304 (cdr %_1305))
                 '#f)))
           (null? (cdr %_1305)))))
      (null? %_1305)))))
(define gcd
  (lambda %_1309
    (if (null? %_1309)
      '0
      (if (null? (cdr %_1309))
        (car %_1309)
        (_gcd (car %_1309) (cadr %_1309))))))
(define lcm
  (lambda %_1310
    (if (null? %_1310)
      '1
      (if (null? (cdr %_1310))
        (car %_1310)
        (_lcm (car %_1310) (cadr %_1310))))))
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
  (lambda %_1311
    (if (null? %_1311)
      '""
      (if (null? (cdr %_1311))
        (car %_1311)
        (apply string-append
               (_string-append (car %_1311) (cadr %_1311))
               (cddr %_1311))))))
(define char-downcase
  ((lambda (%_1312)
     ((lambda (%_1313)
        ((lambda (%_1314)
           ((lambda ()
              (lambda (%_1315)
                ((lambda (%_1316)
                   (if (if (>= %_1316 %_1312) (<= %_1316 %_1313) '#f)
                     (integer->char (+ %_1316 %_1314))
                     %_1315))
                 (char->integer %_1315))))))
         (- (char->integer '#\a) %_1312)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1317)
     ((lambda (%_1318)
        ((lambda (%_1319)
           ((lambda ()
              (lambda (%_1320)
                ((lambda (%_1321)
                   (if (if (>= %_1321 %_1317) (<= %_1321 %_1318) '#f)
                     (integer->char (- %_1321 %_1319))
                     %_1320))
                 (char->integer %_1320))))))
         (- %_1317 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1322 %_1323)
    (> (char->integer %_1322) (char->integer %_1323))))
(define char<?
  (lambda (%_1324 %_1325)
    (< (char->integer %_1324) (char->integer %_1325))))
(define char=? eq?)
(define char>=?
  (lambda (%_1326 %_1327)
    ((lambda (%_1328)
       (if %_1328 %_1328 (char=? %_1326 %_1327)))
     (char>? %_1326 %_1327))))
(define char<=?
  (lambda (%_1329 %_1330)
    ((lambda (%_1331)
       (if %_1331 %_1331 (char=? %_1329 %_1330)))
     (char<? %_1329 %_1330))))
(define char-ci>?
  (lambda (%_1332 %_1333)
    (char>?
      (char-downcase %_1332)
      (char-downcase %_1333))))
(define char-ci<?
  (lambda (%_1334 %_1335)
    (char<?
      (char-downcase %_1334)
      (char-downcase %_1335))))
(define char-ci=?
  (lambda (%_1336 %_1337)
    (char=?
      (char-downcase %_1336)
      (char-downcase %_1337))))
(define char-ci>=?
  (lambda (%_1338 %_1339)
    ((lambda (%_1340)
       (if %_1340 %_1340 (char-ci=? %_1338 %_1339)))
     (char-ci>? %_1338 %_1339))))
(define char-ci<=?
  (lambda (%_1341 %_1342)
    ((lambda (%_1343)
       (if %_1343 %_1343 (char-ci=? %_1341 %_1342)))
     (char-ci<? %_1341 %_1342))))
(define char-alphabetic?
  (lambda (%_1344)
    (if (char-ci>=? %_1344 '#\a)
      (char-ci<=? %_1344 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1345)
    (if (char-ci>=? %_1345 '#\0)
      (char-ci<=? %_1345 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1346)
    (if (memq %_1346 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1347)
    (if (char-alphabetic? %_1347)
      (char>? %_1347 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1348)
    (if (char-alphabetic? %_1348)
      (char>? %_1348 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_1349
           (lambda (%_1354 %_1355 %_1356 %_1357 %_1358)
             (if (< %_1357 %_1358)
               (begin
                 (string-set!
                   %_1355
                   %_1357
                   (%_1356 (string-ref %_1354 %_1357)))
                 (%_1349
                   %_1354
                   %_1355
                   %_1356
                   (+ %_1357 '1)
                   %_1358))
               %_1355))))
  (begin
    (set! string-downcase
      (lambda (%_1350)
        ((lambda (%_1351)
           (%_1349
             %_1350
             %_1351
             char-downcase
             '0
             (string-length %_1350)))
         (make-string (string-length %_1350)))))
    (set! string-upcase
      (lambda (%_1352)
        ((lambda (%_1353)
           (%_1349
             %_1352
             %_1353
             char-upcase
             '0
             (string-length %_1352)))
         (make-string (string-length %_1352)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_1359
             (lambda (%_1362 %_1363)
               (if (null? %_1362)
                 (not (null? %_1363))
                 (if (null? %_1363)
                   '#f
                   ((lambda (%_1364 %_1365)
                      (if (char<? %_1364 %_1365)
                        '#t
                        (if (char>? %_1364 %_1365)
                          '#f
                          (%_1359 (cdr %_1362) (cdr %_1363)))))
                    (car %_1362)
                    (car %_1363)))))))
    (lambda (%_1360 %_1361)
      (%_1359
        (string->list %_1360)
        (string->list %_1361)))))
(define string>?
  (letrec ((%_1366
             (lambda (%_1369 %_1370)
               (if (null? %_1370)
                 (not (null? %_1369))
                 (if (null? %_1369)
                   '#f
                   ((lambda (%_1371 %_1372)
                      (if (char>? %_1371 %_1372)
                        '#t
                        (if (char<? %_1371 %_1372)
                          '#f
                          (%_1366 (cdr %_1369) (cdr %_1370)))))
                    (car %_1369)
                    (car %_1370)))))))
    (lambda (%_1367 %_1368)
      (%_1366
        (string->list %_1367)
        (string->list %_1368)))))
(define string<=?
  (lambda (%_1373 %_1374)
    ((lambda (%_1375)
       (if %_1375 %_1375 (string=? %_1373 %_1374)))
     (string<? %_1373 %_1374))))
(define string>=?
  (lambda (%_1376 %_1377)
    ((lambda (%_1378)
       (if %_1378 %_1378 (string=? %_1376 %_1377)))
     (string>? %_1376 %_1377))))
(define string-ci=?
  (lambda (%_1379 %_1380)
    (string=?
      (string-downcase %_1379)
      (string-downcase %_1380))))
(define string-ci<?
  (lambda (%_1381 %_1382)
    (string<?
      (string-downcase %_1381)
      (string-downcase %_1382))))
(define string-ci>?
  (lambda (%_1383 %_1384)
    (string>?
      (string-downcase %_1383)
      (string-downcase %_1384))))
(define string-ci>=?
  (lambda (%_1385 %_1386)
    (string>=?
      (string-downcase %_1385)
      (string-downcase %_1386))))
(define string-ci<=?
  (lambda (%_1387 %_1388)
    (string<=?
      (string-downcase %_1387)
      (string-downcase %_1388))))
(define substring
  (letrec ((%_1389
             (lambda (%_1394 %_1395 %_1396 %_1397 %_1398)
               (if (< %_1397 %_1398)
                 (begin
                   (string-set!
                     %_1395
                     %_1396
                     (string-ref %_1394 %_1397))
                   (%_1389
                     %_1394
                     %_1395
                     (+ %_1396 '1)
                     (+ %_1397 '1)
                     %_1398))
                 (void)))))
    (lambda (%_1390 %_1391 %_1392)
      ((lambda (%_1393)
         (begin
           (%_1389 %_1390 %_1393 '0 %_1391 %_1392)
           %_1393))
       (make-string (- %_1392 %_1391))))))
(define format
  (lambda (%_1400 . %_1399)
    ((lambda (%_1401)
       ((letrec ((%_1402
                   (lambda (%_1403 %_1404)
                     (if (null? %_1403)
                       (get-output-string %_1401)
                       (if (char=? (car %_1403) '#\~)
                         (if (null? (cdr %_1403))
                           (error 'format '"Incomplete escape sequence")
                           ((lambda (%_1405)
                              (if (memv %_1405 '(#\a))
                                (if (null? %_1404)
                                  (error 'format
                                         '"No value for escape sequence")
                                  (begin
                                    (display (car %_1404) %_1401)
                                    (%_1402 (cddr %_1403) (cdr %_1404))))
                                (if (memv %_1405 '(#\s))
                                  (if (null? %_1404)
                                    (error 'format
                                           '"No value for escape sequence")
                                    (begin
                                      (write (car %_1404) %_1401)
                                      (%_1402 (cddr %_1403) (cdr %_1404))))
                                  (if (memv %_1405 '(#\%))
                                    (begin
                                      (display '#\newline %_1401)
                                      (%_1402 (cddr %_1403) %_1404))
                                    (if (memv %_1405 '(#\~))
                                      (begin
                                        (display '#\~ %_1401)
                                        (%_1402 (cddr %_1403) %_1404))
                                      (error 'format
                                             '"Unrecognized escape sequence"))))))
                            (cadr %_1403)))
                         (begin
                           (display (car %_1403) %_1401)
                           (%_1402 (cdr %_1403) %_1404)))))))
          %_1402)
        (string->list %_1400)
        %_1399))
     (open-output-string))))
(define list-ref
  (lambda (%_1406 %_1407)
    (if (zero? %_1407)
      (car %_1406)
      (list-ref (cdr %_1406) (- %_1407 '1)))))
(define values
  (lambda %_1408
    (call-with-current-continuation
      (lambda (%_1409) (apply %_1409 %_1408)))))
