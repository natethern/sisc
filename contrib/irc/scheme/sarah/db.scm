(import jdbc)
(import s2j)
(import streams)

(define (dbconnect host)
  (jdbc/connect (format "jdbc:postgresql://~a/sarah?user=scgmille" host)))

(define (lookup-item conn key)
  (let* ([stmt (jdbc/prepare-statement conn
                (format "SELECT key, data FROM knowledge WHERE lower(key)='~a'" 
                        (string-downcase key)))]
         [results
          (jdbc/execute-query stmt)])
    (and (not (null? results)) 
         (ordered-stream-map (lambda (item)
                               (cons (item '1) (item '2)))
                     results))))

(define (store-item conn key data)
  (let ([pstmt (jdbc/prepare-statement conn
                "INSERT INTO knowledge VALUES(trim(?),?)")])
    (set-string pstmt (->jint 1) (->jstring key))
    (set-string pstmt (->jint 2) (->jstring data))
    (with/fc (lambda (m e) #f) (lambda () (jdbc/execute pstmt)))))

