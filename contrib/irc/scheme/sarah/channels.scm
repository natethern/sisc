(define channel-map (make-hashtable equal?))
(define (get-channel channel-name)
  (hashtable/get channel-map channel-name))
(define (add-channel channel-name channel-record)
  (hashtable/put! channel-map channel-name channel-record))
(define (remove-channel channel-name)
  (hashtable/remove! channel-map channel-name))

(define (add-user-to-channel channel-name soundex-nick)
  (let ([chanrec (get-channel channel-name)])
    (when chanrec
      (set-channel-members! chanrec (lset-adjoin equal?
                                                (channel-members chanrec)
                                                soundex-nick)))))


(define (remove-user-from-channel channel-name soundex-nick)
  (let ([chanrec (get-channel channel-name)])
    (when chanrec
      (set-channel-members! chanrec (delete soundex-nick
                                            (channel-members chanrec))))))

(define (channels-user-occupies soundex-nick)
  (let loop ([keys (hashtable/keys channel-map)])
    (if (null? keys) '()
        (let ([chan (get-channel (car keys))])
          (if (member soundex-nick (channel-members chan))
              (cons (car keys) (loop (cdr keys)))
              (loop (cdr keys)))))))