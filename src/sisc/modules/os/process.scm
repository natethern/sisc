(define-java-classes 
  <java.lang.runtime>
  <java.lang.process>
  <java.io.file>
  <java.lang.string*>
  <sisc.io.stream-input-port>
  <sisc.io.stream-output-port>
  <java.lang.string>)
  
(define-generic-java-methods
  (java-get-runtime |getRuntime|)
  exec get-error-stream get-input-stream 
  get-output-stream wait-for destroy 
  exit-value)

(define runtime-instance #f)

(define (get-runtime)
  (or runtime-instance
      (begin
        (set! runtime-instance 
              (java-get-runtime (java-null <java.lang.runtime>)))
        (get-runtime))))

(define (process-terminated? process)
  (with-failure-continuation
   (lambda (m e) #f)
   (lambda () (->number (exit-value process)))))

(define (wait-for-process process)
  (with/fc (lambda (m e) #f)
    (lambda () (->number (wait-for process)))))
  
(define (process? val)
  (and (java-object? val) 
       (instance-of? val <java.lang.process>)))

(define (get-process-stdout process)
  (java-unwrap 
    (java-new <sisc.io.stream-input-port> 
              (get-input-stream process))))

(define (get-process-stderr process)
  (java-unwrap 
    (java-new <sisc.io.stream-input-port> 
            (get-error-stream process))))

(define (get-process-stdin process . aflush)
  (java-unwrap 
    (java-new <sisc.io.stream-output-port> 
              (get-output-stream process)
	     (->jboolean (if (null? aflush) #f (car aflush))))))
	    
(define (spawn-process progname . arglist)
  (let ([runtime (get-runtime)])
    (if (null? arglist)
        (exec runtime (->jstring progname))
        (exec runtime 
	     (->jarray (map ->jstring (cons progname (car arglist)))
		       <java.lang.string>)))))

(define (assoc->envp assoc)
  (->jarray (map (lambda (binding)
		   (->jstring 
                       (format "~a=~a" (car binding) (cdr binding))))
	        assoc)
	   <java.lang.string>))

(define (spawn-process-with-environment progname arglist env . working-dir)
  (let ([runtime (get-runtime)])
    (exec runtime 
	  (->jarray (map ->jstring (cons progname arglist))
		   <java.lang.string>)
	  (if env (assoc->envp env) (java-null <java.lang.string*>))
	  (java-new <java.io.file> 
		   (->jstring 
		    (if (null? working-dir)
			(current-directory)
			(normalize-url (car working-dir))))))))

