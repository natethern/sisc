;; ICFP 2002 Entry 
;; Initialization file
(current-optimizer (lambda (x) x))
(putprop 'assumptive-procedures '*opt* '(+ - * / not car cdr cons))

(trace 'load)
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

(define in)
(define out)
(define sock)

(define (debug . args)
  (display (apply format args))
  (newline))

(define (st) (stack-trace (get-last-error)))
(define (et) (print-error (get-last-error)))
  
(import s2j)
(import generic-procedures)
(define-generic repaint)
(define-generic show)
(define gui-frame)
(define gui-pane)
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
    (set! gui-frame (make (java-class "Gui")))
    (set! gui-pane (gui-frame 'a))
    (display gui-frame)
    (show gui-frame)
    (debug "Entering main-loop...")
    (main-loop playerno #f #f)))
;(go)
(define (gui id)
  (repaint gui-pane))


