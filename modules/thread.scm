;;
; monitor/synchronize-unsafe will synchronize the execution of a thunk
; on a given monitor, but will *not* safely unlock the monitor when
; execution of the thunk raises an error or escapes the thunk by
; invoking a continuation.
;
; The only advantage over monitor/synchronize is a profound 
; difference in speed. USE WITH CARE.
;;
(define (monitor/synchronize-unsafe monitor thunk)
  (monitor/lock monitor)
  (let ([result (thunk)])
    (monitor/unlock monitor)
    result))

(define (synchronized-unsafe obj thunk)
  (monitor/synchronize-unsafe (monitor-of obj) thunk))

;;
; monitor/synchronize will synchronize the execution of a thunk on a
; given monitor and will safely unlock the monitor if the synchronized
; thunk is left due to error or a non-local exit.
;;
(define (monitor/synchronize monitor thunk)
  (dynamic-wind
   (lambda () (monitor/lock monitor))
   thunk
   (lambda () (monitor/unlock monitor))))

(define (synchronized obj thunk)
  (monitor/synchronize (monitor-of obj) thunk))

;;

(define (parallel . thunks)
  (let ([threads (map thread/new thunks)])
    (for-each thread/start threads)
    (for-each (lambda (t)
                (let loop ([rv (thread/join t)])
                  (if (not rv) (loop (thread/join t)))))
              threads)
    (apply values (map thread/result threads))))
