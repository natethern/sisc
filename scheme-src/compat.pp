
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
;;; compat.ss
;;; Robert Hieb & Kent Dybvig
;;; 92/06/18

;;; This file contains nonstandard help procedures.
;;; They are all present in Chez Scheme, but are easily defined
;;; in any standard Scheme system.
;;; These versions do no error checking.

; In Chez Scheme "(void)" returns an object that is ignored by the
; REP loop.  It is returned whenever a "nonspecified" value is specified
; by the standard.  The following should pick up an appropriate value.

;(define void
;   (let ((void-object (if #f #f)))
;      (lambda () void-object)))

; "andmap" is like "map" except instead of "consing" the results it
; "ands" them, quitting early if #f" is obtained.
; The following does no error checking.
(load-module "sisc.debug.SDebug")

(define annotation-stripped
  (lambda (x)
    (not (annotation? x))))

(define set-annotation-stripped!
  (lambda (what huh)
    ;Just going to ignore this since I have *no* idea what its supposed
    ;to do
    (void)))

(define andmap
   (lambda (f first . rest)
     (if (null? rest)
	 ((lambda (mapf)
	    (begin 
	      (set! mapf (lambda (l)
			   (if (null? l) #t
			       (if (f (car l)) (mapf (cdr l)) #f))))
	      (mapf first))) #f)
	 (if (null? (cdr rest))
	     ((lambda (mapf)
		(begin 
		  (set! mapf (lambda (l1 l2)
			       (if (null? l1) #t
				   (if (f (car l1) (car l2)) 
				       (mapf (cdr l1) (cdr l2)) #f))))
		  (mapf first (car rest)))) #f)
	     ((lambda (mapf)
		(begin
		  (set! mapf (lambda (first rest)
			       (if (null? first) #t
				   (if (apply f (car first) (map car rest))
				       (mapf (cdr first) (map cdr rest)) #f))))
		  (mapf first rest))) #f)))))

(define gen-sym
  ((lambda (symcounter)
     (lambda (base) 
       (set! symcounter (+ symcounter 1))
       (string->symbol (format "~s_~s" base symcounter))))
   0))
  
(define gensym
  (lambda ()
    (gen-sym '%)))

(define list*
  (lambda args
    (if (null? args) '()
        (if (null? (cdr args)) 
	    (car args)
	    (cons (car args) (apply list* (cdr args)))))))

(define top-level-bound?
  (lambda (x)
    (getprop 'x '*toplevel*)))

(define ormap
  (lambda (proc list1)
    (if (not (null? list1))
      ((lambda (t) (if t t (ormap proc (cdr list1))))
       (proc (car list1)))
      '#f)))
 
(define remprop
  (lambda (symbol key)
    (putprop symbol key #f)))

(define sc-expand (lambda (x) x))

(define $old-eval (current-evaluator))

(define eval 
  ((lambda (old-eval)
     (lambda (x . env)
       (if (if (pair? x) (eq? (car x) "noexpand") #f)
	   (apply old-eval (cons (cadr x) env))
	   ((lambda (e)  
	     (apply old-eval (cons e env)))
	    (sc-expand x)))))
   (current-evaluator)))

(define make-false
  (lambda (v) #f))

;;psyntax.[ss,pp] forgot to define these
(define fx> >)
(define fx>= >=)

;;;;;;;;;;;;; Module loading
;(if (not (getprop 'LITE '*sisc*))
;    (for-each load-module 
;              '("sisc.modules.SNative" "sisc.modules.J2S"
;                "sisc.modules.SLogicOps"
;                "sisc.modules.SNetwork" "sisc.modules.SDebug")))
(if (not (getprop 'LITE '*sisc*))
    (for-each load-module '("sisc.modules.SNative")))
