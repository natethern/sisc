(define seen-table (make-hashtable))


(define (seen? id x y) 
  (let ((seenworld (hashtable/get! seen-table id (lambda () (make-string 
							     (* world-width world-height))))))
							     
    (char->integer (string-ref seenworld (world-idx x y)))))

(define (clear-seen! id)
  (hashtable/remove! seen-table id))

(define (set-seen! id x y)
  (let ((seenworld (hashtable/get! seen-table id (lambda () (make-string 
							     (* world-width world-height))))))
    (string-set! seenworld (world-idx x y) 
                 (integer->char
                  (+ (char->integer (string-ref seenworld (world-idx x y)))
                     1)))))
                    
                    

