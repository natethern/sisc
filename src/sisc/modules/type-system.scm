;;;;;;;;;; PROCEDURES AND PREDICATES ;;;;;;;;;;

(define type-of-hook (make-hook native-type-of))
(define type<=-hook (make-hook native-type<=))
(define (type-of o) (invoke-hook type-of-hook o))
(define (type<= x y) (if (eq? x y) #t (invoke-hook type<=-hook x y)))
(define (type= x y) (and (type<= x y) (type<= y x)))
(define (instance-of? x y) (type<= (type-of x) y))

(define (every2 pred x y)
  (cond [(null? x) #t]
        [(null? y) #t]
        [else (and (pred (car x) (car y)) (every2 pred (cdr x) (cdr y)))]))

(define (types<= x y)       (every2 type<= x y))
(define (types= x y)        (every2 type= x y))
(define (instances-of? x y) (every2 instance-of? x y))

;;compare two types taking into account the cpl of c
;;NB: c must be a sub-type of both types
(define compare-types-hook
  (make-hook (lambda (x y c)
               (error (string-append
                       "unable to compare types ~s and ~s "
                       "with respect to type ~s")
                      x y c))))
(define (compare-types x y c)
  (let ([x<y? (type<= x y)]
        [y<x? (type<= y x)])
    (cond [(and x<y? y<x?) 'equal]
          [x<y? 'more-specific]
          [y<x? 'less-specific]
          [else (invoke-hook compare-types-hook x y c)])))


;;;;;;;;;; R5RS TYPES ;;;;;;;;;;

(define-syntax define-scheme-type
  (lambda (x)
    (syntax-case x ()
      ((_ name jname)
       (with-syntax ([sname (wrap-symbol "<" (syntax name) ">")]
                     [jname (wrap-symbol "sisc.data." (syntax jname) "")])
         (syntax (define sname (make-type 'jname))))))))
(define-syntax define-scheme-types
  (syntax-rules ()
    ((_ (name jname) ...)
     (begin (define-scheme-type name jname) ...))))

;;for convenience we pre-define all the types defined in R5RS plus the
;;base type (<value>) of all of them. Caveat: instead of a pair and
;;null type there is just a list type.
(define-scheme-types
  (value        |Value|)
  (eof          |EOFObject|)
  (symbol       |Symbol|)
  (box          |Box|)
  (list         |Pair|)
  (procedure    |Procedure|)
  (number       |Quantity|)
  (boolean      |SchemeBoolean|)
  (char         |SchemeCharacter|)
  (string       |SchemeString|)
  (vector       |SchemeVector|))

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
;; Portions created by Scott G. Miller are Copyright (C) 2000-2006
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