(import srfi-11)
(import srfi-19)
(import jdbc)
(import s2j)
(import streams)

(define (dbconnect host)
  (jdbc/connect (sisc:format "jdbc:postgresql://~a/sarah?user=scgmille" host)))

(define (lookup-item conn type key)
  (let* ([stmt (jdbc/prepare-statement conn
                (if type
                  (sisc:format 
                    "SELECT key, data FROM knowledge WHERE type='~a' AND key ilike '%~a%'" 
                        type (string-downcase key))
                  (sisc:format 
                    "SELECT key, data FROM knowledge WHERE key ilike '%~a%'" 
                        (string-downcase key))))]
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

(define (remove-items conn key)
  (let ([pstmt (jdbc/prepare-statement conn
                "DELETE FROM knowledge WHERE key=?")])
    (set-string pstmt (->jint 1) (->jstring key))
    (with/fc (lambda (m e) #f) (lambda () (jdbc/execute pstmt)))))

(define (lookup-seen conn person)
  (let* ([stmt (jdbc/prepare-statement conn
                (sisc:format (string-append "SELECT to_char(timezone('UTC',seenon), 'Mon DD at HH:MI pm')"
		                            ", message, nick FROM seen WHERE id='~a'")
                             person))]
         [result
          (jdbc/execute-query stmt)])
    (if (not (null? result)) 
        (values ((car result) '1)
                ((car result) '2)
		((car result) '3))
        (values #f #f #f))))

(define (store-seen conn id person message)
  (let ([pstmt (if (let-values ([(a b c) (lookup-seen conn id)]) a)
                   (let ([stmt
                          (jdbc/prepare-statement conn 
               "UPDATE seen SET seenon=NOW(), message=?, nick=? WHERE id=?")])
                     (set-string stmt (->jint 1) (->jstring message))
                     (set-string stmt (->jint 2) (->jstring (string-downcase 
                                                             person)))
                     (set-string stmt (->jint 3) (->jstring id))
                     stmt)
                   (let ([stmt
                          (jdbc/prepare-statement conn 
                   "INSERT INTO seen(nick,seenon,message, id) VALUES(?,NOW(),?,?)")])
                     (set-string stmt (->jint 1) 
                                 (->jstring (string-downcase person)))
                     (set-string stmt (->jint 2) (->jstring message))
                     (set-string stmt (->jint 3) (->jstring id))
                     stmt))])
    (with/fc (lambda (m e) #f) (lambda () 
                                 (display pstmt) 
                                 (newline)
                                 (jdbc/execute pstmt)))))


(define (store-message conn sender id recipient message) 
  (let ([pstmt (jdbc/prepare-statement conn
                "INSERT INTO tell(recipient, sender, message, id) VALUES(?,?,?,?)")])
    (set-string pstmt (->jint 1) (->jstring recipient))
    (set-string pstmt (->jint 2) (->jstring sender))
    (set-string pstmt (->jint 3) (->jstring message))
    (set-string pstmt (->jint 4) (->jstring id))
    (with/fc (lambda (m e) #f) (lambda () (jdbc/execute pstmt)))))

(define (fetch-messages! conn recipient)
  (let* ([stmt (jdbc/prepare-statement conn
                                       (sisc:format "SELECT sender, message FROM tell WHERE id='~a'"
                                                    recipient))]
         [results
          (jdbc/execute-query stmt)])
    (and (not (null? results)) 
         (begin 
           (let ([rv
                  (ordered-stream-map (lambda (item)  (cons (item '1)
                                                            (item '2)))
                                      results)])
             (jdbc/execute (jdbc/prepare-statement 
                            conn (sisc:format "DELETE FROM tell WHERE id='~a'" 
                                              recipient)))
             rv)))))

