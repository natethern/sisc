;; SRFI-27 - Sources of Random Bits
;; 
;; Implementation for SISC
;; (make-random-source), given zero arguments, produces a secure
;; PRNG based on java.util.SecureRandom, initialized with a seed
;; of the first 16 hexadecimal digits of the Golden Ratio.
;;
;; One argument is allowed to make-random-source, a symbol which can be:
;;  'fast   : Generate a fast prng initialized with the golden ratio
;;  'secure : Generate a secure prng as above
;;
;; The secure RNG is java.security.SecureRandom.  It is cryptographically
;; strong against prediction, given a random seed.
;;
;; random-source-randomize! will seed from the same algorithm
;; used by default for SecureRandom when given a secure PRNG, and
;; will use output from a secure prng to seed fast PRNGs.

(define <java.util.Random> (java-class "java.util.Random"))
(define <java.security.SecureRandom> (java-class "java.security.SecureRandom"))
(define <java.math.BigInteger> (java-class "java.math.BigInteger"))
(define-generic next-int)
(define-generic next-long)
(define-generic next-double)
(define-generic get-instance)
(define-generic set-seed)
(define-generic generate-seed)

(define log2 
  (let ([ln2 (log 2)])
    (lambda (n)
      (/ (log n) ln2))))

(define (bits-of n)
  (inexact->exact (ceiling (log2 n))))

(define (random-source-make-integers s)
  (lambda (n)
    (let ([bits-needed (bits-of n)])
      (modulo 
       (if (<= bits-needed 31)
	   (logand #x7fffffff 
		   (->number (next-int s)))
	   (->number (make <java.math.BigInteger> (->jint bits-needed) 
			   s)))
       n))))

(define (random-source-make-reals s . unit)
  (lambda ()
    (let loop ([result (->number (next-double s))])
      (if (zero? result) 
	  (loop (->number (next-double s)))
	  result))))

(define (make-secure-prng)
  (get-instance <java.security.SecureRandom> (->jstring "SHA1PRNG")))

(define (make-fast-prng l) (make <java.util.Random>) l)

(define (make-random-source . type) 
  (let ([golden-ratio #x9e3779b97f4a7c15])
    (if (and (pair? type) (eq? (car type) 'fast))
	(make-fast-prng (->jlong golden-ratio))
	(let ([rv (make-secure-prng)])
	  (random-source-state-set! rv golden-ratio)
	  rv))))

(define secure-random-source)
(define default-random-source)

(define random-integer)
(define random-real)

(define (random-source? v)
  (type<= (type-of v) <java.util.Random>))

(define (random-source-randomize! s)
  (set-seed s 
	    (if (type<= (type-of s) <java.security.SecureRandom>)
		(generate-seed s (->jint 128))
		(next-long secure-random-source))))

(define random-source-table (make-hashtable equal?))

(define (random-source-pseudo-randomize! s . ij)
  (set-seed s (hashtable/get! random-source-table ij 
			      (lambda ()
				(next-long secure-random-source)))))

(define (random-source-state-ref s)
  (->number (next-long s)))

(define (random-source-state-set! s state)
  (set-seed s (->jlong state)))

;; current problem: these objects wont serialize
(define (srfi-27-init)
  (set! secure-random-source (let ([s (make-random-source)])
			       (random-source-randomize! s)
			       s))
  (set! default-random-source (make-random-source))
  (set! random-integer  (random-source-make-integers default-random-source))
  (set! random-real (random-source-make-reals default-random-source)))