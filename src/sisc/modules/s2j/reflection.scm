;;;;;;;;;; HELPERS ;;;;;;;;;;

(define (filter-map f lis)
  (let recur ((lis lis))
    (if (null? lis) 
        lis
        (let ((tail (recur (cdr lis))))
          (cond ((f (car lis)) => (lambda (x) (cons x tail)))
                (else tail))))))


;;;;;;;;;; CLASS PRECEDENCE LIST ;;;;;;;;;;

(define (java-class-declared-superclasses jclass)
  ((cond [(java/array-class? jclass) java-array-superclasses]
         [(java/primitive? jclass) java-primitive-superclasses]
         [(java/interface? jclass) java-interface-superclasses]
         [else java-normal-superclasses])
   jclass))

(define java-normal-superclasses
  (let ([<java.lang.object-class>
         (java/class '|java.lang.Object|)])
    (lambda (jclass)
      (let ([super (java/superclass jclass)]
            [interfaces (java/interfaces jclass)])
        (cond
          [(java/null? super)
           interfaces]
          [(eqv? super <java.lang.object-class>)
           ;;we always shuffle Object to the end
           (append interfaces (list <java.lang.object-class>))]
          [else
            (cons super interfaces)])))))

(define java-interface-superclasses
  (let ([<java.lang.object-class>
         (java/class '|java.lang.Object|)])
    ;;we pretend that all interfaces have Object as the last element in
    ;;their declared superclasses
    (lambda (jclass)
      (append (java/interfaces jclass)
              (list <java.lang.object-class>)))))

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

;;let X[n] denote the type of an array of type X with n dimensions.
;;
;;X[n]'s superclasses are B[n], I_0[n] ... I_k[n] where B is X's
;;superclass and I_0...I_k are X's superinterfaces. If X is
;;a primitive type or Object then X[n]'s superclasses are
;;Serializable[n-1] and Cloneable[n-1], Object[n-1].
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
        (cond
          [(java/array-class? c)
           (loop (+ level 1) (java/component-type c))]
          [(or (java/primitive? c)
               (eqv? c <java.lang.object-class>))
           (let ([level (- level 1)])
             (map (lambda (c)
                    (if (zero? level)
                        c
                        (java/array-class c level)))
                  (list <java.io.serializable-class>
                        <java.lang.cloneable-class>
                        <java.lang.object-class>)))]
          [else 
            (map (lambda (c) (java/array-class c level))
                 (java-class-declared-superclasses c))))))))

(define (compute-class-precedence-list jclass)
  (or (total-order
       (let ([parents (java-class-declared-superclasses jclass)])
         (cons (cons jclass parents)
               (map java-class-precedence-list parents)))
       type<=)
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

(define *REFLECTION-MUTEX* (mutex/new))
(define *CLASS-PRECEDENCE-LISTS*        (make-hashtable eqv? #f))
(define *REFLECTED-CONSTRUCTORS*        (make-hashtable eqv? #f))
(define *REFLECTED-METHODS*             (make-hashtable eq? #f))
(define *REFLECTED-FIELD-ACCESSORS*     (make-hashtable eq? #f))
(define *REFLECTED-FIELD-MODIFIERS*     (make-hashtable eq? #f))

(define (s2j/clear-reflection-cache!)
  (hashtable/clear! *CLASS-PRECEDENCE-LISTS*)
  (hashtable/clear! *REFLECTED-CONSTRUCTORS*)
  (hashtable/clear! *REFLECTED-METHODS*)
  (hashtable/clear! *REFLECTED-FIELD-ACCESSORS*)
  (hashtable/clear! *REFLECTED-FIELD-MODIFIERS*))

(define (reflect-java-class-members jclass)
  (define (helper fetch create)
    (filter-map (lambda (m) (and (memq 'public (java/modifiers m))
                                 (cons (java/name m) (create m))))
                (or (fetch jclass) '())))
  (hashtable/put!
   *REFLECTED-CONSTRUCTORS*
   jclass
   (let ([gproc (make-generic-procedure)])
     (add-methods gproc (map cdr (helper java/constructors
                                         java-constructor-method)))
     gproc))
  (for-each (lambda (table fetch create)
              (for-each (lambda (member)
                          (add-method (hashtable/get!
                                       table
                                       (car member)
                                       make-generic-procedure)
                                      (cdr member)))
                        (helper fetch create)))
            (list *REFLECTED-METHODS*
                  *REFLECTED-FIELD-ACCESSORS*
                  *REFLECTED-FIELD-MODIFIERS*)
            (list java/methods
                  java/fields
                  java/fields)
            (list java-method-method
                  java-field-accessor-method
                  java-field-modifier-method)))

(define (reflect-java-class jclass)
  (let ([reflected? (hashtable/get *CLASS-PRECEDENCE-LISTS* jclass)])
    (or reflected?
        (begin
          (for-each reflect-java-class
                    (java-class-declared-superclasses jclass))
          (hashtable/put! *CLASS-PRECEDENCE-LISTS*
                          jclass
                          (compute-class-precedence-list jclass))
          (if (memq 'public (java/modifiers jclass))
              (reflect-java-class-members jclass)
              (hashtable/put! *REFLECTED-CONSTRUCTORS*
                              jclass
                              (make-generic-procedure)))))))

(define (generic-java-procedure table name)
  (mutex/synchronize
   *REFLECTION-MUTEX*
   (lambda ()
     (let ([gproc (hashtable/get! table
                                  name
                                  make-generic-procedure)])
       (lambda args
         (if (not (null? args))
             (let ([o (car args)])
               (if (java/object? o)
                   (mutex/synchronize
                    *REFLECTION-MUTEX*
                    (lambda ()
                      (reflect-java-class (java/class-of o)))))))
         (apply gproc args))))))

;;;;;;;;;; HIGH LEVEL PROCEDURES AND SYNTAX ;;;;;;;;;;

(define (java-class-precedence-list jclass)
  (mutex/synchronize
   *REFLECTION-MUTEX*
   (lambda ()
     (reflect-java-class jclass)
     (hashtable/get *CLASS-PRECEDENCE-LISTS* jclass))))

(define (java-constructor-for-class jclass)
  (mutex/synchronize
   *REFLECTION-MUTEX*
   (lambda ()
     (reflect-java-class jclass)
     (hashtable/get *REFLECTED-CONSTRUCTORS* jclass))))

(define (generic-java-method name)
  (generic-java-procedure *REFLECTED-METHODS* name))

(define (generic-java-field-accessor name)
  (generic-java-procedure *REFLECTED-FIELD-ACCESSORS* name))

(define (generic-java-field-modifier name)
  (generic-java-procedure *REFLECTED-FIELD-MODIFIERS* name))

(define (java-class name)
  (let ([jclass (java/class name)])
    (reflect-java-class jclass)
    jclass))

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
           (lambda (x)
             (syntax-case x ()
               [(_ name native)
                (and (identifier? (syntax name))
                     (identifier? (syntax native)))
                (syntax (define name (complex 'native)))]
               [(_ name)
                (identifier? (syntax name))
                (syntax (define name (complex (simple 'name))))])))
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
