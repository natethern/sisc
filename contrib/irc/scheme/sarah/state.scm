; Handle keeping track of who is in the channel

(require 'soundex)

(define (normalize-nick nick)
  (cond [(instance-of? nick <jstring>)
         (soundex (->string nick))]
        [(symbol? nick)
         (soundex (symbol->string nick))]
        [(string? nick)
         nick]
        [else (error 'normalize-nick "Invalid nick type ~a" nick)]))

(define (union elem ls)
  (if (not (member elem ls))
      (cons elem ls)
      ls))

(define (remove elem ls)
  (cond [(null? ls) '()]
        [(equal? (car ls) elem) (remove elem (cdr ls))]
        [else (cons (car ls) (remove elem (cdr ls)))]))

(define (add-presence channel)
  (putprop 'channels 'sarah (union channel (get-presence))))

(define (remove-presence channel)
  (putprop 'channels 'sarah (remove channel (get-presence))))

(define (get-presence)
  (or (getprop 'channels 'sarah) (begin (putprop 'channels 'sarah '()) '())))

(define (add-nick channel nick)
  (putprop 'members channel (union nick (get-present channel))))

(define (get-present channel)
  (or (getprop 'members channel) (begin (putprop 'members channel '()) '())))

(define (remove-nick channel nick)
  (putprop 'members channel (remove nick (get-present channel))))

(define (find-nick nick)
  (call/cc 
   (lambda (escape)
    (for-each (lambda (channel)
                (if (member nick (get-present channel))
                    (escape channel)))
      (get-presence))
    #f)))

(define (find-nicks nick)
  (remove #f (map (lambda (channel)
                    (if (member nick (get-present channel))
                        channel 
                        #f))
                  (get-presence))))

(define (bot-quiet channel)
  (getprop channel 'bot-quiet))

(define (bot-quiet! channel state)
  (putprop channel 'bot-quiet state))
