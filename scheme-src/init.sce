(define for-each
  (lambda (%_1081 . %_1080)
    (if (null? %_1080)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_1080)))
        (begin
          (apply %_1081 (map car %_1080))
          (apply for-each (cons %_1081 (map cdr %_1080))))
        (void)))))
(define eof-object?
  (lambda (%_1082) (eq? %_1082 '#!eof)))
(define not
  (lambda (%_1083) (if %_1083 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_1084
    (apply display (cons '#\newline %_1084))))
(define map (void))
(letrec ((%_1085
           (letrec ((%_1086
                      (lambda (%_1090 %_1091 %_1092 %_1093)
                        (if (null? %_1093)
                          %_1091
                          (begin
                            (set-cdr!
                              %_1092
                              (cons (%_1090 (car %_1093)) '()))
                            (%_1086
                              %_1090
                              %_1091
                              (cdr %_1092)
                              (cdr %_1093)))))))
             (lambda (%_1087 %_1088)
               (if (null? %_1088)
                 '()
                 ((lambda (%_1089)
                    (%_1086 %_1087 %_1089 %_1089 (cdr %_1088)))
                  (cons (%_1087 (car %_1088)) '())))))))
  (set! map %_1085))
(define compose
  (lambda %_1094
    (if (null? %_1094)
      (lambda (%_1098) %_1098)
      ((lambda (%_1095 %_1096)
         (lambda (%_1097) (%_1095 (%_1096 %_1097))))
       (car %_1094)
       (apply compose (cdr %_1094))))))
(define compose2
  (lambda (%_1099 %_1100)
    (lambda (%_1101) (%_1099 (%_1100 %_1101)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((%_1102
           (lambda (%_1116 %_1117 %_1118)
             (if (null? %_1118)
               '#f
               (if (%_1116 (caar %_1118) %_1117)
                 (car %_1118)
                 (%_1102 %_1116 %_1117 (cdr %_1118))))))
         (%_1103
           (lambda (%_1119 %_1120 %_1121)
             (if (null? %_1121)
               '#f
               (if (%_1119 (car %_1121) %_1120)
                 %_1121
                 (%_1103 %_1119 %_1120 (cdr %_1121)))))))
  (begin
    (set! assq
      (lambda (%_1104 %_1105)
        (%_1102 eq? %_1104 %_1105)))
    (set! assv
      (lambda (%_1106 %_1107)
        (%_1102 eqv? %_1106 %_1107)))
    (set! assoc
      (lambda (%_1108 %_1109)
        (%_1102 equal? %_1108 %_1109)))
    (set! memq
      (lambda (%_1110 %_1111)
        (%_1103 eq? %_1110 %_1111)))
    (set! memv
      (lambda (%_1112 %_1113)
        (%_1103 eqv? %_1112 %_1113)))
    (set! member
      (lambda (%_1114 %_1115)
        (%_1103 equal? %_1114 %_1115)))))
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
  (lambda (%_1122 %_1123)
    (if (null? %_1122)
      %_1123
      (cons (car %_1122) (append2 (cdr %_1122) %_1123)))))
(define append append2)
(define list->string
  (lambda (%_1124)
    (letrec ((%_1125
               (lambda (%_1126 %_1127 %_1128)
                 (if (null? %_1126)
                   %_1127
                   (begin
                     (string-set! %_1127 %_1128 (car %_1126))
                     (%_1125 (cdr %_1126) %_1127 (+ %_1128 '1)))))))
      (%_1125 %_1124 (make-string (length %_1124)) '0))))
(define string->list
  (letrec ((%_1129
             (lambda (%_1131 %_1132 %_1133)
               (if (< %_1133 '0)
                 %_1132
                 (%_1129
                   %_1131
                   (cons (string-ref %_1131 %_1133) %_1132)
                   (- %_1133 '1))))))
    (lambda (%_1130)
      (%_1129 %_1130 '() (- (string-length %_1130) '1)))))
(define list->vector
  (letrec ((%_1134
             (lambda (%_1136 %_1137 %_1138)
               (if (null? %_1136)
                 %_1137
                 (begin
                   (vector-set! %_1137 %_1138 (car %_1136))
                   (%_1134 (cdr %_1136) %_1137 (+ %_1138 '1)))))))
    (lambda (%_1135)
      (if (proper-list? %_1135)
        (%_1134 %_1135 (make-vector (length %_1135)) '0)
        (error 'list->vector
               '"can only convert a proper list."
               %_1135)))))
(define vector
  (lambda %_1139 (list->vector %_1139)))
(define string
  (lambda %_1140 (list->string %_1140)))
(define detect-os
  (lambda ()
    ((lambda (%_1141)
       (if (> (string-length %_1141) '3)
         (if (equal? (substring %_1141 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_1141 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_1141 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_1141 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_1141 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_1141 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_1141 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_1142
    (if (null? %_1142)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url (current-url) (car %_1142))))))
(define load-expanded load)
((lambda (%_1143)
   ((lambda (%_1144 %_1145 %_1146)
      (begin
        (set! open-input-file (%_1144 open-input-file))
        (set! open-source-input-file
          (%_1144 open-source-input-file))
        (set! open-output-file (%_1144 open-output-file))
        (set! load
          (lambda (%_1147)
            (begin
              ((lambda (%_1148)
                 (begin
                   (current-url (normalize-url %_1148 %_1147))
                   (call-with-failure-continuation
                     (lambda ()
                       ((%_1145 (string->symbol (%_1146 (current-url))))
                        (current-url)))
                     (lambda (%_1149 %_1150 %_1151)
                       (begin
                         (current-url %_1148)
                         (%_1151 %_1149 %_1150))))
                   (current-url %_1148)))
               (current-url))
              (void))))))
    (lambda (%_1152)
      (lambda (%_1154 . %_1153)
        (apply %_1152
               (normalize-url (current-url) %_1154)
               %_1153)))
    (lambda (%_1155)
      ((lambda (%_1156)
         (if (memv %_1156 '(sce pp)) load-expanded %_1143))
       %_1155))
    (lambda (%_1157)
      ((letrec ((%_1158
                  (lambda (%_1159 %_1160)
                    (if (null? %_1159)
                      '#f
                      (if (equal? (car %_1159) '#\.)
                        (list->string %_1160)
                        (%_1158 (cdr %_1159) (cons (car %_1159) %_1160)))))))
         %_1158)
       (reverse (string->list %_1157))
       '()))))
 load)
(define load-module
  (lambda (%_1161)
    ((lambda (%_1162)
       ((lambda (%_1163)
          ((lambda ()
             (for-each
               (lambda (%_1164)
                 (putprop
                   %_1164
                   '*toplevel*
                   (native-library-binding %_1162 %_1164)))
               %_1163))))
        (native-library-binding-names %_1162)))
     (load-native-library %_1161))))
(define reverse
  (letrec ((%_1165
             (lambda (%_1167 %_1168)
               (if (null? %_1167)
                 %_1168
                 (%_1165 (cdr %_1167) (cons (car %_1167) %_1168))))))
    (lambda (%_1166) (%_1165 %_1166 '()))))
(define remove
  (lambda (%_1169 %_1170)
    (if (null? %_1170)
      '()
      (if (equal? (car %_1170) %_1169)
        (remove %_1169 (cdr %_1170))
        (cons (car %_1170) (remove %_1169 (cdr %_1170)))))))
(define append
  (letrec ((%_1171
             (lambda (%_1174 . %_1173)
               (if (null? %_1173)
                 %_1174
                 (if (null? %_1174)
                   (apply %_1171 %_1173)
                   (apply %_1171
                          (cons (append2 %_1174 (car %_1173))
                                (cdr %_1173))))))))
    (lambda %_1172
      (if (null? %_1172)
        '()
        (if (null? (cdr %_1172))
          (car %_1172)
          (apply %_1171 (cons (car %_1172) (cdr %_1172))))))))
(define map
  (letrec ((%_1175 map)
           (%_1176
             (lambda (%_1180 %_1181 %_1182 %_1183)
               (if (null? (car %_1181))
                 (if (andmap null? %_1181)
                   %_1182
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_1184 %_1185)
                    (begin
                      (if (not (null? %_1183))
                        (set-cdr! %_1183 %_1184)
                        (void))
                      (if (null? %_1182)
                        (%_1176 %_1180 %_1185 %_1184 %_1184)
                        (%_1176 %_1180 %_1185 %_1182 %_1184))))
                  (cons (apply %_1180 (%_1175 car %_1181)) '())
                  (%_1175 cdr %_1181))))))
    (lambda (%_1179 %_1178 . %_1177)
      (if (null? %_1177)
        (%_1175 %_1179 %_1178)
        (%_1176 %_1179 (cons %_1178 %_1177) '() '())))))
(define proper-list?
  (lambda (%_1186)
    ((letrec ((%_1187
                (lambda (%_1188 %_1189)
                  (if (pair? %_1188)
                    ((lambda (%_1190)
                       (if (pair? %_1190)
                         ((lambda (%_1191 %_1192)
                            (if (not (eq? %_1191 %_1192))
                              (%_1187 %_1191 %_1192)
                              '#f))
                          (cdr %_1190)
                          (cdr %_1189))
                         (null? %_1190)))
                     (cdr %_1188))
                    (null? %_1188)))))
       %_1187)
     %_1186
     %_1186)))
(define circular?
  (lambda (%_1193)
    (letrec ((%_1194
               (lambda (%_1200)
                 ((lambda (%_1201)
                    (if %_1201
                      %_1201
                      ((lambda (%_1202)
                         (if %_1202
                           %_1202
                           (if (vector? %_1200)
                             (not (zero? (vector-length %_1200)))
                             '#f)))
                       (box? %_1200))))
                  (pair? %_1200))))
             (%_1195
               (lambda (%_1203)
                 (if (pair? %_1203)
                   '2
                   (if (box? %_1203) '1 (vector-length %_1203)))))
             (%_1196
               (lambda (%_1204 %_1205)
                 (if (vector? %_1204)
                   (vector-ref %_1204 %_1205)
                   (if (box? %_1204)
                     (unbox %_1204)
                     ((if (zero? %_1205) car cdr) %_1204)))))
             (%_1197
               (lambda (%_1206)
                 ((lambda (%_1207)
                    ((letrec ((%_1208
                                (lambda (%_1209 %_1210 %_1211)
                                  (if (>= %_1210 '0)
                                    ((lambda (%_1215)
                                       (if (%_1194 %_1215)
                                         (cons %_1215 (cons %_1210 %_1211))
                                         (%_1208 %_1209 (- %_1210 '1) %_1211)))
                                     (%_1196 %_1209 %_1210))
                                    ((lambda (%_1212)
                                       (if (pair? %_1212)
                                         ((lambda (%_1213 %_1214)
                                            (%_1208
                                              (car %_1214)
                                              (- %_1213 '1)
                                              %_1214))
                                          (car %_1212)
                                          (cdr %_1212))
                                         '#f))
                                     (cdr %_1211))))))
                       %_1208)
                     %_1207
                     (- (%_1195 %_1207) '1)
                     %_1206))
                  (car %_1206))))
             (%_1198
               (lambda (%_1216 %_1217)
                 (letrec ((%_1218
                            (lambda (%_1227 %_1228)
                              ((lambda (%_1229)
                                 (if %_1229
                                   (%_1198 (%_1197 %_1227) (%_1197 %_1229))
                                   '#f))
                               (%_1197 %_1228)))))
                   (if %_1217
                     (if (not (eq? (car %_1217) (car %_1216)))
                       (%_1218 %_1216 %_1217)
                       ((letrec ((%_1219
                                   (lambda (%_1220 %_1221)
                                     ((lambda (%_1222)
                                        (if %_1222
                                          %_1222
                                          (if (if (= (cadr %_1220)
                                                     (cadr %_1221))
                                                (eq? (caddr %_1220)
                                                     (caddr %_1221))
                                                '#f)
                                            (%_1219
                                              (cddr %_1220)
                                              (cddr %_1221))
                                            ((lambda (%_1223)
                                               ((letrec ((%_1224
                                                           (lambda (%_1225)
                                                             (if %_1225
                                                               ((lambda (%_1226)
                                                                  (if %_1226
                                                                    %_1226
                                                                    (%_1224
                                                                      (%_1197
                                                                        %_1225))))
                                                                (eq? (car %_1225)
                                                                     %_1223))
                                                               (%_1218
                                                                 %_1220
                                                                 %_1221)))))
                                                  %_1224)
                                                (%_1197 (list %_1223))))
                                             (car %_1220)))))
                                      (null? (cdr %_1220))))))
                          %_1219)
                        %_1216
                        %_1217))
                     '#f)))))
      (if (%_1194 %_1193)
        ((lambda (%_1199) (%_1198 %_1199 (%_1197 %_1199)))
         (list %_1193))
        '#f))))
(define list?
  (letrec ((%_1230
             (lambda (%_1233 %_1234)
               ((lambda (%_1235)
                  (if %_1235
                    %_1235
                    ((lambda (%_1236)
                       (if %_1236
                         %_1236
                         (if (pair? %_1234)
                           ((lambda (%_1237)
                              (if %_1237
                                %_1237
                                (if (not (eq? %_1233 %_1234))
                                  (%_1230 (cdr %_1233) (cddr %_1234))
                                  '#f)))
                            (null? (cdr %_1234)))
                           '#f)))
                     (null? %_1234))))
                (null? %_1233)))))
    (lambda (%_1231)
      ((lambda (%_1232)
         (if %_1232
           %_1232
           (if (pair? %_1231)
             (%_1230 %_1231 (cdr %_1231))
             '#f)))
       (null? %_1231)))))
(define expt
  (lambda (%_1238 %_1239)
    (if (if (integer? %_1239) (= %_1238 '2) '#f)
      (ashl '1 %_1239)
      ((letrec ((%_1240
                  (lambda (%_1241 %_1242 %_1243)
                    (if (zero? %_1241)
                      %_1242
                      (%_1240
                        (quotient %_1241 '2)
                        (if (odd? %_1241) (* %_1242 %_1243) %_1242)
                        (* %_1243 %_1243))))))
         %_1240)
       %_1239
       '1
       %_1238))))
(define modpow
  (lambda (%_1244 %_1245 %_1246)
    ((lambda (%_1247)
       (if (= %_1245 '1)
         (modulo %_1244 %_1246)
         (if (even? %_1245)
           ((lambda (%_1249)
              (modulo (* %_1249 %_1249) %_1246))
            (modpow %_1244 (/ %_1245 '2) %_1246))
           ((lambda (%_1248)
              (begin
                (set! %_1248 (modulo (* %_1248 %_1248) %_1246))
                (modulo (* %_1244 %_1248) %_1246)))
            (modpow %_1244 (/ (- %_1245 '1) '2) %_1246)))))
     '0)))
(define integer?
  ((lambda (%_1250)
     (lambda (%_1251)
       ((lambda (%_1252)
          (if %_1252
            %_1252
            (if (real? %_1251) (= (round %_1251) %_1251) '#f)))
        (%_1250 %_1251))))
   integer?))
(define real?
  ((lambda (%_1253)
     (lambda (%_1254)
       (if (number? %_1254) (not (%_1253 %_1254)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1255)
    (if (not (real? %_1255))
      ((lambda (%_1256 %_1257)
         (sqrt (+ (* %_1256 %_1256) (* %_1257 %_1257))))
       (real-part %_1255)
       (imag-part %_1255))
      (if (< %_1255 '0) (- %_1255) %_1255))))
(define min (void))
(define max (void))
(letrec ((%_1258
           (lambda (%_1263 %_1264 %_1265 %_1266)
             (if (null? %_1265)
               (if (if %_1266 (exact? %_1264) '#f)
                 (exact->inexact %_1264)
                 %_1264)
               (if (%_1263 (car %_1265) %_1264)
                 (%_1258
                   %_1263
                   (car %_1265)
                   (cdr %_1265)
                   ((lambda (%_1267)
                      (if %_1267 %_1267 (inexact? (car %_1265))))
                    %_1266))
                 (%_1258 %_1263 %_1264 (cdr %_1265) %_1266))))))
  (begin
    (set! min
      (lambda (%_1260 . %_1259)
        (if (null? %_1259)
          %_1260
          (%_1258 < %_1260 %_1259 (inexact? %_1260)))))
    (set! max
      (lambda (%_1262 . %_1261)
        (if (null? %_1261)
          %_1262
          (%_1258 > %_1262 %_1261 (inexact? %_1262)))))))
(define negative?
  (lambda (%_1268) (< %_1268 '0)))
(define positive?
  (lambda (%_1269) (> %_1269 '0)))
(define even?
  (lambda (%_1270) (= '0 (modulo %_1270 '2))))
(define odd?
  (lambda (%_1271) (not (even? %_1271))))
(define zero? (lambda (%_1272) (= %_1272 '0)))
(define add1 (lambda (%_1273) (+ %_1273 '1)))
(define sub1 (lambda (%_1274) (- %_1274 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1275 %_1276)
   (begin
     (set! <=
       (%_1275
         (lambda (%_1277 %_1278)
           ((lambda (%_1279)
              (if %_1279 %_1279 (= %_1277 %_1278)))
            (< %_1277 %_1278)))
         %_1276
         '#t))
     (set! >=
       (%_1275
         (lambda (%_1280 %_1281)
           ((lambda (%_1282)
              (if %_1282 %_1282 (= %_1280 %_1281)))
            (> %_1280 %_1281)))
         %_1276
         '#t))))
 (lambda (%_1283 %_1284 %_1285)
   (lambda %_1286
     ((letrec ((%_1287
                 (lambda (%_1288)
                   (if (null? %_1288)
                     %_1285
                     (if (null? (cdr %_1288))
                       %_1285
                       (%_1284
                         (%_1283 (car %_1288) (cadr %_1288))
                         (%_1287 (cdr %_1288))))))))
        %_1287)
      %_1286)))
 (lambda (%_1289 %_1290) (if %_1289 %_1290 '#f)))
((lambda (%_1291)
   (begin
     (set! >= (%_1291 > >=))
     (set! <= (%_1291 < <=))))
 (lambda (%_1292 %_1293)
   (lambda %_1294
     ((lambda (%_1295)
        (if %_1295
          %_1295
          ((lambda (%_1296)
             (if %_1296
               %_1296
               (if ((lambda (%_1297)
                      (if %_1297
                        %_1297
                        (%_1292 (car %_1294) (cadr %_1294))))
                    (= (car %_1294) (cadr %_1294)))
                 (apply %_1293 (cdr %_1294))
                 '#f)))
           (null? (cdr %_1294)))))
      (null? %_1294)))))
(define gcd
  (lambda %_1298
    (if (null? %_1298)
      '0
      (if (null? (cdr %_1298))
        (car %_1298)
        (_gcd (car %_1298) (cadr %_1298))))))
(define lcm
  (lambda %_1299
    (if (null? %_1299)
      '1
      (if (null? (cdr %_1299))
        (car %_1299)
        (_lcm (car %_1299) (cadr %_1299))))))
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
  (lambda %_1300
    (if (null? %_1300)
      '""
      (if (null? (cdr %_1300))
        (car %_1300)
        (apply string-append
               (_string-append (car %_1300) (cadr %_1300))
               (cddr %_1300))))))
(define char-downcase
  ((lambda (%_1301)
     ((lambda (%_1302)
        ((lambda (%_1303)
           ((lambda ()
              (lambda (%_1304)
                ((lambda (%_1305)
                   (if (if (>= %_1305 %_1301) (<= %_1305 %_1302) '#f)
                     (integer->char (+ %_1305 %_1303))
                     %_1304))
                 (char->integer %_1304))))))
         (- (char->integer '#\a) %_1301)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1306)
     ((lambda (%_1307)
        ((lambda (%_1308)
           ((lambda ()
              (lambda (%_1309)
                ((lambda (%_1310)
                   (if (if (>= %_1310 %_1306) (<= %_1310 %_1307) '#f)
                     (integer->char (- %_1310 %_1308))
                     %_1309))
                 (char->integer %_1309))))))
         (- %_1306 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1311 %_1312)
    (> (char->integer %_1311) (char->integer %_1312))))
(define char<?
  (lambda (%_1313 %_1314)
    (< (char->integer %_1313) (char->integer %_1314))))
(define char=? eq?)
(define char>=?
  (lambda (%_1315 %_1316)
    ((lambda (%_1317)
       (if %_1317 %_1317 (char=? %_1315 %_1316)))
     (char>? %_1315 %_1316))))
(define char<=?
  (lambda (%_1318 %_1319)
    ((lambda (%_1320)
       (if %_1320 %_1320 (char=? %_1318 %_1319)))
     (char<? %_1318 %_1319))))
(define char-ci>?
  (lambda (%_1321 %_1322)
    (char>?
      (char-downcase %_1321)
      (char-downcase %_1322))))
(define char-ci<?
  (lambda (%_1323 %_1324)
    (char<?
      (char-downcase %_1323)
      (char-downcase %_1324))))
(define char-ci=?
  (lambda (%_1325 %_1326)
    (char=?
      (char-downcase %_1325)
      (char-downcase %_1326))))
(define char-ci>=?
  (lambda (%_1327 %_1328)
    ((lambda (%_1329)
       (if %_1329 %_1329 (char-ci=? %_1327 %_1328)))
     (char-ci>? %_1327 %_1328))))
(define char-ci<=?
  (lambda (%_1330 %_1331)
    ((lambda (%_1332)
       (if %_1332 %_1332 (char-ci=? %_1330 %_1331)))
     (char-ci<? %_1330 %_1331))))
(define char-alphabetic?
  (lambda (%_1333)
    (if (char-ci>=? %_1333 '#\a)
      (char-ci<=? %_1333 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1334)
    (if (char-ci>=? %_1334 '#\0)
      (char-ci<=? %_1334 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1335)
    (if (memq %_1335 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1336)
    (if (char-alphabetic? %_1336)
      (char>? %_1336 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1337)
    (if (char-alphabetic? %_1337)
      (char>? %_1337 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_1338
           (lambda (%_1343 %_1344 %_1345 %_1346 %_1347)
             (if (< %_1346 %_1347)
               (begin
                 (string-set!
                   %_1344
                   %_1346
                   (%_1345 (string-ref %_1343 %_1346)))
                 (%_1338
                   %_1343
                   %_1344
                   %_1345
                   (+ %_1346 '1)
                   %_1347))
               %_1344))))
  (begin
    (set! string-downcase
      (lambda (%_1339)
        ((lambda (%_1340)
           (%_1338
             %_1339
             %_1340
             char-downcase
             '0
             (string-length %_1339)))
         (make-string (string-length %_1339)))))
    (set! string-upcase
      (lambda (%_1341)
        ((lambda (%_1342)
           (%_1338
             %_1341
             %_1342
             char-upcase
             '0
             (string-length %_1341)))
         (make-string (string-length %_1341)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_1348
             (lambda (%_1351 %_1352)
               (if (null? %_1351)
                 (not (null? %_1352))
                 (if (null? %_1352)
                   '#f
                   ((lambda (%_1353 %_1354)
                      (if (char<? %_1353 %_1354)
                        '#t
                        (if (char>? %_1353 %_1354)
                          '#f
                          (%_1348 (cdr %_1351) (cdr %_1352)))))
                    (car %_1351)
                    (car %_1352)))))))
    (lambda (%_1349 %_1350)
      (%_1348
        (string->list %_1349)
        (string->list %_1350)))))
(define string>?
  (letrec ((%_1355
             (lambda (%_1358 %_1359)
               (if (null? %_1359)
                 (not (null? %_1358))
                 (if (null? %_1358)
                   '#f
                   ((lambda (%_1360 %_1361)
                      (if (char>? %_1360 %_1361)
                        '#t
                        (if (char<? %_1360 %_1361)
                          '#f
                          (%_1355 (cdr %_1358) (cdr %_1359)))))
                    (car %_1358)
                    (car %_1359)))))))
    (lambda (%_1356 %_1357)
      (%_1355
        (string->list %_1356)
        (string->list %_1357)))))
(define string<=?
  (lambda (%_1362 %_1363)
    ((lambda (%_1364)
       (if %_1364 %_1364 (string=? %_1362 %_1363)))
     (string<? %_1362 %_1363))))
(define string>=?
  (lambda (%_1365 %_1366)
    ((lambda (%_1367)
       (if %_1367 %_1367 (string=? %_1365 %_1366)))
     (string>? %_1365 %_1366))))
(define string-ci=?
  (lambda (%_1368 %_1369)
    (string=?
      (string-downcase %_1368)
      (string-downcase %_1369))))
(define string-ci<?
  (lambda (%_1370 %_1371)
    (string<?
      (string-downcase %_1370)
      (string-downcase %_1371))))
(define string-ci>?
  (lambda (%_1372 %_1373)
    (string>?
      (string-downcase %_1372)
      (string-downcase %_1373))))
(define string-ci>=?
  (lambda (%_1374 %_1375)
    (string>=?
      (string-downcase %_1374)
      (string-downcase %_1375))))
(define string-ci<=?
  (lambda (%_1376 %_1377)
    (string<=?
      (string-downcase %_1376)
      (string-downcase %_1377))))
(define substring
  (letrec ((%_1378
             (lambda (%_1383 %_1384 %_1385 %_1386 %_1387)
               (if (< %_1386 %_1387)
                 (begin
                   (string-set!
                     %_1384
                     %_1385
                     (string-ref %_1383 %_1386))
                   (%_1378
                     %_1383
                     %_1384
                     (+ %_1385 '1)
                     (+ %_1386 '1)
                     %_1387))
                 (void)))))
    (lambda (%_1379 %_1380 %_1381)
      ((lambda (%_1382)
         (begin
           (%_1378 %_1379 %_1382 '0 %_1380 %_1381)
           %_1382))
       (make-string (- %_1381 %_1380))))))
(define format
  (lambda (%_1389 . %_1388)
    ((lambda (%_1390)
       ((letrec ((%_1391
                   (lambda (%_1392 %_1393)
                     (if (null? %_1392)
                       (get-output-string %_1390)
                       (if (char=? (car %_1392) '#\~)
                         (if (null? (cdr %_1392))
                           (error 'format '"Incomplete escape sequence")
                           ((lambda (%_1394)
                              (if (memv %_1394 '(#\a))
                                (if (null? %_1393)
                                  (error 'format
                                         '"No value for escape sequence")
                                  (begin
                                    (display (car %_1393) %_1390)
                                    (%_1391 (cddr %_1392) (cdr %_1393))))
                                (if (memv %_1394 '(#\s))
                                  (if (null? %_1393)
                                    (error 'format
                                           '"No value for escape sequence")
                                    (begin
                                      (write (car %_1393) %_1390)
                                      (%_1391 (cddr %_1392) (cdr %_1393))))
                                  (if (memv %_1394 '(#\%))
                                    (begin
                                      (display '#\newline %_1390)
                                      (%_1391 (cddr %_1392) %_1393))
                                    (if (memv %_1394 '(#\~))
                                      (begin
                                        (display '#\~ %_1390)
                                        (%_1391 (cddr %_1392) %_1393))
                                      (error 'format
                                             '"Unrecognized escape sequence"))))))
                            (cadr %_1392)))
                         (begin
                           (display (car %_1392) %_1390)
                           (%_1391 (cdr %_1392) %_1393)))))))
          %_1391)
        (string->list %_1389)
        %_1388))
     (open-output-string))))
(define error
  ((lambda (%_1395)
     (lambda %_1396
       ((lambda (%_1397)
          (begin
            (if (null? %_1396)
              (void)
              (if (if (not (null? %_1396))
                    (symbol? (car %_1396))
                    '#f)
                (begin
                  (set! %_1397
                    (cons (cons 'location (car %_1396)) %_1397))
                  (set! %_1396 (cdr %_1396)))
                (if (not (car %_1396))
                  (set! %_1396 (cdr %_1396))
                  (void))))
            ((lambda (%_1398)
               (begin
                 (if %_1398 (set! %_1396 (cdr %_1396)) (void))
                 (if (null? %_1396)
                   (if %_1398
                     (set! %_1397
                       (cons (cons 'message %_1398) %_1397))
                     (void))
                   (if (string? %_1398)
                     (set! %_1397
                       (cons (cons 'message
                                   (apply format (cons %_1398 %_1396)))
                             %_1397))
                     (error 'error
                            '"cannot specify arguments to a non format-string error.")))))
             (if (not (null? %_1396)) (car %_1396) '#f))
            (%_1395 %_1397)))
        '())))
   error))
(define list-ref
  (lambda (%_1399 %_1400)
    (if (zero? %_1400)
      (car %_1399)
      (list-ref (cdr %_1399) (- %_1400 '1)))))
(define values
  (lambda %_1401
    (call-with-current-continuation
      (lambda (%_1402) (apply %_1402 %_1401)))))
