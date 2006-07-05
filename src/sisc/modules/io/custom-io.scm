(define-java-classes
  <sisc.io.custom.scheme-reader>
  <sisc.io.custom.scheme-writer>
  <sisc.io.custom.scheme-input-stream>
  <sisc.io.custom.scheme-output-stream>
  <sisc.io.custom.custom-binary-input-port>
  <sisc.io.custom.custom-character-input-port>
  <sisc.io.custom.custom-binary-output-port>
  <sisc.io.custom.custom-character-output-port>
  <java.io.pushback-reader>)

(define (build-custom-port name wrapper-type java-stream-chain
                           proc-type . procs)
  (for-each (lambda (proc)
          (unless (procedure? proc)
    	(error name "expected procedure, got '~a'." proc)))
        procs)
  (let* ([java-proxy-stream
          (apply java-new wrapper-type (map java-wrap procs))]
         [java-layer
          (let loop ([java-stream java-proxy-stream]
                     [jst java-stream-chain])
            (if (null? jst)
                java-stream
                (loop (java-new (car jst) java-stream)
                      (cdr jst))))])
    (java-unwrap
     (java-new proc-type java-layer java-proxy-stream))))

(define (make-custom-character-input-port read read-string ready close)
  (build-custom-port
   'make-custom-character-input-port
   <sisc.io.custom.scheme-reader>
   (list <java.io.pushback-reader>)
   <sisc.io.custom.custom-character-input-port>
   read read-string ready close))
  
(define (make-custom-binary-input-port read read-block available close)
  (build-custom-port
   'make-custom-binary-input-port
   <sisc.io.custom.scheme-input-stream>
   '()
   <sisc.io.custom.custom-binary-input-port>
   read read-block available close))
  
(define (make-custom-character-output-port write write-string flush close) 
  (build-custom-port
   'make-custom-character-output-port
   <sisc.io.custom.scheme-writer>
   '()
   <sisc.io.custom.custom-character-output-port>
   write write-string flush close))

(define (make-custom-binary-output-port write write-block flush close)
  (build-custom-port    
   'make-custom-character-output-port
   <sisc.io.custom.scheme-output-stream>
   '()
   <sisc.io.custom.custom-binary-output-port>
   write write-block flush close))

