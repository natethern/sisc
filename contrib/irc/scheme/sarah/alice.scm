(import s2j)
(import generic-procedures)
(define <java.net.URLEncoder> (java-class "java.net.URLEncoder"))

(define-generic encode)

(define (read-line . port)
  (let* ((char (apply read-char port)))
    (if (eof-object? char)
        char
        (do ((char char (apply read-char port))
             (clist '() (cons char clist)))
            ((or (eof-object? char) (char=? #\newline char))
             (list->string (reverse clist)))))))

	                                        
(define (ask-alice message)
  (call-with-input-file (sisc:format "http://minstrel:2001/?text=~a"
                                (->string (encode <java.net.URLEncoder>
                                          (->jstring message))))
    read-line))
