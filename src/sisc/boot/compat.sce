
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

(define andmap
   (lambda (f first . rest)
     (if (null? rest)
	 ((lambda (mapf)
	    (begin 
	      (set! mapf (lambda (l)
			   (if (null? l) '#t
			       (if (f (car l)) (mapf (cdr l)) '#f))))
	      (mapf first))) '#f)
	 (if (null? (cdr rest))
	     ((lambda (mapf)
		(begin 
		  (set! mapf (lambda (l1 l2)
			       (if (null? l1) '#t
				   (if (f (car l1) (car l2)) 
				       (mapf (cdr l1) (cdr l2)) 
                                       '#f))))
		  (mapf first (car rest)))) '#f)
	     ((lambda (mapf)
		(begin
		  (set! mapf (lambda (first rest)
			       (if (null? first) '#t
				   (if (apply f (car first) (map-car rest))
				       (mapf (cdr first) (map-cdr rest)) 
                                       '#f))))
		  (mapf first rest))) '#f)))))

(define gen-sym
  (lambda (base)        
    (if base
        (string->symbol (string-append (symbol->string base) "_"
                                       (symbol->string (gensym))))
        (gensym))))

(define ormap
  (lambda (proc list1)
    (if (null? list1)
      '#f
      ((lambda (t) (if t t (ormap proc (cdr list1))))
       (proc (car list1))))))

(define remq
  (lambda (o lst)
    (if (null? lst)
        '()
        (if (eq? o (car lst))
            (remq o (cdr lst))
            (cons (car lst) (remq o (cdr lst)))))))

(define $sc-put-cte (void))
(define identifier? (void))
(define sc-expand (void))
(define datum->syntax-object (void))
(define syntax-object->datum (void))
(define generate-temporaries (void))
(define free-identifier=? (void))
(define bound-identifier=? (void))
(define literal-identifier=? (void))
(define syntax-error (void))
(define $syntax-dispatch (void))
(define $make-environment (void))

(define error
  (lambda args
    (begin
      (for-each (lambda (arg)
                   (begin (display arg) (display #\space)))
                args)
      (newline))))

(define strict-r5rs-compliance (_make-native-parameter "strictR5RSCompliance"))
  
(define make-false
  (lambda (v) '#f))

;;;;;;;;;;;;; Module loading

(if (not (getprop 'LITE (get-symbolic-environment '*sisc*)))
    (for-each load-module '("sisc.modules.SNative$Index")))
