; SISC implementation of SRFI-18
;
; Compliance issues:
; thread-terminate!,
; relies on interrupts to be enabled (using the sisc.interrupts 
; system property)
;

; Time objects
(define-record-type time-object
  (make-time ms)
  time?
  (ms time-ms))

(define (current-time)
  (make-time (system-time)))

(define (time->seconds to)
  (quotient (time-ms to) 1000))

(define (seconds->time seconds)
  (make-time (* seconds 1000)))

(define (time->ms to)
  (cond [(number? to) (inexact->exact (* 1000 to))]
        [(time? to) (time-ms to)]
	[else (error 'time->ms "Unsupported time value ~a." to)]))

;Threading
(define current-thread thread/current)

(define (make-thread thunk . name)
  (let ([thread (thread/new (lambda ()
                              (with/fc
                               (lambda (m e)
                                 (abandon-mutexes (current-thread))
                                 (throw m e))
                               (lambda () 
                                 (let ([rv (thunk)])
                                   (abandon-mutexes (current-thread))
                                   rv)))))])
    (unless (null? name)
      (set-annotation! thread 'name (car name)))
    thread))

(define (thread-name thread)
  (annotation thread 'name))

(define (*-specific obj)
  (annotation obj 'specific))
(define (*-specific-set! obj val)
  (set-annotation! obj 'specific val))

(define (named-constructor real-c init-thunk)
  (lambda args
    (let ([rv (real-c)])
      (unless (null? args)
   	(set-annotation! rv 'name (car args)))
      (init-thunk rv)
      rv)))
(define (*-name obj)
  (annotation obj 'name))

(define thread-specific *-specific)
(define thread-specific-set! *-specific-set!)

(define (thread-start! thread)
  (thread/start thread))

(define thread-yield! thread/yield)
(define (thread-sleep! t)
  (sleep (time->ms t)))

(define (thread-terminate! thread)
  (thread/interrupt thread)
  (thread/join thread)
  (thread/_set-result! thread 
                       (with/fc values (lambda () 
                                         (raise 'thread-terminated thread)))))

(define (thread-join! thread . args)
  (let* ([timeout (let ([v (and (not (null? args))
				(car args))])
		    (and v (time->ms v)))])
    (let loop ()
      (when (eq? (thread/state thread) 'ready)
        (sleep 200)
        (loop)))
    (if timeout
        (if (not (thread/join thread timeout))
            (if (null? (cdr args))
                (raise 'join-timeout timeout)
                (cadr args))
            (thread/result thread))
        (begin
          (thread/join thread)
          (thread/result thread)))))

;; Mutexes

(define (abandon-mutexes thread)
  (for-each (lambda (mutex)
              (mutex-unlock! mutex)
              (set-annotation! mutex 'state 'abandoned))
            (annotation thread 'mutexes '())))
              
(define make-mutex (named-constructor mutex/new 
				      (lambda (v)
					(set-annotation! v 'state
							 'not-abandoned))))

(define mutex-name *-name)
(define mutex-specific *-specific)
(define mutex-specific-set! *-specific-set!)

(define (mutex-state mutex)
  (annotation mutex 'state))

(define (mutex-lock! mutex . args)
  (let* ([timeout (let ([v (and (not (null? args))
				(car args))])
		    (and v (time->ms v)))]
	 [thread (if timeout
                     (if (null? (cdr args))
                         (current-thread)
                         (cadr args))
                     (current-thread))])
    (if timeout
	(mutex/lock! mutex (time->ms timeout))
	(mutex/lock! mutex))
    (let ([oldstate (mutex-state mutex)])
      (if thread
	  (begin
	    (set-annotation! mutex 'owner thread)
	    (set-annotation! mutex 'state thread)
	    (set-annotation! thread 'mutexes 
			     (cons mutex (annotation thread 'mutexes '()))))
	  (set-annotation! mutex 'state 'not-owned))
      (if (eq? oldstate 'abandoned)
          (raise 'abandoned-mutex mutex)))))

(define (mutex-unlock! mutex . args)
  (let* ([condvar (and (not (null? args))
		       (car args))]
	 [timeout (and condvar (let ([v (and (not (null? (cdr args)))
					    (cadr args))])
				(and v (time->ms v))))])
    (if condvar
	(if timeout
	    (mutex/unlock! mutex condvar timeout)
	    (mutex/unlock! mutex condvar)))
    (let ([owner (annotation mutex 'owner)])
      (set-annotation! mutex 'state
		       (if owner 'not-abandoned 'abandoned)))
    (mutex/unlock! mutex)))

; Conditon Variables

(define condition-variable? condvar?)

(define make-condition-variable (named-constructor condvar/new 
                                                   (lambda (v) (void))))
(define condition-variable-specific *-specific)
(define condition-variable-specific-set! *-specific-set!)

(define condition-variable-signal! condvar/notify)
(define condition-variable-broadcast! condvar/notify-all)

; Map SRFI-18's exception handling to SISC's failure continuations
(define (current-exception-handler)
  (call/fc (lambda (f) f)))

(define (with-exception-handler handler thunk)
  (with/fc 
   (lambda (m e)
     (handler m))
   thunk))

(define (raise obj . val)
  (error (cons obj val)))

; Define some exceptions specific to this SRFI
(define-record-type srfi18-exception
  (make-srfi18-exception type val)
  srfi18-exception?
  (type srfi18-exception-type)
  (val srfi18-exception-val))

;Threading
(define (*-mutex-exception? type)
  (lambda (obj)
    (let ([v (error-message obj)])
      (and v (pair? v) (eq? (car v) type)))))

(define join-timeout-exception? (*-mutex-exception? 'join-timeout))
(define abandoned-mutex-exception? (*-mutex-exception? 'abandoned-mutex))
(define terminated-thread-exception? (*-mutex-exception? 'thread-terminated))
(define uncaught-exception? (*-mutex-exception? 'uncaught-exception))
(define (uncaught-exception-reason exc)
  (srfi18-exception-val exc))

    
