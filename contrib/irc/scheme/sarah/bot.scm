(import old-s2j)
(import old-generic-procedures)
(define <java.util.StringTokenizer> (java-class "java.util.StringTokenizer"))
(define-generic next-token)
(define-generic has-more-tokens)

  (display "Connecting to database...\n")
  (define dbcon (dbconnect "minstrel"))

  (display (sisc:format "Creating bot...~%"))
  (define bot-name 'sarahbot)
  (define bot-name-length (string-length (symbol->string bot-name)))
  (define bot (make-bot (symbol->string bot-name)))
;  (set-version bot (->jstring "Sarah - Scheme InfoBot (SISC) v0.6"))
  
  (define (do-connect)
    (display "Connecting...\n")
    (with/fc 
     (lambda (m e)
       (display m)(newline)
       #f)
     (lambda ()
       (connect bot (->jstring "irc.freenode.net"))
       #t)))
  
  (define channels '("#sisc" "#scheme"))

  (define (send-messages destination response)
    (let ([tokenizer (make <java.util.StringTokenizer> 
                           (->jstring response)
                           (->jstring (string #\newline)))])
      (let loop ()
        (when (->boolean (has-more-tokens tokenizer))
          (send-message bot destination (next-token tokenizer))
          (loop)))))

  (define (onPrivateMessage nick login host message)
    (let ([response (answer (->string nick) #f (->string message) #t)])
      (if response
          (send-messages nick response))))

  (define (onMessage channel nick login host message)
    (unless (equal? (symbol->string bot-name) nick)
      (cond  [(getprop (->symbol channel) 'scheme-channels) =>
	      (lambda (chanrec)
		(java-write (car chanrec) 
			    (get-bytes (->jstring
					(string-append
					 (->string message) (string #\newline))))))]
	     [else 
	      (let ([response (answer (->string nick) (string-downcase 
	                                               (->string channel))
				      (->string message))])
		(when response
		      (send-messages channel response)))]))
    (store-seen dbcon (normalize-nick nick) (->string nick) (->string message))
    (deliver-messages channel nick))

  (define (do-part channel)
    (remove-presence (string->symbol channel))
    (part-channel bot (->jstring channel))
    (putprop 'members (string->symbol channel) '())
    (set! channels (remove channel channels))
    (cond [(getprop (string->symbol channel) 'scheme-channels)
	   =>
	   (lambda (chanrec)
	     (thread/interrupt (cadr chanrec))
	     (remprop (string->symbol channel) 'scheme-channels))]))

  (define (do-join channel)
    (add-presence (string->symbol channel))
    (join-channel bot (->jstring channel))
    (set! channels (cons channel channels))
    (bot-quiet! (string->symbol channel) #t))

;; Try to stay connected
  
  (define (onDisconnect)
    (let loop ()
      (sleep 15)
      (unless (do-connect)
	(loop)))
    (for-each (lambda (channel)
		(display (sisc:format "Joining ~a...~%" channel))
		(do-join channel))
	      channels)
#;    (make-schemechan "#schemerepl"))

  (onDisconnect)
