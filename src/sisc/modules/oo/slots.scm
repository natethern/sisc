(define-record-type <slot> (make-slot name
                                      class
                                      accessor
                                      modifier
                                      accessor-method
                                      modifier-method)
  slot?
  (name                 slot-name)
  (class                slot-class)
  (accessor             slot-accessor)
  (modifier             slot-modifier)
  (accessor-method      slot-accessor-method)
  (modifier-method      slot-modifier-method))

(define (make-slot-helper name class idx)
  (define (object-type-error obj)
    (error "wrong object type, expected ~s, got ~s"
           class (type-of obj)))
  (make-slot name
             class
             (lambda (obj) (if (instance-of? obj class)
                               (record-ref obj idx)
                               (object-type-error obj)))
             (lambda (obj val) (if (instance-of? obj class)
                                   (record-set! obj idx val)
                                   (object-type-error obj)))
             (make-method
              (lambda (next obj) (record-ref obj idx))
              (list class)
              #f)
             (make-method
              (lambda (next obj val) (record-set! obj idx val))
              (list class <value>)
              #f)))
