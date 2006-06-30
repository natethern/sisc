(module gio/basetype
  (<port>)
  (import oo)
  (define-nongenerative-class (<port>)
    sisc.io.port-type))

(module gio/porttypes
  (<input-port> <output-port>)
  (import oo)
  (import gio/basetype)
  (define-nongenerative-class (<input-port> <port>)
    sisc.io.input-port-type)
  (define-nongenerative-class (<output-port> <port>)
    sisc.io.output-port-type))

(module gio/charporttypes
  (<character-input-port>
   <character-output-port>)
  (import oo)
  (import gio/porttypes)
  (define-nongenerative-class (<character-input-port> <input-port>)
    sisc.io.character-input-port-type)
  (define-nongenerative-class (<character-output-port> <output-port>)
    sisc.io.character-output-port-type))

(module gio/filtergenerics
  (:in :out :in! :out! :aflush :aflush!)
  (import generic-procedures)
  (define-generics :in :in! :out :out! :aflush :aflush!))

(module gio/filterporttypes
  (<filter-input-port> <filter-output-port>)
  (import oo)
  (import gio/filtergenerics)
  (import gio/porttypes)
  (define-nongenerative-class (<filter-input-port> <input-port>)
    sisc.io.filter-input-port-type
    (in :in :in!))
  (define-nongenerative-class (<filter-output-port> <output-port>)
    sisc.io.filter-output-port-type
    (out :out :out!)
    (auto-flush :aflush :aflush!)))

(module gio/nativeporttypes
  (<native-input-port>
   <native-output-port>)
  (import oo)
  (import gio/filterporttypes)
  (define-nongenerative-class (<native-input-port> <filter-input-port>)
    sisc.io.native-input-port-type)
  (define-nongenerative-class (<native-output-port> <filter-output-port>)
    sisc.io.native-output-port-type))

(module gio/nativecharporttypes
  (<native-character-input-port>
   <native-character-output-port>)
  (import oo)
  (import gio/nativeporttypes)
  (import gio/charporttypes)
  (define-nongenerative-class (<native-character-input-port>
                               <native-input-port> <character-input-port>)
    sisc.io.native-character-input-port-type)
  (define-nongenerative-class (<native-character-output-port>
                               <native-output-port> <character-output-port>)
    sisc.io.native-character-output-port-type))

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