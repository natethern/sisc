  (display "Connecting to database...\n")
  (define dbcon (dbconnect "minstrel"))

  (display (format "Creating bot...~%"))
  (define bot-name 'sarahbot)
  (define bot-name-length (string-length (symbol->string bot-name)))
  (define bot (make-bot (symbol->string bot-name)))
  
  (display (format "Connecting...~%"))
  (with/fc 
   (lambda (m e)
     (display m)(newline))
   (lambda ()
     (connect bot (->jstring "irc.openprojects.net"))))
  
  (define channel "#sarahtest")

  (define (onPrivateMessage nick login host message)
    (let ([response (answer (->string nick) (->string message) #t)])
      (display response) (newline)
      (if response
          (send-message bot nick (->jstring response)))))

  (define (onMessage channel nick login host message)
    (store-seen dbcon (->string nick) (->string message))
    (unless (equal? (symbol->string bot-name) nick)
      (let ([response (answer (->string nick) (->string message))])
        (if response
            (send-message bot channel (->jstring response))))))
  (display (format "Starting Hal...~%"))
  (define hal (make-hal))
  (display (format "Joining ~a...~%" channel))
  (join-channel bot (->jstring channel))