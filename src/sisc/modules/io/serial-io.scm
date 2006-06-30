(define-nongenerative-class (<serial-input-port> <filter-input-port>)
  sisc.io.serial-input-port-type)
(define-nongenerative-class (<serial-output-port> <filter-output-port>)
  sisc.io.serial-output-port-type)

(define (open-serial-input-port port)
  (make <serial-input-port>
    (_open-serial-input-port (unwrap-native-input-port port))))

(define (open-serial-output-port port)
  (make <serial-output-port>
    (_open-serial-output-port (unwrap-native-output-port port))))

(define (call-with-serial-input-port port proc)
  (proc (open-serial-input-port port)))

(define (call-with-serial-output-port port proc)
  (let ([port (open-serial-output-port port)])
    (call-with-values
        (lambda () (proc port))
      (lambda returns
        (flush-output-port port)
        (apply values returns)))))

(define (with-serial-input-from-port port thunk)
  (call-with-serial-input-port port 
    (lambda (port) (with-input-from-port port thunk))))

(define (with-serial-output-to-port port thunk)
  (call-with-serial-output-port port 
    (lambda (port) (with-output-to-port port thunk))))

(define (call-with-serial-input-file url proc)
  (call-with-binary-input-file url
    (lambda (in)
      (call-with-serial-input-port in proc))))

(define (call-with-serial-output-file url proc)
  (call-with-binary-output-file url
    (lambda (out)
      (call-with-serial-output-port out proc))))

(define (with-serial-output-to-file url thunk)
  (call-with-serial-output-file url
   (lambda (out)
     (with-output-to-port out thunk))))

(define (with-serial-input-from-file url thunk)
  (call-with-serial-input-file url
   (lambda (in)
     (with-input-from-port in thunk))))

(define (serialize v . portarg)
  (_serialize v (unwrap-native-output-port
                 (if (null? portarg) (current-input-port) (car portarg)))))

(define (deserialize . portarg)
  (_deserialize (unwrap-native-input-port
                 (if (null? portarg) (current-input-port) (car portarg)))))

(define (serial-input-port? v)
  (instance-of? v <serial-input-port>))

(define (serial-output-port? v)
  (instance-of? v <serial-output-port>))

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