(display (format "Creating bot...~%"))
(define bot (make-bot "SarahBot"))
(define bot-name 'sarah)

(display (format "Connecting...~%"))
(with/fc 
 (lambda (m e)
   (display m)(newline))
 (lambda ()
   (connect bot (->jstring "irc.openprojects.net"))))

(display (format "Joining...~%"))
(define channel (->jstring "#sisc"))
#;(join-channel bot channel)
(define (onMessage channel nick login host message)
  (let ([response (answer (->string message))])
    (if response
        (send-message bot channel (->jstring response)))))
(display (format "Starting Hal...~%"))
(define hal (make-hal))