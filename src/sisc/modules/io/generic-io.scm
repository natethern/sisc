(define-generics gio/char-ready? gio/peek-char gio/peek-byte gio/read-byte
  gio/read gio/read-char gio/read-block gio/read-string gio/read-code
  gio/write gio/write-char gio/write-block gio/write-string gio/write-byte
  gio/display gio/flush-output-port gio/close gio/input-port-location
  open-character-input-port open-character-output-port)

; Define the native types
(define <sisc.data.scheme-input-port>
  (make-type '|sisc.data.SchemeInputPort|))
(define <sisc.data.scheme-output-port>
  (make-type '|sisc.data.SchemeOutputPort|))
(define <sisc.modules.io.buffer>
  (make-type '|sisc.modules.io.Buffer|))

(define-java-classes
  <sisc.io.writer-output-port> <sisc.io.reader-input-port> <sisc.io.charset>
  <sisc.io.source-input-port>)

(define-generic-java-methods get-input-stream get-output-stream for-name)

(define-syntax inport
  (syntax-rules ()
    ((_ portarg)
     (if (null? portarg) (current-input-port) (car portarg)))))

(define-syntax outport
  (syntax-rules ()
    ((_ portarg)
     (if (null? portarg) (current-output-port) (car portarg)))))

; First, save the original functions
(define native-char-ready?      (getprop 'char-ready?))
(define native-peek-char        (getprop 'peek-char))
(define native-peek-byte        (getprop 'peek-byte))
(define native-read             (getprop 'read))
(define native-read-char        (getprop 'read-char))
(define native-read-byte        (getprop 'read-byte))
(define native-read-string      (getprop 'read-string))
(define native-read-code        (getprop 'read-code))
(define native-write            (getprop 'write))
(define native-write-byte       (getprop 'write-byte))
(define native-write-char       (getprop 'write-char))
(define native-write-string     (getprop 'write-string))
(define native-display          (getprop 'display))
(define native-flush-output-port (getprop 'flush-output-port))
(define native-open-input-file  (getprop 'open-input-file))
(define native-open-output-file (getprop 'open-output-file))
(define native-close-input-port (getprop 'close-input-port))
(define native-close-output-port (getprop 'close-output-port))
(define native-input-port-location (getprop 'input-port-location))

(define set-filter-in!)
(define set-filter-out!)
(define unwrap-native-input-port)
(define unwrap-native-output-port)

; Next, redefine the R5RS functions in terms of the generics
(define (open-output-file . args)
  (make <native-character-output-port> (apply native-open-output-file args)))

(define open-binary-output-file
  (let ([ioproc (make-io-proc native-open-binary-output-file)])
    (lambda args
      (make <native-output-port> (apply ioproc args)))))

(define (open-input-file . args)
  (make <native-character-input-port> (apply native-open-input-file args)))

(define open-binary-input-file
  (let ([ioproc (make-io-proc native-open-binary-input-file)])
    (lambda args
      (make <native-input-port>
        (apply ioproc args)))))

(define (char-ready? . port)
  (gio/char-ready? (inport port)))

(define (peek-char . port)
  (gio/peek-char (inport port)))

(define (peek-byte . port)
  (gio/peek-byte (inport port)))

(define (read . port)
  (gio/read (inport port)))

(define (read-byte . port)
  (gio/read-byte (inport port)))

(define (read-char . port)
  (gio/read-char (inport port)))

(define (read-block buffer offset length . port)
  (gio/read-block buffer offset length (inport port)))

(define (read-string string offset length . port)
  (gio/read-string string offset length (inport port)))

(define (read-code . port)
  (gio/read-code (inport port)))

(define (write v . port)
  (gio/write v (outport port)))

(define (write-byte byte . port)
  (gio/write-byte byte (outport port)))

(define (write-char char . port)
  (gio/write-char char (outport port)))

(define (write-block buf offset length . port)
  (gio/write-block buf offset length (outport port)))

(define (write-string str offset length . port)
  (gio/write-string str offset length (outport port)))

(define (display v . port)
  (gio/display v (outport port)))

(define (flush-output-port . port)
  (gio/flush-output-port (outport port)))

(define (input-port-location port)
  (gio/input-port-location port))

(define close-output-port)
(define close-input-port)

(define (make-wrapped-constructor type proc)
  (lambda args
    (make type (apply proc args))))

(define (port? v)
  (instance-of? v <port>))

(define (input-port? v)
  (instance-of? v <input-port>))

(define (output-port? v)
  (instance-of? v <output-port>))

(define (character-input-port? v)
  (instance-of? v <character-input-port>))

(define (character-output-port? v)
  (instance-of? v <character-output-port>))

(define (binary-input-port? v)
  (and (input-port? v)
       (not (instance-of? v <character-input-port>))))

(define (binary-output-port? v)
  (and (output-port? v)
       (not (instance-of? v <character-output-port>))))

(define-method (initialize (<filter-input-port> i) (<value> parent-i))
  (:in! i parent-i))

(define-method (initialize (<filter-output-port> i) (<value> parent-i))
  (:out! i parent-i))

(define-method (gio/char-ready? (<filter-input-port> i))
  (gio/char-ready? (:in i)))

(define-method (gio/peek-byte (<filter-input-port> i))
  (gio/peek-byte (:in i)))

(define-method (gio/peek-char (<filter-input-port> i))
  (gio/peek-char (:in i)))

(define-method (gio/read (<filter-input-port> i))
  (gio/read (:in i)))

(define-method (gio/read-byte (<filter-input-port> i))
  (gio/read-byte (:in i)))

(define-method (gio/read-char (<filter-input-port> i))
  (gio/read-char (:in i)))

(define-method (gio/read-block (<sisc.modules.io.buffer> buffer)
                               (<number> offset)
                               (<number> length)
                               (<filter-input-port> i))
  (gio/read-block buffer offset length (:in i)))

(define-method (gio/read-string (<string> string)
                                (<number> offset)
                                (<number> length)
                                (<filter-input-port> i))
  (gio/read-string string offset length (:in i)))

(define-method (gio/read-code (<filter-input-port> i))
  (gio/read-code (:in i)))

(define-method (gio/write (<value> v) (<filter-output-port> o))
  (gio/write v (:out o)))

(define-method (gio/write-byte (<number> b) (<filter-output-port> o))
  (gio/write-byte b (:out o)))

(define-method (gio/write-char (<char> c) (<filter-output-port> o))
  (gio/write-char c (:out o)))

(define-method (gio/write-block (<sisc.modules.io.buffer> b)
                                (<number> off)
                                (<number> count)
                                (<filter-output-port> o))
  (gio/write-block b off count (:out o)))

(define-method (gio/write-string (<string> s)
                                 (<number> off)
                                 (<number> count)
                                 (<filter-output-port> o))
  (gio/write-string s off count (:out o)))

(define-method (gio/display (<value> v) (<filter-output-port> o))
  (gio/display v (:out o)))

(define-method (gio/flush-output-port (<filter-output-port> o))
  (gio/flush-output-port (:out o)))

(define-method (gio/close (<filter-input-port> i))
  (close-input-port (:in i)))

(define-method (gio/close (<filter-output-port> i))
  (flush-output-port i)
  (close-output-port (:out i)))

(define-method (gio/input-port-location (<filter-input-port> i))
  (input-port-location (:in i)))

(define-method (gio/input-port-location (<native-input-port> i))
  (native-input-port-location (unwrap-native-input-port i)))

; Native port classes
; Finally, add back the R5RS function logic

(define-method (initialize (<native-input-port> i)
                           (<sisc.data.scheme-input-port> parent-i))
  (:in! i parent-i))

(define-method (initialize (<native-output-port> i)
                           (<sisc.data.scheme-output-port> parent-i))
  (:out! i parent-i))

(define-method (gio/char-ready? (<sisc.data.scheme-input-port> i))
  (native-char-ready? i))

(define-method (gio/peek-byte (<sisc.data.scheme-input-port> i))
  (native-peek-byte i))

(define-method (gio/peek-char (<sisc.data.scheme-input-port> i))
  (native-peek-char i))

(define-method (gio/read (<sisc.data.scheme-input-port> i))
  (native-read i))

(define-method (gio/read-byte (<sisc.data.scheme-input-port> i))
  (native-read-byte i))

(define-method (gio/read-char (<sisc.data.scheme-input-port> i))
  (native-read-char i))

(define-method (gio/read-block (<sisc.modules.io.buffer> buffer)
                               (<number> offset)
                               (<number> length)
                               (<sisc.data.scheme-input-port> i))
  (native-read-block buffer offset length i))

(define-method (gio/read-string (<string> string)
                                (<number> offset)
                                (<number> length)
                                (<sisc.data.scheme-input-port> i))
  (native-read-string string offset length i))

(define-method (gio/read-code (<sisc.data.scheme-input-port> i))
  (native-read-code i))

(define-method (gio/write (<value> v) (<sisc.data.scheme-output-port> o))
  (native-write v o))

(define-method (gio/write-byte (<number> b) (<native-output-port> o))
  (gio/write-byte b (unwrap-native-output-port o)))

(define-method (gio/write-byte (<number> b) (<sisc.data.scheme-output-port> o))
  (native-write-byte b o))

(define-method (gio/write-char (<char> c) (<native-output-port> o))
  (gio/write-char c (unwrap-native-output-port o)))

(define-method (gio/write-char (<char> c) (<sisc.data.scheme-output-port> o))
  (native-write-char c o))

(define-method (gio/write-block (<sisc.modules.io.buffer> b)
                                (<number> off)
                                (<number> count)
                                (<sisc.data.scheme-output-port> o))
  (native-write-block b off count o))

(define-method (gio/write-string (<string> s)
                                 (<number> off)
                                 (<number> count)
                                 (<sisc.data.scheme-output-port> o))
  (native-write-string s off count o))

(define-method (gio/display (<value> v) (<sisc.data.scheme-output-port> o))
  (native-display v o))

(define-method (gio/flush-output-port (<sisc.data.scheme-output-port> o))
  (native-flush-output-port o))

(define-method (gio/close (<sisc.data.scheme-output-port> o))
  (native-close-output-port o))

(define-method (gio/close (<sisc.data.scheme-input-port> i))
  (native-close-input-port i))

; And a couple of utility methods

(define-method (open-character-output-port (<character-output-port> o))
  o)

(define-method (open-character-input-port (<character-input-port> i))
  i)

(define-method (open-character-output-port (<native-output-port> o))
  (open-character-output-port o #f))

(define-method (open-character-output-port (<native-output-port> o) (<boolean> aflush))
  (make <native-character-output-port>
    (java-unwrap
     (java-new <sisc.io.writer-output-port>
              (get-output-stream (java-wrap (:out o)))
              (for-name (java-null <sisc.io.charset>)
                        (->jstring (character-set)))
              (->jboolean aflush)))))

(define-method (open-character-input-port (<native-input-port> i))
  (make <native-character-input-port>
    (java-unwrap
     (java-new <sisc.io.reader-input-port>
               (get-input-stream (java-wrap (:in i)))
               (for-name (java-null <sisc.io.charset>)
                         (->jstring (character-set)))))))

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