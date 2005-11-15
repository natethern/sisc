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

