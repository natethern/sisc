; basic infobot plugins
(define (*-is? type)
  (lambda (channel message ignore term)
    (if (eqv? #\? (string-ref term (- (string-length term) 1)))
        (set! term (substring term 
                              0 (- (string-length term) 1))))
    (and term 
         (let ([results (lookup-item dbcon type (trim term))])
           (or (not results)
               (let ([random-result (random-elem results)])
                 (sisc:format "~a~a ~a ~a" 
                              (random-elem whatis-preludes) 
                              (car random-result)
                              (cdr (assq (if type type 'what)
                                         '((what . is) (where . "is at"))))
                              (cdr random-result))))))))

(define (learn type)
  (lambda (channel message term definition)
    (if (store-item dbcon type term definition)
	(random-elem learn-responses) 
	(random-elem knewthat-responses))))


(define (lookup-item conn type key)
  (let* ([stmt (jdbc/prepare-statement conn
                  (sisc:format 
                    (string-append
                      "SELECT knowledge.key, knowledge.data FROM knowledge LEFT JOIN aka ON "
                      "    (aka.key ilike '~a' AND aka.data ilike knowledge.key)"
                      " WHERE ((aka.key IS NULL AND knowledge.key ilike '~a') "
                      "    OR (aka.key IS NOT NULL)) "
                      "   ~a") 
                     key key (if type (sisc:format "AND type='~a'"
                                                   type) "")))]
         [results
          (jdbc/execute-query stmt)])
    (and (not (null? results)) 
         (ordered-stream-map (lambda (item)
                               (cons (item '1) (item '2)))
                     results))))

(define (store-item conn type key data)
  (let ([pstmt (jdbc/prepare-statement conn
                "INSERT INTO knowledge VALUES(?,trim(?),?)")])
    (set-string pstmt (->jint 1) (->jstring type))
    (set-string pstmt (->jint 2) (->jstring key))
    (set-string pstmt (->jint 3) (->jstring data))
    (with/fc (lambda (m e) #f) (lambda () (jdbc/execute pstmt)))))

(define (store-aka conn key data)
  (let ([pstmt (jdbc/prepare-statement conn
                "INSERT INTO aka VALUES(trim(?),trim(?))")])
    (set-string pstmt (->jint 1) (->jstring key))
    (set-string pstmt (->jint 2) (->jstring data))
    (with/fc (lambda (m e) #f) (lambda () (jdbc/execute pstmt)))))

(define (remove-items conn key)
  (let ([pstmt (jdbc/prepare-statement conn
                "DELETE FROM knowledge WHERE key=?")])
    (set-string pstmt (->jint 1) (->jstring key))
    (with/fc (lambda (m e) #f) (lambda () (jdbc/execute pstmt)))))

(define whatis-preludes
  '("I've heard " 
    "Someone once said "
    ""
    "I could be wrong, but "
    "Its been said that "
    "Last time I checked "
    "From what I understand, "))

(define knewthat-responses
  '("Thats what I heard."
    "Yep, I know."
    "Thats very true."))

(define learn-responses
  '("Got it."
    "Okay."
    "Understood."
    "I'll keep that in mind."
    "So noted."))

(define forget-responses
  '("Okay."
    "Consider it forgotten."))

(define didntknow-responses
  '("Already done."
    "Never knew it."))

