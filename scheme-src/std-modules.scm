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
;;;;;;;;;;;;;;;; NATIVE MODULES ;;;;;;;;;;;;;;;

(define-syntax native-module
  (lambda (x)
    (syntax-case x ()
      ((_ name class)
       (let ((m (load-native-library (syntax-object->datum (syntax class)))))
         (with-syntax (((def ...) (datum->syntax-object
                                   (syntax name)
                                   (get-native-library-binding-names m))))
           (syntax (module name (def ...)
		     (define *module* (load-native-library class))
             (define def (get-native-library-binding
                          *module* (quote def)))
		     ...))))))))

(native-module logicops   "sisc.modules.SLogicOps")
(native-module networking "sisc.modules.SNetwork")
(native-module debugging  "sisc.debug.SDebug")
(native-module threading-native  "sisc.modules.SThread")
(native-module s2j-native        "sisc.modules.S2J")
(native-module hashtable-native  "sisc.modules.SHashtable")

(module threading
  (thread/new
   thread/start
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
   monitor-of
   monitor/new
   monitor/lock
   monitor/unlock
   monitor/wait
   monitor/notify
   monitor/notify-all
   monitor/synchronize
   monitor/synchronize-unsafe
   synchronized
   synchronized-unsafe
   parallel)
  (import threading-native)
  (include "../modules/thread.scm"))

(module hashtable
  (make-hashtable
   hashtable?
   hashtable/put!
   hashtable/get
   hashtable/get!
   hashtable/remove!
   hashtable/clear!
   hashtable->alist
   alist->hashtable
   hashtable/keys
   hashtable/for-each
   hashtable/map)
  (import hashtable-native)
  (import threading)
  (include "../modules/hashtable.scm"))

(module generic-procedures
  (meta
   type<=
   instance-of?
   define-generic
   define-method
   define-constructor
   make-generic-procedure
   make-generic-constructor
   make-method
   method-procedure
   method-types
   method-rest?
   generic-procedure-methods
   generic-procedure-next
   constructor
   add-method
   generic-java-procedure
   generic-java-constructor
   make)
  (import s2j-native)
  (import hashtable)
  (import threading)
  (include "../modules/generic-procedures.scm"))

(module s2j
  ((define-java-proxy java-proxy java-proxy-helper)
   java-class
   java-wrap
   java-unwrap
   java-synchronized
   java-instance?
   java-assignable?
   java-object?
   java-class?
   java-interface?
   java-array?
   java-null?
   java-class-of
   java-array-new
   java-new
   java-set!
   jnull
   ->
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
   <jvoid>
   <jboolean>
   <jchar>
   <jbyte>
   <jshort>
   <jint>
   <jlong>
   <jfloat>
   <jdouble>
   <jclass>
   <jmath>
   <jobject>
   <jprocess>
   <jruntime>
   <jstring>
   <jstringbuffer>
   <jsystem>
   <jthread>
   <jthrowable>
   <jexception>
   <expression>
   <input-port>
   <output-port>
   <list>
   <procedure>
   <number>
   <boolean>
   <character>
   <string>
   <vector>
   <void>
   <symbol>
   <object>)
  (import s2j-native)
  (import generic-procedures)
  (include "../modules/s2j.scm")
  (define (java-class name)
    (java/class (if (string? name) (string->symbol name) name)))
  (define java-synchronized	java/synchronized)
  (define java-wrap         java/wrap)
  (define java-unwrap		java/unwrap)
  (define java-instance?	java/instance?)
  (define java-assignable?	java/assignable?)
  (define java-object?		java/object?)
  (define java-class?		java/class?)
  (define java-interface?	java/interface?)
  (define java-array?		java/array?)
  (define java-null? 		java/null?)
  (define java-class-of		java/class-of)
  (define java-array-new  	java/array-new)
  (define java-new          java/new)
  (define java-set!         java/set!)
  (define jnull             (java/new))
  (define-generic ->)
  (define-method (-> ((meta <jboolean>) _)) ->jboolean)
  (define-method (-> ((meta <jchar>)_))     ->jchar)
  (define-method (-> ((meta <jbyte>) _))    ->jbyte)
  (define-method (-> ((meta <jshort>) _))   ->jshort)
  (define-method (-> ((meta <jint>) _))     ->jint)
  (define-method (-> ((meta <jlong>) _))    ->jlong)
  (define-method (-> ((meta <jfloat>) _))   ->jfloat)
  (define-method (-> ((meta <jdouble>) _))  ->jdouble)
  (define-method (-> ((meta <jstring>) _))  ->jstring)
  (define-method (-> ((meta <list>) _))     ->list)
  (define-method (-> ((meta <number>) _))   ->number)
  (define-method (-> ((meta <boolean>) _))  ->boolean)
  (define-method (-> ((meta <character>) _))    ->character)
  (define-method (-> ((meta <string>) _))   ->string)
  (define-method (-> ((meta <vector>) _))   ->vector)
  (define-method (-> ((meta <symbol>) _))   ->symbol)
  )
