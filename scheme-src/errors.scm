;; SISC Error handling.  Most of the code here is for providing
;; SRFI-23 style error producing, which is then applied into
;; SISC's failure-continuation model

(define error
  (lambda args
    (throw (apply make-error args))))

(define (throw error . args)
  (call-with-failure-continuation
      (lambda (fk)
        (if (null? args)
            (call-with-current-continuation (lambda (k) (fk error k)))
            (fk error (car args))))))

(define (make-nested-error error-record parent-record)
  (cons (cons 'parent parent-record) error-record))

(define make-error
  (lambda args
    (let ([error-record '()])
      ;;Location
      (cond [(null? args) (void)]
            [(and (not (null? args))
                  (symbol? (car args)))
             (set! error-record (cons (cons 'location (car args)) 
                                      error-record))
             (set! args (cdr args))]
            [(not (car args))
             (set! args (cdr args))])
      
      ;;Message/Value
      (let ([message (and (not (null? args))
                          (car args))])
        (if message (set! args (cdr args)))
        (if (null? args)
            (if message (set! error-record (cons `(message . ,message)
                                                 error-record)))
            (if (string? message)
                (set! error-record
                  (cons `(message . ,(apply format (cons message args)))
                        error-record))
                (error 'error "cannot specify arguments to a non format-string error."))))
      error-record)))


