(import old-s2j)
(import s2j-reflection)
(import old-generic-procedures)

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
(define-method (create ((meta <jstring>) class)
                       (<jchar> c))
  (make <jstring> (->jarray (list c) <jchar>)))
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
;;test object initialization
(define-method (create (next: next-method)
                       ((meta <jstringbuffer>) class)
                       . rest)
  (next-method class))
(define-method (initialize (<jstringbuffer> sb) . rest)
  (apply app sb rest))
(make <jstringbuffer> (->jstring "foo") (->jint 1) (->jstring "bar"))
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
;;define methods on Scheme types
(define-method (app (<list> l) . rest)
  (apply append l rest))
(define-method (app (<vector> v) . rest)
  (list->vector (apply append (map vector->list (cons v rest)))))
(define-method (app (<string> s) . rest)
  (apply string-append s rest))
(app '(1 2) '(3 4))
(app '#(1 2) '#(3 4))
(app "foo" "bar")

;array creation and access
(define a (java-array-new <jint> '#(2 2 2)))
(a '#(1 1 1))
(a '#(1 1 1) (->jint 1))
(a '(1 1 1))
(map ->number (->list (->jarray (map ->jint (iota 10)) <jint>)))

;;access to static and instance fields
;;the only reason we use sisc's symbol class for testing is that the
;;JDK has no classes with public instance fields and I didn't want to
;;create a class just for testing.
(define <sisc.data.Symbol> (java-class "sisc.data.Symbol"))
(define s (make <sisc.data.Symbol> (->jstring "foo")))
(s 'symval)
(s 'case-sensitive)
(<sisc.data.Symbol> '|caseSensitive|)
;;bean field access
(define <java.io.File> (java-class "java.io.File"))
(define file (make <java.io.File> (->jstring "/foo/bar.baz")))
(file '(canonical-file name)) ;=> bar.baz

;;equality
(define jstring-null (java-null <jstring>))
(eq? jstring-null jnull) ;=> #f
(eqv? jstring-null jnull) ;=> #f
(equal? jstring-null jnull) ;=> #t
(eq? <jstring> jstring-null) ;=> #f
(eqv? <jstring> jstring-null) ;=> #f
(equal? <jstring> jstring-null) ;=> #f
(define <java.util.Date> (java-class "java.util.Date"))
(define d (make <java.util.Date>))
(define time (d '(time)))
(define d1 (make <java.util.Date> time))
(define d2 (make <java.util.Date> time))
(eq? d1 d2) ;=> #f
(eqv? d1 d2) ;=> #f
(equal? d1 d2) ;=> #t
(eq? (java-null <jstring>) (java-null <jstring>)) ;=> may return #f
(eqv? (java-null <jstring>) (java-null <jstring>)) ;=> #t
(equal? (java-null <jstring>) (java-null <jstring>)) ;=> #t

;;special handling of jnull
(value-of <jstring> jnull) ;=> #<java java.lang.String null>
(type-of jnull) ;=> <java.lang.Object>
(instance-of? jstring-null <jstring>) ;=> #t
(define aa (java-array-new <jstring> '#(2 2 2)))
(aa '#(0 0 0)) ;=> #<jnull java.lang.String>

;;<bot>, <top>, <jclass>
(define-generic top-bot-test)
(define-method (top-bot-test (<top> x)) 'top)
(define-method (top-bot-test (<jclass> x)) 'class)
(define-method (top-bot-test (<number> x)) 'number)
(define-method (top-bot-test (<bot> x)) 'bot)
(top-bot-test 'foo) ;=> 'top
(top-bot-test <jstring>) ;=> 'class
(top-bot-test 1) ;=> 'number
(top-bot-test jnull) ;=> 'top
(top-bot-test (java-null <number>)) ;=> 'number

;;generic type conversions
((-> <list>) a)
((-> <number>) ((-> <jint>) 1))
((-> <boolean>) ((-> <jboolean>) #t))
((-> <character>) ((-> <jchar>) #\a))
((-> <string>) ((-> <jstring>) "foo"))
((-> <vector>) a)
((-> <symbol>) ((-> <jstring>) 'foo))

;;primitive types are sub-types of their java.lang classes
(define <java.lang.Integer> (java-class "java.lang.Integer"))
(java-assignable? <jobject> <java.lang.Integer>) ;=> #t
(java-assignable? <jobject> <jint>) ;=> #t
(java-assignable? <java.lang.Integer> <jint>) ;=>#t
(java-assignable? <jint> <java.lang.Integer>) ;=>#f
(java-assignable? <jint> <jshort>) ;=>#f
(java-assignable? <jshort> <jint>) ;=>#f
(java-instance? <jobject> (->jint 1)) ;=>#t
(java-instance? <java.lang.Integer> (->jint 1)) ;=>#t
(java-instance? <jint> (->jint 1)) ;=>#t
(java-instance? <jint> (make <java.lang.Integer> (->jint 1))) ;=>#f

;;implementing Java interfaces in Scheme
(define <java.util.Comparator> (java-class "java.util.Comparator"))
(define <java.util.Arrays> (java-class "java.util.Arrays"))
(define <comparator-proxy> (java-proxy-class <java.util.Comparator>))
(define (comparator fn)
  (make <comparator-proxy>
        (java-proxy-method-dispatcher fn)))
(define-java-proxy-method (compare (<procedure> fn)
                                   (<java.util.Comparator> p)
                                   (<jobject> obj1)
                                   (<jobject> obj2))
  (let ([x (java-unwrap obj1)]
        [y (java-unwrap obj2)])
    (->jint (cond [(fn x y) -1]
                  [(fn y x) +1]
                  [else 0]))))
(define-generic sort)
(define (list-sort fn l)
  (let ([a (->jarray (map java-wrap l) <jobject>)])
    (sort <java.util.Arrays> a (comparator fn))
    (map java-unwrap (->list a))))
(list-sort < '(3 4 2 1))
(list-sort string<? '("foo" "bar" "baz"))

;;exception handling
(define-generic char-at)
(with/fc (lambda (m e) (print-exception (make-exception m e)))
  (lambda () (char-at (->jstring "foo") (->jint 3))))
;;throwing exceptions from within proxy
(define <java.util.Iterator> (java-class "java.util.Iterator"))
(define <java.lang.UnsupportedOperationException>
  (java-class "java.lang.UnsupportedOperationException"))
(define <java.util.NoSuchElementException>
  (java-class "java.util.NoSuchElementException"))
(define <iterator-proxy> (java-proxy-class <java.util.Iterator>))
(define-class (<list-iterator>) (value #f))
(define-method (initialize (<list-iterator> i) (<top> value))
  (i 'value value))
(define-java-proxy-method (has-next (<list-iterator> i)
                                    (<java.util.Iterator> p))
  (->jboolean (not (null? (i 'value)))))
(define-java-proxy-method (next (<list-iterator> i)
                                (<java.util.Iterator> p))
  (let ([ll (i 'value)])
    (if (null? ll)
        (error (make <java.util.NoSuchElementException>))
        (begin
          (i 'value (cdr ll))
          (java-wrap (car ll))))))
(define-java-proxy-method (remove (<list-iterator> i)
                                  (<java.util.Iterator> p))
  (error (make <java.lang.UnsupportedOperationException>)))
(define-generic has-next)
(define-generic next)
(define-generic remove)
(define i (make <iterator-proxy>
                (java-proxy-method-dispatcher
                 (make <list-iterator> '(1 2 3)))))
(has-next i)
(next i)
(next i)
(next i)
(next i)
;;catching an exception thrown by a proxy.
(with/fc (lambda (m e) (print-exception (make-exception m e)) #f)
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
;; applicable methods
(define ts (make <java.util.TreeSet>))
(define-generic remove-all)
(applicable-methods (generic-procedure-next remove-all)
                    (list <java.util.TreeSet> <java.util.TreeSet>))


;;check exception handling in reflection api

(define (find pred l)
  (and (not (null? l))
       (if (pred (car l))
           (car l)
           (find pred (cdr l)))))
(java/wrap) ;;arg size exception
(java/unwrap 1) ;;type error
(java/class '|foo|) ;;class not found
(java/array-class (java/null) 1) ;;illegal null
(java/array-class <jvoid> 1) ;;illegal void
(java/array-class <jint> -1) ;;illegal dimensions
(java/array-new (java/null) '(1 1 1)) ;;illegal null
(java/array-new <jvoid> '(1 1 1)) ;;illegal void
(java/array-new <jint> '(1 -1 1)) ;;illegal dimensions
(define <jnumber> (java/class '|java.lang.Number|))
(java/invoke-constructor (car (java/constructors <jnumber>))
                         (list)) ;;constructor on abstract class
(define <jaccessible-object>
  (java/class '|java.lang.reflect.AccessibleObject|))
(java/invoke-constructor (car (java/constructors
                               <jaccessible-object>))
                         (list)) ;;access to protected constructor
(define <jurl> (java/class '|java.net.URL|))
(define make-url-from-string
  (find (lambda (c) (equal? (java/parameter-types c)
                            (list <jstring>)))
        (java/constructors <jurl>)))
(java/invoke-constructor make-url-from-string
                         (list)) ;;illegal arguments
(java/invoke-constructor make-url-from-string
                         (list (->jint 1))) ;;illegal arguments
(java/invoke-constructor make-url-from-string
                         (list (->jstring "foo://bar"))) ;;malformed url
(define <jreader> (java/class '|java.io.Reader|))
(define reader-lock
  (find (lambda (f) (eq? (java/name f) 'lock))
        (java/fields <jreader>)))
(define <jstring-reader> (java/class '|java.io.StringReader|))
(define str
  (java/invoke-constructor
   (car (java/constructors <jstring-reader>))
   (list (->jstring "foo"))))
(java/field-ref reader-lock str) ;;illegal access
(define <jstream-tokenizer> (java/class '|java.io.StreamTokenizer|))
(define st
  (java/invoke-constructor
   (find (lambda (c) (equal? (java/parameter-types c)
                             (list <jreader>)))
         (java/constructors <jstream-tokenizer>))
   (list str)))
(define tokenizer-sval
  (find (lambda (f) (eq? (java/name f) 'sval))
        (java/fields <jstream-tokenizer>)))
(java/field-ref tokenizer-sval (java/null)) ;;illegal null
(java/field-ref tokenizer-sval str) ;;illegal arg
(java/field-set! tokenizer-sval
                 (java/null)
                 (->jstring "foo")) ;;illegal null
(java/field-set! tokenizer-sval
                 str
                 (->jstring "foo")) ;;illegal arg
(java/field-set! tokenizer-sval
                 st
                 (->jint 1)) ;;illegal arg
(java/field-set! reader-lock str (->jstring "foo")) ;;illegal access
(define url-set
  (find (lambda (m) (and (eq? (java/name m) 'set)
                         (equal? (java/parameter-types m)
                                 (list <jstring> <jstring> <jint>
                                       <jstring> <jstring>))))
        (java/methods <jurl>)))
(define url (make-url-from-string
             (->jstring "http://sisc.sourceforge.net")))
(java/invoke-method url-set
                    url
                    (list (->jstring "http")
                          (->jstring "sisc.sourceforge.net")
                          (->jint 80)
                          (->jstring "foo")
                          (->jstring "bar"))) ;;illegal access
(define stream-mark
  (find (lambda (m) (eq? (java/name m) 'mark))
        (java/methods <jreader>)))
(java/invoke-method stream-mark
                    (java/null)
                    (list (->jint 1))) ;;illegal null
(java/invoke-method stream-mark
                    url
                    (list (->jint 1))) ;;illegal args
(java/invoke-method stream-mark
                    str
                    (list)) ;;illegal args
(java/invoke-method stream-mark
                    str
                    (list (->jstring "foo"))) ;;illegal args
(java/invoke-method stream-mark
                    str
                    (list (->jint -1))) ;;IllegalArgumentException
(java/proxy-class <jurl>) ;;illegal interfaces
(java/proxy-class (java/null)) ;;illegal null
(java/array-ref (java/null) 1) ;;illegal null
(java/array-ref (->jint 1) 1) ;;not an array
(define ar (java/array-new <jint> '(1)))
(java/array-ref ar 2) ;;out of bounds
(java/array-set! (java/null) 1 (->jint 1)) ;;illegal null
(java/array-set! (->jint 1) 1 (->jint 1)) ;;not an array
(java/array-set! ar 0 (->jstring "foo")) ;;type incompatible
(java/array-set! ar 2 (->jint 1)) ;;out of bounds
