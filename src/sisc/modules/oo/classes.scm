(define-record-type <class> (_make-class name direct-superclasses)
  class?
  (name                 class-name
                        set-class-name!)
  (direct-superclasses  class-direct-superclasses
                        set-class-direct-superclasses!)
  (direct-slots         class-direct-slots
                        set-class-direct-slots!)
  (precedence-list      class-precedence-list
                        set-class-precedence-list!)
  (direct-slot-count    class-direct-slot-count
                        set-class-direct-slot-count!)
  (constructor          class-constructor
                        set-class-constructor!))

(define (compute-class-precedence-list class)
  (or (total-order (let ([parents (class-direct-superclasses class)])
                     (cons (cons class parents)
                           (map class-precedence-list parents)))
                   type<=)
      (error "inconsistent class precedence graph for class ~a"
             (class-name class))))

;;check that all superclasses with ordinary (i.e. non-shared) slots
;;form a single inheritance hierarchy
(define (enforce-single-inheritance class)
  (define (cpl-error class1 class2)
    (error (string-append
            "the superclasses ~a and ~a of ~a both have direct "
            "slots but neither is a subclass of the other")
           (class-name class1)
           (class-name class2)
           (class-name class)))
  (let ([cpl (class-precedence-list class)])
    (let loop ([current (car cpl)]
               [supers (cdr cpl)])
      (if (not (null? supers))
          (let ([super (car supers)]
                [supers (cdr supers)])
            (if (zero? (class-direct-slot-count super))
                (loop current supers)
                (if (memq super (class-precedence-list current))
                    (loop super supers)
                    (cpl-error current super))))))))

(define (make-class-helper name direct-superclasses direct-slots)
  (let* ([class (_make-class name direct-superclasses)]
         [cpl   (compute-class-precedence-list class)]
         [idx   (apply + (map class-direct-slot-count (cdr cpl)))]
         [offs  0])
    (define (process-slot-def name props)
      (let ([slot (make-slot-helper
                   name
                   class
                   (begin (set! offs (+ offs 1))
                          (+ idx offs -1))
                   (cond [(assq 'value props) => cdr]
                         [else #f]))])
        (define (add-slot-method kind fetch)
          (let ([gproc (assq kind props)])
            (if gproc (add-method (cdr gproc) (fetch slot)))))
        (add-slot-method 'accessor slot-accessor-method)
        (add-slot-method 'modifier slot-modifier-method)
        slot))
    (define (make-constructor)
      (let ([class-slot-count (+ offs idx)]
            [initializers
             (map slot-initializer
                  (apply append (map class-direct-slots cpl)))])
        (lambda args
          (let ([instance (make-record class class-slot-count)])
            (for-each (lambda (initializer) (initializer instance))
                      initializers)
            instance))))
    (set-class-precedence-list! class cpl)
    (enforce-single-inheritance class)
    (set-class-direct-slots! class
                             (map process-slot-def
                                  (map car direct-slots)
                                  (map cdr direct-slots)))
    (set-class-direct-slot-count! class offs)
    (set-class-constructor! class (make-constructor))
    class))

(define (make-class name direct-superclasses direct-slots)
  (make-class-helper name
                     (if (null? direct-superclasses)
                         (list <object>)
                         direct-superclasses)
                     direct-slots))

(define-simple-syntax (define-class (name . superclasses)
                        (slot-name (slot-prop-name slot-prop-val) ...)
                        ...)
  (define name
    (make-class 'name
                (list . superclasses)
                (list (list 'slot-name
                            `(slot-prop-name . ,slot-prop-val) ...)
                      ...))))
