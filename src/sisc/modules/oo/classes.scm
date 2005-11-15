(define-nongenerative-record-type <class> sisc.oo.class-type
  (_make-class name direct-superclasses)
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

(define (make-class-helper name guid direct-superclasses direct-slots)
  (define (maybe-intern value)
    (if guid
        (type-safe-intern class? guid value)
        value))
  (let* ([class (maybe-intern (_make-class name direct-superclasses))]
         [cpl   (compute-class-precedence-list class)]
         [idx   (apply + (map class-direct-slot-count (cdr cpl)))]
         [offs  0])
    (define (make-slot name)
      (make-slot-helper name
                        class
                        (begin (set! offs (+ offs 1))
                               (+ idx offs -1))))
    (define (make-constructor)
      (let ([class-slot-count (+ offs idx)])
        (lambda () (make-record class class-slot-count))))
    (set-class-precedence-list! class cpl)
    (enforce-single-inheritance class)
    (set-class-direct-slots! class (map make-slot direct-slots))
    (set-class-direct-slot-count! class offs)
    (set-class-constructor! class (make-constructor))
    class))

(define (make-class name direct-superclasses direct-slots . opt-guid)
  (make-class-helper name
                     (if (null? opt-guid) #f (car opt-guid))
                     (if (null? direct-superclasses)
                         (list <object>)
                         direct-superclasses)
                     direct-slots))

(define (make-class-with-slots name guid direct-superclasses slot-defs)
  (let ([class (make-class name
                           direct-superclasses
                           (map car slot-defs)
                           guid)])
    (for-each
     (lambda (slot props)
       (if (not (null? props))
           (let ([method (car props)]
                 [props (cdr props)])
             (add-method method (slot-accessor-method slot))
             (if (not (null? props))
                 (let ([method (car props)]
                       [props (cdr props)])
                   (add-method method (slot-modifier-method slot))
                   (if (not (null? props))
                       (error "too many slot properties")))))))
     (class-direct-slots class)
     (map cdr slot-defs))
    class))

(define-simple-syntax (define-class (name . superclasses)
                        (slot-name . slot-props)
                        ...)
  (module (name)
    (define name)
    (set! name
      (make-class-with-slots 'name 
                             #f
                             (list . superclasses)
                             `((slot-name ,@(list . slot-props))
                               ...)))))

(define-simple-syntax (define-nongenerative-class (name . superclasses)
                        guid
                        (slot-name . slot-props)
                        ...)
  (module (name)
    (define name)
    (set! name
      (make-class-with-slots 'name
                             'guid
                             (list . superclasses)
                             `((slot-name ,@(list . slot-props))
                               ...)))))
