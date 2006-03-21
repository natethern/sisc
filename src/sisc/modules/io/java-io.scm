(define-java-classes
  (<java.io.input-stream> |java.io.InputStream|)
  (<java.io.output-stream> |java.io.OutputStream|)
  (<java.io.reader> |java.io.Reader|)
  (<java.io.writer> |java.io.Writer|)
  (<sisc.io.stream-input-port> |sisc.io.StreamInputPort|)
  (<sisc.io.stream-output-port> |sisc.io.StreamOutputPort|)
  (<sisc.io.reader-input-port> |sisc.io.ReaderInputPort|)
  (<sisc.io.writer-output-port> |sisc.io.WriterOutputPort|))

(define-generic-java-methods
  get-input-stream get-output-stream get-reader get-writer)


;; Java Input/OutputStream to non-character port
(define-generics ->binary-input-port ->binary-output-port)

;; 1. InputStream -> <native-input-port>
(define-method (->binary-input-port (<java.io.input-stream> is))
  (make <native-input-port>
    (java-unwrap (java-new <sisc.io.stream-input-port> is))))

;; 2. OutputStream -> <native-output-port>
(define-method (->binary-output-port (<java.io.output-stream> os)
                                     (<boolean> aflush?))
  (make <native-output-port>
    (java-unwrap (java-new <sisc.io.stream-output-port> os
                           (->jboolean aflush?)))))
(define-method (->binary-output-port (<java.io.output-stream> os))
  (->binary-output-port os #f))


;; Java Read/Writer to character port
(define-generics ->character-input-port ->character-output-port)

;; 3. Reader -> <native-character-input-port>
(define-method (->character-input-port (<java.io.reader> reader))
  (make <native-character-input-port>
    (java-unwrap (java-new <sisc.io.reader-input-port> reader))))

;; 4. Writer -> <native-character-output-port>
(define-method (->character-output-port (<java.io.writer> writer)
                                        (<boolean> aflush?))
  (make <native-character-output-port>
    (java-unwrap (java-new <sisc.io.writer-output-port> writer
                           (->jboolean aflush?)))))
(define-method (->character-output-port (<java.io.writer> writer))
  (->character-output-port writer #f))



;; <filter-*-port> -> Java Stream
(define-generics ->jinput-stream ->joutput-stream)

;; 5. <filter-input-port> -> InputStream
(define-method (->jinput-stream (<filter-input-port> in-port))
  (get-input-stream (java-wrap (:in in-port))))

;; 6. <character-input-port> -> InputStream (error)
(define-method (->jinput-stream (<character-input-port> in-port))
  (error "Cannot obtain an InputStream from a <character-input-port>"))

;; 7. <filter-output-port> -> OutputStream
(define-method (->joutput-stream (<filter-output-port> out-port))
  (get-output-stream (java-wrap (:out out-port))))

;; 8. <character-output-port> -> OutputStream (error)
(define-method (->joutput-stream (<character-output-port> out-port))
  (error "Cannot obtain an OutputStream from a <charater-output-port>"))


;; <native-*-character-port> -> Java Read/Writer
(define-generics ->jreader ->jwriter)

;; 9. <native-character-input-port> => Reader
(define-method (->jreader (<native-character-input-port> in-port))
  (get-reader (java-wrap (:in in-port))))

;; 10. <native-character-output-port> => Writer
(define-method (->jwriter (<native-character-output-port> out-port))
  (get-writer (java-wrap (:out out-port))))
