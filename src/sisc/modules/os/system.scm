(define-java-classes
  <java.lang.system>)

(define-generic-java-methods
  (j/free-memory |freeMemory|)
  (j/total-memory |totalMemory|)
  (j/max-memory |maxMemory|)
  available-processors
  gc)

(define (free-memory)
  (->number (j/free-memory (get-runtime))))

(define (total-memory)
  (->number (j/total-memory (get-runtime))))

(define (max-memory)
  (->number (j/max-memory (get-runtime))))

(define (garbage-collect)
  (gc (java-null <java.lang.system>)))

(define (core-count)
  (->number (available-processors (get-runtime))))

