;; records - mostly taken from SRFI-9

; Definition of DEFINE-RECORD-TYPE

(define-syntax define-record-type
  (syntax-rules ()
    ((define-record-type type
       (constructor constructor-tag ...)
       predicate
       (field-tag accessor . more) ...)
     (begin
       (define type (make-record-type 'type '(field-tag ...)))
       (define (constructor . args)
         (set! constructor
           (record-constructor type '(constructor-tag ...)))
         (apply constructor args))
       (define (predicate thing)
         (set! predicate (record-predicate type))
         (predicate thing))
       (define-record-field type field-tag accessor . more)
       ...))))

; An auxilliary macro for define field accessors and modifiers.
; This is needed only because modifiers are optional.

(define-syntax define-record-field
  (syntax-rules ()
    ((define-record-field type field-tag accessor)
     (define (accessor thing)
       (set! accessor (record-accessor type 'field-tag))
       (accessor thing)))
    ((define-record-field type field-tag accessor modifier)
     (begin
       (define (accessor thing)
         (set! accessor (record-accessor type 'field-tag))
         (accessor thing))
       (define (modifier thing value)
         (set! modifier (record-modifier type 'field-tag))
         (modifier thing value))))))

; We define the following procedures:
; 
; (make-record-type <type-name <field-names>)    -> <record-type>
; (record-constructor <record-type<field-names>) -> <constructor>
; (record-predicate <record-type>)               -> <predicate>
; (record-accessor <record-type <field-name>)    -> <accessor>
; (record-modifier <record-type <field-name>)    -> <modifier>
;   where
; (<constructor> <initial-value> ...)         -> <record>
; (<predicate> <value>)                       -> <boolean>
; (<accessor> <record>)                       -> <value>
; (<modifier> <record> <value>)         -> <unspecific>

;----------------
; Record types are themselves records, so we first define the type for
; them.  Except for problems with circularities, this could be defined as:
;  (define-record-type :record-type
;    (make-record-type name field-tags)
;    record-type?
;    (name record-type-name)
;    (field-tags record-type-field-tags))
; As it is, we need to define everything by hand.

; Now that :record-type exists we can define a procedure for making more
; record types.

(define :record-type (void))

(define (make-record-type name field-tags)
  (let ([res (make-record :record-type 2)])
    (record-set! res 0 name)
    (record-set! res 1 field-tags)
    res))

(define (record-type? thing)
  (and (record? thing) (eq? (record-type thing) :record-type)))

; Accessors for record types.

(define (record-type-name record-type)
  (record-ref record-type 0))

(define (record-type-field-tags record-type)
  (record-ref record-type 1))

;----------------
; A utility for getting the offset of a field within a record.

(define (field-index type tag)
  (let loop ((i 0) (tags (record-type-field-tags type)))
    (cond ((null? tags)
           (error "record type has no such field" type tag))
          ((eq? tag (car tags))
           i)
          (else
           (loop (+ i 1) (cdr tags))))))

;----------------
; Now we are ready to define RECORD-CONSTRUCTOR and the rest of the
; procedures used by the macro expansion of DEFINE-RECORD-TYPE.

(define (record-constructor type tags)
  (let ((size (length (record-type-field-tags type)))
        (arg-count (length tags))
        (indexes (map (lambda (tag) (field-index type tag)) tags)))
    (lambda args
      (if (= (length args) arg-count)
          (let ((new (make-record type size)))
            (for-each (lambda (arg i) (record-set! new i arg))
                      args
                      indexes)
            new)
          (error "wrong number of arguments to constructor" type args)))))

(define (record-predicate type)
  (lambda (thing)
    (and (record? thing) (eq? (record-type thing) type))))

(define (record-accessor type tag)
  (let ((index (field-index type tag)))
    (lambda (thing)
      (if (eq? (record-type thing) type)
          (record-ref thing index)
          (error "accessor applied to bad value" type tag thing)))))

(define (record-modifier type tag)
  (let ((index (field-index type tag)))
    (lambda (thing value)
      (if (eq? (record-type thing) type)
          (record-set! thing index value)
          (error "modifier applied to bad value" type tag thing)))))

;; define-struct ala MzScheme
(define-syntax define-struct
  (lambda (x)
    (syntax-case x ()
      ((_ name (field ...))
       (let* ((name-syntax (syntax name))
              (name-string (symbol->string (syntax-object->datum
                                            name-syntax))))
         (with-syntax ((make-name (wrap-symbol "make-" name-syntax ""))
                       (name? (wrap-symbol "" name-syntax "?"))
                       ((field-getter ...)
                        (map (lambda (f)
                               (wrap-symbol
                                (string-append name-string "-")
                                (datum->syntax-object name-syntax f)
                                ""))
                             (syntax-object->datum (syntax (field ...)))))
                       ((field-setter ...)
                        (map (lambda (f)
                               (wrap-symbol
                                (string-append "set-" name-string "-")
                                (datum->syntax-object name-syntax f)
                                "!"))
                             (syntax-object->datum (syntax (field ...))))))
           (syntax
            (define-record-type name (make-name field ...)
              name?
              (field field-getter field-setter) ...))))))))

(set! :record-type (make-record :record-type 2))
(record-type! :record-type :record-type)
(record-set! :record-type 0 ':record-type)
(record-set! :record-type 1 '(name field-tags))
