(import old-s2j)
(import old-generic-procedures)
(import file-manipulation)
(define-generic dcc-accept-chat)
(define-generic exit)
(define-generic enter)
(define-generic get-bytes)
(define-generic send-line)
(define java-read-line (generic-java-procedure 'read-line))
(define java-write (generic-java-procedure 'write))

(define <sisc.interpreter.Context> (java-class "sisc.interpreter.Context"))
(define <sisc.io.SourceInputPort> (java-class "sisc.io.SourceInputPort"))
(define <java.io.PipedOutputStream> (java-class "java.io.PipedOutputStream"))
(define <java.io.PipedInputStream> (java-class "java.io.PipedInputStream"))

(define (forbidden-procedure name)
  (lambda (args)
    (error name "use is forbidden in this environment.")))

(define schemechan-env #f)

(define forbidden-bindings 
   '(open-input-file open-output-file 
    interaction-environment
    with-output-to-file
    with-input-from-file
    call-with-input-file
    call-with-output-file
    open-source-input-file))

(define (my-load url env)
  (call-with-input-file url
    (lambda (in)
     (let loop ([expr (read-code in)])
       (unless (eof-object? expr)
         (eval expr env)
         (loop (read-code in)))))))

(define simple-gen-sym 
  (let ([x 0])
    (lambda (var)
      (set! x (+ x 1))
      (string->symbol (format "~a_~a" var x)))))
(define gen-sym simple-gen-sym)
	
(define (make-schemechan channel-name)
  (let* ([parser (let* ([interp (enter <sisc.interpreter.Context>)]
			[i ((interp 'dynenv) 'parser)])
		   (exit <sisc.interpreter.Context>)
		   i)]
	 [pipeout (make <java.io.PipedOutputStream>)]
         [etmp (scheme-report-environment 5)]
         [load-from-url
           (lambda (url)
             (with/fc (lambda (m e)  
 	                 (if (eq? (error-location m) 'load)
                             (throw m e)
                             (my-load url etmp)))
                (lambda ()
                 (when (file-is-file? url) 
                  (error 'load "Loading from local files not permitted.")))))]
	 [env (begin 
		(for-each (lambda (proc)
			    (putprop proc etmp (forbidden-procedure proc)))
                          forbidden-bindings)
                (putprop '$sc-put-cte etmp $sc-put-cte)
		(putprop '_load etmp my-load)
		(putprop 'gen-sym etmp simple-gen-sym)
		(putprop 'sc-expand etmp sc-expand)
                (putprop 'load etmp load-from-url)
		etmp)]
	 [parserinput (java-unwrap (make <sisc.io.SourceInputPort> 
				     (make <java.io.PipedInputStream> pipeout)
				     (->jstring channel-name)))]
	 [channel-closed #f]
	 [evalthread (thread/new 
		      (lambda ()
			(do-join channel-name)
			(let loop ()
			  (with/fc (lambda (m e)
                                     (send-messages (->jstring channel-name)
                                                    (make-error-message
                                                      (error-location m)
                                                      (error-message m))))
                            (lambda ()
 			      (let ([datum (read-code parserinput)])
			        (send-messages (->jstring channel-name)
				  	       (eval-within-n-ms 
					         datum 5000 env)))))
			  (loop))))])
    (putprop (string->symbol channel-name)
	     'scheme-channels (list pipeout evalthread))
    (set! schemechan-env env)
    (thread/start evalthread)))
