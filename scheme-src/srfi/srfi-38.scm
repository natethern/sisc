;; SRFI-38: write-showing-shared, or Common-Lisp style shared structure
;; external representations.
;;
;; These are handled natively by SISC, we just need to create the 
;; write-showing-shared function.

(define write-showing-shared
  (lambda args
    (let ([old-shared-state #f])
      (dynamic-wind 
       (lambda () 
         (set! old-shared-state (print-shared #t)))
       (lambda ()
         (apply write args))
       (lambda ()
         (print-shared old-shared-state))))))
       