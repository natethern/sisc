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
		 
(current-evaluator eval)
;(emit-annotations #t)

;Loads an already expanded file (ie does not run it through the expander)
(define (load-expanded file)
  (call-with-input-file file
    (lambda (port) 
      (do ((x (read port) (read port)))
          ((eof-object? x) (void))
        (eval (list "noexpand" x))))))

(define (parameterize . args)
  (let ([initial-value (if (null? args) #f (car args))]
        [constraint? (if (or (null? args) (null? (cdr args)))
                        (lambda (x) #t)
                        (if (not (procedure? (cadr args)))
                            (error 'parameterize "constraint is not a procedure/")
                            (cadr args)))])
    (let ([parameter (make-parameter initial-value)])
      (lambda arg
        (cond [(null? arg) (parameter)]
              [(constraint? (car arg)) 
               (parameter (car arg))]
              [else (error "new parameter value does not meet the parameter's type constraints")])))))

;;A parameter that defines whether vectors will be printed with a length
;;prefix
(define vector-length-prefixing (parameterize #t))

(define modulo
  (lambda (x y)
    (let ([r (remainder x y)])
       (if (if (negative? y) (positive? r) (negative? r))
           (+ r y)
           r))))

(define (current-failure-continuation)
  (call-with-failure-continuation
   (lambda () (error 'current-fc))
   (lambda (m e f)
     f)))

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
	    ((or (not here)             ; HERE has reached the root.
		 (and target
		      (< (point-depth here)
			 (point-depth target))))
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
	 (let ((point (get-dynamic-point)))
	   (proc (lambda results
		   (travel-between-points (get-dynamic-point) point)
		   (apply cont results)))))))
    (define (dynamic-wind/impl in body out)
      (let* ((here (get-dynamic-point))
	     (point (make-point 
		     (if here (+ (point-depth here) 1) 1)
		     in out here)))
	(in)
	(set-dynamic-point! point)
	(call-with-values
	    (lambda ()
	      (with/fc
	       (lambda (m e)
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
        (set! call-with-current-continuation dynwind-call/cc)
        (set! call/cc dynwind-call/cc)
        (set! dynamic-wind dynamic-wind/impl)
        (dynamic-wind in body out)))
    ;;finally, the install the dynamic-wind hooks
    (set! dynamic-wind dynamic-wind-loader)
    (set! unload-dynamic-wind
          (lambda ()
            (set! call-with-current-continuation original-call/cc)
            (set! call/cc original-call/cc)
            (set! dynamic-wind dynamic-wind-loader))))

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
(define call/fc call-with-failure-continuation)
(define with/fc with-failure-continuation)
(define call/cc call-with-current-continuation)

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
	  
(define (unquote x)
  (error 'unquote "expression ~s not valid outside of a quasiquote."
	 x))

(define (unquote-splicing x)
  (error 'unquote-splicing "expression ~s valid outside of a quasiquote."
	 x))

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
     (if (not e0) (begin e1 e2 ...)))))

;;perform macro expansion on a file
(define (expand-file expand-from expand-to)
  (let ([inp (open-input-file expand-from)]
	[outp (open-output-file expand-to)]
	[precision (max-precision)])
    (max-precision 1500)
    (let loop ([expr (read inp)])
      (if (not (eof-object? expr))
	  (begin
	    (let ([ev (sc-expand expr)])
	      (pretty-print
	       ;;the expansion tends to generate a lot of of
	       ;;expressions of the form (begin (void) <x>). The
	       ;;following reduces these to <x>.
	       (if (and #t
			(list? ev) 
			(= (length ev) 3)
			(eq? (car ev) 'begin)
			(equal? (caadr ev) '$sc-put-cte))
		   (caddr ev)
		   ev) outp))
	    (newline outp)
	    (loop (read inp))))
      (close-input-port inp)
      (close-output-port outp)
      (max-precision precision))))

;; I/O ;;

(define (call-with-input-file file proc)
  (let* ([port (open-input-file file)]
         [result (proc port)])
    (close-input-port port)
    result))

(define (call-with-output-file file proc)
  (let* ([port (open-output-file file)]
         [result (proc port)])
    (close-output-port port)
    result))

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

(define (with-input-from-file file thunk)
  (call-with-input-file file
    (lambda (port) (with-input-from-port port thunk))))

(define (with-output-to-file file thunk)
  (call-with-output-file file
    (lambda (port) (with-output-to-port port thunk))))

(define (call-with-input-string str proc)
  (let* ([port (open-input-string str)]
         [result (proc port)])
    (close-input-port port)
    result))

(define (call-with-output-string proc)
  (let ([outsp (open-output-string)])
    (proc outsp)
    (let ([s (get-output-string outsp)])
      (close-output-port outsp)
      s)))

(define (with-input-from-string str thunk)
  (call-with-input-string str
    (lambda (port) (with-input-from-port port thunk))))

(define (with-output-to-string thunk)
  (call-with-output-string
    (lambda (port) (with-output-to-port port thunk))))

;; needed in a few places; cut-down version from SRFI-1
(define (iota count)
  (do ((count (- count 1) (- count 1))
       (ans '() (cons count ans)))
      ((< count 0) ans)))

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

; We must redefine READ so that it converts explicit annotations to internal 
; ones
(define read-with-annotations read)
(define (read . port)
  (let ([rv (apply read-with-annotations port)])
    (if (annotation? rv)
        (let ([expr (annotation-expression rv)]
              [source (annotation-source rv)])
          (for-each (lambda (kv)
                      (set-annotation! expr (car kv) (cdr kv)))
                    source)
          expr)
        rv)))

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
              (error "~a is not a procedure"))
          (set! *startup-hooks* (cons thunk *startup-hooks*)))))

(on-startup
 (lambda ()
   ;;populate *config-parameters* symbolic env with contents of
   ;;sisc.properties file, but leaving any existing entries intact
   (let ([prop-file (or (getprop 'sisc.properties
                                 '*environment-variables*)
                        "sisc.properties")]
         [testval	(list #f)])
     (with/fc  ;ignore errors
      (lambda (m e) #f)
      (lambda ()
        (with-input-from-file prop-file
          (lambda ()
            (let loop ([entry (read)])
              (or (eof-object? entry)
                  (begin
                    (if (eq? (getprop (car entry)
                                      '*config-parameters*
                                      testval)
                             testval)
                        (putprop (car entry)
                                 '*config-parameters*
                                 (cdr entry)))
                    (loop (read))))))))))
   (unload-dynamic-wind)))

;;
(if (not (getprop 'LITE '*sisc*))
    (load "../modules/std-modules.scm"))
