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

(define modulo
  (lambda (x y)
    (let ([r (remainder x y)])
       (if (if (negative? y) (positive? r) (negative? r))
           (+ r y)
           r))))

(define dynamic-wind 
  (lambda args
    (eval '(let ()
	     (define *here* (list #f))
	     
	     (define original-cwcc call-with-current-continuation)
	     
	     (define (reroot! there)
	       (if (not (eq? *here* there))
		   (begin
		     (reroot! (cdr there))
		     (let ((before (caar there)) (after (cdar there)))
		       (set-car! *here* (cons after before))
		       (set-cdr! *here* there)
		       (set-car! there #f)
		       (set-cdr! there '())
		       (set! *here* there)
		       (before)))))                                   
	     
	     (set! dynwind-call/cc
		   (lambda (proc)
		     (let ((here *here*))
		       (original-cwcc
			(lambda (cont)
			  (proc (lambda results
				  (reroot! here)
				  (apply cont results))))))))
	     
	     (set! dynamic-wind
		   (lambda (before during after)
		     (let ((here *here*))
		       (reroot! (cons (cons before after) here))
		       (call-with-values
			   during
			 (lambda results
			   (reroot! here)
			   (apply values results))))))
	     
	     (set! call/cc dynwind-call/cc)
	     (set! call-with-current-continuation dynwind-call/cc)))
    (apply (getprop 'dynamic-wind) args)))
  
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
	  
(define (file-exists? x)
  (not (eq? (file-type x) 'no-file)))

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
       (let ([st (gensym)]
	     [et (gensym)])
	 (syntax (let* ((st (system-time))
			(val e)
			(et (system-time)))
		   (list val (list (- et st) 'ms)))))))))
	 
;; Unless and When 
(define-syntax when
  (syntax-rules ()
    ((_ e0 e1 e2 ...)
     (if e0 (begin e1 e2 ...)))))

(define-syntax unless
  (syntax-rules ()
    ((_ e0 e1 e2 ...)
     (if (not e0) (begin e1 e2 ...)))))


