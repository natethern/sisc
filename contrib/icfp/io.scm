; IO Routines

(import networking) ; Load TCP/IP stack

(define (connect host port)
  (let* ((sock (open-tcp-socket host port))
	 (in (open-socket-input-port sock))
	 (out (open-socket-output-port sock #t)))
    (list sock in out)))

(define (check-newline in)
  (let ((next-char (read-char in)))
    (if (not (eq? next-char #\newline))
	(error 'receive-world 
	       "Expected a newline, got '~a'." next-char))))

(define (receive-world in)
  (let* ((w (read in))
	 (h (read in))
	 (world (make-world! w h)))
    (check-newline in)
    (do ((y 1 (+ y 1)))
	((> y h) world)
      (do ((x 1 (+ x 1)))
	  ((> x w))
	(let ((square (read-char in)))
	  (world-set! world x y square)
	  (if (eq? square BASE)
	      (add-home-base! x y))))
      (check-newline in))))

  
(define (receive-configuration in)
  (let* ((id (read in))
	 (cap (read in))
	 (money (read in)))
    (check-newline in)
    (robot-capacity! id cap)
    (robot-money! id money)
    id))

(define (receive-package in)
  (and (not (eq? (peek-char in) #\newline))
      (let* ((id (read in))
	     (x (read in))
	     (y (read in))
	     (weight (read in)))
        (let ((p (make-package id)))
          (package-details! p x y weight)
          (package-drop! p 0 x y)
          p))))


(define (more-packages? in)
  (let ((nc (read-char in)))
    (and (not (eof-object? nc))
	 (not (eq? nc #\newline)))))

(define more-responses? more-packages?)
(define more-robots? more-packages?)

(define (receive-packages in)
  (let ((package (receive-package in)))
    (cond [(not package) (begin (check-newline in) '())]
	  [(more-packages? in)
	   (cons package (receive-packages in))]
	  [else 
	   (list package)])))

(define (receive-robots in)
  (let* ((id (begin (read-char in) (read in)))
	 (x (begin (read in) (read in)))
	 (y (begin (read in) (read in))))
    (store-robot-location! id x y)
    (if (more-robots? in)
	(cons id (receive-robots in))
	(list id))))

(define (send-command out bid command . args)
  (display (format "~a ~a" bid command) out)
  (for-each (lambda (arg)
	      (display #\space out)
	      (display arg out))
	    args)
  (newline out))

(define (receive-responses in)
  (let* ((id (begin (read-char in) (read in))))
    (if (not (eq? (peek-char in) #\newline))
	(let loop ([code (read in)])
	  (parse-response id code in)
	  (cond [(and (eq? (peek-char in) #\space)
		      (read-char in)
		      (eq? (peek-char in) #\#))
		 (receive-responses in)]
		[(not (eq? (peek-char in) #\newline))
		 (loop (read in))])))
    (check-newline in)))

(define (receive-gamestate in)
  (receive-world in)
  (receive-configuration in))

(define (handshake in out)
  (display (format "Player~%") out))

;(trace 'receive-configuration 'read-char 'receive-responses 'parse-response)
