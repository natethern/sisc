;; A simple SISC interface to the JDBC API
;;
;; Results are returned as a stream of 'result set accessor' procedures,
;; each of which can be applied to an integer (column number) or
;; a string (column label).
;;
;; Currently only supports SQL number and string types.
(module jdbc (jdbc/connect jdbc/prepare-statement
                           jdbc/execute-query jdbc/execute jdbc/close
                           set-int set-string set-double set-float)
  (import old-s2j)
  (import old-generic-procedures)
  (import streams)
  (define <java.sql.Connection> (java-class "java.sql.Connection"))
  (define <java.sql.PreparedStatement> (java-class "java.sql.PreparedStatement"))
  (define <java.sql.ResultSet> (java-class "java.sql.ResultSet"))
  (define <java.sql.DriverManager> (java-class "java.sql.DriverManager"))
  (define <java.sql.Types> (java-class "java.sql.Types"))  
  (define-generic close)
  (define-generic prepare-statement)
  (define-generic execute-query)
  (define-generic execute-update)
  (define-generic get-connection)
  (define-generic get-meta-data)
  (define-generic get-type)
  (define-generic get-string)
  (define-generic get-int)
  (define-generic get-float)
  (define-generic get-double)
  (define-generic set-string)
  (define-generic set-int)
  (define-generic set-float)
  (define-generic set-double)
  (define-generic get-column-type)
  (define-generic get-column-count)
  (define-generic get-column-label)
  (define-generic delete-row)
  (define-generic next)
  (define jdbc/close close)
  (define type-conversions #f)
  (define (list-index ls e)
    (cond [(null? ls) #f]
          [(equal? (car ls) e) 0]
          [else (+ 1 (list-index (cdr ls) e))]))
  (define (jdbc/connect jdbc-datasource)
    (get-connection <java.sql.DriverManager> (->jstring jdbc-datasource)))
  (define jdbc/execute execute-update)
  (define (jdbc/execute-query statement)
    (let* ((rs (execute-query statement))
           (md (get-meta-data rs))
           (cc (->number (get-column-count md)))
           (cn (map (lambda (i)
                      (->string (get-column-label md (->jint i))))
                      (cdr (iota (+ cc 1))))))
      (let ((types-conv (map (lambda (t)
                               (cdr (assoc (->number (get-column-type md (->jint (+ t 1)))) type-conversions)))
                             (iota cc))))
        (letrec ((build-row-accessor 
                  (lambda (rs)
                    (lambda (field-id)
                      (let* ((field-pos 
                              (cond [(eq? field-id 'delete) 
                                     (delete-row rs)]
                                    [(number? field-id)
                                     field-id]
                                    [(string? field-id)
                                     (+ (list-index cn field-id) 1)]
                                    [else (error 'result-set "columns are indexed by positive non-zero integers and by field-name strings.")]))
                             (conv-record (list-ref types-conv
                                                    (- field-pos 1))))
                        ((cdr conv-record) ((car conv-record) 
                                            rs (->jint field-pos)))))))
                 (fetch-next-row
                  (lambda ()
                    (if (->boolean (next rs))
                        (stream-cons (build-row-accessor rs)
                                     (fetch-next-row))
                        '()))))
          (fetch-next-row)))))
  (define (jdbc/prepare-statement connection query . updatable)
    (if (and (not (null? updatable)) (car updatable))
        (prepare-statement connection (->jstring query)
                           (<java.sql.ResultSet> '|TYPE_FORWARD_ONLY|)
                           (<java.sql.ResultSet> '|CONCUR_UPDATABLE|))
        (prepare-statement connection (->jstring query))))
                                                       
  (set! type-conversions
        `((,(->number (<java.sql.Types> '|INTEGER|)) . (,get-int . ,->number))
          (,(->number (<java.sql.Types> '|FLOAT|)) . (,get-float . ,->number))
          (,(->number (<java.sql.Types> '|DOUBLE|)) . (,get-double . ,->number))
          (,(->number (<java.sql.Types> '|DECIMAL|)) . (,get-double . ,->number))
          (,(->number (<java.sql.Types> '|NUMERIC|)) . (,get-double . ,->number))
          (,(->number (<java.sql.Types> '|REAL|)) . (,get-float . ,->number))
          (,(->number (<java.sql.Types> '|VARCHAR|)) . (,get-string . ,->string))
          (,(->number (<java.sql.Types> '|CHAR|)) . (,get-string . ,->string))))
  (java-class "org.postgresql.Driver"))


