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

(native-module logicops-module "sisc.modules.SLogicOps")
(native-module networking-module "sisc.modules.SNetwork")
(native-module threading-module "sisc.modules.SThread")
(native-module debug-module "sisc.debug.SDebug")
(native-module s2j-module "sisc.modules.S2J")
(native-module hashtable-module "sisc.modules.SHashtable")

(module hashtable
  (make-hashtable
   hashtable?
   hashtable/put!
   hashtable/get
   hashtable/remove!
   hashtable/clear!
   hashtable->alist
   alist->hashtable
   hashtable/keys
   hashtable/for-each
   hashtable/map)
  (import hashtable-module)
  ;;The following are quite inefficient. To get around that we'd have
  ;;to expose java collection iterators.
  (define (hashtable/for-each proc ht)
    (for-each (lambda (x) (proc (car x) (cdr x))) (hashtable->alist ht)))
  (define (hashtable/map proc ht)
    (map (lambda (x) (proc (car x) (cdr x))) (hashtable->alist ht))))

(module generic-functions 
  ((define-generic generic-function)
   (define-method add-method generic-function-name)
   (define-constructor add-constructor)
   make)
  (import s2j-module)
  (import hashtable)
  (import threading-module)
  (include "../modules/generic-functions.scm"))

(module s2j
  (define-generic
   define-method
   define-constructor
   make
   (define-java-proxy java-proxy java-proxy-helper)
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
  (import s2j-module)
  (import generic-functions)
  (include "../modules/s2j.scm")
  (define (java-class name)
    (java/class (if (string? name) (string->symbol name) name)))
  (define java-synchronized	java/synchronized)
  (define java-wrap		java/wrap)
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
  (define-generic ->)
  (define-method (-> (<jboolean> _))	->jboolean)
  (define-method (-> (<jchar> _))	->jchar)
  (define-method (-> (<jbyte> _))	->jbyte)
  (define-method (-> (<jshort> _))	->jshort)
  (define-method (-> (<jint> _))	->jint)
  (define-method (-> (<jlong> _))	->jlong)
  (define-method (-> (<jfloat> _))	->jfloat)
  (define-method (-> (<jdouble> _))	->jdouble)
  (define-method (-> (<jstring> _))	->jstring)
  (define-method (-> (<list> _))	->list)
  (define-method (-> (<number> _))	->number)
  (define-method (-> (<boolean> _))	->boolean)
  (define-method (-> (<character> _))	->character)
  (define-method (-> (<string> _))	->string)
  (define-method (-> (<vector> _))	->vector)
  (define-method (-> (<symbol> _))	->symbol)
  )
