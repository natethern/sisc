(module gio/basetype
  (<port>)
  (import oo)
  (define-class (<port>)))

(module gio/porttypes
  (<input-port> <output-port>)
  (import oo)
  (import gio/basetype)
  (define-class (<input-port> <port>))
  (define-class (<output-port> <port>)))

(module gio/charporttypes
  (<character-input-port>
   <character-output-port>)
  (import oo)
  (import gio/porttypes)
  (define-class (<character-input-port> <input-port>))
  (define-class (<character-output-port> <output-port>)))

(module gio/filtergenerics
  (:in :out :in! :out! :aflush :aflush!)
  (import generic-procedures)
  (define-generics :in :in! :out :out! :aflush :aflush!))

(module gio/filterporttypes
  (<filter-input-port> <filter-output-port>)
  (import oo)
  (import gio/filtergenerics)
  (import gio/porttypes)
  (define-class (<filter-input-port> <input-port>)
    (in (accessor :in) (modifier :in!)))
  (define-class (<filter-output-port> <output-port>)
    (out (accessor :out) (modifier :out!))
    (auto-flush (value #f) (accessor :aflush) (modifier :aflush!))))

(module gio/nativeporttypes
  (<native-input-port>
   <native-output-port>)
  (import oo)
  (import gio/filterporttypes)
  (define-class (<native-input-port> <filter-input-port>))
  (define-class (<native-output-port> <filter-output-port>)))

(module gio/nativecharporttypes
  (<native-character-input-port>
   <native-character-output-port>)
  (import oo)
  (import gio/nativeporttypes)
  (import gio/charporttypes)
  (define-class (<native-character-input-port>
                 <native-input-port> <character-input-port>))
  (define-class (<native-character-output-port>
                 <native-output-port> <character-output-port>)))

