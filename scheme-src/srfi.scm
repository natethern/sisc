(native-module r5rs "sisc.modules.R5RS")

(display "srfi-0\n")
(module srfi-0 (cond-expand)
  (include "srfi/srfi-0.scm")
  (add-feature 'srfi-0))

(display "srfi-8\n")
(module srfi-8
  (receive)
  (include "srfi/srfi-8.scm")
  (add-feature 'srfi-8))

(module _srfi-23 (_error)
  (define _error error))

(display "srfi-23\n")
(module srfi-23 (error)
  (import _srfi-23)
  (define (error msg . args)
    (if (null? args)
        (_error msg)
        (_error (string-append msg ": ~a") (apply list args))))
  (add-feature 'srfi-23))

(module optional-args
  (check-arg
   :optional
   (let-optionals* %let-optionals*)
   error
   bitwise-and)
  (import _srfi-23)
  (define (error msg . args)
    (cond
     ((null? args)
      (_error msg))
     ((= (length args) 1)
      (_error (string-append msg ": ~a") (car args)))
     (else
      (_error (string-append msg " in ~a: ~a") (car args) (cdr args)))))
  (define (bitwise-and . args)
    (error "bitwise-and not implemented"))
  (include "optional-args.scm"))

(display "srfi-1\n")
(module srfi-1
  (cons
   list
   xcons cons* make-list list-tabulate list-copy circular-list iota
   pair? null?
   proper-list? circular-list? dotted-list? not-pair? null-list?
   list=
   car cdr list-ref
   caar cadr cdar cddr
   caaar caadr cadar caddr cdaar cdadr cddar cdddr
   caaaar caaadr caadar caaddr cadaar cadadr caddar cadddr
   cdaaar cdaadr cdadar cdaddr cddaar cddadr cdddar cddddr
   first second third fourth fifth sixth seventh eighth ninth tenth
   car+cdr
   take drop
   take-right drop-right
   take! drop-right! split-at split-at! last last-pair
   length length+
   append concatenate reverse
   append! concatenate! reverse!
   append-reverse append-reverse!
   zip unzip1 unzip2 unzip3 unzip4 unzip5
   count
   map for-each
   fold unfold pair-fold reduce fold-right unfold-right pair-fold-right
   reduce-right append-map append-map!
   map! pair-for-each filter-map map-in-order
   filter partition remove
   filter! partition! remove!
   member memq memv
   find find-tail any every
   list-index
   take-while drop-while take-while!
   span break span! break!
   delete delete-duplicates delete! delete-duplicates!
   assoc assq assv
   alist-cons alist-copy
   alist-delete alist-delete!
   lset<= lset= lset-adjoin
   lset-union lset-union!
   lset-intersection lset-intersection!
   lset-difference lset-difference!
   lset-xor lset-xor!
   lset-diff+intersection lset-diff+intersection!)
  (import* r5rs
           for-each
           cons pair? null? car cdr set-car! set-cdr!
           list append reverse length list-ref
           memq memv assq assv
           caar cadr cdar cddr
           caaar caadr cadar caddr cdaar cdadr cddar cdddr
           caaaar caaadr caadar caaddr cadaar cadadr caddar cadddr
           cdaaar cdaadr cdadar cdaddr cddaar cddadr cdddar cddddr)
  (import optional-args)
  (import srfi-8) ;RECEIVE
  (include "srfi/srfi-1.scm")
  (add-feature 'srfi-1))

(display "srfi-2\n")
(module srfi-2 (and-let*)
  (import srfi-23) ;ERROR
  (include "srfi/srfi-2.scm")
  (add-feature 'srfi-2))

(display "srfi-5\n")
(module srfi-5 (let)
  (include "srfi/srfi-5.scm")
  (add-feature 'srfi-5))

(module _srfi-6 (_open-input-string _open-output-string _get-output-string)
  (define _open-input-string	open-input-string)
  (define _open-output-string	open-input-string)
  (define _get-output-string	get-output-string))

(display "srfi-6\n")
(module srfi-6 (open-input-string open-output-string get-output-string)
  (import _srfi-6)
  (define open-input-string	_open-input-string)
  (define open-output-string	_open-output-string)
  (define get-output-string	_get-output-string)
  (add-feature 'srfi-6))

(display "srfi-7\n")
(module srfi-7 (program)
  (import srfi-0)
  (include "srfi/srfi-7.scm")
  (add-feature 'srfi-7))

(display "srfi-9\n")
(module srfi-9
  ((define-record-type
     make-record-type record-constructor record-predicate
     define-record-field record-accessor record-modifier)
   record?
   vector?)
  (import* r5rs (real-vector? vector?))
  (import srfi-23) ;ERROR
  (include "srfi/srfi-9.scm")
  (add-feature 'srfi-9))

(display "srfi-11\n")
(module srfi-11
  (let-values let*-values)
  (include "srfi/srfi-11.scm")
  (add-feature 'srfi-11))

(native-module srfi-12-native "sisc.modules.SRFI12")

(display "srfi-12\n")
(module srfi-12
  (current-exception-handler
   with-exception-handler
   handle-exceptions
   abort
   signal
   condition?
   make-composite-condition
   make-property-condition
   condition-predicate
   condition-property-accessor)
  (import srfi-12-native)
  (include "srfi/srfi-12.scm")
  (add-feature 'srfi-12))

(display "srfi-14\n")
(module srfi-14
  (char-set?
   char-set= char-set<=
   char-set-hash 
   char-set-cursor char-set-ref char-set-cursor-next end-of-char-set?
   char-set-fold char-set-unfold char-set-unfold!
   char-set-for-each char-set-map
   char-set-copy char-set
   list->char-set  string->char-set 
   list->char-set! string->char-set! 
   char-set-filter  ucs-range->char-set  ->char-set
   char-set-filter! ucs-range->char-set!
   char-set->list char-set->string
   char-set-size char-set-count char-set-contains?
   char-set-every char-set-any
   char-set-adjoin  char-set-delete 
   char-set-adjoin! char-set-delete!
   char-set-complement  char-set-union  char-set-intersection  
   char-set-complement! char-set-union! char-set-intersection! 
   char-set-difference  char-set-xor  char-set-diff+intersection
   char-set-difference! char-set-xor! char-set-diff+intersection!
   char-set:lower-case		char-set:upper-case	char-set:title-case
   char-set:letter		char-set:digit		char-set:letter+digit
   char-set:graphic		char-set:printing	char-set:whitespace
   char-set:iso-control		char-set:punctuation	char-set:symbol
   char-set:hex-digit		char-set:blank		char-set:ascii
   char-set:empty		char-set:full)
  (import srfi-9) ;DEFINE-RECORD-TYPE
  (import optional-args)
  (define %latin1->char integer->char)
  (define %char->latin1 char->integer)
  (include "srfi/srfi-14.scm")
  (add-feature 'srfi-14))

(display "srfi-13\n")
(module srfi-13
  (string-map
   string-map!
   string-fold       string-unfold
   string-fold-right string-unfold-right 
   string-tabulate string-for-each string-for-each-index
   string-every string-any
   string-hash string-hash-ci
   string-compare string-compare-ci
   string=    string<    string>    string<=    string>=    string<>
   string-ci= string-ci< string-ci> string-ci<= string-ci>= string-ci<> 
   string-downcase  string-upcase  string-titlecase  
   string-downcase! string-upcase! string-titlecase! 
   string-take string-take-right
   string-drop string-drop-right
   string-pad string-pad-right
   string-trim string-trim-right string-trim-both
   string-filter string-delete
   string-index string-index-right 
   string-skip  string-skip-right
   string-count
   string-prefix-length string-prefix-length-ci
   string-suffix-length string-suffix-length-ci
   string-prefix? string-prefix-ci?
   string-suffix? string-suffix-ci?
   string-contains string-contains-ci
   string-copy! substring/shared
   string-reverse string-reverse! reverse-list->string
   string-concatenate string-concatenate/shared string-concatenate-reverse
   string-append/shared
   xsubstring string-xcopy!
   string-null?
   string-join
   string-tokenize
   string-replace
   string->list string-copy string-fill! 
   string? make-string string-length string-ref string-set! 
   string string-append list->string
   make-kmp-restart-vector string-kmp-partial-search kmp-step
   string-parse-start+end
   string-parse-final-start+end
   let-string-start+end
   check-substring-spec
   substring-spec-ok?)
  (import* r5rs 
           string? make-string string-length string-ref string-set!
           string string-append list->string)
  (import srfi-8) ;RECEIVE
  (import srfi-14)
  (import optional-args)
  (define char-cased? char-alphabetic?)
  (define char-titlecase char-upcase)
  (include "srfi/srfi-13.scm")
  (add-feature 'srfi-13))

(display "srfi-16\n")
(module srfi-16 (case-lambda)
  (import srfi-23) ;ERROR
  (include "srfi/srfi-16.scm")
  (add-feature 'srfi-16))

(display "srfi-24\n")
(module srfi-24 ()
  ;;this srfi is natively supported by our syntax expander
  (add-feature 'srfi-24))
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
