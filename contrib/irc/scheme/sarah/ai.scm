(import srfi-2)
(import srfi-11)
(import threading)
(import old-s2j)
(import old-generic-procedures)
(import string-io)

(define (read-line . port)
  (let* ((char (apply read-char port)))
    (if (eof-object? char)
        char
        (do ((char char (apply read-char port))
             (clist '() (cons char clist)))
            ((or (eof-object? char) (char=? #\newline char))
             (list->string (reverse clist)))))))

(define <java.util.StringTokenizer> (java-class "java.util.StringTokenizer"))
(define-generic next-token)
(define-generic has-more-tokens)
(define-generic jtrim (generic-java-procedure 'trim))

(define (rac ls)
  (cond [(null? ls) (error 'rac "Expected type pair, got '()")]
	[(null? (cdr ls)) (car ls)]
	[else (rac (cdr ls))]))

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


(define (trim str)
 (->string (jtrim (->jstring str))))

(define (string-split str on)
  (let ([i (string-index str on)])
    (if i
        (values (trim (substring str 0 i))
                (trim (substring str (+ i (string-length on)) (string-length str))))
        (values #f #f))))

(define (string-index str substr)
  (let ([strlen (string-length str)]
        [substrlen (string-length substr)])
    (let loop ([sidx 0]
               [substridx 0])
      (cond [(= substridx substrlen) (- sidx substrlen)]
            [(= sidx strlen) #f]
            [(eqv? (string-ref str sidx)
                  (string-ref substr substridx))
             (loop (+ sidx 1) (+ substridx 1))]
            [else (loop (+ sidx 1) 0)]))))

(define (clean word charset)
  (if (null? word) 
      '()
      (let ((c (char-downcase (car word))))
        (if (memv c charset)
            (cons c (clean (cdr word) charset))
            (clean (cdr word) charset)))))

(define (tokenize m) (tokenize-ignoring-punct (string->list m) '()))


(define (tokenize-ignoring-punct ls acc)
  (cond [(null? ls) (or (and (not (null? acc))
                             (list (string->symbol  
                                    (list->string (clean (reverse acc) somewhat-clean)))))
                        '())]
        [(memv (car ls) '(#\newline #\tab #\space))
         (if (not (null? acc))
             (cons (string->symbol
                    (list->string (clean (reverse acc) somewhat-clean)))
                    (tokenize-ignoring-punct (cdr ls) '()))
             (tokenize-ignoring-punct (cdr ls) acc))]
        [else (tokenize-ignoring-punct (cdr ls) (cons (car ls) acc))]))

(define find-pattern 
  (let ()
    (define find-pattern-helper
      (lambda (tokens graph n first)
        (if (symbol? graph) 
            graph
            (let ([pattern (apply amb graph)])
              (cond [(eqv? (car pattern) (car tokens))
                     (find-pattern-helper (cdr tokens) (cdr pattern) (+ n 1) 
                                          #f)]
                    [(and first (eqv? (car pattern) '^)
                          (eqv? (cadr pattern) (car tokens)))
                     (find-pattern-helper (cdr tokens) (cddr pattern)
                                          (+ n 1)
                                          #f)]
                    [else (amb-fail)])))))
    (lambda (tokens)
      (initialize-amb-fail)
      (with/fc 
       (lambda (m e)
         (if (null? tokens)
	     #f
             (find-pattern (cdr tokens))))
       (lambda ()
         (find-pattern-helper tokens pattern-graph 1 #t))))))
          
(define (list-skip ls n)
  (if (zero? n) ls (list-skip (cdr ls) (- n 1))))

(define (answer from channel message . priv-message)
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
		      ;; Name must be first or last in a sentence
		      (eqv? bot-name (car strict-tokens))
		      (eqv? bot-name (rac strict-tokens)))]
          [cleaned-message (bot-clean message)]
          [pattern (find-pattern strict-tokens)]
          [response (and-let* ([handler 
                                (assq (or pattern 
  				       (and (let ([last-token (symbol->string 
							       (rac tokens))])
                                              (eqv? (string-ref last-token
                                                      (- (string-length 
                                                           last-token) 1))
                                                    #\?))
                                            'EXPLAIN))
                                              pattern-handlers)])
                        (display (car handler))
                        ((cdr handler) from channel
				       cleaned-message to-bot))])
    (if response
        (and (or (and channel
		      (not (bot-quiet (string->symbol channel))))
		 to-bot) response)
        (and (or (and channel
		      (not (bot-quiet (string->symbol channel))))
		 to-bot)
                 (ask-alice from cleaned-message)))))
    
(define (bot-clean message)
  (trim 
   (let loop ([x 0])
     (cond [(or (= x (string-length message))
                (> x (+ bot-name-length 1)))
            message]
           [(eqv? (string-ref message x) #\:)
            (substring message (+ x 1) (string-length message))]
           [else (loop (+ x 1))]))))

(define pattern-graph
  '((^ help . HELP)
    (yow . YOW)
    (what . ((is . WHATIS)
             (time . WHATTIME)))
    (whats . WHATIS)
    (who . ((is . WHOIS)))
    (where . ((is . WHEREIS)
              (can . WHEREIS)))
    (shut . ((up . QUIET)))
    (is . ((aka . AKA)
           (also . AKA)))
    (is . LEARN)
    (be . ((quiet . QUIET)))
    (^ listen . ((up . LISTEN)))
    (expand . EXPAND)
    (optimize . optimize)
    (beautify . PRETTYPRINT)
    (pretty . ((print . PRETTYPRINT)))
    (prettyprint . PRETTYPRINT)
    (pp . PRETTYPRINT)
    (eval . EVALUATE)
;    (evaluate . EVALUATE)
    (seen . SEEN)
    (later . ((tell . LATERTELL)))
    (tell . TELL)
    (forget . FORGET)
    (leave . LEAVE)
    (join . JOIN)
    (new . ((scheme . SCHEMECHANNEL)))
    ))

(define (help from . args)
  (send-messages (->jstring from)
   (string-append
    "Hello, I'm Sarah, a SISC Scheme Infobot.\n"
    "I respond to some natural language commands, such as:\n"
    "help - You're doing it.\n\n"
    "<Something> is <something's description> -- I'll remember this for someone's later query of...\n"
    "What is <something> -- You'll get a similar effect with Who is somebody? and Where is something?\n\n"
    "<Something> is also <something else> -- I'll remember the first as an alias for the second.\n"
    "forget <something> -- I'll forget all knowledge of a term.  Please be careful!\n"
    "Tell <somebody> <something>. -- I'll tell someone your message immediately if they're online, or hold it until I see them next.\n"
    "Later tell <somebody> <something>. -- I'll tell someone your message next time they speak, or hold it until I see them next if they're offline.\n"
    "Seen somebody? -- I'll tell you the last time I saw someone, and what they last said.\n"
    "\n"
    "evaluate <s-expression> -- I'll run a simple program for you, but it must complete quickly!\n"
    "pretty-print <s-expression> -- I'll nicely format your Scheme expression for you.\n"
    "expand <s-expression> -- I'll syntactically expand the expression and pretty print it.\n"))
  "")
  

(define (*-is type from channel message st)
  (let-values ([(ignoreables term) (string-split message " is ")])
    (and term (explain type from channel term st))))

(define (puzzled from channel term st)
  (explain 'what from channel term st))

(define (explain type from channel term st) 
  (if (eqv? #\? (string-ref term (- (string-length term) 1)))
      (set! term (substring term 
                            0 (- (string-length term) 1))))
      (and-let* ([results (lookup-item dbcon type term)])
        (let ([random-result (random-elem results)])
          (sisc:format "~a~a ~a ~a" 
                       (random-elem whatis-preludes) 
                       (car random-result)
                       (cdr (assq (if type type 'what)
                                  '((what . is) (where . "is at"))))
                       (cdr random-result)))))
       
(define (quiet from channel message . args) 
  (bot-quiet! (string->symbol channel) #t) 
  "Fine, shutting up.")
(define (listen from channel message. args) 
  (bot-quiet! (string->symbol channel) #f) 
  "Okay, I'm listening.")

(define (eval-within-n-ms datum ms . env)
    (let* ([evaluation-thread
            (let* ([env (if (null? env) 
                            (scheme-report-environment 5)
                            (car env))])
              (putprop 'call/cc env call/cc)
              (putprop '$sc-put-cte env $sc-put-cte)
	      (strict-r5rs-compliance #t)
              (thread/new 
               (lambda ()
                 (with-output-to-string 
                     (lambda ()
		       (let ([result (eval datum env)])
			 (cond [(circular? result) (write result)]
                               [else (pretty-print result)])))))))]
           [watchdog-thread
            (thread/new
             (lambda ()
               (thread/join evaluation-thread ms)
               (with-failure-continuation
                   (lambda (m e)
                     ; An error?  Egads!
                     (if (eqv? (thread/state evaluation-thread) 'running)
                         (begin 
                           (thread/interrupt evaluation-thread)
                           "Sorry, I couldn't evaluate your expression in the given time.")
                           
                         (make-error-message (error-location m) 
                                             (error-message m))))
                 (lambda ()
                   (thread/result evaluation-thread)))))])
      ;Start the threads
      (thread/start evaluation-thread)
      (thread/start watchdog-thread)
      (let loop () (unless (thread/join watchdog-thread) (loop)))
      (thread/result watchdog-thread)))

(define (evaluate from channel message st)
  (let-values ([(ignoreables term) (string-split message "eval ")])
    (eval-within-n-ms (with-input-from-string term read-code) 5000)))

(define (learn from channel message st)
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

(define (aka from channel message st)
  (let-values ([(term definition) (string-split message " is also ")])    
    (and (or (and term definition
                  (if (store-aka dbcon term definition)
		      (random-elem learn-responses) 
                      (random-elem knewthat-responses)))
             (let-values ([(term definition) (string-split message " is aka ")])
               (and term definition
                    (if (store-aka dbcon term definition)
			(random-elem learn-responses) 
                        (random-elem knewthat-responses))))))))

(define (forget from channel message st)
  (let-values ([(ignorables term) (string-split message "forget ")])    
    (if (remove-items dbcon term)
        (random-elem forget-responses)
        (random-elem didntknow-responses))))

(define (onJoin channel sender login hostname)
  (add-nick (string->symbol (->string channel))
            (normalize-nick sender))
  (deliver-messages channel sender))

(define (deliver-messages channel sender)
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
(define (onQuit nick login hostname reason)
  (onPart (->jstring (find-nick (normalize-nick nick))) nick login hostname))

(define (onNickChange oldnick login hostname newnick)
  (let ([locations (find-nicks (normalize-nick oldnick))])
    (for-each (lambda (channel)
                (remove-nick channel (normalize-nick oldnick))
                (onJoin (->jstring channel) newnick newnick 
                        (->jstring "unknown.net")))
     locations)))

(define (onUserList channel users)
  (let ([channel (string->symbol (->string channel))])
    (putprop 'members channel '())
    (for-each (lambda (nick)
                (onJoin (->jstring channel) 
                        nick nick (->jstring "unknown.net")))
              (map (lambda (arrayelem)
                     (get-nick arrayelem))
                   (->list users)))))

(define pronouns
  '((his . your)
    (hers . yours)
    (her . you)
    (my . (his . her))
    (we . you)
    (you . me)
    (your . my)
    (she . you)
    (|she's| . you're)
    (he . you)
    (|he's| . you're)
    (|i'm| . (|he's| . |she's|))
    (i . (he . she))
    (mine . (his . hers))))

(define (set-capitalization sym orig-str)
  (let ([new-str (sisc:format "~a" sym)])
    (if (and (char-upper-case? (string-ref orig-str 0))
             (not (equal? (string-ref orig-str 0) '#\I)))
        (string-set! new-str 0 (char-upcase (string-ref new-str 0))))
    new-str))

;disabled for now
(define (translate-for-third-party sentence sex) sentence)

#;(define (translate-for-third-party sentence sex)
  (let ([tokenizer (make <java.util.StringTokenizer> 
                         (->jstring sentence)
                         (->jstring "\n\t ")
                         (->jboolean #t))]
        [result-str ""])

    (let loop ()
        (when (->boolean (has-more-tokens tokenizer))
          (let ([tok (->string (next-token tokenizer))])
            (set! result-str
              (string-append 
               result-str
               (cond [(assoc (string->symbol (string-downcase tok))
                            pronouns)=>
                      (lambda (x)
                        ; Sex specific pronoun?
                        (set-capitalization 
                         (if (pair? (cdr x))
                             ; Do we know the guy/gal's sex?
                             (if (or (not sex) (eqv? sex 'male))
                                 (cadr x) ;male
                                 (cddr x)) ;female 
                             (cdr x))
                         tok))]
                     [else tok]))))
          (loop)))
    result-str))
    
(define (do-tell recipient channel sender message)
  (send-message bot (->jstring channel)
                (->jstring 
                 (sisc:format "~a, ~a says: ~a" recipient sender message))))
  
(define (tell from channel message st)
  (store-tell from channel message st #f))

(define (later-tell from channel message st)
  (store-tell from channel message st #t))

(define (store-tell from channel message st later)
  (let-values ([(ignoreables message) (string-split message "tell ")])
    (and message
         (and-let* ([spidx (string-index message " ")]
                    [recipient (substring message 0 spidx)])
           (let ([message (substring message (+ spidx 1)
                                     (string-length message))])
             (if (not (equal? (string-ref message 0) #\"))
                 (set! message
                   (translate-for-third-party message 'male)))
             (if (and (not later) (find-nick (soundex recipient)))
                 (begin (do-tell recipient (find-nick (soundex recipient)) from message) #t)
                 (begin 
                   (store-message dbcon from (soundex recipient)
                                  (string-downcase recipient) message)
                   (random-elem tell-responses))))))))
      
(define (seen from channel message st)
  (let-values ([(ignoreables person) (string-split message "seen ")])
    (and person 
         (begin 
           (if (eqv? #\? (string-ref person (- (string-length person) 1)))
               (set! person (substring person 
                                     0 (- (string-length person) 1))))
           (let-values ([(seen message person) 
                         (lookup-seen dbcon (soundex person))])
             (if seen (sisc:format "~a UTC, saying: ~a."
                         (sisc:format (random-elem seen-phrases) person seen)
                         message)
                 (random-elem haventseen-responses)))))))
                              
(define (what-is from channel message st) (*-is 'what from channel message st))
(define (where-is from channel message st) (*-is 'where from channel message st))
(define (who-is from channel message st) (*-is 'what from channel message st))

(define (prettyprint from channel message st)
  (with-input-from-string message
    (lambda ()
      (let loop ([x (read)] [l #f])
	(if (eof-object? x)
	    (and l (pretty-print-to-string l))
	    (loop (read) x))))))

(define (expand from channel message st)
  (let-values ([(ignoreables expr) (string-split message "expand ")])
    (with-input-from-string expr
      (lambda ()
	(pretty-print-to-string (sc-expand (read-code) '(e) '(e)))))))

(define (optimize from channel message st)
  (let-values ([(ignoreables expr) (string-split message "optimize ")])
    (with-input-from-string expr
      (lambda ()
	(pretty-print-to-string (optimize (sc-expand (read-code))))))))

(define (join from channel message st) 
  (let-values ([(ignoreables chan) (string-split message "join ")])
    (if (char=? (string-ref chan 0) #\#)
	(do-join chan))
    "Okay."))

(define (leave from channel message st) 
  (let-values ([(ignoreables chan) (string-split message "leave ")])
    (if (char=? (string-ref chan 0) #\#)
	(do-part chan))
    "Okay."))

(define (schemechan from channel message st) 
  (let-values ([(ignoreables chan) (string-split message "new scheme ")])
    (make-schemechan message)
    "Done."))

(define (if-spoken-to handler)
  (lambda (from channel message spoken-to)
    (if spoken-to
	(handler from channel message spoken-to)
	#f)))

(define (yow from channel message st)
  (random-elem zippy))

          

(define pattern-handlers
  `((WHATIS . ,(if-spoken-to what-is))
    (JOIN . ,(if-spoken-to join))
    (LEAVE . ,(if-spoken-to leave))
    (WHATTIME . ,what-time)
    (WHOIS . ,(if-spoken-to who-is))
    (WHEREIS . ,(if-spoken-to where-is))
    (QUIET . ,quiet)
    (SEEN . ,seen)
    (LISTEN . ,(if-spoken-to listen))
    (LEARN . ,(if-spoken-to learn))
    (AKA . ,(if-spoken-to aka))
    (EVALUATE . ,(if-spoken-to evaluate))
    (TELL . ,(if-spoken-to tell))
    (HELP . ,(if-spoken-to help))
    (EXPAND . ,(if-spoken-to expand))
    (OPTIMIZE . ,(if-spoken-to optimize))
    (PRETTYPRINT . ,(if-spoken-to prettyprint))
    (EXPLAIN . ,(if-spoken-to puzzled))
    (FORGET . ,(if-spoken-to forget))
    (YOW . ,(if-spoken-to yow))
    (LATERTELL . ,(if-spoken-to later-tell))
    (SCHEMECHANNEL . ,schemechan)))
