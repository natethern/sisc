(define-record-type <slot> (make-slot name
                                      class
                                      initializer
                                      accessor
                                      modifier
                                      initializer-method
                                      accessor-method
                                      modifier-method)
  slot?
  (name                 slot-name)
  (class                slot-class)
  (initializer          slot-initializer)
  (accessor             slot-accessor)
  (modifier             slot-modifier)
  (initializer-method   slot-initializer-method)
  (accessor-method      slot-accessor-method)
  (modifier-method      slot-modifier-method))

(define (make-slot-helper name class idx value)
  (define (object-type-error obj)
    (error "wrong object type, expected ~s, got ~s"
           class (type-of obj)))
  (make-slot name
             class
             (lambda (obj) (if (instance-of? obj class)
                               (record-set! obj idx value)
                               (object-type-error obj)))
             (lambda (obj) (if (instance-of? obj class)
                               (record-ref obj idx)
                               (object-type-error obj)))
             (lambda (obj val) (if (instance-of? obj class)
                                   (record-set! obj idx val)
                                   (object-type-error obj)))
             (make-method
              (lambda (next obj) (record-set! obj idx value))
              (list class)
              #f)
             (make-method
              (lambda (next obj) (record-ref obj idx))
              (list class)
              #f)
             (make-method
              (lambda (next obj val) (record-set! obj idx val))
              (list class <value>)
              #f)))
