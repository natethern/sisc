;;
; convenience wrapper around thread/new&start
;;
(define (thread/spawn thunk)
  (let ([thread (thread/new thunk)])
    (thread/start thread)
    thread))

;;
; mutex/synchronize-unsafe will synchronize the execution of a thunk
; on a given mutex, but will *not* safely unlock the mutex when
; execution of the thunk raises an error or escapes the thunk by
; invoking a continuation.
;
; The only advantage over mutex/synchronize is a profound 
; difference in speed. USE WITH CARE.
;;
(define (mutex/synchronize-unsafe mutex thunk)
  (mutex/lock! mutex)
  (call-with-values thunk
    (lambda res
      (mutex/unlock! mutex)
      (apply values res))))

(define (synchronized-unsafe obj thunk)
  (mutex/synchronize-unsafe (mutex-of obj) thunk))

;;
; mutex/synchronize will synchronize the execution of a thunk on a
; given mutex and will safely unlock the mutex if the synchronized
; thunk is left due to error or a non-local exit.
;;
(define (mutex/synchronize mutex thunk)
  (dynamic-wind
   (lambda () (mutex/lock! mutex))
   thunk
   (lambda () (mutex/unlock! mutex))))

(define (synchronized obj thunk)
  (mutex/synchronize (mutex-of obj) thunk))

;;

(define (parallel . thunks)
  (let ([threads (map thread/spawn thunks)])
    (for-each (lambda (t)
                (let loop ([rv (thread/join t)])
                  (if (not rv) (loop (thread/join t)))))
              threads)
    (apply values (map thread/result threads))))
