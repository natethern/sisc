(begin
  ($sc-put-cte
    'new-state
    (lambda (%_2072)
      ((lambda (%_2073)
         ((lambda (%_2074)
            (if %_2074
              (apply (lambda (%_2075)
                       '#3(syntax-object
                           '()
                           ((top)
                            #4(ribcage #1(dummy) #1(("m" top)) #1("i"))
                            #4(ribcage ())
                            #4(ribcage #1(x) #1(("m" top)) #1("i"))
                            #4(ribcage (#2(import-token *top*)) ())
                            #4(ribcage (#2(import-token *top*)) ()))))
                     %_2074)
              (syntax-error %_2073)))
          ($syntax-dispatch
            (compile-in-annotation %_2073 value)
            '(any))))
       %_2072)))
  (begin
    ($sc-put-cte
      'get-state-entry
      '(global . get-state-entry))
    (define get-state-entry
      (lambda (%_2076 %_2077)
        ((lambda (%_2078) (if %_2078 (cdr %_2078) '#f))
         (assq %_2077 %_2076)))))
  (begin
    ($sc-put-cte
      'set-state-entry
      '(global . set-state-entry))
    (define set-state-entry
      (lambda (%_2079 %_2080 %_2081)
        (if (null? %_2079)
          (list (cons %_2080 %_2081))
          (if (eq? (caar %_2079) %_2080)
            (cons (cons %_2080 %_2081) (cdr %_2079))
            (cons (car %_2079)
                  (set-state-entry (cdr %_2079) %_2080 %_2081)))))))
  (begin
    ($sc-put-cte
      'generic-modify-state-entry
      '(global . generic-modify-state-entry))
    (define generic-modify-state-entry
      (lambda (%_2082)
        (lambda (%_2083 %_2084 %_2085)
          ((lambda (%_2086)
             (set-state-entry
               %_2083
               %_2084
               (if %_2086 (%_2082 %_2086 %_2085) (list %_2085))))
           (get-state-entry %_2083 %_2084))))))
  (begin
    ($sc-put-cte
      'generic-modify-state-entry*
      '(global . generic-modify-state-entry*))
    (define generic-modify-state-entry*
      (lambda (%_2087)
        (lambda (%_2088 %_2089 %_2090)
          ((lambda (%_2091)
             (set-state-entry
               %_2088
               %_2089
               (if %_2091 (%_2087 %_2091 %_2090) %_2090)))
           (get-state-entry %_2088 %_2089))))))
  (begin
    ($sc-put-cte
      'union-state-entry*
      '(global . union-state-entry*))
    (define union-state-entry*
      (generic-modify-state-entry*
        (lambda (%_2092 %_2093) (union %_2093 %_2092)))))
  (begin
    ($sc-put-cte
      'union-state-entry
      '(global . union-state-entry))
    (define union-state-entry
      (generic-modify-state-entry
        (lambda (%_2094 %_2095)
          (if (not (memq %_2095 %_2094))
            (cons %_2095 %_2094)
            %_2094)))))
  (begin
    ($sc-put-cte 'distinct '(global . distinct))
    (define distinct
      (lambda (%_2096)
        (if (null? %_2096)
          '()
          (if (memq (car %_2096) (cdr %_2096))
            (distinct (cdr %_2096))
            (cons (car %_2096) (distinct (cdr %_2096))))))))
  (begin
    ($sc-put-cte
      'union-assoc
      '(global . union-assoc))
    (define union-assoc
      (lambda %_2097
        (if (null? %_2097)
          '()
          ((lambda (%_2098)
             ((letrec ((%_2099
                         (lambda (%_2100)
                           (if (null? %_2100)
                             '()
                             (cons (cons (car %_2100)
                                         (apply union
                                                (map (lambda (%_2101)
                                                       ((lambda (%_2102)
                                                          (if %_2102
                                                            (cdr %_2102)
                                                            '()))
                                                        (assoc (car %_2100)
                                                               %_2101)))
                                                     %_2097)))
                                   (%_2099 (cdr %_2100)))))))
                %_2099)
              %_2098))
           (distinct (map car (apply append %_2097))))))))
  (begin
    ($sc-put-cte
      'merge-states
      '(global . merge-states))
    (define merge-states union-assoc)))
(putprop 'assumptive-procedures '*opt* '())
(on-startup
  (lambda () (current-optimizer optimize_7g)))
(begin
  ($sc-put-cte
    'optimizer
    '(module
       .
       #3(interface
          #3(#3(syntax-object
                opt-analyze
                ((top)
                 #4(ribcage
                    #1(opt-analyze)
                    #1((top))
                    #1(opt-analyze_7f))))
             #3(syntax-object
                opt
                ((top) #4(ribcage #1(opt) #1((top)) #1(opt_7e))))
             #3(syntax-object
                optimize
                ((top)
                 #4(ribcage
                    #1(optimize)
                    #1((top))
                    #1(optimize_7d)))))
          optimizer_7g)))
  (begin
    (define opt-analyze_7f (void))
    (define opt_7e (void))
    (define optimize_7d (void)))
  (letrec ((%_2117
             (letrec ((%_2118
                        (lambda (%_2121 %_2122)
                          (if (null? %_2121)
                            %_2122
                            (if (memq (car %_2121) %_2122)
                              (%_2118 (cdr %_2121) %_2122)
                              (cons (car %_2121)
                                    (%_2118 (cdr %_2121) %_2122)))))))
               (lambda (%_2120 . %_2119)
                 (if (null? %_2119)
                   %_2120
                   (apply %_2117
                          (cons (%_2118 %_2120 (car %_2119)) (cdr %_2119)))))))
           (%_2116
             (lambda (%_2123)
               (if (not (pair? %_2123))
                 (if (not (vector? %_2123))
                   (not (box? %_2123))
                   '#f)
                 '#f)))
           (%_2115
             (lambda (%_2124)
               (if (pair? %_2124)
                 (if (= (length %_2124) '2)
                   (eq? (car %_2124) 'quote)
                   '#f)
                 '#f)))
           (%_2114
             (lambda (%_2125 %_2126 %_2127)
               (call-with-values
                 (lambda ()
                   (opt_7e
                     %_2126
                     (union-state-entry* %_2127 'vars %_2125)))
                 (lambda (%_2128 %_2129)
                   (values (list 'lambda %_2125 %_2128) %_2129)))))
           (%_2113
             (lambda (%_2130 %_2131 %_2132)
               ((lambda (%_2133 %_2134 %_2135)
                  ((lambda (%_2136) (values %_2134 %_2135 %_2136))
                   ((letrec ((%_2137
                               (lambda (%_2138 %_2139)
                                 (if (null? %_2138)
                                   '()
                                   (if (if %_2133
                                         (memq (car %_2138) %_2133)
                                         '#f)
                                     (begin
                                       (set! %_2134 (cons (car %_2138) %_2134))
                                       (set! %_2135 (cons (car %_2139) %_2135))
                                       (%_2137 (cdr %_2138) (cdr %_2139)))
                                     (if (%_2115 (car %_2139))
                                       (cons (cons (car %_2138) (car %_2139))
                                             (%_2137
                                               (cdr %_2138)
                                               (cdr %_2139)))
                                       (begin
                                         (set! %_2134
                                           (cons (car %_2138) %_2134))
                                         (set! %_2135
                                           (cons (car %_2139) %_2135))
                                         (%_2137
                                           (cdr %_2138)
                                           (cdr %_2139)))))))))
                      %_2137)
                    %_2130
                    %_2131)))
                (get-state-entry %_2132 'set-vars)
                '()
                '())))
           (%_2112
             (lambda (%_2140 %_2141 %_2142 %_2143)
               (call-with-values
                 (lambda () (%_2113 %_2140 %_2141 %_2143))
                 (lambda (%_2144 %_2145 %_2146)
                   (call-with-values
                     (lambda ()
                       (opt_7e
                         %_2142
                         (if (null? %_2146)
                           %_2143
                           (union-state-entry* %_2143 'constant-prop %_2146))))
                     (lambda (%_2147 %_2148)
                       (values
                         (if (null? %_2144)
                           %_2147
                           (list 'letrec (map list %_2144 %_2145) %_2147))
                         %_2148)))))))
           (%_2111
             (lambda (%_2149 %_2150 %_2151 %_2152)
               (call-with-values
                 (lambda () (%_2113 %_2149 %_2150 %_2152))
                 (lambda (%_2153 %_2154 %_2155)
                   (call-with-values
                     (lambda ()
                       (opt_7e
                         %_2151
                         (if (null? %_2155)
                           %_2152
                           (union-state-entry* %_2152 'constant-prop %_2155))))
                     (lambda (%_2156 %_2157)
                       (values
                         (if (null? %_2153)
                           %_2156
                           (cons (list 'lambda %_2153 %_2156) %_2154))
                         %_2157)))))))
           (%_2110
             (lambda (%_2158 %_2159)
               ((lambda (%_2160)
                  ((lambda (%_2161)
                     (if %_2161
                       ((lambda (%_2162) (values (cdr %_2162) '()))
                        %_2161)
                       (values %_2158 '())))
                   (if %_2160 (assq %_2158 %_2160) '#f)))
                (get-state-entry %_2159 'constant-prop))))
           (%_2109
             (lambda (%_2163 %_2164 %_2165 %_2166)
               ((letrec ((%_2167
                           (lambda (%_2168)
                             ((lambda (%_2169)
                                (if %_2169
                                  (apply (lambda (%_2202)
                                           (values
                                             (if %_2202 %_2164 %_2165)
                                             '()))
                                         %_2169)
                                  ((lambda (%_2170)
                                     (if (if %_2170
                                           (apply (lambda (%_2196)
                                                    (memq 'not
                                                          (getprop
                                                            'assumptive-procedures
                                                            '*opt*)))
                                                  %_2170)
                                           '#f)
                                       (apply (lambda (%_2184)
                                                (values
                                                  ((lambda (%_2193
                                                            %_2194
                                                            %_2195)
                                                     (cons 'if
                                                           (cons %_2193
                                                                 (cons %_2194
                                                                       (cons %_2195
                                                                             '())))))
                                                   %_2184
                                                   %_2165
                                                   %_2164)
                                                  '((new-assumptions not))))
                                              %_2170)
                                       ((lambda (%_2171)
                                          (if %_2171
                                            (apply (lambda (%_2172)
                                                     (values
                                                       ((lambda (%_2181
                                                                 %_2182
                                                                 %_2183)
                                                          (cons 'if
                                                                (cons %_2181
                                                                      (cons %_2182
                                                                            (cons %_2183
                                                                                  '())))))
                                                        %_2172
                                                        %_2164
                                                        %_2165)
                                                       '()))
                                                   %_2171)
                                            (error 'match
                                                   '"Unmatched datum: ~s"
                                                   %_2168)))
                                        (sexp-dispatch %_2168 'any))))
                                   (sexp-dispatch
                                     %_2168
                                     '(#2(atom not) any)))))
                              (sexp-dispatch %_2168 '(#2(atom quote) any))))))
                  %_2167)
                %_2163)))
           (%_2108 '(+ - / * not))
           (%_2107
             (lambda (%_2208 %_2209 %_2210)
               (if (if (symbol? %_2208)
                     (if (memq %_2208
                               (getprop 'assumptive-procedures '*opt*))
                       (andmap %_2115 %_2209)
                       '#f)
                     '#f)
                 (values
                   (list 'quote (eval (cons %_2208 %_2209)))
                   (merge-states
                     %_2210
                     (list (list 'new-assumptions %_2208))))
                 (values (cons %_2208 %_2209) '()))))
           (%_2106
             (letrec ((%_2211
                        (lambda (%_2216 . %_2215)
                          (if (null? %_2215)
                            ((letrec ((%_2241
                                        (lambda (%_2242)
                                          ((lambda (%_2243)
                                             (if %_2243
                                               (apply (lambda (%_2251)
                                                        (apply %_2211 %_2251))
                                                      %_2243)
                                               ((lambda (%_2244)
                                                  (if %_2244
                                                    (apply (lambda (%_2245)
                                                             (list %_2245))
                                                           %_2244)
                                                    (error 'match
                                                           '"Unmatched datum: ~s"
                                                           %_2242)))
                                                (sexp-dispatch %_2242 'any))))
                                           (sexp-dispatch
                                             %_2242
                                             '(#2(atom begin) . each-any))))))
                               %_2241)
                             %_2216)
                            ((letrec ((%_2217
                                        (lambda (%_2218)
                                          ((lambda (%_2219)
                                             (if %_2219
                                               (apply (lambda (%_2235)
                                                        (apply %_2211 %_2215))
                                                      %_2219)
                                               ((lambda (%_2220)
                                                  (if %_2220
                                                    (apply (lambda (%_2228)
                                                             ((lambda (%_2234)
                                                                (append
                                                                  %_2234
                                                                  (apply %_2211
                                                                         %_2215)))
                                                              (apply %_2211
                                                                     %_2228)))
                                                           %_2220)
                                                    ((lambda (%_2221)
                                                       (if %_2221
                                                         (apply (lambda (%_2222)
                                                                  (cons %_2222
                                                                        (apply %_2211
                                                                               %_2215)))
                                                                %_2221)
                                                         (error 'match
                                                                '"Unmatched datum: ~s"
                                                                %_2218)))
                                                     (sexp-dispatch
                                                       %_2218
                                                       'any))))
                                                (sexp-dispatch
                                                  %_2218
                                                  '(#2(atom begin)
                                                    .
                                                    each-any)))))
                                           (sexp-dispatch
                                             %_2218
                                             '(#2(atom quote) any))))))
                               %_2217)
                             %_2216)))))
               (lambda (%_2213 . %_2212)
                 (if (null? %_2212)
                   %_2213
                   ((lambda (%_2214)
                      (if (if (pair? %_2214) (= (length %_2214) '1) '#f)
                        (car %_2214)
                        (cons 'begin %_2214)))
                    (apply %_2211 %_2213 %_2212))))))
           (%_2105
             (lambda (%_2257 %_2258 %_2259)
               (values (apply %_2106 (cons %_2257 %_2258)) '())))
           (%_2104
             (lambda (%_2260 %_2261 %_2262)
               (values (list 'set! %_2260 %_2261) '())))
           (%_2103
             (lambda (%_2263)
               ((letrec ((%_2264
                           (lambda (%_2265)
                             ((lambda (%_2266)
                                (if %_2266
                                  (apply (lambda (%_2420) '()) %_2266)
                                  ((lambda (%_2267)
                                     (if (if %_2267
                                           (apply (lambda (%_2414)
                                                    (symbol? %_2414))
                                                  %_2267)
                                           '#f)
                                       (apply (lambda (%_2408) '()) %_2267)
                                       ((lambda (%_2270)
                                          (if %_2270
                                            (apply (lambda (%_2392 %_2393)
                                                     (call-with-values
                                                       (lambda ()
                                                         (((lambda (%_2396)
                                                             (letrec ((%_2397
                                                                        (lambda (%_2398)
                                                                          (if (null? %_2398)
                                                                            (values
                                                                              '())
                                                                            (call-with-values
                                                                              (lambda ()
                                                                                (%_2397
                                                                                  (cdr %_2398)))
                                                                              (lambda (%_2399)
                                                                                (call-with-values
                                                                                  (lambda ()
                                                                                    (%_2396
                                                                                      (car %_2398)))
                                                                                  (lambda (%_2400)
                                                                                    (values
                                                                                      (cons %_2400
                                                                                            %_2399))))))))))
                                                               %_2397))
                                                           %_2264)
                                                          %_2393))
                                                       (lambda (%_2401)
                                                         (call-with-values
                                                           (lambda ()
                                                             (%_2264 %_2392))
                                                           (lambda (%_2402)
                                                             (merge-states
                                                               %_2402
                                                               (apply merge-states
                                                                      %_2401)))))))
                                                   %_2270)
                                            ((lambda (%_2273)
                                               (if %_2273
                                                 (apply (lambda (%_2375
                                                                 %_2376
                                                                 %_2377)
                                                          (call-with-values
                                                            (lambda ()
                                                              (((lambda (%_2380)
                                                                  (letrec ((%_2381
                                                                             (lambda (%_2382)
                                                                               (if (null? %_2382)
                                                                                 (values
                                                                                   '())
                                                                                 (call-with-values
                                                                                   (lambda ()
                                                                                     (%_2381
                                                                                       (cdr %_2382)))
                                                                                   (lambda (%_2383)
                                                                                     (call-with-values
                                                                                       (lambda ()
                                                                                         (%_2380
                                                                                           (car %_2382)))
                                                                                       (lambda (%_2384)
                                                                                         (values
                                                                                           (cons %_2384
                                                                                                 %_2383))))))))))
                                                                    %_2381))
                                                                %_2264)
                                                               %_2377))
                                                            (lambda (%_2385)
                                                              (call-with-values
                                                                (lambda ()
                                                                  (%_2264
                                                                    %_2376))
                                                                (lambda (%_2386)
                                                                  (merge-states
                                                                    %_2386
                                                                    (apply merge-states
                                                                           %_2385)))))))
                                                        %_2273)
                                                 ((lambda (%_2276)
                                                    (if %_2276
                                                      (apply (lambda (%_2358
                                                                      %_2359
                                                                      %_2360)
                                                               (call-with-values
                                                                 (lambda ()
                                                                   (%_2264
                                                                     %_2360))
                                                                 (lambda (%_2361)
                                                                   (call-with-values
                                                                     (lambda ()
                                                                       (((lambda (%_2364)
                                                                           (letrec ((%_2365
                                                                                      (lambda (%_2366)
                                                                                        (if (null? %_2366)
                                                                                          (values
                                                                                            '())
                                                                                          (call-with-values
                                                                                            (lambda ()
                                                                                              (%_2365
                                                                                                (cdr %_2366)))
                                                                                            (lambda (%_2367)
                                                                                              (call-with-values
                                                                                                (lambda ()
                                                                                                  (%_2364
                                                                                                    (car %_2366)))
                                                                                                (lambda (%_2368)
                                                                                                  (values
                                                                                                    (cons %_2368
                                                                                                          %_2367))))))))))
                                                                             %_2365))
                                                                         %_2264)
                                                                        %_2359))
                                                                     (lambda (%_2369)
                                                                       (merge-states
                                                                         (apply merge-states
                                                                                %_2369)
                                                                         %_2361))))))
                                                             %_2276)
                                                      ((lambda (%_2278)
                                                         (if %_2278
                                                           (apply (lambda (%_2350
                                                                           %_2351)
                                                                    (call-with-values
                                                                      (lambda ()
                                                                        (%_2264
                                                                          %_2351))
                                                                      (lambda (%_2352)
                                                                        %_2352)))
                                                                  %_2278)
                                                           ((lambda (%_2280)
                                                              (if %_2280
                                                                (apply (lambda (%_2342
                                                                                %_2343)
                                                                         (call-with-values
                                                                           (lambda ()
                                                                             (%_2264
                                                                               %_2343))
                                                                           (lambda (%_2344)
                                                                             (union-state-entry
                                                                               %_2344
                                                                               'set-vars
                                                                               %_2342))))
                                                                       %_2280)
                                                                ((lambda (%_2282)
                                                                   (if %_2282
                                                                     (apply (lambda (%_2334
                                                                                     %_2335)
                                                                              (call-with-values
                                                                                (lambda ()
                                                                                  (%_2264
                                                                                    %_2335))
                                                                                (lambda (%_2336)
                                                                                  %_2336)))
                                                                            %_2282)
                                                                     ((lambda (%_2286)
                                                                        (if %_2286
                                                                          (apply (lambda (%_2323
                                                                                          %_2324
                                                                                          %_2325)
                                                                                   (call-with-values
                                                                                     (lambda ()
                                                                                       (%_2264
                                                                                         %_2325))
                                                                                     (lambda (%_2326)
                                                                                       (call-with-values
                                                                                         (lambda ()
                                                                                           (%_2264
                                                                                             %_2324))
                                                                                         (lambda (%_2327)
                                                                                           (call-with-values
                                                                                             (lambda ()
                                                                                               (%_2264
                                                                                                 %_2323))
                                                                                             (lambda (%_2328)
                                                                                               (merge-states
                                                                                                 %_2328
                                                                                                 %_2327
                                                                                                 %_2326))))))))
                                                                                 %_2286)
                                                                          ((lambda (%_2288)
                                                                             (if %_2288
                                                                               (apply (lambda (%_2315
                                                                                               %_2316)
                                                                                        (call-with-values
                                                                                          (lambda ()
                                                                                            (%_2264
                                                                                              %_2315))
                                                                                          (lambda (%_2317)
                                                                                            %_2317)))
                                                                                      %_2288)
                                                                               ((lambda (%_2291)
                                                                                  (if %_2291
                                                                                    (apply (lambda (%_2299
                                                                                                    %_2300)
                                                                                             (call-with-values
                                                                                               (lambda ()
                                                                                                 (((lambda (%_2303)
                                                                                                     (letrec ((%_2304
                                                                                                                (lambda (%_2305)
                                                                                                                  (if (null? %_2305)
                                                                                                                    (values
                                                                                                                      '())
                                                                                                                    (call-with-values
                                                                                                                      (lambda ()
                                                                                                                        (%_2304
                                                                                                                          (cdr %_2305)))
                                                                                                                      (lambda (%_2306)
                                                                                                                        (call-with-values
                                                                                                                          (lambda ()
                                                                                                                            (%_2303
                                                                                                                              (car %_2305)))
                                                                                                                          (lambda (%_2307)
                                                                                                                            (values
                                                                                                                              (cons %_2307
                                                                                                                                    %_2306))))))))))
                                                                                                       %_2304))
                                                                                                   %_2264)
                                                                                                  %_2300))
                                                                                               (lambda (%_2308)
                                                                                                 (call-with-values
                                                                                                   (lambda ()
                                                                                                     (%_2264
                                                                                                       %_2299))
                                                                                                   (lambda (%_2309)
                                                                                                     (merge-states
                                                                                                       %_2309
                                                                                                       (apply merge-states
                                                                                                              %_2308)))))))
                                                                                           %_2291)
                                                                                    ((lambda (%_2292)
                                                                                       (if %_2292
                                                                                         (apply (lambda (%_2293)
                                                                                                  '())
                                                                                                %_2292)
                                                                                         (error 'match
                                                                                                '"Unmatched datum: ~s"
                                                                                                %_2265)))
                                                                                     (sexp-dispatch
                                                                                       %_2265
                                                                                       'any))))
                                                                                (sexp-dispatch
                                                                                  %_2265
                                                                                  '(any .
                                                                                        each-any)))))
                                                                           (sexp-dispatch
                                                                             %_2265
                                                                             '(#2(atom
                                                                                  compile-in-annotations)
                                                                               any
                                                                               any)))))
                                                                      (sexp-dispatch
                                                                        %_2265
                                                                        '(#2(atom
                                                                             if)
                                                                          any
                                                                          any
                                                                          any)))))
                                                                 (sexp-dispatch
                                                                   %_2265
                                                                   '(#2(atom
                                                                        define)
                                                                     any
                                                                     any)))))
                                                            (sexp-dispatch
                                                              %_2265
                                                              '(#2(atom set!)
                                                                any
                                                                any)))))
                                                       (sexp-dispatch
                                                         %_2265
                                                         '(#2(atom lambda)
                                                           any
                                                           any)))))
                                                  (sexp-dispatch
                                                    %_2265
                                                    '(#2(atom letrec)
                                                      #3(each (any any) 2)
                                                      any)))))
                                             (sexp-dispatch
                                               %_2265
                                               '((#2(atom lambda) any any)
                                                 .
                                                 each-any)))))
                                        (sexp-dispatch
                                          %_2265
                                          '(#2(atom begin) any . each-any)))))
                                   (sexp-dispatch %_2265 'any))))
                              (sexp-dispatch %_2265 '(#2(atom quote) any))))))
                  %_2264)
                %_2263))))
    (begin
      (begin
        (set! opt-analyze_7f
          (lambda (%_2426)
            ((lambda (%_2427)
               ((lambda (%_2428)
                  ((lambda (%_2429)
                     ((lambda () (list %_2428 %_2429))))
                   (map optimize_7d %_2428)))
                (map sc-expand %_2427)))
             (with-input-from-file
               %_2426
               (lambda ()
                 ((letrec ((%_2430
                             (lambda (%_2431)
                               (if (eof-object? %_2431)
                                 '()
                                 (cons %_2431 (%_2430 (read-code)))))))
                    %_2430)
                  (read-code)))))))
        (set! opt_7e
          (lambda (%_2432 %_2433)
            ((letrec ((%_2434
                        (lambda (%_2435)
                          ((lambda (%_2436)
                             (if %_2436
                               (apply (lambda (%_2632)
                                        (values
                                          ((lambda (%_2639)
                                             (cons 'quote (cons %_2639 '())))
                                           %_2632)
                                          '()))
                                      %_2436)
                               ((lambda (%_2437)
                                  (if (if %_2437
                                        (apply (lambda (%_2626)
                                                 (symbol? %_2626))
                                               %_2437)
                                        '#f)
                                    (apply (lambda (%_2620)
                                             (%_2110 %_2620 %_2433))
                                           %_2437)
                                    ((lambda (%_2440)
                                       (if %_2440
                                         (apply (lambda (%_2596 %_2597)
                                                  (call-with-values
                                                    (lambda ()
                                                      (((lambda (%_2602)
                                                          (letrec ((%_2603
                                                                     (lambda (%_2604)
                                                                       (if (null? %_2604)
                                                                         (values
                                                                           '()
                                                                           '())
                                                                         (call-with-values
                                                                           (lambda ()
                                                                             (%_2603
                                                                               (cdr %_2604)))
                                                                           (lambda (%_2605
                                                                                    %_2606)
                                                                             (call-with-values
                                                                               (lambda ()
                                                                                 (%_2602
                                                                                   (car %_2604)))
                                                                               (lambda (%_2607
                                                                                        %_2608)
                                                                                 (values
                                                                                   (cons %_2607
                                                                                         %_2605)
                                                                                   (cons %_2608
                                                                                         %_2606))))))))))
                                                            %_2603))
                                                        %_2434)
                                                       %_2597))
                                                    (lambda (%_2609 %_2610)
                                                      (call-with-values
                                                        (lambda ()
                                                          (%_2434 %_2596))
                                                        (lambda (%_2611 %_2612)
                                                          (call-with-values
                                                            (lambda ()
                                                              (%_2105
                                                                %_2611
                                                                %_2609
                                                                %_2433))
                                                            (lambda (%_2618
                                                                     %_2619)
                                                              (values
                                                                %_2618
                                                                (merge-states
                                                                  %_2619
                                                                  %_2612
                                                                  (apply merge-states
                                                                         %_2610))))))))))
                                                %_2440)
                                         ((lambda (%_2442)
                                            (if %_2442
                                              (apply (lambda (%_2573
                                                              %_2574
                                                              %_2575)
                                                       (call-with-values
                                                         (lambda ()
                                                           (((lambda (%_2580)
                                                               (letrec ((%_2581
                                                                          (lambda (%_2582)
                                                                            (if (null? %_2582)
                                                                              (values
                                                                                '()
                                                                                '())
                                                                              (call-with-values
                                                                                (lambda ()
                                                                                  (%_2581
                                                                                    (cdr %_2582)))
                                                                                (lambda (%_2583
                                                                                         %_2584)
                                                                                  (call-with-values
                                                                                    (lambda ()
                                                                                      (%_2580
                                                                                        (car %_2582)))
                                                                                    (lambda (%_2585
                                                                                             %_2586)
                                                                                      (values
                                                                                        (cons %_2585
                                                                                              %_2583)
                                                                                        (cons %_2586
                                                                                              %_2584))))))))))
                                                                 %_2581))
                                                             %_2434)
                                                            %_2575))
                                                         (lambda (%_2587
                                                                  %_2588)
                                                           (call-with-values
                                                             (lambda ()
                                                               (%_2111
                                                                 %_2573
                                                                 %_2587
                                                                 %_2574
                                                                 %_2433))
                                                             (lambda (%_2594
                                                                      %_2595)
                                                               (values
                                                                 %_2594
                                                                 (merge-states
                                                                   %_2595
                                                                   (apply merge-states
                                                                          %_2588))))))))
                                                     %_2442)
                                              ((lambda (%_2444)
                                                 (if %_2444
                                                   (apply (lambda (%_2550
                                                                   %_2551
                                                                   %_2552)
                                                            (call-with-values
                                                              (lambda ()
                                                                (((lambda (%_2557)
                                                                    (letrec ((%_2558
                                                                               (lambda (%_2559)
                                                                                 (if (null? %_2559)
                                                                                   (values
                                                                                     '()
                                                                                     '())
                                                                                   (call-with-values
                                                                                     (lambda ()
                                                                                       (%_2558
                                                                                         (cdr %_2559)))
                                                                                     (lambda (%_2560
                                                                                              %_2561)
                                                                                       (call-with-values
                                                                                         (lambda ()
                                                                                           (%_2557
                                                                                             (car %_2559)))
                                                                                         (lambda (%_2562
                                                                                                  %_2563)
                                                                                           (values
                                                                                             (cons %_2562
                                                                                                   %_2560)
                                                                                             (cons %_2563
                                                                                                   %_2561))))))))))
                                                                      %_2558))
                                                                  %_2434)
                                                                 %_2551))
                                                              (lambda (%_2564
                                                                       %_2565)
                                                                (call-with-values
                                                                  (lambda ()
                                                                    (%_2112
                                                                      %_2550
                                                                      %_2564
                                                                      %_2552
                                                                      %_2433))
                                                                  (lambda (%_2571
                                                                           %_2572)
                                                                    (values
                                                                      %_2571
                                                                      (merge-states
                                                                        %_2572
                                                                        (apply merge-states
                                                                               %_2565))))))))
                                                          %_2444)
                                                   ((lambda (%_2445)
                                                      (if %_2445
                                                        (apply (lambda (%_2543
                                                                        %_2544)
                                                                 (%_2114
                                                                   %_2543
                                                                   %_2544
                                                                   %_2433))
                                                               %_2445)
                                                        ((lambda (%_2447)
                                                           (if %_2447
                                                             (apply (lambda (%_2532
                                                                             %_2533)
                                                                      (call-with-values
                                                                        (lambda ()
                                                                          (%_2434
                                                                            %_2533))
                                                                        (lambda (%_2534
                                                                                 %_2535)
                                                                          (call-with-values
                                                                            (lambda ()
                                                                              (%_2104
                                                                                %_2532
                                                                                %_2534
                                                                                %_2433))
                                                                            (lambda (%_2541
                                                                                     %_2542)
                                                                              (values
                                                                                %_2541
                                                                                (merge-states
                                                                                  %_2542
                                                                                  %_2535)))))))
                                                                    %_2447)
                                                             ((lambda (%_2449)
                                                                (if %_2449
                                                                  (apply (lambda (%_2519
                                                                                  %_2520)
                                                                           (call-with-values
                                                                             (lambda ()
                                                                               (%_2434
                                                                                 %_2520))
                                                                             (lambda (%_2521
                                                                                      %_2522)
                                                                               (values
                                                                                 ((lambda (%_2530
                                                                                           %_2531)
                                                                                    (cons 'define
                                                                                          (cons %_2530
                                                                                                (cons %_2531
                                                                                                      '()))))
                                                                                  %_2519
                                                                                  %_2521)
                                                                                 %_2522))))
                                                                         %_2449)
                                                                  ((lambda (%_2453)
                                                                     (if %_2453
                                                                       (apply (lambda (%_2503
                                                                                       %_2504
                                                                                       %_2505)
                                                                                (call-with-values
                                                                                  (lambda ()
                                                                                    (%_2434
                                                                                      %_2505))
                                                                                  (lambda (%_2506
                                                                                           %_2507)
                                                                                    (call-with-values
                                                                                      (lambda ()
                                                                                        (%_2434
                                                                                          %_2504))
                                                                                      (lambda (%_2508
                                                                                               %_2509)
                                                                                        (call-with-values
                                                                                          (lambda ()
                                                                                            (%_2434
                                                                                              %_2503))
                                                                                          (lambda (%_2510
                                                                                                   %_2511)
                                                                                            (call-with-values
                                                                                              (lambda ()
                                                                                                (%_2109
                                                                                                  %_2510
                                                                                                  %_2508
                                                                                                  %_2506
                                                                                                  %_2433))
                                                                                              (lambda (%_2517
                                                                                                       %_2518)
                                                                                                (values
                                                                                                  %_2517
                                                                                                  (merge-states
                                                                                                    %_2518
                                                                                                    %_2511
                                                                                                    %_2509
                                                                                                    %_2507)))))))))))
                                                                              %_2453)
                                                                       ((lambda (%_2455)
                                                                          (if %_2455
                                                                            (apply (lambda (%_2490
                                                                                            %_2491)
                                                                                     (call-with-values
                                                                                       (lambda ()
                                                                                         (%_2434
                                                                                           %_2490))
                                                                                       (lambda (%_2492
                                                                                                %_2493)
                                                                                         (values
                                                                                           ((lambda (%_2501
                                                                                                     %_2502)
                                                                                              (cons 'compile-in-annotations
                                                                                                    (cons %_2501
                                                                                                          (cons %_2502
                                                                                                                '()))))
                                                                                            %_2492
                                                                                            %_2491)
                                                                                           %_2493))))
                                                                                   %_2455)
                                                                            ((lambda (%_2458)
                                                                               (if %_2458
                                                                                 (apply (lambda (%_2466
                                                                                                 %_2467)
                                                                                          (call-with-values
                                                                                            (lambda ()
                                                                                              (((lambda (%_2472)
                                                                                                  (letrec ((%_2473
                                                                                                             (lambda (%_2474)
                                                                                                               (if (null? %_2474)
                                                                                                                 (values
                                                                                                                   '()
                                                                                                                   '())
                                                                                                                 (call-with-values
                                                                                                                   (lambda ()
                                                                                                                     (%_2473
                                                                                                                       (cdr %_2474)))
                                                                                                                   (lambda (%_2475
                                                                                                                            %_2476)
                                                                                                                     (call-with-values
                                                                                                                       (lambda ()
                                                                                                                         (%_2472
                                                                                                                           (car %_2474)))
                                                                                                                       (lambda (%_2477
                                                                                                                                %_2478)
                                                                                                                         (values
                                                                                                                           (cons %_2477
                                                                                                                                 %_2475)
                                                                                                                           (cons %_2478
                                                                                                                                 %_2476))))))))))
                                                                                                    %_2473))
                                                                                                %_2434)
                                                                                               %_2467))
                                                                                            (lambda (%_2479
                                                                                                     %_2480)
                                                                                              (call-with-values
                                                                                                (lambda ()
                                                                                                  (%_2434
                                                                                                    %_2466))
                                                                                                (lambda (%_2481
                                                                                                         %_2482)
                                                                                                  (call-with-values
                                                                                                    (lambda ()
                                                                                                      (%_2107
                                                                                                        %_2481
                                                                                                        %_2479
                                                                                                        %_2433))
                                                                                                    (lambda (%_2488
                                                                                                             %_2489)
                                                                                                      (values
                                                                                                        %_2488
                                                                                                        (merge-states
                                                                                                          %_2489
                                                                                                          %_2482
                                                                                                          (apply merge-states
                                                                                                                 %_2480))))))))))
                                                                                        %_2458)
                                                                                 ((lambda (%_2459)
                                                                                    (if %_2459
                                                                                      (apply (lambda (%_2460)
                                                                                               (values
                                                                                                 %_2460
                                                                                                 '()))
                                                                                             %_2459)
                                                                                      (error 'match
                                                                                             '"Unmatched datum: ~s"
                                                                                             %_2435)))
                                                                                  (sexp-dispatch
                                                                                    %_2435
                                                                                    'any))))
                                                                             (sexp-dispatch
                                                                               %_2435
                                                                               '(any .
                                                                                     each-any)))))
                                                                        (sexp-dispatch
                                                                          %_2435
                                                                          '(#2(atom
                                                                               compile-in-annotations)
                                                                            any
                                                                            any)))))
                                                                   (sexp-dispatch
                                                                     %_2435
                                                                     '(#2(atom
                                                                          if)
                                                                       any
                                                                       any
                                                                       any)))))
                                                              (sexp-dispatch
                                                                %_2435
                                                                '(#2(atom
                                                                     define)
                                                                  any
                                                                  any)))))
                                                         (sexp-dispatch
                                                           %_2435
                                                           '(#2(atom set!)
                                                             any
                                                             any)))))
                                                    (sexp-dispatch
                                                      %_2435
                                                      '(#2(atom lambda)
                                                        any
                                                        any)))))
                                               (sexp-dispatch
                                                 %_2435
                                                 '(#2(atom letrec)
                                                   #3(each (any any) 2)
                                                   any)))))
                                          (sexp-dispatch
                                            %_2435
                                            '((#2(atom lambda) any any)
                                              .
                                              each-any)))))
                                     (sexp-dispatch
                                       %_2435
                                       '(#2(atom begin) any . each-any)))))
                                (sexp-dispatch %_2435 'any))))
                           (sexp-dispatch %_2435 '(#2(atom quote) any))))))
               %_2434)
             %_2432)))
        (set! optimize_7d
          (lambda (%_2640)
            (call-with-values
              (lambda () (opt_7e %_2640 (%_2103 %_2640)))
              (lambda (%_2641 %_2642) %_2641)))))
      (void)))
  (void))
