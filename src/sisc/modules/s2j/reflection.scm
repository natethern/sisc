;;;;;;;;;; HELPERS ;;;;;;;;;;

(define (memoize p)
  (let ([memo (make-hashtable eqv?)])
    (lambda (x) (hashtable/get! memo x (lambda () (p x))))))

(define (filter-map f lis)
  (let recur ((lis lis))
    (if (null? lis) 
        lis
        (let ((tail (recur (cdr lis))))
          (cond ((f (car lis)) => (lambda (x) (cons x tail)))
                (else tail))))))


;;;;;;;;;; CLASS PRECEDENCE LIST ;;;;;;;;;;

(define (java-class-declared-superclasses jclass)
  ((if (java/array-class? jclass)
       java-array-superclasses
       java-normal-superclasses)
   jclass))

(define (java-normal-superclasses jclass)
  (let ([super (java/superclass jclass)]
        [interfaces (java/interfaces jclass)])
    (if (java/null? super)
        (if (null? interfaces)
            (if (java/interface? jclass)
                '()
                (java-primitive-superclasses jclass))
            interfaces)
        (cons super interfaces))))

;;let X[n] denote the type of an array of type X with n dimensions.
;;
;;X[n]'s superclasses are B[n], I_0[n] ... I_k[n] where B is X's
;;superclass and I_0...I_k are X's superinterfaces. If X has no
;;superclass and no superinterfaces and is not an interface (i.e. X is
;;a primitive type or Object) then X[n]'s superclasses are
;;Object[n-1], Serializable[n-1] and Cloneable[n-1].
(define java-array-superclasses
  (let ([<java.lang.object-class>
         (java/class '|java.lang.Object|)]
        [<java.io.serializable-class>
         (java/class '|java.io.Serializable|)]
        [<java.lang.cloneable-class>
         (java/class '|java.lang.Cloneable|)])
    (lambda (jclass)
      (let loop ([level 0]
                 [c jclass])
        (if (java/array-class? c)
            (loop (+ level 1) (java/component-type c))
            (let ([supers (java-normal-superclasses c)])
              (if (and (null? supers) (not (java/interface? c)))
                  (let ([level (- level 1)])
                    (map (lambda (c)
                           (if (zero? level)
                               c
                               (java/array-class c level)))
                         (list <java.lang.object-class>
                               <java.io.serializable-class>
                               <java.lang.Cloneable-class>)))
                  (map (lambda (c) (java/array-class c level))
                       supers))))))))

;;fake type hierarchy for primitive types that is consistent with
;;Java's widening conversion
(define java-primitive-superclasses
  (let* ([supers '((void)
                   (boolean)
                   (double)
                   (float double)
                   (long float)
                   (int long)
                   (short int)
                   (byte short)
                   (char int))]
         [super-classes (map (lambda (classes)
                               (map java/class classes))
                             supers)])
    (lambda (jclass)
      (cond [(assv jclass super-classes) => cdr]
            [else '()]))))

(define (compute-class-precedence-list jclass)
  (or (total-order
       (let ([parents (java-class-declared-superclasses jclass)])
         (cons (cons jclass parents)
               (map java-class-precedence-list parents))))
      (error "inconsistent type precedence graph for java type ~a"
             (java/name jclass))))


;;;;;;;;;; REFLECTION CORE ;;;;;;;;;;

(define (java-constructor-procedure jconstr)
  (lambda args (java/invoke-constructor jconstr args)))

(define (java-constructor-method jconstr)
  (make-method (lambda (next . args)
                 (java/invoke-constructor jconstr args))
               (java/parameter-types jconstr)
               #f))

(define (java-method-procedure jmethod)
  (lambda (obj . args) (java/invoke-method jmethod obj args)))

(define (java-method-method jmethod)
  (make-method (lambda (next obj . args)
                 (java/invoke-method jmethod obj args))
               (cons (java/declaring-class jmethod)
                     (java/parameter-types jmethod))
               #f))

(define (java-field-accessor-procedure jfield)
  (lambda (obj) (java/field-ref jfield obj)))

(define (java-field-accessor-method jfield)
  (make-method (lambda (next obj)
                 (java/field-ref jfield obj))
               (list (java/declaring-class jfield))
               #f))

(define (java-field-modifier-procedure jfield)
  (lambda (obj val) (java/field-set! jfield obj val)))

(define (java-field-modifier-method jfield)
  (make-method (lambda (next obj val)
                 (java/field-set! jfield obj val))
               (list (java/declaring-class jfield)
                     <jvalue>)
               #f))

(define (generic-java-constructor jclass)
  (let ([gproc (make-generic-procedure)])
    (if (memq 'public (java/modifiers jclass))
        (add-methods gproc
                     (filter-map
                      (lambda (c)
                        (and (memq 'public (java/modifiers c))
                             (java-constructor-method c)))
                      (java/constructors jclass))))
    gproc))

(define (generic-java-procedure name fetch reflect)
  ;;reflected-classes contains all the classes/interfaces from which
  ;;we have reflected
  (let ([reflected-classes (make-hashtable eqv?)]
        [gproc (make-generic-procedure)])
    (define (do-reflection jclass)
      (hashtable/get!
       reflected-classes
       jclass
       (lambda ()
         (for-each do-reflection
                   (java-class-declared-superclasses jclass))
         (if (memq 'public (java/modifiers jclass))
             (add-methods gproc
                          (filter-map
                           (lambda (p)
                             (and (eq? (java/name p) name)
                                  (memq 'public (java/modifiers p))
                                  (reflect p)))
                           (fetch jclass))))
         #t)))
    (define (proc . args) 
      (if (not (null? args))
          (let ([o (car args)])
            (if (java/object? o) (do-reflection (java/class-of o)))))
      (apply gproc args))
    proc))


;;;;;;;;;; HIGH LEVEL PROCEDURES AND SYNTAX ;;;;;;;;;;

(define java-class-precedence-list)
(define java-constructor-for-class)
(define generic-java-method)
(define generic-java-field-accessor)
(define generic-java-field-modifier)

(define (java-constructor name)
  (java-constructor-for-class (java-class name)))

(define (java-new jclass . args)
  (apply (java-constructor-for-class jclass) args))

(define (java-proxy-dispatcher handlers)
  (java/invocation-handler
   (lambda (p m a)
     (apply (cond [(assq (java/name m) handlers) => cdr]
                  [else (error "no handler for method ~a on proxy ~s"
                               (java/name m) p)])
            p a))))

(define-syntax java-proxy-method-handler
  (syntax-rules (define)
    [(_ (define (?name . ?args) . ?body))
     (java-proxy-method-handler (define ?name (lambda ?args . ?body)))]
    [(_ (define ?name ?binding))
     (cons (java/mangle-method-name '?name) ?binding)]))

(define-simple-syntax (define-java-proxy (?name . ?args)
                        (?interface ...)
                        ?handler ...)
  (define ?name
    (let ([proxy-class (java/proxy-class ?interface ...)])
      (lambda ?args
        (java-new proxy-class
                  (java-proxy-dispatcher
                   (list (java-proxy-method-handler ?handler)
                         ...)))))))

(define-simple-syntax (make-definition-syntax thing things
                                              complex simple)
  (begin (define-syntax thing
           (syntax-rules ()
             [(_ name native)   (define name (complex native))]
             [(_ name)          (thing name (simple 'name))]))
         (define-syntax things
           (syntax-rules ()
             [(_ (name native) . rest)  (begin (thing name native)
                                               (things . rest))]
             [(_ name . rest)           (begin (thing name)
                                               (things . rest))]
             [(_)                       (begin)]))))

(make-definition-syntax define-java-class
                        define-java-classes
                        java-class
                        java/mangle-class-name)
(make-definition-syntax define-generic-java-method
                        define-generic-java-methods
                        generic-java-method
                        java/mangle-method-name)
(make-definition-syntax define-generic-java-field-accessor
                        define-generic-java-field-accessors
                        generic-java-field-accessor
                        java/mangle-field-name)
(make-definition-syntax define-generic-java-field-modifier
                        define-generic-java-field-modifiers
                        generic-java-field-modifier
                        java/mangle-method-name)

(define (setup-memoized-procedures)
  (set! java-class-precedence-list
    (memoize (lambda (jclass)
               (compute-class-precedence-list jclass))))
  (set! java-constructor-for-class
    (memoize (lambda (jclass)
               (generic-java-constructor jclass))))
  (set! generic-java-method
    (memoize (lambda (name)
               (generic-java-procedure name
                                       java/methods
                                       java-method-method))))
  (set! generic-java-field-accessor
    (memoize (lambda (name)
               (generic-java-procedure name
                                       java/fields
                                       java-field-accessor-method))))
  (set! generic-java-field-modifier
    (memoize (lambda (name)
               (generic-java-procedure name
                                       java/fields
                                       java-field-modifier-method))))
  (void))
