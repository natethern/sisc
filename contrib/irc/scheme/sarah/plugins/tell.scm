; message delivery plugin

(define (tell type)
  (lambda (channel message ignore term)
    (store-tell dbcon message term (eq? type 'later))))

(define (store-tell dbcon message term later)
  (and (not (equal? term ""))
       (and-let* ([spidx (string-index term #\space)]
		  [recipient (substring term 0 spidx)])
         (let ([todeliver (substring term (+ spidx 1)
				     (string-length term))])
	   (if (not (equal? (string-ref todeliver 0) #\"))
	       (set! todeliver
		     (translate-for-third-party todeliver 'male)))
	   (if (and (not later) (not (null? (channels-user-occupies 
					     (soundex recipient)))))
                 (begin (do-tell recipient 
				 (car (channels-user-occupies 
				       (message-soundex-nick message)))
				 (message-nick message) todeliver) #f)
                 (begin 
                   (store-message dbcon (message-nick message)
				  (soundex recipient)
                                  (string-downcase recipient) todeliver)
                   (random-elem tell-responses)))))))

(define (do-tell recipient channel-name sender message)
  (send-messages (channel-bot (get-channel channel-name))
                 channel-name
                 (sisc:format "~a, ~a says: ~a" recipient sender message)))

(define (init-tell)
  (add-join-hook 
   (lambda (channel sender login hostname)
     (deliver-messages dbcon (get-channel channel) sender))))

(define (translate-for-third-party sentence sex) sentence)

(define (unawaybot channel message)
  (deliver-messages dbcon channel (message-nick message))
  #t)

(define (deliver-messages dbcon channel sender)
  (let ([messages (fetch-messages! dbcon (soundex sender))])    
    (when messages 
      (send-messages bot (channel-name channel)
                     (sisc:format 
                      (random-elem deliver-preludes)
                      sender
                      (let ([l (length messages)])
                        (sisc:format "~a ~a" l
                                     (if (> l 1) "messages."
                                         "message.")))))
      (for-each (lambda (m)
		  (do-tell sender (channel-name channel) (car m) (cdr m)))
		messages))))


(define (store-message conn sender id recipient message) 
  (let ([pstmt (jdbc/prepare-statement conn
                "INSERT INTO tell(recipient, sender, message, id) VALUES(?,?,?,?)")])
    (set-string pstmt (->jint 1) (->jstring recipient))
    (set-string pstmt (->jint 2) (->jstring sender))
    (set-string pstmt (->jint 3) (->jstring message))
    (set-string pstmt (->jint 4) (->jstring id))
    (with/fc (lambda (m e) (write m) #f) (lambda () (jdbc/execute pstmt)))))

(define (fetch-messages! conn recipient)
  (let* ([stmt (jdbc/prepare-statement conn
                                       (sisc:format "SELECT sender, message FROM tell WHERE id='~a'"
                                                    recipient))]
         [results
          (jdbc/execute-query stmt)])
    (and (not (null? results)) 
         (begin 
           (let ([rv
                  (ordered-stream-map (lambda (item)  (cons (item '1)
                                                            (item '2)))
                                      results)])
             (jdbc/execute (jdbc/prepare-statement 
                            conn (sisc:format "DELETE FROM tell WHERE id='~a'" 
                                              recipient)))
             rv)))))

(define tell-responses
  '("Will do."
    "Got it."
    "Okay."))

(define deliver-preludes
  '("~a, you have ~a"
    "Welcome back ~a, you have ~a"))
