(define somewhat-clean
  (string->list "abcdefghijklmnopqrstuvwxyz()[]->+-*/_01234567890?!."))
(define really-clean
  (string->list "abcdefghijklmnopqrstuvwxyz"))

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
                                      (apply (cdr handler) (list-skip tokens n)))))])
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
    (be . ((quiet . QUIET)))
    (listen . LISTEN)
    (evaluate . EVALUATE)
    ))

(define (what-is . args)
  (case (car args)
    ((SISC) "A lightweight Scheme Interpreter")
    (else #f)))

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
    (EVALUATE . ,evaluate)))

