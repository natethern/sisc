; Data representation for SRFI-14

(define-record-type :char-set
  (make-char-set v)
  char-set?
  (v char-set:s char-set:s!))

(define-record-type :char-set-cursor
  (make-char-set-cursor cset mask)
  char-set-cursor?
  (cset char-set-cursor-cset)
  (mask char-set-cursor-mask char-set-cursor-mask!))


