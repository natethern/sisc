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

;;turn on syntax expansion and optimization

(define current-optimizer (_make-parameter (lambda (x) x)))
  
;; source to eval:
#;(set! eval (let ([old-eval eval]
		 [apply apply]
		 [current-cte current-cte]
		 [sc-expand sc-expand]
		 [interaction-environment interaction-environment])
	     (lambda (x . env)
	       (if (and (pair? x) (equal? (car x) "noexpand"))
		   (apply old-eval (cadr x) env)
		   (let* ([optimizer (current-optimizer)]
			  [old-ie (apply interaction-environment env)]
			  [source (optimizer
				   (sc-expand x '(e) '(e)))])
		     (interaction-environment old-ie)
		     (apply old-eval source env))))))

(set! eval
  ((lambda (|interaction-environment_fglBCWfWB|
            |sc-expand_fg_EEtfWB|
            |apply_fgjMIzeWB|
            |old-eval_fgZPK6eWB|)
     (lambda (|x_fg1uyQgWB| . |env_fgHxAngWB|)
       (if (if (pair? |x_fg1uyQgWB|)
             (equal? (car |x_fg1uyQgWB|) '"noexpand")
             '#f)
         (|apply_fgjMIzeWB|
           |old-eval_fgZPK6eWB|
           (cadr |x_fg1uyQgWB|)
           |env_fgHxAngWB|)
         ((lambda (|optimizer_fgnqwhhWB|)
            ((lambda (|old-ie_fgJmuKhWB|)
               ((lambda (|source_fg3jsbiWB|)
                  (begin
                    (|interaction-environment_fglBCWfWB|
                      |old-ie_fgJmuKhWB|)
                    (|apply_fgjMIzeWB|
                      |old-eval_fgZPK6eWB|
                      |source_fg3jsbiWB|
                      |env_fgHxAngWB|)))
                (|optimizer_fgnqwhhWB|
                  (|sc-expand_fg_EEtfWB| |x_fg1uyQgWB| '(e) '(e)))))
             (|apply_fgjMIzeWB|
               |interaction-environment_fglBCWfWB|
               |env_fgHxAngWB|)))
          (current-optimizer)))))
   interaction-environment
   sc-expand
   apply
   eval))
   
;; Parameter Support, compatible with SRFI-39

(define (make-parameter value . converter)
  (cond [(null? converter) 
         (_make-parameter value)]
	    [(null? (cdr converter))
	     (let ([param (_make-parameter value)]
		       [converter (car converter)])
	      (lambda arg
	        (if (null? arg)
		    (param)
		    (param (converter (car arg))))))]
	    [else (error 'make-parameter "too many arguments.")]))

(define (make-config-parameter name value . converter)
    (cond [(null? converter) 
	   (_make-config-parameter name value)]
	  [(null? (cdr converter))
	   (let ([param (_make-config-parameter name value)]
		 [converter (car converter)])
	     (lambda arg
	       (if (null? arg)
		   (param)
		   (param (converter (car arg))))))]
	  [else (error 'make-config-parameter "too many arguments.")]))

(define (make-native-parameter name . converter)
    (cond [(null? converter) 
	   (_make-native-parameter name)]
	  [(null? (cdr converter))
	   (let ([param (_make-native-parameter name)]
		 [converter (car converter)])
	     (lambda arg
	       (if (null? arg)
		   (param)
		   (param (converter (car arg))))))]
	  [else (error 'make-config-parameter "too many arguments.")]))

(define-syntax parameterize
  (lambda (expr)
    (syntax-case expr ()
      [(_ () . body)
       (syntax (let () . body))]
      [(_ ((param-name new-value) ...) . body)
       (with-syntax ([(tmps ...) 
                      (generate-temporaries (syntax (param-name ...)))])
         (syntax 
           (let ([old-values #f]
                 [tmps new-value] ...)
             (dynamic-wind 
               (lambda () 
                 (set! old-values (list (param-name) ...))
                 (param-name tmps) ...)
               (lambda () . body)
               (lambda () 
	             (for-each (lambda (p l) (p l))
		               (list param-name ...)
		               old-values))))))])))

;; native parameters

(define current-input-port      (make-native-parameter "inputPort"))
(define current-output-port     (make-native-parameter "outputPort"))
(define current-class-path      (make-native-parameter "classPath"))
(define case-sensitive          (make-native-parameter "caseSensitive"))
(define print-shared            (make-native-parameter "printShared"))
(define vector-length-prefixing (make-native-parameter "vectorLengthPrefixing"))
(define emit-debugging-symbols  (make-native-parameter "emitDebuggingSymbols"))
(define emit-annotations        (make-native-parameter "emitAnnotations"))
(define character-set           (make-native-parameter "characterSet"))

(if (equal? (getenv "sisc.debugging") "true")
    (begin
      (emit-annotations #t)
      (emit-debugging-symbols #t)))

;;;;;;;;;; hooks ;;;;;;;;;;

(define (hook-items proc)
  (annotation proc 'items))
  
(define (set-hook-items! proc items)
  (set-annotation! proc 'items items))

(define (make-hook default)
  (let ([items (list default)])
    (define (hook key item)
      (cond [(assq key (cdr items))
             => (lambda (x) (set-cdr! x item))]
            [else
              (set-cdr! items (cons (cons key item)
                                    (cdr items)))]))
    (set-hook-items! hook items)
    hook))

(define (invoke-hook hook . args)
  (let ([all-items (hook-items hook)])
    (let loop ([items (cdr all-items)])
      (if (null? items)
          (apply (car all-items) args)
          (apply (cdar items)
                 (lambda args (loop (cdr items))) args)))))

;;;;;;;;;;;;;;;; error handling ;;;;;;;;;;;;;;;

;; Most of the code here is for providing SRFI-23 style error
;; producing, which is then applied into SISC's failure-continuation
;; model.

(define (make-exception error error-k)
  `((error-continuation . ,error-k) . ,error))
(define (exception? e)
  (and (pair? e) (pair? (car e)) (eq? (caar e) 'error-continuation)))
(define (exception-continuation exception)
  (cdar exception))
(define (exception-error exception)
  (cdr exception))

(define (throw error-or-exception . error-k)
  (call-with-failure-continuation
      (lambda (fk)
        (cond
          [(pair? error-or-exception)
           (if (null? error-k)
               (call-with-current-continuation
                   (lambda (k) (fk error-or-exception k)))
               (fk error-or-exception (car error-k)))]
          [(and (exception? error-or-exception)
                (null? error-k))
           (fk (exception-error error-or-exception)
               (exception-continuation error-or-exception))]
          [else
            (error 'throw "expected error-record or exception, got ~a"
                   error-or-exception)]))))

(define (error . args)
  (throw (apply make-error args)))

(define (make-nested-error error-record parent-record . parent-k)
  `((parent . ,(if (null? parent-k)
                   parent-record
                   (make-exception parent-record (car parent-k))))
    . ,error-record))

(define (make-error . args)
  (let ([ops (print-shared #t)]
        [error-record '()])
    ;;Location
    (cond [(null? args) (void)]
          [(and (not (null? (cdr args)))
                (symbol? (car args)))
           (set! error-record (cons (cons 'location (car args)) 
                                    error-record))
           (set! args (cdr args))]
          [(not (car args))
           (set! args (cdr args))])
      
    ;;Message/Value
    (let ([message (and (not (null? args))
                        (car args))])
      (if message (set! args (cdr args)))
      (if (null? args)
          (if message (set! error-record (cons `(message . ,message)
                                               error-record)))
          (if (string? message)
              (set! error-record
                (cons `(message . ,(apply format message args))
                      error-record))
              (error 'error "cannot specify arguments to a non format-string error."))))
    (print-shared ops)
    error-record))
    

(define (error-location error-record)
  (cond [(and (pair? error-record) (assq 'location error-record))
         => cdr]
        [else #f]))

(define (error-message error-record)
  (cond [(and (pair? error-record) (assq 'message error-record))
         => cdr]
        [else #f]))

(define (error-parent error-record)
  (cond [(and (pair? error-record) (assq 'parent error-record))
         => cdr]
        [else #f]))

(define (error-parent-error error-record)
  (let ([error-parent (error-parent error-record)])
    (and error-parent (exception-error error-parent))))

(define (error-parent-continuation error-record)
  (let ([error-parent (error-parent error-record)])
    (and error-parent (exception-continuation error-parent))))

(define (make-error-message location message)
  (if location
      (if message
          (format "Error in ~a: ~a" location message)
          (format "Error in ~a." location))
      (if message
          (format "Error: ~a" message)
          "Error.")))

(define (display-error e)
  (display (make-error-message (error-location e)
                               (error-message e)))
  (newline))

(define print-exception-stack-trace-hook
  (make-hook (lambda (e)
               (display "printing of stack trace not supported\n"))))

(define (print-exception-stack-trace e)
  (invoke-hook print-exception-stack-trace-hook e))

(define (print-exception e . st)
  (let ([error (exception-error e)])
    (display-error error)
    (if (or (null? st) (car st))
        (invoke-hook print-exception-stack-trace-hook e))
    (let ([p (and (pair? error) (error-parent error))])
      (if p 
          (begin (display "Caused by ")
                 (apply print-exception p st))))))

(define (format format-string . objects)
  (let ((buffer (open-output-string)))
    (let loop ((format-list (string->list format-string))
               (objects objects))
      (cond ((null? format-list) (get-output-string buffer))
            ((char=? (car format-list) #\~)
             (if (null? (cdr format-list))
                 (error 'format "Incomplete escape sequence")
                 (case (cadr format-list)
                   ((#\a)
                    (if (null? objects)
                        (error 'format "No value for escape sequence")
                        (begin
                          (display (car objects) buffer)
                          (loop (cddr format-list) (cdr objects)))))
                   ((#\s)
                    (if (null? objects)
                        (error 'format "No value for escape sequence")
                        (begin
                          (write (car objects) buffer)
                          (loop (cddr format-list) (cdr objects)))))
                   ((#\%)
                    (display #\newline buffer)
                    (loop (cddr format-list) objects))
                   ((#\~)
                    (display #\~ buffer)
                    (loop (cddr format-list) objects))
                   (else
                     (error 'format "Unrecognized escape sequence")))))
            (else (display (car format-list) buffer)                        
                  (loop (cdr format-list) objects))))))

;Loads an already expanded file (ie does not run it through the expander)
(define (load-expanded file)
  (call-with-input-file file
    (lambda (port) 
      (do ((x (read port) (read port)))
          ((eof-object? x))
        (eval (list "noexpand" x))))))

(add-file-handler 'sce load-expanded)
(add-file-handler 'pp load-expanded)

(define call/fc call-with-failure-continuation)
(define with/fc with-failure-continuation)
(define call/cc call-with-current-continuation)

;; This code is based on Richard Kelsey and Jonathan Rees' version of
;; dynamic-wind in Scheme48 (http://s48.org). It has been heavily
;; modified to account for SISC's lack of structures, make exception
;; handling work properly and conform with SRFI18 requirements with
;; regard to call/cc behaviour.
(define dynamic-wind #f)
(define unload-dynamic-wind #f)
(let ((original-call/cc call-with-current-continuation))
  ;;the dynamic wind stack
  (define get-dynamic-point current-wind)
  (define set-dynamic-point! current-wind)
  ;;a point in the dynamic wind stack
  ;;-this would be easier if we had structures
  (define (make-point depth in out parent)
    (vector depth in out parent))
  (define (point-depth point) (vector-ref point 0))
  (define (point-in point) (vector-ref point 1))
  (define (point-out point) (vector-ref point 2))
  (define (point-parent point) (vector-ref point 3))
  ;;
  (define (travel-between-points here target)
    (cond ((eq? here target)
           (set-dynamic-point! here))
          ((or (not here)               ; HERE has reached the root.
               (and target
                    (< (point-depth here) (point-depth target))))
           (travel-between-points here (point-parent target))
           ((point-in target))
           (set-dynamic-point! target))
          (else
            (set-dynamic-point! (point-parent here))
            ((point-out here))
            (travel-between-points (point-parent here) target))))
  ;;wind-safe call/cc
  (define (dynwind-call/cc proc)
    (original-call/cc
     (lambda (cont)
       (let* ((point (get-dynamic-point))
              (safe-k
               (lambda results
                 (travel-between-points (get-dynamic-point) point)
                 (apply cont results))))
         (set-annotation! safe-k 'unsafe-cont cont)
         (proc safe-k)))))
  (define (dynamic-wind/impl in body out)
    (let* ((here (get-dynamic-point))
           (point (make-point (if here (+ (point-depth here) 1) 1)
                              in out here)))
      (in)
      (set-dynamic-point! point)
      (call-with-values
          (lambda () (with/fc (lambda (m e)
                                (set-dynamic-point! here)
                                (out)
                                (throw m e))
                       body))
   	    (lambda results
	      (set-dynamic-point! here)
	      (out)
	      (apply values results)))))
  (define dynamic-wind-loader
    (lambda (in body out)
      (putprop 'call-with-current-continuation dynwind-call/cc)
      (putprop 'call/cc dynwind-call/cc)
      (putprop 'dynamic-wind dynamic-wind/impl)
      (dynamic-wind in body out)))
  ;;finally, the install the dynamic-wind hooks
  (set! dynamic-wind dynamic-wind-loader)
  (set! unload-dynamic-wind
    (lambda ()
      (putprop 'call-with-current-continuation original-call/cc)
      (putprop 'call/cc original-call/cc)
      (putprop 'dynamic-wind dynamic-wind-loader))))

;;;; "ratize.scm" Convert number to rational number (ported from SLIB)

(define rationalize (void))
(letrec ([rational:simplest 
	  (lambda (x y)
	    (cond ((< y x) (rational:simplest y x))
		  ((not (< x y)) (if (rational? x) x 
				     (error 'rationalize 
					    "~s weirdness" x)))
		  ((positive? x) (sr x y))
		  ((negative? y) (- (sr (- y) (- x))))
		  (else (if (and (exact? x) (exact? y)) 0 0.0))))]
	 [sr 
	  (lambda (x y) 
	    (let ((fx (floor x)) (fy (floor y)))
	      (cond ((not (< fx x)) fx)
		    ((= fx fy) (+ fx (/ (sr (/ (- y fy)) (/ (- x fx))))))
		    (else (+ 1 fx)))))])
  (set! rationalize 
	(lambda (x e)
	  (rational:simplest (- x e) (+ x e)))))

(define list-tail (lambda (x k) (if (zero? k) x (list-tail (cdr x) (- k 1)))))

(define make-polar
  (lambda (x y)
    (make-rectangular (* x (cos y))
		      (* x (sin y)))))

(define magnitude
  (lambda (x)
    (cond [(real? x) (abs x)]
	  [else (let ([r (real-part x)]
		      [i (imag-part x)])
		  (sqrt (+ (* r r) (* i i))))])))

(define angle 
  (lambda (x)
    (cond [(integer? x) (if (>= x 0)
			    (atan 0 1)
			    (atan 0 -1))]
	  [(real? x) (atan 0 x)]
	  [else (atan (imag-part x) (real-part x))])))

(define (string-copy x)
  (letrec ([newstr (make-string (string-length x))]
	   [string-loop (lambda (sl n)
			  (if (null? sl) newstr
			      (begin
				(string-set! newstr n (car sl))
				(string-loop (cdr sl) (+ n 1)))))])
    (string-loop (string->list x) 0)))

;(define (unquote x)
;  (error 'unquote "expression ~s not valid outside of a quasiquote."
;	 x))

;(define (unquote-splicing x)
;  (error 'unquote-splicing "expression ~s valid outside of a quasiquote."
;	 x))

;;; macro-defs.ss
;;; Robert Hieb & Kent Dybvig
;;; 92/06/18

;;; simple delay and force; also defines make-promise

(define-syntax delay
   (lambda (x)
      (syntax-case x ()
         ((delay exp)
          (syntax (make-promise (lambda () exp)))))))

(define make-promise
  (lambda (proc)
    ((lambda (result-ready? result)
      (lambda ()
        (if result-ready?
            result
	    ((lambda (x)
	       (if result-ready?
		   result
		   (begin (set! result-ready? #t)
			  (set! result x)
			  result))) 
	     (proc)))))
      #f #f)))

(define force
   (lambda (promise)
      (promise)))

(define-syntax time
  (lambda (x)
    (syntax-case x ()
      ((_ e)
       (syntax (let* ((st (system-time))
		      (val e)
		      (et (system-time)))
		 (list val (list (- et st) 'ms)))))
      ((_ n e)
       (syntax (let* ((st (system-time))
		      (val (let loop ([x (- n 1)])
			     (if (zero? x) 
				 e
				 (begin e (loop (- x 1))))))
		      (et (system-time)))
		 (list val (list (quotient (- et st) n) 'avg 'ms))))))))

;; Unless and When 
(define-syntax when
  (syntax-rules ()
    ((_ e0 e1 e2 ...)
     (if e0 (begin e1 e2 ...)))))

(define-syntax unless
  (syntax-rules ()
    ((_ e0 e1 e2 ...)
     (if e0 '#!void (begin e1 e2 ...)))))

;;perform macro expansion on a file
(define (expand-file from to . scexpopts)
  (let ([inf (open-source-input-file from)]
        [outf (open-output-file to)])
    ;(with-current-url from
     ; (lambda ()
        (let loop ([e (read-code inf)])
          (or (eof-object? e)
              (begin 
                ;(pretty-print e) (newline)
                (let ([source ((current-optimizer)
                               (apply sc-expand e scexpopts))])
                  ;(pretty-print source) (newline)
                  (pretty-print source outf) (newline outf)
                  (loop (read inf))))));))
    (close-output-port outf)
    (close-input-port inf)))

;; I/O ;;

(define (call-with-input-file file procOrEncoding . proc)
  (cond [(null? proc) 
         (let* ([port (open-input-file file)]
                [result (procOrEncoding port)])
           (close-input-port port)
           result)]
        [(null? (cdr proc))
         (let* ([port (open-input-file file procOrEncoding)]
                [result ((car proc) port)])
           (close-input-port port)
           result)]
        [else (error 'call-with-input-file "too many arguments.")]))

(define (call-with-output-file file procOrEncoding . proc)
  (cond [(null? proc) 
         (let* ([port (open-output-file file)]
                [result (procOrEncoding port)])
           (close-output-port port)
           result)]
        [(null? (cdr proc))
         (let* ([port (open-output-file file procOrEncoding)]
                [result ((car proc) port)])
           (close-output-port port)
           result)]
        [else (error 'call-with-output-file "too many arguments.")]))

(define (with-input-from-port port thunk)
  (let ([cip (current-input-port)])
    (dynamic-wind
     (lambda () (current-input-port port))
     thunk
     (lambda () (current-input-port cip)))))

(define (with-output-to-port port thunk)
  (let ([cop (current-output-port)])
    (dynamic-wind
     (lambda () (current-output-port port))
     thunk
     (lambda () (current-output-port cop)))))

(define (with-input-from-file file thunkOrEncoding . thunk)
  (cond [(null? thunk)
         (call-with-input-file file 
           (lambda (port) (with-input-from-port port thunkOrEncoding)))]
        [(null? (cdr thunk))
         (call-with-input-file file thunkOrEncoding
           (lambda (port) (with-input-from-port port (car thunk))))]
        [else (error 'with-input-from-file "too many arguments.")]))

(define (with-output-to-file file thunkOrEncoding . thunk)
  (cond [(null? thunk)
         (call-with-output-file file 
           (lambda (port) (with-output-to-port port thunkOrEncoding)))]
        [(null? (cdr thunk))
         (call-with-output-file file thunkOrEncoding
           (lambda (port) (with-output-to-port port (car thunk))))]
        [else (error 'with-output-to-file "too many arguments.")]))

(define (with-character-set set thunk)
 (let ([previous-set (character-set)])
    (dynamic-wind
     (lambda () (character-set set))
     thunk
     (lambda () (character-set previous-set)))))

(define (with-current-url url thunk)
  (let ([previous-url (current-url)])
    (dynamic-wind
     (lambda () (current-url (normalize-url previous-url url)))
     thunk
     (lambda () (current-url previous-url)))))

(set! current-class-path
  (let ([original-ccp current-class-path])
    (lambda rest
      (if (null? rest)
          (original-ccp)
          (let ([c-url (current-url)])
            (original-ccp (map (lambda (url)
                                 (normalize-url c-url url))
                               (car rest))))))))

(define (with-class-path classpath thunk)
  (let ([previous-classpath (current-class-path)])
    (dynamic-wind
     (lambda () (current-class-path classpath))
     thunk
     (lambda () (current-class-path previous-classpath)))))

;; needed in a few places; cut-down version from SRFI-1
(define (iota count)
  (do ((count (- count 1) (- count 1))
       (ans '() (cons count ans)))
      ((< count 0) ans)))

;;;;;;;;;;;;;;;; native functions ;;;;;;;;;;;;;

(if (getprop 'string-order)
    (let ((string-order-predicate 
           (lambda (p o)
             (lambda (str1 str2)
               (p (o str1 str2) 0)))))
      ;; string=? isn't present because equal? str1 str2 is far faster
      (set! string<? (string-order-predicate < string-order))
      (set! string>? (string-order-predicate > string-order))
      (set! string<=? (string-order-predicate <= string-order))
      (set! string>=? (string-order-predicate >= string-order))
      (set! string-ci=? (string-order-predicate = string-order-ci))
      (set! string-ci>? (string-order-predicate > string-order-ci))
      (set! string-ci<? (string-order-predicate < string-order-ci))
      (set! string-ci<=? (string-order-predicate <= string-order-ci))
      (set! string-ci>=? (string-order-predicate >= string-order-ci))))

;;;;;;;;;;;;; legacy macro support ;;;;;;;;;;;;

(define-syntax define-macro
  (lambda (x)
    (syntax-case x ()
      ((_ (name . args) . body)
       (syntax (define-macro name (lambda args . body))))
      ((_ name transformer)
       (syntax
        (define-syntax name
	  (lambda (y)
	    (syntax-case y ()
               ((_ . args)
		(datum->syntax-object
		 (syntax _)
		 (apply transformer
			(syntax-object->datum (syntax args)))))))))))))

(define-syntax defmacro
  (syntax-rules ()
    ((_ name args . body)
     (define-macro name (lambda args . body)))))

;;our srfi-0 implementation relies on this
(define *features* '())
(define (add-feature feature)
  (if (not (memq feature *features*))
      (set! *features* (cons feature *features*))))
(define (add-features features)
  (for-each add-feature features))
(define (has-feature? feature)
  (memq feature *features*))

(add-feature 'sisc)

;;hook that gets invoked when SISC is started
(define initialize #f)
(define on-startup #f)
(let ([*startup-hooks* '()]
      [startup-enabled? #t])
  (set! initialize
        (lambda ()
          (set! startup-enabled? #f)
          (for-each (lambda (thunk) (thunk)) (reverse *startup-hooks*))))
  (set! on-startup
        (lambda (thunk)
          (if (not startup-enabled?)
              (error "on-startup is only callable during heap build"))
          (if (not (procedure? thunk))
              (error "~a is not a procedure" thunk))
          (set! *startup-hooks* (cons thunk *startup-hooks*)))))

;;
(if (not (getprop 'LITE (get-symbolic-environment '*sisc*)))
    (load "../modules/std-modules.scm"))
