(import s2j) 
(import generic-procedures)

(define-generic exec)
(define-generic get-runtime)
(define-generic get-input-stream)
(define-generic get-output-stream)

(define <java.lang.Runtime> (java-class "java.lang.Runtime"))
(define <sisc.io.StreamInputPort> (java-class "sisc.io.StreamInputPort"))
(define <sisc.io.StreamOutputPort> (java-class "sisc.io.StreamOutputPort"))

(define (debug-read-char port)
  (let ((c (read-char port)))
    (display c)
    c))

(define (make-hal)
  (let* ([process (exec (get-runtime <java.lang.Runtime>) 
                       (->jstring "megahal"))]
         [outp
          (java-unwrap (make <sisc.io.StreamOutputPort> 
                             (get-output-stream process)
                             (->jboolean #t)))]
         [inp
          (java-unwrap
           (make <sisc.io.StreamInputPort> (get-input-stream process)))])
    (let loop ([c (debug-read-char inp)])
      (unless (eq? c #\>)
        (loop (debug-read-char inp))))
    (debug-read-char inp)
    (vector 'hal inp outp process)))



(define (say hal msg)
  (display (format "~a~%~%" msg) (vector-ref hal 2))

  (let ([inp (vector-ref hal 1)])
    (if (char-ready? inp)
        (display "!"))
    (debug-read-char inp)  (debug-read-char inp) 
    (let loop ([acc '()])
      (let ([c (debug-read-char inp)])
        (cond [(eq? c #\>)
               (begin (debug-read-char inp)
                      (list->string (reverse acc)))]
              [(eq? c #\newline)
               (loop (cons #\space acc))]
              [(eof-object? c)
               "I have nothing to say."]
              [else
                (loop (cons c acc))))))))

(define (close-hal h)
  (display (format "#QUIT~%~%~%") (vector-ref h 2)))

