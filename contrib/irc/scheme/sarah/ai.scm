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

(define (answer message)
  (let* ([tokens (tokenize message)])
         ;Tel Hal, regardless, to expand his corups

    ;Is it addressed to the bot
    (let* ([to-bot (memq bot-name tokens)]
           [cleaned-message (bot-clean message)]
           [pattern (find-pattern (map (lambda (ts)
                                         (string->symbol
                                          (list->string 
                                           (clean ts really-clean))))
                                       (map (lambda (tok)
                                              (string->list
                                               (symbol->string tok)))
                                            tokens)))]
           [response (and pattern 
                          (display pattern)
                          (and-let* ([handler (assq pattern pattern-handlers)]) 
                                    (display tokens)
                                    ((cdr handler) cleaned-message)))])
      (if (and response (or (not bot-quiet) to-bot))
          response
          (let ([hal-response
                 (say hal cleaned-message)])
            (and (or (not bot-quiet) to-bot) hal-response))))))
    
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

(define (what-is message)
  (let-values ([(ignoreables term) (string-split message " is ")])
    (and term 
         (begin 
           (if (eq? #\? (string-ref term (- (string-length term) 1)))
               (set! term (substring term 
                                     0 (- (string-length term) 1))))
           (display term)
           (and-let* ([results (lookup-item dbcon term)])
             (let ([random-result (random-elem results)])
               (format "~a ~a is ~a" 
                       (random-elem whatis-preludes) 
                       (car random-result)
                       (cdr random-result))))))))
       

(define (quiet . args) (set! bot-quiet #t) "Fine, shutting up.")
(define (listen . args) (set! bot-quiet #f) "Okay, I'm listening.")
(define (evaluate . args)
  (let-values ([(ignoreables term) (string-split message "evaluate ")])
    (with-output-to-string 
        (lambda () (pretty-print 
                    (eval (with-input-from-string term read)))))))

(define (learn message)
  (let-values ([(term definition) (string-split message " is ")])
    (if (and term definition)
        (if (store-item dbcon term definition)
            (random-elem learn-responses)
            (random-elem knewthat-responses)))))
                
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

