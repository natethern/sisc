; The main turn-based engine

(define (main-loop id last-move expected-position)
  ; Receive and apply the server responses
  (debug "Receiving server response...")
  (receive-responses in)

  ; If we were making a confrontational move, check the success
  ; and adjust our estimated bid accordingly
;  (when expected-position
;	(adjust-bid! (equal? (my-position) expected-position)))

  ; Display the board
  (gui id)
;  (render-world id)
;  ; Display player positions
;  (display (let ((mypos (robot-position id)))
;	     (format "I am at: (~a,~a)~%" (car mypos) (cadr mypos))))
;  (for-each (lambda (oid)
;	      (when (not (= oid id))
;		    (display (let ((opos (robot-position oid)))
;			       (format "#~a is at: (~a,~a)~%" 
;				       id (car opos) (cadr opos))))))
;	    robot-ids)
			       
 ; Receive the currently available packages
  (debug "Receiving packages...")
  (for-each (lambda (package)
	      (apply package-drop! (cons package (cons id (robot-position id)))))
	    (receive-packages in))

  (debug "Thinking...")
  ; Decide on our move and send it to the server
  (let ((next-move (decide id (system-time) 400)))
    (debug "Sending move ~a ..." next-move)
    (apply send-command (cons out next-move))
    ;loop

    ; Pause for debugging
;    (read-char)

    (main-loop id next-move #f)))

