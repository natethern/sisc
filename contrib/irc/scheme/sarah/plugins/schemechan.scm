(import file-manipulation)

(define-record-type :schemer
  (make-schemer at-repl env queue)
  schemer?
  (at-repl schemer-at-repl? schemer-at-repl!)
  (env schemers-env set-schemers-env!)
  (queue schemers-queue set-schemers-queue!))

(define-record-type :scheme-channel
  (make-scheme-channel schemers)
  scheme-channel?
  (schemers scheme-channel-schemers set-scheme-channel-schemers!))

(define (make-schemechan channel message ignore term)
  (do-join term
           (make-channel-record term (channel-bot channel) #f '()
                                (list scheme-channel) #f))
  "Okay.")

(define (queue-empty? schemer)
  (equal? (schemers-queue schemer) ""))

(define (add-text-to-queue! schemer text)
  (set-schemers-queue! schemer
                       (string-append (schemers-queue schemer)
                                      text
                                      (string #\newline))))

(define (queue-complete? schemer)
  (let* ([text (schemers-queue schemer)]
         [sexpr (with/fc (lambda (m e)
                           "error")
                         (lambda ()
                           (with-input-from-string text read-code)))])
    (not (or (and (void? sexpr) (not (equal? text "#!void")))
             (eof-object? sexpr)))))

    
(define (queue->s-expressions channel schemer)
  (with/fc (lambda (m e)
             (clear-queue! schemer)
             (send-messages (channel-bot channel)
                            (channel-name channel)
                            (make-error-message
                             (error-location m)
                             (error-message m))))
           (lambda ()
             (let ([datum (with-input-from-string
                              (schemers-queue schemer)
                            (lambda ()
                              (let loop ([c (read-code)])
                                (if (eof-object? c)
                                    '()
                                    (cons c (loop (read-code)))))))])
               (clear-queue! schemer)
               datum))))

(define (clear-queue! schemer)
  (set-schemers-queue! schemer ""))

(define (scheme-channel channel message)
  (unless (channel-seed channel)
    (set-channel-seed! channel (make-scheme-channel
                                '())))
  (let ([schemechan (channel-seed channel)]
        [nick (message-nick message)])
    (unless (message-is-private? message)
      (unless (assoc nick (scheme-channel-schemers schemechan))
        (set-scheme-channel-schemers!
         schemechan (cons (cons nick
                                (make-schemer
                                 #f (make-scheme-channel-env schemechan) ""))
                          (scheme-channel-schemers schemechan))))
      (let ([schemer (cdr (assoc nick (scheme-channel-schemers schemechan)))]
            [text (message-text message)]
            [commands '(".exit" ".repl" ".attach" ".reset")])
        (let* ([i (string-index text #\space)]
               [command (trim (or (and i (substring text 0 i))
                                  text))])
          (if (member command commands)
              (cond [(equal? command ".exit")
                     (clear-queue! schemer)
                     (schemer-at-repl! schemer #f)
                     (send-messages (channel-bot channel)
                                    (message-nick message)
                                    "You are now chatting.")]
                    [(equal? command ".repl")
                     (schemer-at-repl! schemer #t)
                     (send-messages (channel-bot channel)
                                   (message-nick message)
                                   "You are now in the REPL.")]
                    [(equal? command ".attach")
                     (let ([user (trim (substring text i (string-length text)))])
                       (set-schemers-env!
                        schemer (schemers-env
                                 (cdr (assoc user (scheme-channel-schemers
                                                   schemechan))))))]
                    [(equal? command ".reset")
                     (set-schemers-env! schemer
                                        (make-scheme-channel-env schemechan))])
            (when (schemer-at-repl? schemer)
              (add-text-to-queue! schemer text)
              (when (queue-complete? schemer)
                (strict-r5rs-compliance #t)
                (send-messages
                 (channel-bot channel) (channel-name channel)
                 (let loop ([vs (queue->s-expressions channel
                                                      schemer)])
                   (if (null? vs)
                       ""
                       (string-append
                        (eval-within-n-ms
                         (car vs) 5000
                         (schemers-env schemer))
                        (string #\newline)
                        (loop (cdr vs))))))))))))))

(define (forbidden-procedure name)
  (lambda args
    (error name "use is forbidden in this environment.")))

(define forbidden-bindings 
   '(open-input-file open-output-file 
    interaction-environment
    with-output-to-file
    with-input-from-file
    call-with-input-file
    call-with-output-file
    open-source-input-file))

(define (my-load url env)
  (call-with-input-file url
    (lambda (in)
     (let loop ([expr (read-code in)])
       (unless (eof-object? expr)
         (eval expr env)
         (loop (read-code in)))))))

(define simple-gen-sym 
  (let ([x 0])
    (lambda (var)
      (set! x (+ x 1))
      (string->symbol (format "~a_~a" var x)))))

(define (make-scheme-channel-env schemechan)
  (let* ([etmp (scheme-report-environment 5)]
         [special-var (string->uninterned-symbol "no-binding")]
         [from (lambda (user binding)
                 (if (assoc user (scheme-channel-schemers schemechan))
                     (let ([rv (getprop binding
                                        (schemers-env
                                         (cdr (assoc user (scheme-channel-schemers
                                                           schemechan))))
                                        special-var)])
                       (if (eq? rv special-var)
                           (eval binding (null-environment 5))
                           rv))
                     (eval binding (null-environment 5))))]
         [load-from-url
          (lambda (url)
            (with/fc (lambda (m e)  
                       (if (eq? (error-location m) 'load)
                           (throw m e)
                           (my-load url etmp)))
                     (lambda ()
                       (when (file-is-file? url) 
                         (error 'load "Loading from local files not permitted.")))))])
    (for-each (lambda (proc)
                (putprop proc etmp (forbidden-procedure proc)))
              forbidden-bindings)
    (putprop '$sc-put-cte etmp $sc-put-cte)
    (putprop '$syntax-dispatch etmp $syntax-dispatch)
    (putprop 'syntax-error etmp syntax-error)
    (putprop '_load etmp my-load)
    (putprop 'gen-sym etmp simple-gen-sym)
    (putprop ': etmp from)
    (putprop 'sc-expand etmp 
             (lambda (v) 
               (let ((old-env (interaction-environment etmp)))
                 (dynamic-wind
                     void
                     (lambda () (sc-expand v '(e) '(e)))
                     (lambda () (interaction-environment
                                 old-env))))))
    (putprop 'load etmp load-from-url)
    etmp))

(define (init-schemechan-plugin)
  (add-part-hook
   (lambda (channel sender login hostname)
     (when (get-channel channel)
       (let ([schemechan (channel-seed (get-channel channel))])
         (when (and schemechan
                    (assoc sender (scheme-channel-schemers schemechan)))
           (set-scheme-channel-schemers!
            (delete (cdr (assoc sender
                                (scheme-channel-schemers schemechan)))
                    (scheme-channel-schemers scheme-channel-schemers)))))))))