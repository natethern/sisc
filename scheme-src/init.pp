(define eqv?
  (lambda (x y)
    ((lambda (t)
       (if t
         t
         (if ((lambda (t)
                (if t t (if (inexact? x) (inexact? y) '#f)))
              (if (exact? x) (exact? y) '#f))
           (= x y)
           '#f)))
     (eq? x y))))
(define not (lambda (x) (if x #f #t)))
(define eof-object? (lambda (x) (eq? x #!eof)))
(define for-each
  (lambda (proc ls)
    (if (null? ls)
      (void)
      (begin (proc (car ls)) (for-each proc (cdr ls))))))
(define exit (lambda () '#!eof))
(define newline
  (lambda port
    (apply display (cons '#\newline port))))
(define list (lambda args args))
(define map
  (lambda (proc ls)
    (if (null? ls)
      '()
      (cons (proc (car ls)) (map proc (cdr ls))))))
(define compose
  (lambda (f g) (lambda (x) (f (g x)))))
(define _assn
  (lambda (n obj alist)
    (if (null? alist)
      '#f
      (if (n (caar alist) obj)
        (car alist)
        (_assn n obj (cdr alist))))))
(define _memn
  (lambda (n obj list)
    (if (null? list)
      '#f
      (if (n (car list) obj)
        list
        (_memn n obj (cdr list))))))
(define assq
  (lambda (obj alist) (_assn eq? obj alist)))
(define assv
  (lambda (obj alist) (_assn eqv? obj alist)))
(define assoc
  (lambda (obj alist) (_assn equal? obj alist)))
(define memq
  (lambda (obj list) (_memn eq? obj list)))
(define memv
  (lambda (obj list) (_memn eqv? obj list)))
(define member
  (lambda (obj list) (_memn equal? obj list)))
(define cadr (compose car cdr))
(define cdar (compose cdr car))
(define cddr (compose cdr cdr))
(define caar (compose car car))
(define caaar (compose car caar))
(define caadr (compose car cadr))
(define cadar (compose car cdar))
(define caddr (compose car cddr))
(define cdaar (compose cdr caar))
(define cdadr (compose cdr cadr))
(define cddar (compose cdr cdar))
(define cdddr (compose cdr cddr))
(define caaaar (compose car caaar))
(define caaadr (compose car caadr))
(define caadar (compose car cadar))
(define caaddr (compose car caddr))
(define cadaar (compose car cdaar))
(define cadadr (compose car cdadr))
(define caddar (compose car cddar))
(define cadddr (compose car cdddr))
(define cdaaar (compose cdr caaar))
(define cdaadr (compose cdr caadr))
(define cdadar (compose cdr cadar))
(define cdaddr (compose cdr caddr))
(define cddaar (compose cdr cdaar))
(define cddadr (compose cdr cdadr))
(define cdddar (compose cdr cddar))
(define cddddr (compose cdr cdddr))
(define append
  (lambda (ls1 ls2)
    (if (null? ls1)
      ls2
      (cons (car ls1) (append (cdr ls1) ls2)))))
(define first car)
(define second cadr)
(define third caddr)
(define rest cdr)
(define set-first! set-car!)
(define set-rest! set-cdr!)
(define list->string
  ((lambda (l2s)
     ((lambda (%_15)
        (begin
          (set! l2s %_15)
          ((lambda ()
             (lambda (l) (l2s l (make-string (length l)) '0))))))
      (lambda (l s n)
        (if (null? l)
          s
          (begin
            (string-set! s n (car l))
            (l2s (cdr l) s (+ n '1)))))))
   '#f))
(define string->list
  ((lambda (s2l)
     ((lambda (%_16)
        (begin
          (set! s2l %_16)
          ((lambda ()
             (lambda (s) (s2l s '() (- (string-length s) '1)))))))
      (lambda (s h n)
        (if (< n '0)
          h
          (s2l s (cons (string-ref s n) h) (- n '1))))))
   '#f))
(define list->vector
  ((lambda (l2v)
     ((lambda (%_17)
        (begin
          (set! l2v %_17)
          ((lambda ()
             (lambda (l) (l2v l (make-vector (length l)) '0))))))
      (lambda (l v n)
        (if (null? l)
          v
          (begin
            (vector-set! v n (car l))
            (l2v (cdr l) v (+ n '1)))))))
   '#f))
(define vector
  (lambda elems (list->vector elems)))
(define string
  (lambda elems (list->string elems)))
(define _cd
  (_string-append (getprop 'user.dir '*environment-variables*) 
                 (getprop 'file.separator '*environment-variables*)))
(define current-directory (void))
(define _cd "")
(define _separator "/")
((lambda (gen-path is)
   ((lambda (%_19 %_20)
      (begin
        (set! gen-path %_19)
        (set! is %_20)
        ((lambda ()
           ((lambda (*load
                     *open-output-file
                     *open-input-file
                     *current-directory)
              (begin
                (set! *load
                  ((lambda (_load)
                     (lambda (file) (_load (gen-path _cd file))))
                   load))
                (set! *open-output-file
                  ((lambda (old-oof)
                     (lambda (file)
                       ((lambda (file)
                          (if (not (memq (file-type file) '(no-file file)))
                            (error 'open-output-file
                                   '"~s points to a directory"
                                   file)
                            (old-oof file)))
                        (gen-path (current-directory) file))))
                   open-output-file))
                (set! *open-input-file
                  ((lambda (old-oif)
                     (lambda (file)
                       ((lambda (file)
                          (begin (is file 'file) (old-oif file)))
                        (gen-path (current-directory) file))))
                   open-input-file))
                (set! *current-directory
                  (lambda dir
                    (if (null? dir)
                      _cd
                      ((lambda (newpath)
                         (begin
                           (is newpath 'directory)
                           (if (not (eq? (string-ref
                                           newpath
                                           (- (string-length newpath) '1))
                                         _separator))
                             (set! newpath (string-append newpath _separator))
                             (void))
                           (set! _cd newpath)))
                       (gen-path _cd (car dir))))))
                (begin
                  (set! load *load)
                  (set! current-directory *current-directory)
                  (set! open-input-file *open-input-file)
                  (set! open-output-file *open-output-file))))
            #f
            #f
            #f
            #f)))))
    (lambda (base file)
      ((lambda (sl)
         (if (eq? (car sl) (string-ref _separator '0))
           file
           (string-append base file)))
       (string->list file)))
    (lambda (file type)
      (if (eq? (file-type file) type)
        '#t
        (error 'file-type
               '"~s is not of type ~s"
               file
               type)))))
 '#f
 '#f)
(define with-input-from-file
  (lambda (str thunk)
    ((lambda (cip fip)
       (dynamic-wind
         void
         (lambda ()
           (begin (current-input-port fip) (thunk)))
         (lambda () (current-input-port cip))))
     (current-input-port)
     (open-input-file str))))
(define with-output-to-file
  (lambda (str thunk)
    ((lambda (cop fop)
       (dynamic-wind
         void
         (lambda ()
           (begin (current-output-port fop) (thunk)))
         (lambda () (current-output-port cop))))
     (current-output-port)
     (open-output-file str))))
(define call-with-input-file
  (lambda (file proc)
    ((lambda (port)
       ((lambda (result)
          ((lambda ()
             (begin (close-input-port port) result))))
        (proc port)))
     (open-input-file file))))
(define call-with-output-file
  (lambda (file proc)
    ((lambda (port)
       ((lambda (result)
          ((lambda ()
             (begin (close-output-port port) result))))
        (proc port)))
     (open-output-file file))))
(define reverse
  ((lambda (iter)
     ((lambda (%_21)
        (begin
          (set! iter %_21)
          ((lambda () (lambda (ls) (iter ls '()))))))
      (lambda (ls acc)
        (if (null? ls)
          acc
          (iter (cdr ls) (cons (car ls) acc))))))
   '#f))
(define remove
  (lambda (elem ls)
    (if (null? ls)
      '()
      (if (equal? (car ls) elem)
        (remove elem (cdr ls))
        (cons (car ls) (remove elem (cdr ls)))))))
(define append
  ((lambda (real-append)
     ((lambda (%_22)
        (begin
          (set! real-append %_22)
          ((lambda ()
             (lambda lses
               (if (null? lses)
                 '()
                 (if (null? (cdr lses))
                   (car lses)
                   (apply real-append
                          (cons (car lses)
                                (cons (cadr lses) (cddr lses)))))))))))
      (lambda (ls1 ls2 . lses)
        (if (null? ls1)
          (if (null? lses)
            ls2
            (apply append (cons ls2 lses)))
          (cons (car ls1)
                (apply real-append
                       (cons (cdr ls1) (cons ls2 lses))))))))
   '#f))
(define map
  ((lambda (map1 iter)
     (begin
       (set! map1
         (lambda (proc ls)
           (if (null? ls)
             '()
             (cons (proc (car ls)) (map1 proc (cdr ls))))))
       (set! iter
         (lambda (proc lists head acc)
           (if (null? (car lists))
             (if (andmap null? lists)
               head
               (error 'map '"lists are not of equal length"))
             ((lambda (newres rest)
                (begin
                  (if (not (null? acc))
                    (set-cdr! acc newres)
                    (void))
                  (if (null? head)
                    (iter proc rest newres newres)
                    (iter proc rest head newres))))
              (cons (apply proc (map1 car lists)) '())
              (map1 cdr lists)))))
       (lambda (proc ls . lses)
         (iter proc (cons ls lses) '() '()))))
   '#f
   '#f))
(define list?
  ((lambda (circular?)
     ((lambda (%_23)
        (begin
          (set! circular? %_23)
          ((lambda ()
             (lambda (lsc)
               (if (pair? lsc)
                 (if (not (circular? lsc '()))
                   ((lambda (t) (if t t (null? (cdr lsc))))
                    (list? (cdr lsc)))
                   '#f)
                 '#f))))))
      (lambda (ls backlist)
        (if (pair? ls)
          ((lambda (t)
             (if t t (circular? (cdr ls) (cons ls backlist))))
           (memq ls backlist))
          '#f))))
   '#f))
(define expt
  (lambda (base exponent)
    (if (if (integer? exponent) (= base '2) '#f)
      (ashl '1 exponent)
      (((lambda (loop)
          ((lambda (%_24)
             (begin (set! loop %_24) ((lambda () loop))))
           (lambda (rest result squaring)
             (if (zero? rest)
               result
               (loop (quotient rest '2)
                     (if (odd? rest) (* result squaring) result)
                     (* squaring squaring))))))
        '#f)
       exponent
       '1
       base))))
(define modpow
  (lambda (x y n)
    ((lambda (tmp)
       (if (= y '1)
         (modulo x n)
         (if (even? y)
           ((lambda (tmp) (modulo (* tmp tmp) n))
            (modpow x (/ y '2) n))
           ((lambda (tmp)
              (begin
                (set! tmp (modulo (* tmp tmp) n))
                (modulo (* x tmp) n)))
            (modpow x (/ (- y '1) '2) n)))))
     '0)))
(define integer?
  ((lambda (oldint?)
     (lambda (n)
       ((lambda (t)
          (if t t (if (real? n) (= (round n) n) '#f)))
        (oldint? n))))
   integer?))
(define real?
  ((lambda (oldcomp?)
     (lambda (n) (not (oldcomp? n))))
   complex?))
(define complex? number?)
(define abs
  (lambda (num)
    (if (not (real? num))
      ((lambda (a b) (sqrt (+ (* a a) (* b b))))
       (real-part num)
       (imag-part num))
      (if (< num '0) (- num) num))))
(define _min_max
  (lambda (proc mv args inexact)
    (if (null? args)
      (if (if inexact (exact? mv) '#f)
        (exact->inexact mv)
        mv)
      (if (proc (car args) mv)
        (_min_max
          proc
          (car args)
          (cdr args)
          ((lambda (t) (if t t (inexact? (car args))))
           inexact))
        (_min_max proc mv (cdr args) inexact)))))
(define min
  (lambda args
    (if (null? args)
      '0
      (_min_max
        <
        (car args)
        (cdr args)
        (inexact? (car args))))))
(define max
  (lambda args
    (if (null? args)
      '0
      (_min_max
        >
        (car args)
        (cdr args)
        (inexact? (car args))))))
(define negative? (lambda (n) (< n '0)))
(define positive? (lambda (n) (> n '0)))
(define even? (lambda (n) (= '0 (modulo n '2))))
(define odd? (lambda (n) (not (even? n))))
(define zero? (lambda (n) (= n '0)))
(define _comp_help
  (lambda (comparator chainer endstate)
    (lambda args
      (((lambda (loop)
          ((lambda (%_25)
             (begin (set! loop %_25) ((lambda () loop))))
           (lambda (x)
             (if (null? x)
               endstate
               (if (null? (cdr x))
                 endstate
                 (chainer
                   (comparator (car x) (cadr x))
                   (loop (cdr x))))))))
        '#f)
       args))))
(define _and2 (lambda (x y) (if x y '#f)))
(define <=
  (_comp_help
    (lambda (a b)
      ((lambda (t) (if t t (= a b))) (< a b)))
    _and2
    '#t))
(define >=
  (_comp_help
    (lambda (a b)
      ((lambda (t) (if t t (= a b))) (> a b)))
    _and2
    '#t))
(define gcd
  (lambda args
    (if (null? args)
      '0
      (if (null? (cdr args))
        (car args)
        (_gcd (car args) (cadr args))))))
(define lcm
  (lambda args
    (if (null? args)
      '1
      (if (null? (cdr args))
        (car args)
        (_lcm (car args) (cadr args))))))
(define pi-10 '3.1415926536)
(define pi-70
  '3.1415926535897932384626433832795028841971693993751058209749445923078164)
(define pi-1000
  '3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989)
(define pi pi-10)
(define e-10 '2.7182818285)
(define e-70
  '2.7182818284590452353602874713526624977572470936999595749669676277240766)
(define e-1000
  '2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190115738341879307021540891499348841675092447614606680822648001684774118537423454424371075390777449920695517027618386062613313845830007520449338265602976067371132007093287091274437470472306969772093101416928368190255151086574637721112523897844250569536967707854499699679468644549059879316368892300987931277361782154249992295763514822082698951936680331825288693984964651058209392398294887933203625094431173012381970684161403970198376793206832823764648042953118023287825098194558153017567173613320698112509961818815930416903515988885193458072738667385894228792284998920868058257492796104841984443634632449684875602336248270419786232090021609902353043699418491463140934317381436405462531520961836908887070167683964243781405927145635490613031072085103837505101157477041718986106873969655212671546889570350354)
(define e e-10)
(define string-append
  (lambda args
    (if (null? args)
      '""
      (if (null? (cdr args))
        (car args)
        (apply string-append
               (_string-append (car args) (cadr args))
               (cddr args))))))
(define char-downcase
  ((lambda (a)
     ((lambda (z)
        ((lambda (lc-offset)
           ((lambda ()
              (lambda (c)
                ((lambda (cv)
                   (if (if (>= cv a) (<= cv z) '#f)
                     (integer->char (+ cv lc-offset))
                     c))
                 (char->integer c))))))
         (- (char->integer '#\a) a)))
      (char->integer '#\Z)))
   (char->integer '#\A)))
(define char-upcase
  ((lambda (a)
     ((lambda (z)
        ((lambda (uc-offset)
           ((lambda ()
              (lambda (c)
                ((lambda (cv)
                   (if (if (>= cv a) (<= cv z) '#f)
                     (integer->char (- cv uc-offset))
                     c))
                 (char->integer c))))))
         (- a (char->integer '#\A))))
      (char->integer '#\z)))
   (char->integer '#\a)))
(define char>?
  (lambda (c1 c2)
    (> (char->integer c1) (char->integer c2))))
(define char<?
  (lambda (c1 c2)
    (< (char->integer c1) (char->integer c2))))
(define char=? eq?)
(define char>=?
  (lambda (c1 c2)
    ((lambda (t) (if t t (char=? c1 c2)))
     (char>? c1 c2))))
(define char<=?
  (lambda (c1 c2)
    ((lambda (t) (if t t (char=? c1 c2)))
     (char<? c1 c2))))
(define char-ci>?
  (lambda (c1 c2)
    (char>? (char-downcase c1) (char-downcase c2))))
(define char-ci<?
  (lambda (c1 c2)
    (char<? (char-downcase c1) (char-downcase c2))))
(define char-ci=?
  (lambda (c1 c2)
    (char=? (char-downcase c1) (char-downcase c2))))
(define char-ci>=?
  (lambda (c1 c2)
    ((lambda (t) (if t t (char-ci=? c1 c2)))
     (char-ci>? c1 c2))))
(define char-ci<=?
  (lambda (c1 c2)
    ((lambda (t) (if t t (char-ci=? c1 c2)))
     (char-ci<? c1 c2))))
(define char-alphabetic?
  (lambda (c)
    (if (char-ci>=? c '#\a) (char-ci<=? c '#\z) '#f)))
(define char-numeric?
  (lambda (c)
    (if (char-ci>=? c '#\0) (char-ci<=? c '#\9) '#f)))
(define char-whitespace?
  (lambda (c)
    (if (memq c '(#\space #\tab #\newline)) '#t '#f)))
(define char-upper-case?
  (lambda (c)
    (if (char-alphabetic? c) (char<? '#\a) '#f)))
(define char-lower-case?
  (lambda (c)
    (if (char-alphabetic? c) (char>? '#\z) '#f)))
(define string-downcase
  (lambda (s)
    (list->string
      (map char-downcase (string->list s)))))
(define string-upcase
  (lambda (s)
    (list->string (map char-upcase (string->list s)))))
(define string=? equal?)
(define string<?
  ((lambda (s<?)
     ((lambda (%_26)
        (begin
          (set! s<? %_26)
          ((lambda ()
             (lambda (s1 s2)
               (s<? (string->list s1) (string->list s2)))))))
      (lambda (s1 s2)
        (if (null? s1)
          '#f
          (if (null? s2)
            '#t
            ((lambda (c1 c2)
               (if (char<? c1 c2)
                 '#t
                 (if (char=? c1 c2) '#f (s<? (cdr s1) (cdr s2)))))
             (car s1)
             (car s2)))))))
   '#f))
(define string>?
  ((lambda (s>?)
     ((lambda (%_27)
        (begin
          (set! s>? %_27)
          ((lambda ()
             (lambda (s1 s2)
               (s>? (string->list s1) (string->list s2)))))))
      (lambda (s1 s2)
        (if (null? s1)
          '#f
          (if (null? s2)
            '#t
            ((lambda (c1 c2)
               (if (char>? c1 c2)
                 '#t
                 (if (char=? c1 c2) '#f (s>? (cdr s1) (cdr s2)))))
             (car s1)
             (car s2)))))))
   '#f))
(define string<=?
  (lambda (s1 s2)
    ((lambda (t) (if t t (string=? s1 s2)))
     (string<? s1 s2))))
(define string>=?
  (lambda (s1 s2)
    ((lambda (t) (if t t (string=? s1 s2)))
     (string>? s1 s2))))
(define string-ci=?
  (lambda (s1 s2)
    (string=?
      (string-downcase s1)
      (string-downcase s2))))
(define string-ci<?
  (lambda (s1 s2)
    (string<?
      (string-downcase s1)
      (string-downcase s2))))
(define string-ci>?
  (lambda (s1 s2)
    (string>?
      (string-downcase s1)
      (string-downcase s2))))
(define string-ci>=?
  (lambda (s1 s2)
    (string>=?
      (string-downcase s1)
      (string-downcase s2))))
(define string-ci<=?
  (lambda (s1 s2)
    (string<=?
      (string-downcase s1)
      (string-downcase s2))))
(define substring
  ((lambda (fill-string)
     ((lambda (%_28)
        (begin
          (set! fill-string %_28)
          ((lambda ()
             (lambda (str start end)
               ((lambda (newstr)
                  (begin
                    (fill-string str newstr '0 start end)
                    newstr))
                (make-string (- end start))))))))
      (lambda (sstr dstr n s e)
        (if (< s e)
          (begin
            (string-set! dstr n (string-ref sstr s))
            (fill-string sstr dstr (+ n '1) (+ s '1) e))
          (void)))))
   '#f))
(define format
  ((lambda (make-format)
     ((lambda (%_29)
        (begin
          (set! make-format %_29)
          ((lambda ()
             (lambda (format-string . objects)
               (make-format
                 (string->list format-string)
                 objects
                 (open-output-string)))))))
      (lambda (f-l objects sb)
        (if (null? f-l)
          (get-output-string sb)
          (if (eq? (car f-l) '#\~)
            (begin
              ((lambda (x)
                 (if (memv x '(#\s))
                   (write (car objects) sb)
                   ((lambda (x)
                      (if (memv x '(#\a))
                        (display (car objects) sb)
                        ((lambda (x)
                           (if (memv x '(#\a))
                             (write-char (car objects) sb)
                             ((lambda (x)
                                (if (memv x '(#\%))
                                  (display '#\newline sb)
                                  (if (memv x '(#\~))
                                    (display '#\~ sb)
                                    (void))))
                              x)))
                         x)))
                    x)))
               (cadr f-l))
              (make-format
                (cddr f-l)
                (if (not (null? objects)) (cdr objects) '())
                sb))
            (begin
              (display (car f-l) sb)
              (make-format (cdr f-l) objects sb)))))))
   '#f))
(define error
  ((lambda (oerror)
     (lambda args
       ((lambda (location)
          ((lambda (message)
             ((lambda (objects)
                ((lambda ()
                   (if location
                     (if message
                       (oerror
                         (format
                           '"Error in ~s: ~a"
                           location
                           (apply format (cons message objects))))
                       (oerror (format '"Error in ~s." location)))
                     (if message
                       (oerror
                         (format
                           '"Error: ~a"
                           (apply format (cons message objects))))
                       (oerror '"Error."))))))
              (if (not message)
                '#f
                (if (not location) (cdr args) (cddr args)))))
           (if (not location)
             (if (not (null? args)) (car args) '#f)
             (if (not (null? (cdr args))) (cadr args) '#f))))
        (if (if (not (null? args)) (symbol? (car args)) '#f)
          (car args)
          '#f))))
   error))
(define list-ref
  (lambda (list n)
    (if (zero? n)
      (car list)
      (list-ref (cdr list) (- n '1)))))
