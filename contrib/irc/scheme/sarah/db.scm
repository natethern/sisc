(import srfi-19)
(import jdbc)
(import s2j)
(import streams)

(define (dbconnect host)
  (jdbc/connect (format "jdbc:postgresql://~a/sarah?user=scgmille" host)))

(define (lookup-item conn type key)
  (let* ([stmt (jdbc/prepare-statement conn
                (format "SELECT key, data FROM knowledge WHERE type='~a' AND lower(key)='~a'" 
                        type (string-downcase key)))]
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

(define (lookup-seen conn person)
  (let* ([stmt (jdbc/prepare-statement conn
                (format "SELECT to_char(seenon, 'Mon DD at HH:MI pm'),message FROM seen WHERE lower(nick)='~a'" 
                        (string-downcase person)))]
         [result
          (jdbc/execute-query stmt)])
    (and (not (null? result)) 
         (values ((car result) '1)
                 ((car result) '2)))))

(define (store-seen conn person message)
  (let ([pstmt (if (lookup-seen conn person)
                   (let ([stmt
                          (jdbc/prepare-statement conn "UPDATE seen SET seenon=NOW(), message=? WHERE lower(nick)=?")])
                     (set-string stmt (->jint 1) (->jstring message))
                     (set-string stmt (->jint 2) (->jstring (string-downcase 
                                                             person)))
                     stmt)
                   (let ([stmt
                          (jdbc/prepare-statement conn "INSERT INTO seen(nick,seenon,message) VALUES(?,NOW(),?)")])
                     (set-string stmt (->jint 1) (->jstring (string-downcase person)))
                     (set-string stmt (->jint 2) (->jstring message))
                     stmt))])
    (with/fc (lambda (m e) #f) (lambda () (jdbc/execute pstmt)))))


(define (store-message conn sender recipient message) 
  (let ([pstmt (jdbc/prepare-statement conn
                "INSERT INTO tell VALUES(?,?,?)")])
    (set-string pstmt (->jint 1) (->jstring recipient))
    (set-string pstmt (->jint 2) (->jstring sender))
    (set-string pstmt (->jint 3) (->jstring message))
    (with/fc (lambda (m e) #f) (lambda () (jdbc/execute pstmt)))))

(define (fetch-messages! conn recipient)
  (let* ([stmt (jdbc/prepare-statement conn
                                       (format "SELECT sender, message FROM tell WHERE lower(recipient)='~a'"
                                               (string-downcase recipient)))]
         [results
          (jdbc/execute-query stmt)])
    (and (not (null? results)) 
         (begin 
           (let ([rv
                  (ordered-stream-map (lambda (item)  (cons (item '1)
                                                            (item '2)))
                                      results)])
             (jdbc/execute (jdbc/prepare-statement 
                            conn (format "DELETE FROM tell WHERE lower(recipient)='~a'" 
                                         (string-downcase recipient))))
             rv)))))

