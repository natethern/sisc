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
(import j2s-module)
  
(define scheme->java-object 
  (let ([java-integer-class (java/class-for-name "sisc.data.Value")])
    (lambda (o)
      (if (not (java/object? o))
	  (java/call o "javaValue" #() #())
	  o))))

(define java/field-proxy
  (lambda (class fieldName coerce)
    (lambda args
      (let ([rv 
	     (if (null? args)
		 (java/field-ref class fieldName)
		 (let ([obj (if (null? (car args)) class (car args))]
		       [args (cdr args)])
		   (if (null? args)
		       (java/field-ref obj fieldName)
		       (java/field-set! obj fieldName
					(if coerce 
					    (scheme->java-object (car args))
					    (car args))))))])
	(if coerce (java->scheme-object rv) rv)))))

(define java/method-proxy
  (lambda (class methodName coerce)
    (lambda args
      (let ([rv 
	     (if (null? args)
		 (java/call class methodName #() #())
		 (let ([arga (if coerce (map scheme->java-object (cdr args)) 
				 (cdr args))])
		   (let ([argv (list->vector arga)]
			 [argprot (list->vector (map java/class-of-object arga))])
		     (java/call (if (null? (car args))
				    class
				    (car args))
				methodName argprot argv))))])
	(if coerce (java->scheme-object rv) rv)))))
  
(define java/has-field
  (lambda (c f)
    (call/fc (lambda () 
	       (java/field-ref c f)
	       #t)
	     (lambda (m e c) #f))))

(define java->scheme-object
  (let ([ins-help (lambda (cs c p)
		    (cons cs (lambda (v)
			       (let* ([arg (p v)]
				     [class (java/class-for-name cs)]
				     [ca (java/class-of-object arg)])
				 (if (java/has-field ca "TYPE")
				     (set! ca (java/field-ref ca "TYPE")))
				 (java/instantiate 
				  c
				  (vector ca)
				  (vector arg))))))])
    (let ([identity (lambda (v) v)]
	  [value-type (java/class-for-name "sisc.data.Value")]
	  [java-wrap-type (java/class-for-name "sisc.modules.J2S$JavaObject")]
	  [cstring (java/class-for-name "sisc.data.SchemeString")]
	  [cvect   (java/class-for-name "sisc.data.SchemeVector")]
	  [cnum    (java/class-for-name "sisc.data.Quantity")]
	  [cchar (java/class-for-name "sisc.data.SchemeCharacter")]
	  [java-object-type (java/class-for-name "java.lang.Object")]
	  [TRUE (java/field-ref (java/class-for-name "java.lang.Boolean")
				"TRUE")]
	  [UTIL (java/class-for-name "sisc.Util")])
      (let ([type-mappings 
	     `(,(ins-help "java.lang.Short" cnum identity) 
	       ,(ins-help "java.lang.Integer" cnum identity) 
	       ,(ins-help "java.lang.Byte" cnum identity) 
	       ,(ins-help "java.lang.Float" cnum identity) 
	       ,(ins-help "java.lang.Double" cnum identity) 
	       ,(ins-help "java.lang.Long" cnum identity) 
	       ,(ins-help "java.lang.Character" cchar identity)
	       ,(cons "java.lang.Boolean"
		      (let ([bool 
			     (java/field-ref 
			      (java/class-for-name "java.lang.Boolean")
			      "TYPE")])
			(lambda (v) 
			  (java/call UTIL "truth" 
				     (vector bool)
				     (vector 
				      (java/call v "equals" 
						 (vector 
						  (java/class-for-name "java.lang.Object"))
						 (vector TRUE)))))))
	       ,(ins-help "java.lang.String" cstring 
			  (lambda (v)
			    (java/call v "toCharArray" #() #()))))])
	(lambda (x) 
	  (if (and (not (java/instance-of? x java-wrap-type))
		   (java/instance-of? x value-type))
	      x
	      (let ([jtype (assoc (java/get-class-name (java/class-of-object x))
				  type-mappings)])
		(if jtype 
		    ((cdr jtype) x)
		    (error 'java->scheme-object "unable to convert '~s' to a scheme type" x)))))))))

(define java/import
  (lambda (class . args)
    (let* ([prefix (if (not (null? args)) (car args))]
	   [args (if (not (void? prefix)) (cdr args) args)]
	   [coerce (if (not (null? args)) (car args) #f)]
	   [c (if (java/class? class) class (java/class-of-object class))]
	   [methods (java/get-methods c)]
	   [fields (java/get-fields c)])
      (let loop ([x methods]) 
	(if (not (null? x))
	    (begin
	      (putprop 
	       (string->symbol
		(let ([postfix (string-downcase (car x))])
		  (if (void? prefix) 
		      postfix
		      (string-append prefix postfix))))
	       '*toplevel* 
	       (java/method-proxy c (car x) coerce))
	      (loop (cdr x)))))
      (let loop ([x fields])
	(if (not (null? x))
	    (begin
	      (putprop 
	       (string->symbol
		(let ([postfix (string-downcase (car x))])
		  (if (void? prefix)
		      postfix
		      (string-append prefix postfix))))
	       '*toplevel*
	       (java/field-proxy c (car x) coerce))
	      (loop (cdr x))))))))
