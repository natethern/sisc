(import s2j)
(import generic-procedures)
(define-generic value-of)
(define-generic app (generic-java-procedure 'append)) ;;do not overwrite Scheme's append
(define-generic to-string)
;;test calling of constructor
(define sb (make <jstringbuffer> (->jstring "foo")))
;;test calling of normal method
(app sb (->jstring "foo"))
(app sb sb)
;;test calling of static methods
(value-of <jstring> (->jint 1234))
;;test overloading of Java methods and constructors in Scheme...
(define-constructor (<jstring> (next: next-method)
                               (<jchar> c))
  (next-method (->jarray (list c) <jchar>)))
(make <jstring>) ;calls Java method
(make <jstring> (->jchar #\o)) ;calls scheme method
;;test rest arg handling
;;Wouldn't it be nice if StringBuffer.append could take any number of
;;arguments? Well, now it can - as long as we call it from Scheme :)
(define-method (app (next: next-method)
                    (<jstringbuffer> buf) . rest)
  (for-each (lambda (x) (next-method buf x)) rest)
  buf)
(app sb (->jstring "foo") (->jint 1) (->jstring "bar"))
;scoping
(let ()
  (define-generic value-of)
  (define-method (value-of (next: next-method)
                           ((meta <jstring>) s)
                           (<jchar> c))
    (display "\nLOCAL\n")
    (next-method s c))
  (value-of <jstring> (->jchar #\o)))
(value-of <jstring> (->jchar #\o))

;array creation and access
(define a (java-array-new <jint> #(2 2 2)))
(a #(1 1 1))
(a #(1 1 1) (->jint 1))
(a '(1 1 1))
(map ->number (->list (->jarray (map ->jint (iota 10)) <jint>)))

;assignment
(define v (java-new))
(eq? v jnull)  ;#t
(java-null? v) ;#t
(java-set! v a)
(java-null? v) ;#f
(eq? v a)      ;#t
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

;;exception handling
(define-generic char-at)
(define-generic print-stack-trace)
(with/fc (lambda (m e) (print-stack-trace m) #f)
  (lambda () (char-at (->jstring "foo") (->jint 3))))
;;throwing exceptions from within proxy
(define <java.util.Iterator> (java-class "java.util.Iterator"))
(define <java.lang.UnsupportedOperationException>
  (java-class "java.lang.UnsupportedOperationException"))
(define <java.util.NoSuchElementException>
  (java-class "java.util.NoSuchElementException"))

(define-java-proxy (list-iterator-helper l) <java.util.Iterator>
  (method (has-next)
    (->jboolean (not (null? (unbox l)))))
  (method (next)
    (let ([ll (unbox l)])
      (if (null? ll)
          (throw (make-error (make <java.util.NoSuchElementException>)))
          (begin
            (set-box! l (cdr ll))
            (java-wrap (car ll))))))
  (method (remove)
    (error (make <java.lang.UnsupportedOperationException>))))
(define (list-iterator l)
  (list-iterator-helper (box l)))
(define-generic has-next)
(define-generic next)
(define-generic remove)
(define i (list-iterator '(1 2 3)))
(has-next i)
(next i)
(next i)
(next i)
(next i)
;;catching an exception thrown by a proxy.
(with/fc (lambda (m e) (print-stack-trace m) #f)
  (lambda () (remove i)))

;garbage collection
(let loop ([count 100])
  (if (> count 0)
      (begin
        (java-array-new <jdouble> 10000)
        (make <jstringbuffer> (->jint 10000))
        (loop (- count 1)))))

;awt
(define <java.awt.Frame> (java-class "java.awt.Frame"))
(define <java.awt.FlowLayout> (java-class "java.awt.FlowLayout"))
(define <java.awt.Button> (java-class "java.awt.Button"))
(define-generic set-layout)
(define-generic add)
(define-generic pack)
(define-generic show)
(define frame (make <java.awt.Frame>))
(set-layout frame (make <java.awt.FlowLayout>))
(for-each (lambda (s) (add frame (make <java.awt.Button> (->jstring s))))
          '(button1 button2 button3))
(pack frame)
(show frame)

;; class precedence list
(define <java.util.TreeSet> (java-class "java.util.TreeSet"))
(class-precedence-list <java.util.TreeSet>)
;; slot names
(class-direct-slot-names <number>)
