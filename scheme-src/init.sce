(define for-each
  (lambda (%_1083 . %_1082)
    (if (null? %_1082)
      (error 'for-each
             '"invalid number of arguments to procedure for-each.")
      (if (not (null? (car %_1082)))
        (begin
          (apply %_1083 (map car %_1082))
          (apply for-each (cons %_1083 (map cdr %_1082))))
        (void)))))
(define eof-object?
  (lambda (%_1084) (eq? %_1084 '#!eof)))
(define not
  (lambda (%_1085) (if %_1085 '#f '#t)))
(define eqv? eq?)
(define newline
  (lambda %_1086
    (apply display (cons '#\newline %_1086))))
(define map (void))
(letrec ((%_1087
           (letrec ((%_1088
                      (lambda (%_1092 %_1093 %_1094 %_1095)
                        (if (null? %_1095)
                          %_1093
                          (begin
                            (set-cdr!
                              %_1094
                              (cons (%_1092 (car %_1095)) '()))
                            (%_1088
                              %_1092
                              %_1093
                              (cdr %_1094)
                              (cdr %_1095)))))))
             (lambda (%_1089 %_1090)
               (if (null? %_1090)
                 '()
                 ((lambda (%_1091)
                    (%_1088 %_1089 %_1091 %_1091 (cdr %_1090)))
                  (cons (%_1089 (car %_1090)) '())))))))
  (set! map %_1087))
(define compose
  (lambda %_1096
    (if (null? %_1096)
      (lambda (%_1100) %_1100)
      ((lambda (%_1097 %_1098)
         (lambda (%_1099) (%_1097 (%_1098 %_1099))))
       (car %_1096)
       (apply compose (cdr %_1096))))))
(define compose2
  (lambda (%_1101 %_1102)
    (lambda (%_1103) (%_1101 (%_1102 %_1103)))))
(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))
(letrec ((%_1104
           (lambda (%_1118 %_1119 %_1120)
             (if (null? %_1120)
               '#f
               (if (%_1118 (caar %_1120) %_1119)
                 (car %_1120)
                 (%_1104 %_1118 %_1119 (cdr %_1120))))))
         (%_1105
           (lambda (%_1121 %_1122 %_1123)
             (if (null? %_1123)
               '#f
               (if (%_1121 (car %_1123) %_1122)
                 %_1123
                 (%_1105 %_1121 %_1122 (cdr %_1123)))))))
  (begin
    (set! assq
      (lambda (%_1106 %_1107)
        (%_1104 eq? %_1106 %_1107)))
    (set! assv
      (lambda (%_1108 %_1109)
        (%_1104 eqv? %_1108 %_1109)))
    (set! assoc
      (lambda (%_1110 %_1111)
        (%_1104 equal? %_1110 %_1111)))
    (set! memq
      (lambda (%_1112 %_1113)
        (%_1105 eq? %_1112 %_1113)))
    (set! memv
      (lambda (%_1114 %_1115)
        (%_1105 eqv? %_1114 %_1115)))
    (set! member
      (lambda (%_1116 %_1117)
        (%_1105 equal? %_1116 %_1117)))))
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
  (lambda (%_1124 %_1125)
    (if (null? %_1124)
      %_1125
      (cons (car %_1124) (append2 (cdr %_1124) %_1125)))))
(define append append2)
(define list->string
  (lambda (%_1126)
    (letrec ((%_1127
               (lambda (%_1128 %_1129 %_1130)
                 (if (null? %_1128)
                   %_1129
                   (begin
                     (string-set! %_1129 %_1130 (car %_1128))
                     (%_1127 (cdr %_1128) %_1129 (+ %_1130 '1)))))))
      (%_1127 %_1126 (make-string (length %_1126)) '0))))
(define string->list
  (letrec ((%_1131
             (lambda (%_1133 %_1134 %_1135)
               (if (< %_1135 '0)
                 %_1134
                 (%_1131
                   %_1133
                   (cons (string-ref %_1133 %_1135) %_1134)
                   (- %_1135 '1))))))
    (lambda (%_1132)
      (%_1131 %_1132 '() (- (string-length %_1132) '1)))))
(define list->vector
  (letrec ((%_1136
             (lambda (%_1138 %_1139 %_1140)
               (if (null? %_1138)
                 %_1139
                 (begin
                   (vector-set! %_1139 %_1140 (car %_1138))
                   (%_1136 (cdr %_1138) %_1139 (+ %_1140 '1)))))))
    (lambda (%_1137)
      (if (proper-list? %_1137)
        (%_1136 %_1137 (make-vector (length %_1137)) '0)
        (error 'list->vector
               '"can only convert a proper list."
               %_1137)))))
(define vector
  (lambda %_1141 (list->vector %_1141)))
(define string
  (lambda %_1142 (list->string %_1142)))
(define detect-os
  (lambda ()
    ((lambda (%_1143)
       (if (> (string-length %_1143) '3)
         (if (equal? (substring %_1143 '0 '3) '"mac")
           'macos
           (if (equal? (substring %_1143 '0 '3) '"win")
             'ms-dos
             (if (equal? (substring %_1143 '0 '3) '"ms-")
               'ms-dos
               (if (equal? (substring %_1143 '0 '3) '"uni")
                 'unix
                 (if (equal? (substring %_1143 '0 '3) '"lin")
                   'unix
                   (if (equal? (substring %_1143 '0 '4) '"os/")
                     'os2
                     (if (equal? (substring %_1143 '0 '3) '"vax")
                       'vax
                       (void))))))))
         'unix))
     (string-downcase
       (getprop 'os.name '*environment-variables*)))))
(define current-url (make-parameter '"file:."))
(define current-directory
  (lambda %_1144
    (if (null? %_1144)
      (normalize-url (current-url) '".")
      (current-url
        (normalize-url (current-url) (car %_1144))))))
(define load-expanded load)
((lambda (%_1145)
   ((lambda (%_1146 %_1147 %_1148)
      (begin
        (set! open-input-file (%_1146 open-input-file))
        (set! open-source-input-file
          (%_1146 open-source-input-file))
        (set! open-output-file (%_1146 open-output-file))
        (set! load
          (lambda (%_1149)
            (begin
              ((lambda (%_1150)
                 (begin
                   (current-url (normalize-url %_1150 %_1149))
                   (with-failure-continuation
                     (lambda (%_1151 %_1152)
                       (begin
                         (current-url %_1150)
                         (throw %_1151 %_1152)))
                     (lambda ()
                       ((%_1147 (string->symbol (%_1148 (current-url))))
                        (current-url))))
                   (current-url %_1150)))
               (current-url))
              (void))))))
    (lambda (%_1153)
      (lambda (%_1155 . %_1154)
        (apply %_1153
               (normalize-url (current-url) %_1155)
               %_1154)))
    (lambda (%_1156)
      ((lambda (%_1157)
         (if (memv %_1157 '(sce pp)) load-expanded %_1145))
       %_1156))
    (lambda (%_1158)
      ((letrec ((%_1159
                  (lambda (%_1160 %_1161)
                    (if (null? %_1160)
                      '#f
                      (if (equal? (car %_1160) '#\.)
                        (list->string %_1161)
                        (%_1159 (cdr %_1160) (cons (car %_1160) %_1161)))))))
         %_1159)
       (reverse (string->list %_1158))
       '()))))
 load)
(define load-module
  (lambda (%_1162)
    ((lambda (%_1163)
       ((lambda (%_1164)
          ((lambda ()
             (for-each
               (lambda (%_1165)
                 (putprop
                   %_1165
                   '*toplevel*
                   (native-library-binding %_1163 %_1165)))
               %_1164))))
        (native-library-binding-names %_1163)))
     (load-native-library %_1162))))
(define reverse
  (letrec ((%_1166
             (lambda (%_1168 %_1169)
               (if (null? %_1168)
                 %_1169
                 (%_1166 (cdr %_1168) (cons (car %_1168) %_1169))))))
    (lambda (%_1167) (%_1166 %_1167 '()))))
(define remove
  (lambda (%_1170 %_1171)
    (if (null? %_1171)
      '()
      (if (equal? (car %_1171) %_1170)
        (remove %_1170 (cdr %_1171))
        (cons (car %_1171) (remove %_1170 (cdr %_1171)))))))
(define append
  (letrec ((%_1172
             (lambda (%_1175 . %_1174)
               (if (null? %_1174)
                 %_1175
                 (if (null? %_1175)
                   (apply %_1172 %_1174)
                   (apply %_1172
                          (cons (append2 %_1175 (car %_1174))
                                (cdr %_1174))))))))
    (lambda %_1173
      (if (null? %_1173)
        '()
        (if (null? (cdr %_1173))
          (car %_1173)
          (apply %_1172 (cons (car %_1173) (cdr %_1173))))))))
(define map
  (letrec ((%_1176 map)
           (%_1177
             (lambda (%_1181 %_1182 %_1183 %_1184)
               (if (null? (car %_1182))
                 (if (andmap null? %_1182)
                   %_1183
                   (error 'map '"lists are not of equal length."))
                 ((lambda (%_1185 %_1186)
                    (begin
                      (if (not (null? %_1184))
                        (set-cdr! %_1184 %_1185)
                        (void))
                      (if (null? %_1183)
                        (%_1177 %_1181 %_1186 %_1185 %_1185)
                        (%_1177 %_1181 %_1186 %_1183 %_1185))))
                  (cons (apply %_1181 (%_1176 car %_1182)) '())
                  (%_1176 cdr %_1182))))))
    (lambda (%_1180 %_1179 . %_1178)
      (if (null? %_1178)
        (%_1176 %_1180 %_1179)
        (%_1177 %_1180 (cons %_1179 %_1178) '() '())))))
(define proper-list?
  (lambda (%_1187)
    ((letrec ((%_1188
                (lambda (%_1189 %_1190)
                  (if (pair? %_1189)
                    ((lambda (%_1191)
                       (if (pair? %_1191)
                         ((lambda (%_1192 %_1193)
                            (if (not (eq? %_1192 %_1193))
                              (%_1188 %_1192 %_1193)
                              '#f))
                          (cdr %_1191)
                          (cdr %_1190))
                         (null? %_1191)))
                     (cdr %_1189))
                    (null? %_1189)))))
       %_1188)
     %_1187
     %_1187)))
(define circular?
  (lambda (%_1194)
    (letrec ((%_1195
               (lambda (%_1201)
                 ((lambda (%_1202)
                    (if %_1202
                      %_1202
                      ((lambda (%_1203)
                         (if %_1203
                           %_1203
                           (if (vector? %_1201)
                             (not (zero? (vector-length %_1201)))
                             '#f)))
                       (box? %_1201))))
                  (pair? %_1201))))
             (%_1196
               (lambda (%_1204)
                 (if (pair? %_1204)
                   '2
                   (if (box? %_1204) '1 (vector-length %_1204)))))
             (%_1197
               (lambda (%_1205 %_1206)
                 (if (vector? %_1205)
                   (vector-ref %_1205 %_1206)
                   (if (box? %_1205)
                     (unbox %_1205)
                     ((if (zero? %_1206) car cdr) %_1205)))))
             (%_1198
               (lambda (%_1207)
                 ((lambda (%_1208)
                    ((letrec ((%_1209
                                (lambda (%_1210 %_1211 %_1212)
                                  (if (>= %_1211 '0)
                                    ((lambda (%_1216)
                                       (if (%_1195 %_1216)
                                         (cons %_1216 (cons %_1211 %_1212))
                                         (%_1209 %_1210 (- %_1211 '1) %_1212)))
                                     (%_1197 %_1210 %_1211))
                                    ((lambda (%_1213)
                                       (if (pair? %_1213)
                                         ((lambda (%_1214 %_1215)
                                            (%_1209
                                              (car %_1215)
                                              (- %_1214 '1)
                                              %_1215))
                                          (car %_1213)
                                          (cdr %_1213))
                                         '#f))
                                     (cdr %_1212))))))
                       %_1209)
                     %_1208
                     (- (%_1196 %_1208) '1)
                     %_1207))
                  (car %_1207))))
             (%_1199
               (lambda (%_1217 %_1218)
                 (letrec ((%_1219
                            (lambda (%_1228 %_1229)
                              ((lambda (%_1230)
                                 (if %_1230
                                   (%_1199 (%_1198 %_1228) (%_1198 %_1230))
                                   '#f))
                               (%_1198 %_1229)))))
                   (if %_1218
                     (if (not (eq? (car %_1218) (car %_1217)))
                       (%_1219 %_1217 %_1218)
                       ((letrec ((%_1220
                                   (lambda (%_1221 %_1222)
                                     ((lambda (%_1223)
                                        (if %_1223
                                          %_1223
                                          (if (if (= (cadr %_1221)
                                                     (cadr %_1222))
                                                (eq? (caddr %_1221)
                                                     (caddr %_1222))
                                                '#f)
                                            (%_1220
                                              (cddr %_1221)
                                              (cddr %_1222))
                                            ((lambda (%_1224)
                                               ((letrec ((%_1225
                                                           (lambda (%_1226)
                                                             (if %_1226
                                                               ((lambda (%_1227)
                                                                  (if %_1227
                                                                    %_1227
                                                                    (%_1225
                                                                      (%_1198
                                                                        %_1226))))
                                                                (eq? (car %_1226)
                                                                     %_1224))
                                                               (%_1219
                                                                 %_1221
                                                                 %_1222)))))
                                                  %_1225)
                                                (%_1198 (list %_1224))))
                                             (car %_1221)))))
                                      (null? (cdr %_1221))))))
                          %_1220)
                        %_1217
                        %_1218))
                     '#f)))))
      (if (%_1195 %_1194)
        ((lambda (%_1200) (%_1199 %_1200 (%_1198 %_1200)))
         (list %_1194))
        '#f))))
(define list?
  (letrec ((%_1231
             (lambda (%_1234 %_1235)
               ((lambda (%_1236)
                  (if %_1236
                    %_1236
                    ((lambda (%_1237)
                       (if %_1237
                         %_1237
                         (if (pair? %_1235)
                           ((lambda (%_1238)
                              (if %_1238
                                %_1238
                                (if (not (eq? %_1234 %_1235))
                                  (%_1231 (cdr %_1234) (cddr %_1235))
                                  '#f)))
                            (null? (cdr %_1235)))
                           '#f)))
                     (null? %_1235))))
                (null? %_1234)))))
    (lambda (%_1232)
      ((lambda (%_1233)
         (if %_1233
           %_1233
           (if (pair? %_1232)
             (%_1231 %_1232 (cdr %_1232))
             '#f)))
       (null? %_1232)))))
(define expt
  (lambda (%_1239 %_1240)
    (if (if (integer? %_1240) (= %_1239 '2) '#f)
      (ashl '1 %_1240)
      ((letrec ((%_1241
                  (lambda (%_1242 %_1243 %_1244)
                    (if (zero? %_1242)
                      %_1243
                      (%_1241
                        (quotient %_1242 '2)
                        (if (odd? %_1242) (* %_1243 %_1244) %_1243)
                        (* %_1244 %_1244))))))
         %_1241)
       %_1240
       '1
       %_1239))))
(define modpow
  (lambda (%_1245 %_1246 %_1247)
    ((lambda (%_1248)
       (if (= %_1246 '1)
         (modulo %_1245 %_1247)
         (if (even? %_1246)
           ((lambda (%_1250)
              (modulo (* %_1250 %_1250) %_1247))
            (modpow %_1245 (/ %_1246 '2) %_1247))
           ((lambda (%_1249)
              (begin
                (set! %_1249 (modulo (* %_1249 %_1249) %_1247))
                (modulo (* %_1245 %_1249) %_1247)))
            (modpow %_1245 (/ (- %_1246 '1) '2) %_1247)))))
     '0)))
(define integer?
  ((lambda (%_1251)
     (lambda (%_1252)
       ((lambda (%_1253)
          (if %_1253
            %_1253
            (if (real? %_1252) (= (round %_1252) %_1252) '#f)))
        (%_1251 %_1252))))
   integer?))
(define real?
  ((lambda (%_1254)
     (lambda (%_1255)
       (if (number? %_1255) (not (%_1254 %_1255)) '#f)))
   complex?))
(define complex? number?)
(define abs
  (lambda (%_1256)
    (if (not (real? %_1256))
      ((lambda (%_1257 %_1258)
         (sqrt (+ (* %_1257 %_1257) (* %_1258 %_1258))))
       (real-part %_1256)
       (imag-part %_1256))
      (if (< %_1256 '0) (- %_1256) %_1256))))
(define min (void))
(define max (void))
(letrec ((%_1259
           (lambda (%_1264 %_1265 %_1266 %_1267)
             (if (null? %_1266)
               (if (if %_1267 (exact? %_1265) '#f)
                 (exact->inexact %_1265)
                 %_1265)
               (if (%_1264 (car %_1266) %_1265)
                 (%_1259
                   %_1264
                   (car %_1266)
                   (cdr %_1266)
                   ((lambda (%_1268)
                      (if %_1268 %_1268 (inexact? (car %_1266))))
                    %_1267))
                 (%_1259 %_1264 %_1265 (cdr %_1266) %_1267))))))
  (begin
    (set! min
      (lambda (%_1261 . %_1260)
        (if (null? %_1260)
          %_1261
          (%_1259 < %_1261 %_1260 (inexact? %_1261)))))
    (set! max
      (lambda (%_1263 . %_1262)
        (if (null? %_1262)
          %_1263
          (%_1259 > %_1263 %_1262 (inexact? %_1263)))))))
(define negative?
  (lambda (%_1269) (< %_1269 '0)))
(define positive?
  (lambda (%_1270) (> %_1270 '0)))
(define even?
  (lambda (%_1271) (= '0 (modulo %_1271 '2))))
(define odd?
  (lambda (%_1272) (not (even? %_1272))))
(define zero? (lambda (%_1273) (= %_1273 '0)))
(define add1 (lambda (%_1274) (+ %_1274 '1)))
(define sub1 (lambda (%_1275) (- %_1275 '1)))
(define >= (void))
(define <= (void))
((lambda (%_1276 %_1277)
   (begin
     (set! <=
       (%_1276
         (lambda (%_1278 %_1279)
           ((lambda (%_1280)
              (if %_1280 %_1280 (= %_1278 %_1279)))
            (< %_1278 %_1279)))
         %_1277
         '#t))
     (set! >=
       (%_1276
         (lambda (%_1281 %_1282)
           ((lambda (%_1283)
              (if %_1283 %_1283 (= %_1281 %_1282)))
            (> %_1281 %_1282)))
         %_1277
         '#t))))
 (lambda (%_1284 %_1285 %_1286)
   (lambda %_1287
     ((letrec ((%_1288
                 (lambda (%_1289)
                   (if (null? %_1289)
                     %_1286
                     (if (null? (cdr %_1289))
                       %_1286
                       (%_1285
                         (%_1284 (car %_1289) (cadr %_1289))
                         (%_1288 (cdr %_1289))))))))
        %_1288)
      %_1287)))
 (lambda (%_1290 %_1291) (if %_1290 %_1291 '#f)))
((lambda (%_1292)
   (begin
     (set! >= (%_1292 > >=))
     (set! <= (%_1292 < <=))))
 (lambda (%_1293 %_1294)
   (lambda %_1295
     ((lambda (%_1296)
        (if %_1296
          %_1296
          ((lambda (%_1297)
             (if %_1297
               %_1297
               (if ((lambda (%_1298)
                      (if %_1298
                        %_1298
                        (%_1293 (car %_1295) (cadr %_1295))))
                    (= (car %_1295) (cadr %_1295)))
                 (apply %_1294 (cdr %_1295))
                 '#f)))
           (null? (cdr %_1295)))))
      (null? %_1295)))))
(define gcd
  (lambda %_1299
    (if (null? %_1299)
      '0
      (if (null? (cdr %_1299))
        (car %_1299)
        (_gcd (car %_1299) (cadr %_1299))))))
(define lcm
  (lambda %_1300
    (if (null? %_1300)
      '1
      (if (null? (cdr %_1300))
        (car %_1300)
        (_lcm (car %_1300) (cadr %_1300))))))
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
  (lambda %_1301
    (if (null? %_1301)
      '""
      (if (null? (cdr %_1301))
        (car %_1301)
        (apply string-append
               (_string-append (car %_1301) (cadr %_1301))
               (cddr %_1301))))))
(define char-downcase
  ((lambda (%_1302)
     ((lambda (%_1303)
        ((lambda (%_1304)
           ((lambda ()
              (lambda (%_1305)
                ((lambda (%_1306)
                   (if (if (>= %_1306 %_1302) (<= %_1306 %_1303) '#f)
                     (integer->char (+ %_1306 %_1304))
                     %_1305))
                 (char->integer %_1305))))))
         (- (char->integer '#\a) %_1302)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (%_1307)
     ((lambda (%_1308)
        ((lambda (%_1309)
           ((lambda ()
              (lambda (%_1310)
                ((lambda (%_1311)
                   (if (if (>= %_1311 %_1307) (<= %_1311 %_1308) '#f)
                     (integer->char (- %_1311 %_1309))
                     %_1310))
                 (char->integer %_1310))))))
         (- %_1307 (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (%_1312 %_1313)
    (> (char->integer %_1312) (char->integer %_1313))))
(define char<?
  (lambda (%_1314 %_1315)
    (< (char->integer %_1314) (char->integer %_1315))))
(define char=? eq?)
(define char>=?
  (lambda (%_1316 %_1317)
    ((lambda (%_1318)
       (if %_1318 %_1318 (char=? %_1316 %_1317)))
     (char>? %_1316 %_1317))))
(define char<=?
  (lambda (%_1319 %_1320)
    ((lambda (%_1321)
       (if %_1321 %_1321 (char=? %_1319 %_1320)))
     (char<? %_1319 %_1320))))
(define char-ci>?
  (lambda (%_1322 %_1323)
    (char>?
      (char-downcase %_1322)
      (char-downcase %_1323))))
(define char-ci<?
  (lambda (%_1324 %_1325)
    (char<?
      (char-downcase %_1324)
      (char-downcase %_1325))))
(define char-ci=?
  (lambda (%_1326 %_1327)
    (char=?
      (char-downcase %_1326)
      (char-downcase %_1327))))
(define char-ci>=?
  (lambda (%_1328 %_1329)
    ((lambda (%_1330)
       (if %_1330 %_1330 (char-ci=? %_1328 %_1329)))
     (char-ci>? %_1328 %_1329))))
(define char-ci<=?
  (lambda (%_1331 %_1332)
    ((lambda (%_1333)
       (if %_1333 %_1333 (char-ci=? %_1331 %_1332)))
     (char-ci<? %_1331 %_1332))))
(define char-alphabetic?
  (lambda (%_1334)
    (if (char-ci>=? %_1334 '#\a)
      (char-ci<=? %_1334 '#\z)
      '#f)))
(define char-numeric?
  (lambda (%_1335)
    (if (char-ci>=? %_1335 '#\0)
      (char-ci<=? %_1335 '#\9)
      '#f)))
(define char-whitespace?
  (lambda (%_1336)
    (if (memq %_1336 '(#\space #\tab #\newline))
      '#t
      '#f)))
(define char-upper-case?
  (lambda (%_1337)
    (if (char-alphabetic? %_1337)
      (char>? %_1337 '#\a)
      '#f)))
(define char-lower-case?
  (lambda (%_1338)
    (if (char-alphabetic? %_1338)
      (char>? %_1338 '#\Z)
      '#f)))
(define string-downcase (void))
(define string-upcase (void))
(letrec ((%_1339
           (lambda (%_1344 %_1345 %_1346 %_1347 %_1348)
             (if (< %_1347 %_1348)
               (begin
                 (string-set!
                   %_1345
                   %_1347
                   (%_1346 (string-ref %_1344 %_1347)))
                 (%_1339
                   %_1344
                   %_1345
                   %_1346
                   (+ %_1347 '1)
                   %_1348))
               %_1345))))
  (begin
    (set! string-downcase
      (lambda (%_1340)
        ((lambda (%_1341)
           (%_1339
             %_1340
             %_1341
             char-downcase
             '0
             (string-length %_1340)))
         (make-string (string-length %_1340)))))
    (set! string-upcase
      (lambda (%_1342)
        ((lambda (%_1343)
           (%_1339
             %_1342
             %_1343
             char-upcase
             '0
             (string-length %_1342)))
         (make-string (string-length %_1342)))))))
(define string=? equal?)
(define string<?
  (letrec ((%_1349
             (lambda (%_1352 %_1353)
               (if (null? %_1352)
                 (not (null? %_1353))
                 (if (null? %_1353)
                   '#f
                   ((lambda (%_1354 %_1355)
                      (if (char<? %_1354 %_1355)
                        '#t
                        (if (char>? %_1354 %_1355)
                          '#f
                          (%_1349 (cdr %_1352) (cdr %_1353)))))
                    (car %_1352)
                    (car %_1353)))))))
    (lambda (%_1350 %_1351)
      (%_1349
        (string->list %_1350)
        (string->list %_1351)))))
(define string>?
  (letrec ((%_1356
             (lambda (%_1359 %_1360)
               (if (null? %_1360)
                 (not (null? %_1359))
                 (if (null? %_1359)
                   '#f
                   ((lambda (%_1361 %_1362)
                      (if (char>? %_1361 %_1362)
                        '#t
                        (if (char<? %_1361 %_1362)
                          '#f
                          (%_1356 (cdr %_1359) (cdr %_1360)))))
                    (car %_1359)
                    (car %_1360)))))))
    (lambda (%_1357 %_1358)
      (%_1356
        (string->list %_1357)
        (string->list %_1358)))))
(define string<=?
  (lambda (%_1363 %_1364)
    ((lambda (%_1365)
       (if %_1365 %_1365 (string=? %_1363 %_1364)))
     (string<? %_1363 %_1364))))
(define string>=?
  (lambda (%_1366 %_1367)
    ((lambda (%_1368)
       (if %_1368 %_1368 (string=? %_1366 %_1367)))
     (string>? %_1366 %_1367))))
(define string-ci=?
  (lambda (%_1369 %_1370)
    (string=?
      (string-downcase %_1369)
      (string-downcase %_1370))))
(define string-ci<?
  (lambda (%_1371 %_1372)
    (string<?
      (string-downcase %_1371)
      (string-downcase %_1372))))
(define string-ci>?
  (lambda (%_1373 %_1374)
    (string>?
      (string-downcase %_1373)
      (string-downcase %_1374))))
(define string-ci>=?
  (lambda (%_1375 %_1376)
    (string>=?
      (string-downcase %_1375)
      (string-downcase %_1376))))
(define string-ci<=?
  (lambda (%_1377 %_1378)
    (string<=?
      (string-downcase %_1377)
      (string-downcase %_1378))))
(define substring
  (letrec ((%_1379
             (lambda (%_1384 %_1385 %_1386 %_1387 %_1388)
               (if (< %_1387 %_1388)
                 (begin
                   (string-set!
                     %_1385
                     %_1386
                     (string-ref %_1384 %_1387))
                   (%_1379
                     %_1384
                     %_1385
                     (+ %_1386 '1)
                     (+ %_1387 '1)
                     %_1388))
                 (void)))))
    (lambda (%_1380 %_1381 %_1382)
      ((lambda (%_1383)
         (begin
           (%_1379 %_1380 %_1383 '0 %_1381 %_1382)
           %_1383))
       (make-string (- %_1382 %_1381))))))
(define format
  (lambda (%_1390 . %_1389)
    ((lambda (%_1391)
       ((letrec ((%_1392
                   (lambda (%_1393 %_1394)
                     (if (null? %_1393)
                       (get-output-string %_1391)
                       (if (char=? (car %_1393) '#\~)
                         (if (null? (cdr %_1393))
                           (error 'format '"Incomplete escape sequence")
                           ((lambda (%_1395)
                              (if (memv %_1395 '(#\a))
                                (if (null? %_1394)
                                  (error 'format
                                         '"No value for escape sequence")
                                  (begin
                                    (display (car %_1394) %_1391)
                                    (%_1392 (cddr %_1393) (cdr %_1394))))
                                (if (memv %_1395 '(#\s))
                                  (if (null? %_1394)
                                    (error 'format
                                           '"No value for escape sequence")
                                    (begin
                                      (write (car %_1394) %_1391)
                                      (%_1392 (cddr %_1393) (cdr %_1394))))
                                  (if (memv %_1395 '(#\%))
                                    (begin
                                      (display '#\newline %_1391)
                                      (%_1392 (cddr %_1393) %_1394))
                                    (if (memv %_1395 '(#\~))
                                      (begin
                                        (display '#\~ %_1391)
                                        (%_1392 (cddr %_1393) %_1394))
                                      (error 'format
                                             '"Unrecognized escape sequence"))))))
                            (cadr %_1393)))
                         (begin
                           (display (car %_1393) %_1391)
                           (%_1392 (cdr %_1393) %_1394)))))))
          %_1392)
        (string->list %_1390)
        %_1389))
     (open-output-string))))
(define list-ref
  (lambda (%_1396 %_1397)
    (if (zero? %_1397)
      (car %_1396)
      (list-ref (cdr %_1396) (- %_1397 '1)))))
(define values
  (lambda %_1398
    (call-with-current-continuation
      (lambda (%_1399) (apply %_1399 %_1398)))))
