(import jdbc)
(import s2j)

(define (dbconnect host)
  (jdbc/connect (format "jdbc:postgresql://~a/sarah?user=scgmille" host)))

(define (lookup-item conn key)
  (let* ([stmt (jdbc/prepare-statement conn
                (format "SELECT data FROM knowledge WHERE key='~a'" key))]
         [results
          (jdbc/execute-query stmt)])
    (and (not (null? results)) ((car results) '1))))

(define (store-item conn key data)
  (let ([pstmt (jdbc/prepare-statement conn
                "INSERT INTO knowledge VALUES(?,?)")])
    (set-string pstmt (->jint 1) (->jstring (string-downcase key)))
    (set-string pstmt (->jint 2) (->jstring data))
    (jdbc/execute pstmt)))

