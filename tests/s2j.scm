(import s2j)
(define-generic append)
(define-generic value-of)

;;test calling of constructor
(define sb (make <jstringbuffer> (->jstring "foo")))
;;test calling of normal method
(append sb (->jstring "foo"))
(append sb sb)
;;test calling of static methods
(value-of (->jstring "foo") (->jint 1234))
(value-of <jstring> (->jint 1234))
;;test overloading of Java methods in Scheme...
;;Wouldn't it be nice if StringBuffer.indexOf could take a char as an
;;argument? Well, now it can - as long as we call it from Scheme :)
(define-generic index-of)
(define-method (index-of (<jstringbuffer> buf) (<jchar> c))
  (index-of buf (make <jstring> (->jarray (list c) <jchar>))))
(index-of sb (->jstring "oo")) ;calls java method
(index-of sb (->jchar #\o)) ;calls scheme method
;test of "next-method" functionality.
(define-method (value-of (next: next-method)
                         (<jstring> s)
                         ((java-class "java.lang.Character") c))
  (display "\nFOUND\n")
  (next-method s c))
(value-of <jstring> (->jchar #\o))
;;test overloading of Java constructors in Scheme...
(define-constructor (<jstringbuffer> (next: next-method) (<jstring> s))
  (display "\nHERE\n")
  (next-method))
(make <jstringbuffer> (->jstring "foo"))

;array creation and access
(define a (java-array-new <jint> #(2 2 2)))
(a #(1 1 1))
(a #(1 1 1) (->jint 1))
(a '(1 1 1))
(map ->number (->list (->jarray (map ->jint (iota 10)) <jint>)))

;;access to static and instance fields
;;the only reason we use sisc's symbol class for testing is that the
;;JDK has no classes with public instance fields and I didn't want to
;;create a class just for testing.
(define <sisc.data.Symbol> (java-class "sisc.data.Symbol"))
(define s (make <sisc.data.Symbol> (->jstring "foo")))
(s 'symval)
(s '|caseSensitive|)
(<sisc.data.Symbol> '|caseSensitive|)

;;generic type conversions
((-> <list>) a)
((-> <number>) ((-> <jint>) 1))
((-> <boolean>) ((-> <jboolean>) #t))
((-> <character>) ((-> <jchar>) #\a))
((-> <string>) ((-> <jstring>) "foo"))
((-> <vector>) a)
((-> <symbol>) ((-> <jstring>) 'foo))

;;equivalence of primitive types and their java.lang classes
(define <java.lang.Integer> (java-class "java.lang.Integer"))
(java-assignable? <jobject> <java.lang.Integer>) ;=> #t
(java-assignable? <jobject> <jint>) ;=> #t
(java-assignable? <java.lang.Integer> <jint>) ;=>#t
(java-assignable? <jint> <java.lang.Integer>) ;=>#t
(java-assignable? <jint> <jshort>) ;=>#f
(java-assignable? <jshort> <jint>) ;=>#f
(java-instance? <jobject> (->jint 1)) ;=>#t

;;implementing Java interfaces in Scheme
(define <java.util.Comparator> (java-class "java.util.Comparator"))
(define <java.util.Arrays> (java-class "java.util.Arrays"))
(define-java-proxy (comparator fn) <java.util.Comparator>
  (method (|compare| (<jobject> obj1) (<jobject> obj2))
    (let ((x (java-unwrap obj1))
          (y (java-unwrap obj2)))
      (->jint (cond ((fn x y) -1)
                    ((fn y x) +1)
                    (else 0))))))
(define-generic sort)
(define (list-sort comp l)
  (let ([a (->jarray (map java-wrap l) <jobject>)])
    (sort <java.util.Arrays> a comp)
    (map java-unwrap (->list a))))
(list-sort (comparator <) '(3 4 2 1))
(list-sort (comparator string<?) '("foo" "bar" "baz"))

;exception handling
(define-generic char-at)
(define-generic print-stack-trace)
(call/fc
 (lambda () (char-at (->jstring "foo") (->jint 3)))
 (lambda (m e f)
   (print-stack-trace m)
   #f))
