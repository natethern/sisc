;; ICFP 2002 Entry 
;; Initialization file
; Load the source code
(load "constants.scm")
(load "gamestate.scm")
(load "world.scm")
(load "weights.scm")
(load "package.scm")
(load "io.scm")
(load "bid.scm")
(load "mainloop.scm")
(load "ai.scm")
(load "moves.scm")
(load "seen.scm")
;(load "priorque.scm")
(load "prioq.scm")
(load "astar.scm")

(define in (void))
(define out (void))
(define sock (void))

(define (debug . args)
  (display (apply format args))
  (newline))


(define (go)
  (let ((connection 
         (connect (getprop 'host '*environment-variables*)
                  (string->number (getprop 'port '*environment-variables*)))))
    (set! sock (car connection))
    (set! in (cadr connection))
    (set! out (caddr connection)))
  (debug "Handshaking...")
  (handshake in out)
  (debug "Receiving Game State...")
  
  (let ((playerno (receive-gamestate in)))
    (set! gui-frame (make (java-class "Gui") (->jint playerno)))
    (set! gui-pane (gui-frame 'a))
    (display gui-frame)
    (show gui-frame)
    (debug "Entering main-loop...")
    (main-loop playerno #f #f)))
;(go)
(define (gui id) 
 (repaint gui-pane))


