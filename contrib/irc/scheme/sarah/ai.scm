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
            (values graph n)
            (let ([pattern (eval `(amb ,@(map (lambda (v)
                                                `',v)
                                              graph)))])
              (if (eq? (car pattern) (car tokens))
                  (find-pattern-helper (cdr tokens) (cdr pattern) (+ n 1))
                  (amb-fail))))))
    (lambda (tokens)
      (initialize-amb-fail)
      (with/fc 
       (lambda (m e)
         (if (null? tokens)
             (values 'UNKNOWN '())
             (find-pattern (cdr tokens))))
       (lambda ()
         (find-pattern-helper tokens pattern-graph 1))))))
          
(define bot-quiet #t)

(define (list-skip ls n)
  (if (zero? n) ls (list-skip (cdr ls) (- n 1))))

(define (answer message)
  (let* ([tokens (tokenize message)])
         ;Tel Hal, regardless, to expand his corups

    ;Is it addressed to the bot
    (let* ([to-bot (memq bot-name tokens)]
           [response (and (or (not bot-quiet) to-bot)
                          (let-values ([(pattern n) 
                                        (find-pattern 
                                         (map (lambda (ts)
                                                (string->symbol
                                                 (list->string 
                                                  (clean ts really-clean))))
                                              (map (lambda (tok)
                                                     (string->list
                                                      (symbol->string tok)))
                                                   tokens)))])
                            (display pattern)
                            (and-let* ([handler (assq pattern pattern-handlers)]) 
                                      (display tokens)
                                      (apply (cdr handler) tokens))))])
      (if response response
          (let ([cleaned-message (bot-clean message)])
            (let ([hal-response
                   (say hal cleaned-message)])
              (and (or (not bot-quiet) to-bot) hal-response)))))))
    
(define (bot-clean message)
  (let loop ([x 0])
    (cond [(= x (string-length message)) message]
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
    ))

(define whatis-preludes 
  '("I've heard" 
    "Someone once said"
    ""
    "I could be wrong, but"
    "And I quote:"
    "Last time I checked"
    "From what I understand"))

(define (what-is . args)
  (and (not (null? args))
       (if (eq? bot-name (car args))
           (apply what-is (cdr args))
           (let* ([relevent-tokens
                   (let loop ((ls args))
                     (cond [(null? ls) #f]
                           [(eq? (car ls) 'is)
                            (cdr ls)]
                           [else (loop (cdr ls))]))]
                  [term (and relevent-tokens (tokens->string relevent-tokens))])
             (and term
                  (begin 
                    (if (eq? #\? (string-ref term (- (string-length term) 1)))
                        (set! term (substring term 
                                              0 (- (string-length term) 1))))
                    (and-let* ([result (lookup-item dbcon term)])
                              (format "~a ~a is ~a" 
                                      (random-elem whatis-preludes) 
                                      term result))))))))
       

(define (quiet . args) (set! bot-quiet #t) "Fine, shutting up.")
(define (listen . args) (set! bot-quiet #f) "Okay, I'm listening.")
(define (evaluate . args)
  (with-output-to-string 
      (lambda () (pretty-print 
                  (eval (with-input-from-string
                            (with-output-to-string
                                (lambda ()
                                  (for-each (lambda (elem)
                                              (display elem)
                                              (display #\space))
                                            args)))
                          read))))))
(define (learn . args)
  (and (not (null? args))
       (if (eq? bot-name (car args))
           (apply learn (cdr args))
           (let-values ([(term definition)
                         (let loop ((term (list (car args)))
                                    (ls (cdr args)))
                           (if (null? ls)
                               (values #f #f)
                               (if (eq? (car ls) 'is)
                                   (values (reverse term) (cdr ls))
                                   (loop (cons (car ls) term) (cdr ls)))))])
             (if (and term definition)
                 (store-item dbcon (tokens->string term) (tokens->string definition)))))
       #f))
             
          
                
(define what-time)
(define who-is)
(define where-is)

(define pattern-handlers
  `((WHATIS . ,what-is)
    (WHATTIME . ,what-time)
    (WHOIS . ,who-is)
    (WHEREIS . ,where-is)
    (QUIET . ,quiet)
    (LISTEN . ,listen)
    (LEARN . ,learn)
    (EVALUATE . ,evaluate)))

