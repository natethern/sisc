(import s2j)
(import generic-procedures)
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
  
  (display (sisc:format "Connecting...~%"))
  (with/fc 
   (lambda (m e)
     (display m)(newline))
   (lambda ()
     (connect bot (->jstring "irc.freenode.net"))))
  
  (define channels '("#sarahtest" "#sisc"))

  (define (send-messages destination response)
    (let ([tokenizer (make <java.util.StringTokenizer> 
                           (->jstring response)
                           (->jstring (string #\newline)))])
      (let loop ()
        (when (->boolean (has-more-tokens tokenizer))
          (send-message bot destination (next-token tokenizer))
          (loop)))))

  (define (onPrivateMessage nick login host message)
    (let ([response (answer (->string nick) (->string message) #t)])
      (if response
          (send-messages nick response))))

  (define (onMessage channel nick login host message)
    (store-seen dbcon (normalize-nick nick) (->string nick) (->string message))
    (unless (equal? (symbol->string bot-name) nick)
      (let ([response (answer (->string nick) (->string message))])
        (when response
          (send-messages channel response)))))

  (for-each (lambda (channel)
              (display (sisc:format "Joining ~a...~%" channel))
              (add-presence (string->symbol channel))
              (join-channel bot (->jstring channel)))
            channels)
