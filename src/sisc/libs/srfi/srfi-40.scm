(require-library 'sisc/libs/srfi/srfi-1)
(require-library 'sisc/libs/srfi/srfi-9)

(module srfi-40
    (stream-null
     (stream-cons make-stream
                  stream-error
                  stream-low-level-delay
                  stream-low-level-lazy
                  stream-low-level-strict)
     stream?
     stream-null?
     stream-pair?
     stream-car
     stream-cdr
     (stream-delay make-stream
                   stream-low-level-lazy)
     stream
     stream-unfoldn
     stream-map
     stream-for-each
     stream-filter)
  (import* srfi-1 any every)
  (import srfi-9)
  (include "../../modules/srfi/srfi-40.scm"))
