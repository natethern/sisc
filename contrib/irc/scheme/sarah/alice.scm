(import s2j)
(import threading)
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

	          
(define alice-mutex (monitor/new))                              

(define ask-alice
  (let ([last-user #f])
    (lambda (from message)
      (monitor/synchronize-unsafe alice-mutex
       (lambda ()
	 (unless (equal? from last-user)
  	   (call-with-input-file 
	       (sisc:format "http://minstrel:2001/?text=Call+me+~a." from)
	     read-line)
	   (set! last-user from))
	 (call-with-input-file 
	     (sisc:format "http://minstrel:2001/?text=~a"
			  (->string (encode <java.net.URLEncoder>
					    (->jstring message))))
	   read-line))))))
