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

(define (make-schemechan channel-name)
  (let* ([parser (let* ([interp (enter <sisc.interpreter.Context>)]
			[i ((interp 'dynenv) 'parser)])
		   (exit <sisc.interpreter.Context>)
		   i)]
	 [pipeout (make <java.io.PipedOutputStream>)]
	 [env (let ([e (scheme-report-environment 5)])
		(for-each (lambda (proc)
			    (putprop proc e (forbidden-procedure proc)))
			  '(open-input-file open-output-file 
					    with-output-to-file
					    with-input-from-file
					    call-with-input-file
					    call-with-output-file
					    open-source-input-file))
		e)]
	 [parserinput (java-unwrap (make <sisc.io.SourceInputPort> 
				     (make <java.io.PipedInputStream> pipeout)
				     (->jstring channel-name)))]
	 [channel-closed #f]
	 [evalthread (thread/new 
		      (lambda ()
			(do-join channel-name)
			(let loop ()
			  (let ([datum (read-code parserinput)])
			    (send-messages (->jstring channel-name)
					   (eval-within-n-ms datum 500 env))
			    (loop)))))])
    (putprop (string->symbol channel-name)
	     'scheme-channels (list pipeout evalthread))
    (thread/start evalthread)))
