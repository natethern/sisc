; Bidding

(define money (make-hashtable))
(define estimated-bids (make-hashtable))

(define (robot-money id) 
  (hashtable/get money id 0))

(define (robot-money! id v)
  (hashtable/put! money id v))

(define (bid! id v)
  (robot-money! id (- (robot-money id) v)))

(define (forceful-bid id before)
  ((if before + -)
   estimated-confrontational-bid))

(define (peaceful-bid id) 1)

(define (adjust-bid! id success)
  (hashtable/put! estimated-bids id 
		  ((if success + -) (estimated-confrontational-bid id) 1)))


