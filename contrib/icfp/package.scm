; Package representation

(define (remove x ls)
  (if (null? ls) '()
      (if (eq? x (car ls))
	  (remove x (cdr ls))
	  (cons (car ls) (remove x (cdr ls))))))

(define unclaimed-packages (make-hashtable))
(define claimed-packages (make-hashtable))
(define all-packages (make-hashtable))

(define (make-package id)
  (let ((p (make-hashtable)))
    (hashtable/put! p 'id id)
    p))

(define (package-id p) (hashtable/get p 'id))
(define (package-location p) (hashtable/get p 'location))
(define (package-destination p) (hashtable/get p 'destination))
(define (package-weight p) (hashtable/get p 'weight))

(define (package-details! p destx desty weight)
  (hashtable/put! p 'destination (list destx desty))
  (hashtable/put! p 'weight weight))

(define (package-location! p . loc)
  (hashtable/put! p 'location loc))

(define (package-lookup id)
  (hashtable/get all-packages id))

; Called when we observe a drop action.  This does nothing if the package
; was delivered (we knew its destination and it was dropped at that destination)
; If it was dropped and we don't know its destination, we record the package as
; unclaimed.
(define (package-drop! p id . droploc)
  (when p
	(let ((loc (package-destination p)))
          (debug "loc: ~a" loc)
          (begin (if (not (and loc (equal? loc droploc)))
                     (hashtable/put! unclaimed-packages (package-id p) p)
                     (begin 
                       (hashtable/put! 
                        claimed-packages id 
                        (remove p (hashtable/get claimed-packages id '())))
                       (hashtable/remove! all-packages (package-id p))))
                 (robot-load-decr! id (package-weight p))
                 (apply package-location! `(,p ,@droploc))
                 (clear-seen! id)))
        droploc))


(define (package-add! p)
  (hashtable/put! unclaimed-packages (package-id p) p)
  (hashtable/put! all-packages (package-id p) p))
    
; Called when we observe a pickup action.  This removes the package
; from those we know about that are unclaimed.
(define (package-pickup! p id . pickuploc)
  (when p
	(hashtable/remove! unclaimed-packages (package-id p))
	(robot-load-incr! id (package-weight p))
	(hashtable/put! claimed-packages id
                        (cons p (hashtable/get claimed-packages id '())))
        (clear-seen! id)))

(define (robots-packages id)
  (hashtable/get claimed-packages id '()))

(define (packages . loc)
  (apply append
	 (hashtable/map (lambda (key val)
			  (if (equal? (package-location val) loc)
			      (list val)
			      '()))
			unclaimed-packages)))