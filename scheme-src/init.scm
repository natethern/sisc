;; 
;; The contents of this file are subject to the Mozilla Public
;; License Version 1.1 (the "License"); you may not use this file
;; except in compliance with the License. You may obtain a copy of
;; the License at http://www.mozilla.org/MPL/
;; 
;; Software distributed under the License is distributed on an "AS
;; IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
;; implied. See the License for the specific language governing
;; rights and limitations under the License.
;; 
;; The Original Code is the Second Interpreter of Scheme Code (SISC).
;; 
;; The Initial Developer of the Original Code is Scott G. Miller.
;; Portions created by Scott G. Miller are Copyright (C) 2000-2001
;; Scott G. Miller.  All Rights Reserved.
;; 
;; Contributor(s):
;; Matthias Radestock 
;; 
;; Alternatively, the contents of this file may be used under the
;; terms of the GNU General Public License Version 2 or later (the
;; "GPL"), in which case the provisions of the GPL are applicable 
;; instead of those above.  If you wish to allow use of your 
;; version of this file only under the terms of the GPL and not to
;; allow others to use your version of this file under the MPL,
;; indicate your decision by deleting the provisions above and
;; replace them with the notice and other provisions required by
;; the GPL.  If you do not delete the provisions above, a recipient
;; may use your version of this file under either the MPL or the
;; GPL.
;;
;; SISC initialization file
;; Code from various sources, about 80% original.  If you notice
;; something you wrote, let me know.
;;;;;;

