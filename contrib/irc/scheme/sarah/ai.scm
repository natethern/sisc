(import srfi-2)
(import srfi-11)

(define somewhat-clean
  (string->list "abcdefghijklmnopqrstuvwxyz()[]->+-*/_01234567890?!."))
(define really-clean
  (string->list "abcdefghijklmnopqrstuvwxyz"))

(define (tokens->string tokens)
  (let ([str
         (with-output-to-string
             (lambda ()
               (for-each (lambda (tok)
                           (display tok)
                           (display #\space))
                         tokens)))])
    (substring str 0 (- (string-length str) 1))))

(define (string-split str on)
  (let ([i (string-index str on)])
    (if i
        (values (substring str 0 i)
                (substring str (+ i (string-length on)) (string-length str)))
        (values #f #f))))

(define (string-index str substr)
  (let ([strlen (string-length str)]
        [substrlen (string-length substr)])
    (let loop ([sidx 0]
               [substridx 0])
      (cond [(= substridx substrlen) (- sidx substrlen)]
            [(= sidx strlen) #f]
            [(eq? (string-ref str sidx)
                  (string-ref substr substridx))
             (loop (+ sidx 1) (+ substridx 1))]
            [else (loop (+ sidx 1) 0)]))))

(define (clean word charset)
  (if (null? word) 
      '()
      (let ((c (char-downcase (car word))))
        (if (memq c charset)
            (cons c (clean (cdr word) charset))
            (clean (cdr word) charset)))))

(define (tokenize m) (tokenize-ignoring-punct (string->list m) '()))


(define (tokenize-ignoring-punct ls acc)
  (cond [(null? ls) (or (and (not (null? acc))
                             (list (string->symbol  
                                    (list->string (clean (reverse acc) somewhat-clean)))))
                        '())]
        [(memq (car ls) '(#\newline #\tab #\space))
         (if (not (null? acc))
             (cons (string->symbol
                    (list->string (clean (reverse acc) somewhat-clean)))
                    (tokenize-ignoring-punct (cdr ls) '()))
             (tokenize-ignoring-punct (cdr ls) acc))]
        [else (tokenize-ignoring-punct (cdr ls) (cons (car ls) acc))]))

(define find-pattern 
  (let ()
    (define find-pattern-helper
      (lambda (tokens graph n)
        (if (symbol? graph) 
            graph
            (let ([pattern (apply amb graph)])
              (if (eq? (car pattern) (car tokens))
                  (find-pattern-helper (cdr tokens) (cdr pattern) (+ n 1))
                  (amb-fail))))))
    (lambda (tokens)
      (initialize-amb-fail)
      (with/fc 
       (lambda (m e)
         (if (null? tokens)
             'UNKNOWN
             (find-pattern (cdr tokens))))
       (lambda ()
         (find-pattern-helper tokens pattern-graph 1))))))
          
(define bot-quiet #t)

(define (list-skip ls n)
  (if (zero? n) ls (list-skip (cdr ls) (- n 1))))

(define (answer from message . priv-message)
  (let* ([tokens (tokenize message)]
         [strict-tokens (map (lambda (ts)
                               (string->symbol
                                (list->string 
                                 (clean ts really-clean))))
                             (map (lambda (tok)
                                    (string->list
                                     (symbol->string tok)))
                                  tokens))]
          [to-bot (or (and (not (null? priv-message)) (car priv-message))
                      (memq bot-name strict-tokens))]
          [cleaned-message (bot-clean message)]
          [pattern (find-pattern strict-tokens)]
          [response (and pattern 
                         (display pattern)
                         (and-let* ([handler (assq pattern pattern-handlers)]) 
                                   ((cdr handler) from cleaned-message)))])
    (if (and response (or (not bot-quiet) to-bot))
        (and (not (eq? response #t))
             response)
        (let ([hal-response
               (say hal cleaned-message)])
          (and (or (not bot-quiet) to-bot) hal-response)))))
    
(define (bot-clean message)
  (let loop ([x 0])
    (cond [(or (= x (string-length message))
               (> x (+ bot-name-length 1)))
           message]
          [(eq? (string-ref message x) #\:)
           (substring message (+ x 1) (string-length message))]
          [else (loop (+ x 1))])))

(define pattern-graph
  '((what . ((is . WHATIS)
             (time . WHATTIME)))
    (whats . WHATIS)
    (who . ((is . WHOIS)))
    (where . ((is . WHEREIS)
              (can . WHEREIS)))
    (shut . ((up . QUIET)))
    (is . LEARN)
    (be . ((quiet . QUIET)))
    (listen . LISTEN)
    (evaluate . EVALUATE)
    (seen . SEEN)
    (tell . TELL)
    ))

(define (*-is type from message)
  (let-values ([(ignoreables term) (string-split message " is ")])
    (and term 
         (begin 
           (if (eq? #\? (string-ref term (- (string-length term) 1)))
               (set! term (substring term 
                                     0 (- (string-length term) 1))))
           (and-let* ([results (lookup-item dbcon type term)])
             (let ([random-result (random-elem results)])
               (sisc:format "~a ~a ~a ~a" 
                       (random-elem whatis-preludes) 
                       (car random-result)
                       (cdr (assq type '((what . is) (where . "is at"))))
                       (cdr random-result))))))))
       

(define (quiet . args) (set! bot-quiet #t) "Fine, shutting up.")
(define (listen . args) (set! bot-quiet #f) "Okay, I'm listening.")
(define (evaluate from message)
  (let-values ([(ignoreables term) (string-split message "evaluate ")])
    (with-output-to-string 
        (lambda () (pretty-print 
                    (eval (with-input-from-string term read)))))))

(define (learn from message)
  (let-values ([(term definition) (string-split message " is at ")])    
    (and (or (and term definition
                  (if (store-item dbcon 'where term definition)
                      (random-elem learn-responses)
                      (random-elem knewthat-responses)))
             (let-values ([(term definition) (string-split message " is ")])
               (and term definition
                    (if (store-item dbcon 'what term definition)
                        (random-elem learn-responses)
                        (random-elem knewthat-responses))))))))

(define (onJoin channel sender login hostname)
  (add-nick (string->symbol (->string channel))
            (normalize-nick sender))
  (let ([messages (fetch-messages! dbcon (normalize-nick sender))])
    (when messages 
         (send-message bot channel 
                       (->jstring (sisc:format (random-elem deliver-preludes)
                                          (->string sender) 
                                          (let ([l (length messages)])
                                            (sisc:format "~a ~a" l
                                                    (if (> l 1) "messages."
                                                        "message."))))))
         (for-each (lambda (m)
                     (do-tell (->string sender) (->string channel)
                              (car m) (cdr m)))
                   messages))))

;; Nick Management
(define (onPart channel sender login hostname)
  (remove-nick (string->symbol (->string channel))
               (normalize-nick sender)))
(define onQuit onPart)
(define (onNickChange oldnick login hostname newnick)
  (remove-nick (string->symbol channel) (normalize-nick oldnick))
  (onJoin (->jstring channel) 
          newnick newnick (->jstring "unknown.net")))

(define (onUserList channel users)
  (let ([channel (string->symbol (->string channel))])
    (putprop 'members channel '())
    (for-each (lambda (nick)
                (onJoin (->jstring channel) 
                        nick nick (->jstring "unknown.net")))
              (map (lambda (arrayelem)
                     (get-nick arrayelem))
                   (->list users)))))

(define (do-tell recipient channel sender message)
  (send-message bot (->jstring channel)
                (->jstring 
                 (sisc:format "~a, ~a says: ~a" recipient sender message))))
  
(define (tell from message)
  (let-values ([(ignoreables message) (string-split message "tell ")])
    (and message
         (and-let* ([spidx (string-index message " ")]
                    [recipient (substring message 0 spidx)])
           (let ([message (substring message (+ spidx 1)
                                     (string-length message))])
             (if (member (soundex recipient)
                         (get-present (string->symbol channel)))
                 (begin (do-tell recipient channel from message) #t)
                 (begin 
                   (store-message dbcon from (soundex recipient)
                                  (string-downcase recipient) message)
                   (random-elem tell-responses))))))))
  

      
(define (seen from message)
  (let-values ([(ignoreables person) (string-split message "seen ")])
    (and person 
         (begin 
           (if (eq? #\? (string-ref person (- (string-length person) 1)))
               (set! person (substring person 
                                     0 (- (string-length person) 1))))
           (let-values ([(seen message) (lookup-seen dbcon (soundex person))])
             (if seen (sisc:format "~a, saying: ~a."
                              (sisc:format (random-elem seen-phrases) person seen)
                              message)
                 (random-elem haventseen-responses)))))))
                              
(define (what-is from message) (*-is 'what from message))
(define (where-is from message) (*-is 'where from message))
(define (who-is from message) (*-is 'what from message))

(define pattern-handlers
  `((WHATIS . ,what-is)
    (WHATTIME . ,what-time)
    (WHOIS . ,who-is)
    (WHEREIS . ,where-is)
    (QUIET . ,quiet)
    (SEEN . ,seen)
    (LISTEN . ,listen)
    (LEARN . ,learn)
    (EVALUATE . ,evaluate)
    (TELL . ,tell)))
