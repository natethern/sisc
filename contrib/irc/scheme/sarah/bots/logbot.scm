(define (logbot channel message)
  (do-log channel
          (sisc:format "<~a> ~a" 
                       (message-nick message) 
                       (message-text message))))

(define (do-log channel message-text)
   (if (channel-log-file channel)
       (display (sisc:format "[~a] ~a~%" 
                             (date->string (current-date) "~H:~M")
                             message-text)
                (channel-log-file channel))))

(add-action-hook
 (lambda (channel message)
   (do-log channel (sisc:format "* ~a ~a" (message-nick message)
                                          (message-text message)))))

(add-join-hook
 (lambda (channel sender login hostname)
   (do-log (get-channel channel) (sisc:format "~~ ~a has joined." sender))))

(add-part-hook
 (lambda (channel sender login hostname)
   (do-log (get-channel channel) (sisc:format "~~ ~a has left." sender))))

(add-send-hook
 (lambda (target message)
   (let ([chan (get-channel target)])
     (when chan
       (logbot chan (make-irc-message #f chan bot-name #f #f #f message))))))