  (display "Connecting to database...\n")
  (define dbcon (dbconnect "minstrel"))

  (display (format "Creating bot...~%"))
  (define bot (make-bot "sarahbot"))
  (define bot-name 'sarahbot)
  
  (display (format "Connecting...~%"))
  (with/fc 
   (lambda (m e)
     (display m)(newline))
   (lambda ()
     (connect bot (->jstring "irc.openprojects.net"))))
  
  (define channel (->jstring "#sarahtest"))

  (define (onPrivateMessage nick login host message)
    (let ([response (answer (->string message) #t)])
      (if response
          (send-message bot nick (->jstring response)))))

  (define (onMessage channel nick login host message)
    (store-seen dbcon (->string nick) (->string message))
    (let ([response (answer (->string message))])
      (if response
          (send-message bot channel (->jstring response)))))
  (display (format "Starting Hal...~%"))
  (define hal (make-hal))
  (display (format "Joining...~%"))
  (join-channel bot channel)