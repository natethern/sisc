;;the following come straight from the Chez Scheme User Manual
(define-syntax define-alias
  (syntax-rules ()
    [(_ x y)
     (define-syntax x
       (identifier-syntax y))]))
(define-syntax from
  (syntax-rules ()
    [(_ m id) (let () (import-only m) id)]))
(define-syntax import*
  (syntax-rules ()
    [(_ m) (begin)]
    [(_ m (new old))
     (module ((new tmp))
       (define-alias new tmp)
       (module (tmp)
         (import m)
         (define-alias tmp old)))]
    [(_ m id) (module (id) (import m))]
    [(_ m spec0 spec1 ...)
     (begin (import* m spec0)
            (import* m spec1 ...))]))
(define-syntax with-implicit
  (lambda (x)
    (syntax-case x ()
      ((_ (tid id ...) exp ...)
       (andmap identifier? #'(tid id ...))
       #'(with-syntax ((id (datum->syntax-object #'tid 'id)) ...)
           exp ...)))))
(define-syntax define-module
  (syntax-rules ()
    [(_ name interface defn ...)
     (interface name (defn ...))]))
(define-syntax define-compound-interface
  (syntax-rules ()
    [(_ name (element1 element ...))
     (define-syntax name
       (lambda (x)
         (syntax-case x ()
           [(_ n defs)
            #'(element1 (element ...) () n defs)])))]))
(define-syntax define-interface
  (syntax-rules ()
    [(_ name (export ...))
     (define-syntax name
       (lambda (x)
         (syntax-case x ()
           [(_ n defs)
            #'(_ () () n defs)]
           [(_ (element1 element (... ...)) exports n defs)
            (with-implicit (n export ...)
              #'(element1 (element (... ...)) (export ... . exports) n defs))]
           [(_ () exports n defs)
            (with-implicit (n export ...)
              #'(module n (export ... . exports) . defs))])))]))

;(define-interface foo (a b))
;(define-interface bar (c d))
;(define-compound-interface baz (foo bar))
;(define-module boo baz
;  (define a 1)
;  (define b 2)
;  (define c 3)
;  (define d 4))

; Returns the list of bindings exported by a named
; module
(module (module-exports)
  (define (module-record? x)
    (and (pair? x) (eq? (car x) 'module)
         (vector? (cdr x))))
  (define (module-interface? x)
    (and (vector? x) (= 3 (vector-length x))
         (eq? (vector-ref x 0) 'interface)))
  (define (module-exports modname)
    (let ([symrec (getprop modname '*sc-expander*)])
      (if (not (module-record? symrec))
          (error 'module-exports "~a is not a module."
                 modname))
      (let ([iface (cdr symrec)])
        (if (not (module-interface? iface))
            (error
             'module-exports
             "~a does not name a recognizable module"
             modname))
        (map syntax-object->datum
             (vector->list (vector-ref iface 1)))))))

;;;;;;;;;;;;;;;; NATIVE MODULES ;;;;;;;;;;;;;;;

(define-syntax native-module
  (lambda (x)
    (syntax-case x ()
      ((_ name class)
       (let ((m (load-native-library (syntax-object->datum (syntax class)))))
         (with-syntax (((def ...) (datum->syntax-object
                                   (syntax name)
                                   (native-library-binding-names m))))
           (syntax (module name (def ...)
                     (define *module* (load-native-library class))
                     (define def (native-library-binding
                                  *module* (quote def))) ...))))))))

(native-module logicops   "sisc.modules.SLogicOps$Index")
(native-module networking-native "sisc.modules.io.SNetwork$Index")
(native-module debugging-native  "sisc.modules.SDebug$Index")
(native-module threading-native  "sisc.modules.SThread$Index")
(native-module types-native      "sisc.modules.STypes$Index")
(native-module s2j-reflection    "sisc.modules.s2j.Reflection$Index")
(native-module s2j-conversion    "sisc.modules.s2j.Conversion$Index")
(native-module hashtable-native  "sisc.modules.hashtable.Primitives$Index")
(native-module record-native     "sisc.modules.record.Primitives$Index")
(native-module binary-io-native  "sisc.modules.io.BinaryIO$Index")
(native-module string-io-native  "sisc.modules.io.StringIO$Index")
(native-module serial-io-native  "sisc.modules.io.SerialIO$Index")
(native-module file-manipulation-native "sisc.modules.io.FileManipulation$Index")

(module misc
    (wrap-symbol
     dynamic-freeze
     define-values
     define-simple-syntax
     compose
     total-order)
  (include "misc.scm"))

(module threading
  (thread?
   thread/new
   thread/start
   thread/spawn
   thread/yield
   thread/interrupt
   thread/join
   thread/result
   thread/current
   thread/notify
   thread/notify-all
   thread/wait
   thread/name
   thread/name!
   thread/priority
   thread/daemon?
   thread/daemon!
   thread/priority!
   thread/state
   thread/interrupted?
   thread/holds-lock?
   thread/_active-thread-count
   mutex?
   mutex-of
   mutex/new
   mutex/lock!
   mutex/unlock!
   condvar?
   condvar/new
   condvar/notify
   condvar/notify-all
   mutex/synchronize
   mutex/synchronize-unsafe
   synchronized
   synchronized-unsafe
   parallel)
  (import threading-native)
  (include "thread.scm"))

(module buffers
  (make-buffer
   buffer
   buffer?
   buffer-ref
   buffer-set!
   buffer-length
   buffer-copy!
   open-input-buffer
   open-output-buffer
   get-output-buffer)
  (import binary-io-native)
  (include "io/buffer.scm"))

(module file-manipulation
  (directory-list
   file-hidden? 
   file-is-directory?
   file-is-file? 
   file-is-readable? 
   file-is-writeable? 
   file-length
   file-last-modified
   file-rename!
   file-set-last-modified!
   file-set-read-only!
   file-delete!
   get-parent-url
   make-directory!
   make-directories!)
  (import file-manipulation-native)
  (define directory-list)
  (define file-hidden?)
  (define file-is-directory?)
  (define file-is-file?)
  (define file-is-readable?)
  (define file-is-writeable?)
  (define file-length)
  (define file-last-modified)
  (define file-rename!)
  (define file-set-last-modified!)
  (define file-set-read-only!)
  (define file-delete!)
  (define get-parent-url)
  (define make-directory!)
  (define make-directories!)
  (define (normalize proc)
    (lambda (path)
      (proc (normalize-url (current-directory) path))))
  (set! directory-list (normalize directory/list))
  (set! file-hidden? (normalize file/hidden?))
  (set! file-is-directory? (normalize file/is-directory?))
  (set! file-is-file? (normalize file/is-file?))
  (set! file-is-readable? (normalize file/is-readable?))
  (set! file-is-writeable? (normalize file/is-writeable?))
  (set! file-length (normalize file/length))
  (set! file-last-modified (normalize file/last-modified))
  (set! file-rename! 
    (lambda (f1 f2)
      (file/rename! (normalize-url f1) (normalize-url f2))))
  (set! file-set-last-modified! 
    (lambda (f1 v)
      (file/set-last-modified! (normalize-url f1) v)))
  (set! file-set-read-only! (normalize file/set-read-only!))
  (set! file-delete! (normalize file/delete!))
  (set! get-parent-url (normalize _get-parent-url))
  (set! make-directory! (normalize _make-directory!))
  (set! make-directories! (normalize _make-directories!)))

(module hashtable
    (make-hashtable
     hashtable?
     hashtable/put!
     hashtable/get
     hashtable/get!
     hashtable/remove!
     hashtable/clear!
     hashtable/size
     hashtable->alist
     alist->hashtable
     hashtable/keys
     hashtable/for-each
     hashtable/map)
  (import hashtable-native)
  (import threading)
  (include "hashtable/hashtable.scm"))

(module procedure-properties
  (procedure-property
   set-procedure-property!
   procedure-property!)
  (import threading)
  (include "procedure-properties.scm"))

(module type-system
    (make-type
     type-of
     native-type-of
     type<=
     type=
     instance-of?
     types<=
     types=
     instances-of?
     compare-types
     <value>
     <eof>
     <symbol>
     <list>
     <procedure>
     <number>
     <boolean>
     <char>
     <string>
     <vector>
     type-of-hook
     type<=-hook
     compare-types-hook)
  (import* types-native
           (native-type-of type-of)
           (native-type<= type<=)
           make-type)
  (import procedure-properties)
  (import misc)
  (include "type-system.scm"))

(module record
    (define-record-type
     define-struct
     record?
     record-type
     record-constructor
     record-predicate
     record-accessor
     record-modifier
     make-record-type
     record-type?
     record-type-name
     record-type-field-tags
     <record>)
  (import record-native)
  (import misc)
  (import* type-system
           make-type
           type<=
           type-of-hook
           type<=-hook
           compare-types-hook)
  (include "record/record.scm")
  (type-of-hook 'record record-type-of-hook)
  (type<=-hook  'record record-type<=-hook))

(module generic-procedures
    (make-generic-procedure
     generic-procedure-methods
     add-method
     add-methods
     applicable-methods
     define-generic
     define-generics
     define-method
     define-methods
     (let-monomorphic first-method-procedure)
     ;;method stuff
     <method>
     make-method
     method?
     method-procedure
     method-types
     method-rest?
     method-arity
     method=
     method-applicable?
     compare-methods
     method)
  (import* record
           define-struct
           define-record-type)
  (import* type-system
           type-of
           types=
           types<=
           compare-types)
  (import hashtable)
  (import threading)
  (import procedure-properties)
  (import misc)
  (include "generic-procedures/methods.scm")
  (include "generic-procedures/procedures.scm"))

(module s2j
    (java-new
     ;;classes
     java-class
     java-class?
     java-class-name
     java-class-flags
     java-class-declaring-class
     java-class-declared-superclasses
     java-class-declared-classes
     java-class-declared-constructors
     java-class-declared-methods
     java-class-declared-fields
     java-class-precedence-list
     define-java-class
     define-java-classes
     ;;constructors
     java-constructor?
     java-constructor-name
     java-constructor-flags
     java-constructor-declaring-class
     java-constructor-parameter-types
     java-constructor-procedure
     java-constructor-method
     ;;methods
     java-method?
     java-method-name
     java-method-flags
     java-method-declaring-class
     java-method-parameter-types
     java-method-return-type
     java-method-procedure
     java-method-method
     generic-java-method
     define-generic-java-method
     define-generic-java-methods
     ;;fields
     java-field?
     java-field-name
     java-field-flags
     java-field-declaring-class
     java-field-type
     java-field-accessor-procedure
     java-field-modifier-procedure
     java-field-accessor-method
     java-field-modifier-method
     generic-java-field-accessor
     generic-java-field-modifier
     define-generic-java-field-accessor
     define-generic-java-field-modifier
     define-generic-java-field-accessors
     define-generic-java-field-modifiers
     ;;arrays
     java-array-class
     java-array?
     java-array-new
     java-array-ref
     java-array-set!
     java-array-length
     ;;proxies
     java-proxy-class
     java-proxy-dispatcher
     (define-java-proxy java-proxy-method-handler)
     ;;misc
     s2j/clear-reflection-cache!
     java-synchronized
     java-wrap
     java-unwrap
     java-null
     java-object?
     java-interface?
     java-null?
     ;;primitive types
     <jvalue>
     <jvoid>
     <jboolean>
     <jchar>
     <jbyte>
     <jshort>
     <jint>
     <jlong>
     <jfloat>
     <jdouble>
     ;;conversions
     ->jboolean
     ->jchar
     ->jbyte
     ->jshort
     ->jint
     ->jlong
     ->jfloat
     ->jdouble
     ->jstring
     ->jarray
     ->boolean
     ->character
     ->number
     ->string
     ->symbol
     ->vector
     ->list
     jnull
     display-java-stack-trace)
  (import* record
           define-record-type)
  (import* type-system
           make-type
           type<=
           type-of-hook
           type<=-hook
           compare-types-hook)
  (import* generic-procedures
           make-method
           make-generic-procedure
           add-methods
           add-method)
  (import* threading
           mutex/new
           mutex/synchronize)
  (import misc)
  (import hashtable)
  (import s2j-reflection)
  (import s2j-conversion)
  (define <jvalue> (make-type '|sisc.modules.s2j.JavaObject|))
  (define jnull (java/null))
  (include "s2j/reflection.scm")
  (include "s2j/misc.scm")
  (type-of-hook       'java java-type-of-hook)
  (type<=-hook        'java java-type<=-hook)
  (compare-types-hook 'java java-compare-types-hook)
  (initialize-exception-handling))

(module oo
    (<slot>
     slot?
     slot-name
     slot-class
     slot-accessor
     slot-modifier
     slot-modifier-method
     <class>
     class?
     class-name
     class-direct-superclasses
     class-precedence-list
     class-direct-slots
     <object>
     make-class
     define-class
     make
     initialize)
  (import* record
           define-record-type)
  (import* record-native
           make-record
           record-ref
           record-set!)
  (import* type-system
           type<=
           type-of
           instance-of?
           <value>
           type-of-hook
           type<=-hook
           compare-types-hook)
  (import* generic-procedures
           make-method
           add-method
           define-generic
           define-method
           method)
  (import misc)
  (include "oo/slots.scm")
  (include "oo/classes.scm")
  (include "oo/misc.scm")
  (initialize-classes)
  (type<=-hook        'oo oo-type<=-hook)
  (compare-types-hook 'oo oo-compare-types-hook))


(include "io/generic-io-types.scm")
(module generic-io-types
  (<port> <input-port> <output-port>
          <character-input-port> <character-output-port>
          <filter-input-port> <filter-output-port>
          <native-input-port> <native-output-port>
          <native-character-input-port> <native-character-output-port>)
  (import gio/basetype)
  (import gio/porttypes)
  (import gio/charporttypes)
  (import gio/filterporttypes)
  (import gio/nativeporttypes)
  (import gio/nativecharporttypes))

(module generic-io
  (char-ready?
   read
   peek-char
   read-char
   read-code
   read-block
   read-string
   flush-output-port
   write
   display
   write-char
   write-block
   write-string
   open-input-file
   open-output-file
   open-binary-input-file
   open-binary-output-file
   close-input-port
   close-output-port
   input-port?
   output-port?
   character-input-port?
   character-output-port?
   binary-input-port?
   binary-output-port?
   make-wrapped-constructor
   unwrap-native-input-port
   unwrap-native-output-port
   gio/char-ready?
   gio/read
   gio/read-char
   gio/read-code
   gio/read-block
   gio/read-string
   gio/flush-output-port
   gio/write
   gio/display
   gio/write-char
   gio/write-block
   gio/write-string
   gio/close
   <port> <input-port> <output-port>
   <character-input-port> <character-output-port>
   <filter-input-port> <filter-output-port>
   <native-input-port> <native-output-port>
   <native-character-input-port> <native-character-output-port>)
  (import generic-io-types)
  (import generic-procedures)
  (import oo)
  (import type-system)
  (import s2j)
  (import* binary-io-native
           (native-read-block read-block)
           (native-write-block write-block)
           (native-open-binary-input-file open-binary-input-file)
           (native-open-binary-output-file open-binary-output-file))
  (import gio/filtergenerics)
  (include "io/generic-io.scm")
  (set! unwrap-native-output-port :out)
  (set! unwrap-native-input-port :in)
  (set! close-input-port gio/close)
  (set! close-output-port gio/close))

(module binary-io
  (read-block
   write-block
   make-buffer
   buffer
   buffer?
   buffer-ref
   buffer-set!
   buffer-length
   buffer-copy!
   open-binary-input-file
   open-binary-output-file
   call-with-binary-input-file
   call-with-binary-output-file
   with-binary-input-from-file
   with-binary-output-to-file
   binary-input-port?
   binary-output-port?)
  (import buffers)
  (import* generic-io
           read-block
           write-block
           open-binary-input-file
           open-binary-output-file
           close-input-port
           close-output-port
           binary-input-port?
           binary-output-port?)
  (include "io/binary-io.scm"))

(module string-io
  (with-input-from-string
   with-output-to-string
   call-with-input-string
   call-with-output-string
   open-input-string
   open-output-string
   get-output-string
   string-input-port?
   string-output-port?
   open-source-input-string)
  (import oo)
  (import generic-io)
  (import* type-system instance-of?)
  (import string-io-native)
  (include "io/string-io.scm"))

(import generic-io)

; Good Lord what a hack!
(for-each 
  (lambda (x) 
    (putprop x (eval (sc-expand x)))
    ($sc-put-cte x `(global . ,x)))
 '(char-ready?
   read
   peek-char
   read-char
   read-code
   read-string
   flush-output-port
   write
   display
   newline
   write-char
   write-string
   open-input-file
   open-output-file
   close-input-port
   close-output-port
   input-port?
   output-port?))
   
(let ()
  (import type-system)
  (import oo)
  (on-repl-start
   (lambda ()
     (let ([curin (current-input-port)]
           [curout (current-output-port)])
       (unless (instance-of? curin <native-input-port>)
         (current-input-port (make <native-input-port> curin)))
       (unless (instance-of? curout <native-output-port>)
         (current-output-port (make <native-output-port> curout)))))))

(module serial-io
  (serialize
   deserialize
   open-serial-input-port
   open-serial-output-port
   call-with-serial-input-port
   call-with-serial-output-port
   with-serial-input-from-port
   with-serial-output-to-port
   call-with-serial-input-file
   call-with-serial-output-file
   with-serial-input-from-file
   with-serial-output-to-file
   serial-input-port?
   serial-output-port?)
  (import* serial-io-native
           (_serialize serialize)
           (_deserialize deserialize)
           (_open-serial-input-port open-serial-input-port)
           (_open-serial-output-port open-serial-output-port))
  (import oo)
  (import generic-io)
  (import* binary-io call-with-binary-input-file call-with-binary-output-file)
  (import* type-system instance-of?)
  (include "io/serial-io.scm"))

(module networking
  (open-tcp-listener
   accept-tcp-socket
   open-tcp-socket
   open-binary-socket-input-port
   open-binary-socket-output-port
   open-socket-input-port
   open-socket-output-port
   close-socket
   get-host-ip-by-name
   get-host-name-by-ip
   get-local-host
   open-udp-listen-socket
   open-udp-socket
   open-multicast-socket
   join-multicast-group
   leave-multicast-group
   set-multicast-ttl!
   set-so-timeout!
   socket?
   server-socket?)
  (import* networking-native
           open-tcp-listener
           accept-tcp-socket
           open-tcp-socket
           (_open-binary-socket-input-port open-binary-socket-input-port)
           (_open-binary-socket-output-port open-binary-socket-output-port)
           (_open-socket-input-port open-socket-input-port)
           (_open-socket-output-port open-socket-output-port)
           close-socket
           get-host-ip-by-name
           get-host-name-by-ip
           get-local-host
           open-udp-listen-socket
           open-udp-socket
           open-multicast-socket
           join-multicast-group
           leave-multicast-group
           set-multicast-ttl!
           set-so-timeout!
           socket?
           server-socket?)
  (import generic-io)
  (import oo)
  (include "io/networking.scm"))

(module pretty-printing
  (pretty-print
   generic-write)
  (import string-io)
  (include "../modules/pp.scm"))

(module debugging
    (show
     express
     compile
     error-continuation-k
     annotated?
     trace-depth
     trace-call
     trace-lambda
     trace-let
     trace
     untrace
     stack-trace
     set-breakpoint!
     clear-breakpoint!
     continue
     stack-trace
     print-stack-trace)
  (import debugging-native)
  (import pretty-printing)
  (include "debug.scm"))

(module libraries
  (require-library
   provide-library
   library-exists?
   library-loaded?
   compile-file)
  (import threading)
  (import hashtable)
  (import serial-io)
  (import* debugging compile)
  (include "libraries.scm")
  (install))

(module pattern-matching
  ((match+ match-help match-help1 clause-body let-values**
           guard-body convert-pat mapper my-backquote extend-backquote
           sexp-dispatch)
         (trace-match+ match-help match-help1 clause-body let-values**
           guard-body convert-pat mapper my-backquote extend-backquote
           sexp-dispatch)
         (match match-help match-help1 clause-body let-values**
           guard-body convert-pat mapper my-backquote extend-backquote
           sexp-dispatch)
         (trace-match match-help match-help1 clause-body let-values**
           guard-body convert-pat mapper my-backquote extend-backquote
           sexp-dispatch)
         match-equality-test)
    (import debugging)
    (include "match.ss"))

(module os
  (process?
   process-terminated?
   wait-for-process
   get-process-stdout
   get-process-stderr
   get-process-stdin
   spawn-process
   spawn-process-with-environment
   spawn-process/env)
  (import s2j)
  (import* type-system instance-of?)
  (include "os/process.scm")
  (define spawn-process/env)
  (set! spawn-process/env spawn-process-with-environment))

(module optimizer
  (optimize initialize)
  (import pattern-matching)
  (import debugging)
  ;;TODO: we really want to import the srfi-11 module here, but srfis
  ;;are not part of the core build
  (include "srfi/srfi-11.scm")
  (include "optimizer/ds.scm")
  (include "optimizer/helpers.scm")
  (include "optimizer/logic.scm")
  (include "optimizer/main.scm")
  (define optimize opt:optimize))

;; Standard imports
(import libraries)
(import optimizer)
(putprop 'pretty-print @pretty-printing::pretty-print)
(import pretty-printing)

(initialize)
(set! current-optimizer (make-parameter optimize))

;;load and import srfi-0
(module srfi-0 (cond-expand)
  (include "srfi/srfi-0.scm")
  (add-feature 'srfi-0))
(import srfi-0)

;;load and import srfi-22
;; we support this directly so we don't have to load srfi.scc in scripts
(module srfi-22 (srfi-22-prepare main main-hook)
  (include "srfi/srfi-22/srfi-22.scm")
  (add-feature 'srfi-22))
(import srfi-22)

;;Final initialization
(let ()
  (import s2j)
  (s2j/clear-reflection-cache!))

