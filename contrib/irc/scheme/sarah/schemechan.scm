(import old-s2j)
(import old-generic-procedures)
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
    with-output-to-file
    with-input-from-file
    call-with-input-file
    call-with-output-file
    open-source-input-file))

(define (make-schemechan channel-name)
  (let* ([parser (let* ([interp (enter <sisc.interpreter.Context>)]
			[i ((interp 'dynenv) 'parser)])
		   (exit <sisc.interpreter.Context>)
		   i)]
	 [pipeout (make <java.io.PipedOutputStream>)]
	 [env (let ([e (scheme-report-environment 5)])
		(for-each (lambda (proc)
			    (putprop proc e (forbidden-procedure proc)))
                          forbidden-bindings)
                (putprop '$sc-put-cte e $sc-put-cte)
		e)]
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