(define (for-each proc . lists)
  (if (null? lists)
      (error 'for-each "invalid number of arguments to procedure for-each")
      (if (not (null? (car lists)))
          (begin
            (apply proc (map car lists))
            (apply for-each (cons proc (map cdr lists)))))))

(define (exit) #!eof)

(define (eof-object? x) (eq? x #!eof))
;;;;;;;;; Standard Scheme functions

(define (not x) (if x #f #t))
(define eqv? eq?)
(define (newline . port)
  (apply display (cons #\newline port)))

(define map (void))
(letrec ([map1 
	  (letrec ([iter (lambda (proc head acc ls)
			   (if (null? ls) 
			       head
			       (begin
				 (set-cdr! acc (cons (proc (car ls)) ()))
				 (iter proc head (cdr acc) (cdr ls)))))])
	    
	    (lambda (proc ls)
	      (if (null? ls) 
		  ()
		  (let ([sv (cons (proc (car ls)) ())])
		    (iter proc sv sv (cdr ls))))))])
  (set! map map1))

(define (compose . rest)
  (if (null? rest)
      (lambda (x) x)
      (let ([f (car rest)]
            [g (apply compose (cdr rest))])
        (lambda (x) (f (g x))))))

(define (compose2 f g)
  (lambda (x) (f (g x))))

(define assq (void))
(define assv (void))
(define assoc (void))
(define memq (void))
(define memv (void))
(define member (void))

(letrec ([assN
	  (lambda (N obj alist)
	    (cond [(null? alist) #f]
		  [(N (caar alist) obj) (car alist)]
		  [else (assN N obj (cdr alist))]))]
	 [memN
	  (lambda (N obj list)
	    (cond [(null? list) #f]
		  [(N (car list) obj) list]
		  [else (memN N obj (cdr list))]))])
  (set! assq (lambda (obj alist) (assN eq? obj alist)))
  (set! assv (lambda (obj alist) (assN eqv? obj alist)))
  (set! assoc (lambda (obj alist) (assN equal? obj alist)))
  (set! memq (lambda (obj list) (memN eq? obj list)))
  (set! memv (lambda (obj list) (memN eqv? obj list)))
  (set! member (lambda (obj list) (memN equal? obj list))))

;c....r
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
  (lambda (ls1 ls2)
    (if (null? ls1) ls2
	(cons (car ls1) (append2 (cdr ls1) ls2)))))
(define append append2)

;;;;;;;;;;;;;;; Conversion functions

(define (list->string l)
  (letrec ([l2s
	    (lambda (l s n)
	      (if (null? l) 
		  s 
		  (begin (string-set! s n (car l))
			 (l2s (cdr l) s (+ n 1)))))])
    (l2s l (make-string (length l)) 0)))

(define string->list
  (letrec [(s2l
             (lambda (s h n)
               (if (< n 0) 
		   h
                   (s2l s (cons (string-ref s n) h) (- n 1)))))]
     (lambda (s)
        (s2l s '() (- (string-length s) 1)))))

(define list->vector
  (letrec [(l2v
             (lambda (l v n)
               (if (null? l) v
                   (begin (vector-set! v n (car l))
                          (l2v (cdr l) v (+ n 1))))))]
     (lambda (l)
       (if (not (circular-list? l))
	   (l2v l (make-vector (length l)) 0)
	   (error 'list->vector "cannot convert a circular list" l)))))

;;;;;;;;;;;;; Constructors

;(if (lookup 'list) (void)
;    (define list (lambda args args))
(define (vector . elems) (list->vector elems))
(define (string . elems) (list->string elems))

;;;;;;;;;;;;; OS Detection

(define (detect-os)
  (let ([osn (string-downcase (getprop 'os.name '*environment-variables*))])
    (if (> (string-length osn) 3)
	(cond [(equal? (substring osn 0 3) "mac") 'macos]
	      [(equal? (substring osn 0 3) "win") 'ms-dos]
	      [(equal? (substring osn 0 3) "ms-") 'ms-dos]
	      [(equal? (substring osn 0 3) "uni") 'unix]
	      [(equal? (substring osn 0 3) "lin") 'unix]
	      [(equal? (substring osn 0 4) "os/") 'os2]
	      [(equal? (substring osn 0 3) "vax") 'vax])
	'unix)))

;;;;;;;;;;;;; File functions

(define current-directory (void))
(letrec ([_cd 
	  (lambda args
	    (if (null? args) (getprop 'current-directory '*sisc*)
		(putprop 'current-directory '*sisc* (car args))))]
	 [gen-path
	  (lambda (p)
	    (if (or (absolute-path? p)
		    (and (memq (detect-os) '(ms-dos windows))
			 (> (string-length p) 1) 
			 (eq? (string-ref p 1) #\:)))
		p
		(make-path (_cd) p)))]
	 [is
	  (lambda (file type)
	    (if (eq? (file-type file) type)
		#t
		(error 'file-type "~s is not of type ~s" file type)))])
  (define *current-directory
    (lambda dir
      (if (null? dir) (_cd)
	  (let ((newpath (gen-path (car dir))))
	    (is newpath 'directory)
	    (_cd newpath)))))
  (define *open-input-file
    (let ((old-oif open-input-file))
      (lambda (file)
	(let ((file (gen-path file)))
	  (is file 'file)
	  (old-oif file)))))

  (define *open-output-file
    (let ((old-oof open-output-file))
      (lambda (file)
	(let ((file (gen-path file)))
	  (if (not (memq (file-type file) '(no-file file)))
	      (error 'open-output-file "~s points to a directory" file)
	      (old-oof file))))))

  (define *load	 
    (let ((_load load))
      (lambda (file)
	(_load (gen-path file)))))
  
  (_cd ".")
  (set! load *load)
  (set! current-directory *current-directory)
  (set! open-input-file *open-input-file)
  (set! open-output-file *open-output-file))

(define (load-module str)
  (let* ([nl (load-native-library str)]
	 [binding-names (get-native-library-binding-names nl)])
    (for-each (lambda (name)
		(putprop name '*toplevel* (get-native-library-binding nl name)))
	      binding-names)))
    
;;;;;;;;;;;;; Optimized functions
(define reverse
   (letrec [(iter 
             (lambda (ls acc)
               (if (null? ls) acc
                   (iter (cdr ls) (cons (car ls) acc)))))]
     (lambda (ls)	
       (iter ls ()))))

(define (remove elem ls)
  (cond [(null? ls) ()]
	[(equal? (car ls) elem) (remove elem (cdr ls))]
	[else
	 (cons (car ls) (remove elem (cdr ls)))]))

(define append
  (letrec ([real-append 
	    (lambda (ls1 . lses)
	      (cond [(null? lses) ls1]
		    [(null? ls1)
		     (apply real-append lses)]
		    [else (apply real-append 
				 (cons (append2 ls1 (car lses))
				       (cdr lses)))]))])
    (lambda lses
      (cond [(null? lses) ()]
	    [(null? (cdr lses)) (car lses)]
	    [else (apply real-append `(,(car lses) . ,(cdr lses)))]))))
(define map
  (letrec ([map1 map]
	   [iter
	    (lambda (proc lists head acc)
	      (if (null? (car lists)) 
		  (if (andmap null? lists)
		      head
		      (error 'map "lists are not of equal length"))
		  (let ([newres (cons (apply proc (map1 car lists)) ())]
			[rest (map1 cdr lists)])
		    (if (not (null? acc)) (set-cdr! acc newres))
		    (if (null? head)
			(iter proc rest newres newres)
			(iter proc rest head newres)))))])
    (lambda (proc ls . lses)
      (if (null? lses)
	  (map1 proc ls)
	  (iter proc (cons ls lses) () ())))))

;;Flat list circularity detection
(define (circular-list? x)
  (let lp ((x x) (lag x))
    (and (pair? x)
         (let ((x (cdr x)))
           (and (pair? x)
                (let ((x   (cdr x))
                      (lag (cdr lag)))
                  (or (eq? x lag) (lp x lag))))))))

;; Credits to Al Petrofsky for the following code, modified to support
;; boxes

;; Return #t if the object has any circularities (that is, if ordinary
;; printing of the object would not terminate).
;; Uses O(n) time.
(define (circular? obj)
  (define (pv? x)
    (or (pair? x) 
        (box? x)
        (and (vector? x) (not (zero? (vector-length x))))))
  (define (pv-length x)
    (cond [(pair? x) 2]
          [(box? x) 1]
          [else (vector-length x)]))
  (define (pv-ref x n)
    (cond [(vector? x) (vector-ref x n)]
          [(box? x) (unbox x)]
;          [(pair? (cdr x)) ((if (zero? n) car cadr) x)]
          [else ((if (zero? n) car cdr) x)]))
  ;; A path is either #f, or an odd-length list in which each even
  ;; element is a pair or vector somewhere in the object, and each odd
  ;; element is the index, in the following element, of the preceeding
  ;; element.  Next returns the path of the next pair or vector in a
  ;; depth-first right-to-left traversal.  If obj is ((a) b . #(c d
  ;; (e))), then the starting path and the successive values returned by
  ;; next are as follows:
  ;;
  ;;                                         (((a) b . #(c d (e))))
  ;;                      ((b . #(c d (e))) 1 ((a) b . #(c d (e))))
  ;;         (#(c d (e)) 1 (b . #(c d (e))) 1 ((a) b . #(c d (e))))
  ;;   ((e) 2 #(c d (e)) 1 (b . #(c d (e))) 1 ((a) b . #(c d (e))))
  ;;                                   ((a) 0 ((a) b . #(c d (e))))
  ;;                                                             #f
  (define (next path)
    (let ((head (car path)))
      (let scan ((head head) (i (- (pv-length head) 1)) (path path))
        (if (>= i 0)
            (let ((new-head (pv-ref head i)))
              (if (pv? new-head)
                  (cons new-head (cons i path))
                  (scan head (- i 1) path)))
            (let ((path (cdr path)))
              (and (pair? path)
                   (let ((i (car path)) (path (cdr path)))
                     (scan (car path) (- i 1) path))))))))
  ;; Race advances the tortoise and hare paths, with hare running twice
  ;; as fast as tortoise.  If the hare catches the tortoise, we must
  ;; determine whether we have found a circularity or just a shared
  ;; substructure.  To do this, we backtrack to the point where the hare
  ;; stepped into the tortoise's footprints.  We then send a single
  ;; runner down this subtree, comparing each node to the top of the
  ;; subtree.  If something wraps around to the top, then we have found
  ;; a cycle.  If the traversal completes, then the subtree is
  ;; cycle-free, so we step hare and tortoise past it and continue.  We
  ;; know the traversal won't get stuck in a subcycle, because if there
  ;; were one, then hare would never have managed to get back to the
  ;; top.
  (define (race tortoise hare)
    (define (advance tortoise hare)
      (let ((hare (next hare)))
        (and hare
             (race (next tortoise) (next hare)))))
    (and hare
         (if (not (eq? (car hare) (car tortoise)))
             (advance tortoise hare)
             (let unroll ((tortoise tortoise) (hare hare))
               (or (null? (cdr tortoise))
                   (if (and (= (cadr tortoise) (cadr hare))
                            (eq? (caddr tortoise) (caddr hare)))
                       (unroll (cddr tortoise) (cddr hare))
                       (let ((top (car tortoise)))
                         (let check ((path (next (list top))))
                           (if path
                               (or (eq? (car path) top)
                                   (check (next path)))
                               (advance tortoise hare))))))))))
  (and (pv? obj)
       (let ((start (list obj)))
         (race start (next start)))))

(define list? 
  (letrec [(list-h? 
            (lambda (lsp1 lsp2)
              (or (null? lsp1) (null? lsp2)
                  (and 
                   (pair? lsp2)
                   (or 
                    (null? (cdr lsp2))
                    (and (not (eq? lsp1 lsp2))
                         (list-h? (cdr lsp1) (cddr lsp2))))))))]
    (lambda (lsc)
      (or (null? lsc) (and  (pair? lsc) (list-h? lsc (cdr lsc)))))))


;;;;;;;;;;;;;; Math functions/constants
(define (expt base exponent)
  (if (and (integer? exponent) (= base 2))
      (ashl 1 exponent)
      (let loop ([rest exponent]
		 [result 1]
		 [squaring base])
	(if (zero? rest)
	    result
	    (loop (quotient rest 2)
		  (if (odd? rest)
		      (* result squaring)
		      result)
		  (* squaring squaring))))))
  
(define (modpow x y N)
  (let ((tmp 0))
    (if (= y 1) 
	(modulo x N)
	(if (even? y)
	    (let ([tmp (modpow x (/ y 2) N)])
	      (modulo (* tmp tmp) N))
	    (let ([tmp (modpow x (/ (- y 1) 2) N)])
	      (set! tmp (modulo (* tmp tmp) N))
	      (modulo (* x tmp) N))))))

(define integer?
  (let ((oldint? integer?))
    (lambda (n)
      (or (oldint? n) 
	  (and (real? n)
	       (= (round n) n))))))

(define real? 
 (let ((oldcomp? complex?))
  (lambda (n)
   (not (oldcomp? n)))))

(define complex? number?)

(define (abs num) 
  (if (not (real? num))
      (let ([a (real-part num)]
	    [b (imag-part num)])
	(sqrt (+ (* a a) (* b b))))
      (if (< num 0) (- num) num)))

(define min (void))
(define max (void))
(letrec ([_min_max 
	  (lambda (proc mv args inexact)
	    (cond [(null? args) 
		   (if (and inexact (exact? mv)) 
		       (exact->inexact mv)
		       mv)]
		  [(proc (car args) mv) 
		   (_min_max proc (car args) (cdr args)
			     (or inexact (inexact? (car args))))]
		  [else (_min_max proc mv (cdr args) inexact)]))])
  (set! min (lambda (x1 . args)
	      (if (null? args) 
                  x1
		  (_min_max < x1 args
			    (inexact? (car args))))))
  (set! max (lambda (x1 . args)
	      (if (null? args) 
                  x1
		  (_min_max > x1 args
			    (inexact? (car args)))))))

(define (negative? n) (< n 0))
(define (positive? n) (> n 0))
(define (even? n) (= 0 (modulo n 2)))
(define (odd? n) (not (even? n)))
(define (zero? n) (= n 0))
(define (add1 n) (+ n 1))
(define (sub1 n) (- n 1))

(define >= (void))
(define <= (void))
(let ([_comp_help
      (lambda (comparator chainer endstate)
	(lambda args
	  (let loop ([x args])
	    (cond [(null? x) endstate]
		  [(null? (cdr x)) endstate]
		  [else (chainer (comparator (car x) (cadr x))
				 (loop (cdr x)))]))))]
      [_and2 (lambda (x y) (and x y))])
  
  (set! <= (_comp_help (lambda (a b) (or (< a b) (= a b))) _and2 #t))
  (set! >= (_comp_help (lambda (a b) (or (> a b) (= a b))) _and2 #t)))


(let ([_?= (lambda (comparator chainer)
	     (lambda args
	       (or (null? args) 
		   (null? (cdr args))
		   (and (or (= (car args) (cadr args))
			    (comparator (car args) (cadr args)))
			(apply chainer (cdr args))))))])
  (set! >= (_?= > >=))
  (set! <= (_?= < <=)))

(define (gcd . args)
   (cond [(null? args) 0]
	 [(null? (cdr args)) (car args)]
         [else (_gcd (car args) (cadr args))]))

(define (lcm . args)
   (cond [(null? args) 1]
	 [(null? (cdr args)) (car args)]
         [else (_lcm (car args) (cadr args))]))

(max-precision 1500)
;pi
(define pi-10 (string->number "3.1415926536"))
(define pi-70
 (string->number
  "3.1415926535897932384626433832795028841971693993751058209749445923078164"))
(define pi-1000
  (string->number "3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989"))
(define pi pi-10)

; e
(define e-10 (string->number "2.7182818285"))
(define e-70
 (string->number "2.7182818284590452353602874713526624977572470936999595749669676277240766"))
(define e-1000
 (string->number "2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190115738341879307021540891499348841675092447614606680822648001684774118537423454424371075390777449920695517027618386062613313845830007520449338265602976067371132007093287091274437470472306969772093101416928368190255151086574637721112523897844250569536967707854499699679468644549059879316368892300987931277361782154249992295763514822082698951936680331825288693984964651058209392398294887933203625094431173012381970684161403970198376793206832823764648042953118023287825098194558153017567173613320698112509961818815930416903515988885193458072738667385894228792284998920868058257492796104841984443634632449684875602336248270419786232090021609902353043699418491463140934317381436405462531520961836908887070167683964243781405927145635490613031072085103837505101157477041718986106873969655212671546889570350354"))
(define e e-10)

(max-precision 32)

;;;;;;;;;;;;;; String functions

(define (string-append . args)
  (cond [(null? args) ""]
        [(null? (cdr args)) (car args)]
        [else (apply string-append (_string-append (car args) (cadr args))
	             (cddr args))]))

(define char-downcase
  (let* ((a (char->integer #\A))
         (z (char->integer #\Z))
         (lc-offset (- (char->integer #\a) a)))
    (lambda (c) 
      (let ((cv (char->integer c)))
        (if (and (>= cv a) (<= cv z))
            (integer->char (+ cv lc-offset))
            c)))))

(define char-upcase
  (let* ((a (char->integer #\a))
         (z (char->integer #\z))
         (uc-offset (- a (char->integer #\A))))
    (lambda (c) 
      (let ((cv (char->integer c)))
        (if (and (>= cv a) (<= cv z))
            (integer->char (- cv uc-offset))
            c)))))

(define (char>? c1 c2) (> (char->integer c1) (char->integer c2)))
(define (char<? c1 c2) (< (char->integer c1) (char->integer c2)))
(define char=? eq?)
(define (char>=? c1 c2) (or (char>? c1 c2) (char=? c1 c2)))
(define (char<=? c1 c2) (or (char<? c1 c2) (char=? c1 c2)))
(define (char-ci>? c1 c2) (char>? (char-downcase c1) (char-downcase c2)))
(define (char-ci<? c1 c2) (char<? (char-downcase c1) (char-downcase c2)))
(define (char-ci=? c1 c2) (char=? (char-downcase c1) (char-downcase c2)))
(define (char-ci>=? c1 c2) (or (char-ci>? c1 c2) (char-ci=? c1 c2)))
(define (char-ci<=? c1 c2) (or (char-ci<? c1 c2) (char-ci=? c1 c2)))

(define (char-alphabetic? c) (and (char-ci>=? c #\a) (char-ci<=? c #\z)))
(define (char-numeric? c) (and (char-ci>=? c #\0) (char-ci<=? c #\9)))
(define (char-whitespace? c) (if (memq c '(#\space #\tab #\newline)) #t #f))

(define (char-upper-case? c) (and (char-alphabetic? c) (char<? c #\a)))
(define (char-lower-case? c) (and (char-alphabetic? c) (char>? c #\z)))

(define string-downcase (void))
(define string-upcase (void))
(letrec ([string-map
	  (lambda (strsrc strdst proc n l)
	    (if (< n l)
		(begin 
		  (string-set! strdst n (proc (string-ref strsrc n))) 
		  (string-map strsrc strdst proc (+ n 1) l))
		strdst))])
  (set! string-downcase 
	(lambda (str)
	  (let ([newstr (make-string (string-length str))])
	    (string-map str newstr char-downcase 0 
			(string-length str)))))
  (set! string-upcase 
	(lambda (str)
	  (let ([newstr (make-string (string-length str))])
	    (string-map str newstr char-upcase 0 
			(string-length str))))))
(define string=? equal?)

(define string<?
  (letrec ([s<? (lambda (s1 s2)
		  (cond [(null? s1) (not (null? s2))]
			[(null? s2) #f]
			[else (let ([c1 (car s1)]
				    [c2 (car s2)])
				(cond [(char<? c1 c2) #t]
				      [(char>? c1 c2) #f]
				      [else (s<? (cdr s1) (cdr s2))]))]))])
    (lambda (s1 s2)
      (s<? (string->list s1) (string->list s2)))))

(define string>?
  (letrec ([s>? (lambda (s1 s2)
		  (cond [(null? s2) (not (null? s1))]
			[(null? s1) #f]
			[else (let ([c1 (car s1)]
				    [c2 (car s2)])
				(cond [(char>? c1 c2) #t]
				      [(char<? c1 c2) #f]
				      [else (s>? (cdr s1) (cdr s2))]))]))])
    (lambda (s1 s2)
      (s>? (string->list s1) (string->list s2)))))

(define (string<=? s1 s2) (or (string<? s1 s2) (string=? s1 s2)))
(define (string>=? s1 s2) (or (string>? s1 s2) (string=? s1 s2)))
(define (string-ci=? s1 s2) 
  (string=? (string-downcase s1) (string-downcase s2)))
(define (string-ci<? s1 s2)
  (string<? (string-downcase s1) (string-downcase s2)))
(define (string-ci>? s1 s2)
  (string>? (string-downcase s1) (string-downcase s2)))
(define (string-ci>=? s1 s2)
  (string>=? (string-downcase s1) (string-downcase s2)))
(define (string-ci<=? s1 s2)
  (string<=? (string-downcase s1) (string-downcase s2)))

(define substring
  (letrec ([fill-string
	    (lambda (sstr dstr n s e)
	      (if (< s e)
		  (begin
		    (string-set! dstr n (string-ref sstr s))
		    (fill-string sstr dstr (+ n 1) (+ s 1) e))))])
    (lambda (str start end)
      (let ([newstr (make-string (- end start))])
	(fill-string str newstr 0 start end)
	newstr))))

(define format
  (letrec ([make-format
	    (lambda (f-l objects sb)
	      (cond [(null? f-l) (get-output-string sb)]
		    [(eq? (car f-l) #\~)
		     (begin
		       (case (cadr f-l)
			 ((#\s) (write (car objects) sb))
			 ((#\a) (display (car objects) sb))
			 ((#\%) (display #\newline sb))
			 ((#\~) (display #\~ sb)))
		       (make-format (cddr f-l) (if (not (null? objects))
						   (cdr objects) ())
				    sb))]
		    [else (begin
			    (display (car f-l) sb)
			    (make-format (cdr f-l) objects sb))]))])
    (lambda (format-string . objects)
      (make-format (string->list format-string) 
		   objects (open-output-string)))))


;;;;;;;;;;;;;; Runtime system

;;we try to accomodate syntax-case's way of reporting errors.
;;This code is pretty horrible and should be cleaned up at some point.
(define error
  (let ((oerror error))
    (lambda args
      (let* ([location (if (and (not (null? args)) 
				(symbol? (car args)))
			   (car args)
			   #f)]
	     [message (if (not location)
			  (if (not (null? args))
			      (if (not (car args))
				  (cadr args)
				  (car args))
			      #f)
			  (if (not (null? (cdr args)))
			      (cadr args)
			      #f))]
	     [objects (if (not message) 
			  '()
			  (if (not location)
                              (if (not (null? args))
                                  (if (not (car args))
                                      (cddr args)
                                      (cdr args))
                                  (cdr args))
			      (cddr args)))])
	(if location
	    (if message
		(oerror (format "Error in ~s: ~a" location 
				(apply format (cons message objects))))
		(oerror (format "Error in ~s." location)))
	    (if message
		(if (string? message)
		    (oerror (format "Error: ~a" 
				    (apply format (cons message objects))))
		    (if (null? objects)
			(oerror message)
			(error 'error "cannot specify error arguments to a non format-string error.")))
		(oerror "Error.")))))))
	    

;;;;;;;;;;;;; Miscellaneous

(define (list-ref list n)
  (if (zero? n) (car list) (list-ref (cdr list) (- n 1))))

(define iota
  (letrec ([iota-help
	    (lambda (n h) 
	      (if (> n h)
		  ()
		  (cons n (iota-help (+ n 1) h))))])
    (lambda (n) 
      (iota-help 0 n))))


(define (values . args)
  (call-with-current-continuation
   (lambda (k) 
     (apply k args))))

