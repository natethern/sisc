  (display "Connecting to database...\n")
  (define dbcon (dbconnect "minstrel"))

  (display (sisc:format "Creating bot...~%"))
  (define bot-name 'sarahbot)
  (define bot-name-length (string-length (symbol->string bot-name)))
  (define bot (make-bot (symbol->string bot-name)))
;  (set-version bot (->jstring "Sarah - Scheme InfoBot (SISC) v0.6"))
  
  (display (sisc:format "Connecting...~%"))
  (with/fc 
   (lambda (m e)
     (display m)(newline))
   (lambda ()
     (connect bot (->jstring "irc.freenode.net"))))
  
  (define channel "#sisc")

  (define (onPrivateMessage nick login host message)
    (let ([response (answer (->string nick) (->string message) #t)])
      (display response) (newline)
      (if response
          (send-message bot nick (->jstring response)))))

  (define (onMessage channel nick login host message)
    (store-seen dbcon (normalize-nick nick) (->string nick) (->string message))
    (unless (equal? (symbol->string bot-name) nick)
      (let ([response (answer (->string nick) (->string message))])
        (if response
            (send-message bot channel (->jstring response))))))
  (display (sisc:format "Starting Hal...~%"))
  (define hal (make-hal))
  (display (sisc:format "Joining ~a...~%" channel))
  (join-channel bot (->jstring channel))