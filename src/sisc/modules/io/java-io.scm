(define-java-classes
  (<java.io.input-stream> |java.io.InputStream|)
  (<java.io.output-stream> |java.io.OutputStream|)
  (<java.io.reader> |java.io.Reader|)
  (<java.io.writer> |java.io.Writer|)
  (<sisc.io.autoflush-output-stream> |sisc.io.AutoflushOutputStream|)
  (<sisc.io.autoflush-writer> |sisc.io.AutoflushWriter|)
  (<sisc.data.scheme-binary-input-port> |sisc.data.SchemeBinaryInputPort|)
  (<sisc.data.scheme-binary-output-port> |sisc.data.SchemeBinaryOutputPort|)
  (<sisc.data.scheme-character-input-port> |sisc.data.SchemeCharacterInputPort|)
  (<sisc.data.scheme-character-output-port> |sisc.data.SchemeCharacterOutputPort|))

(define-generic-java-methods
  get-input-stream get-output-stream get-reader get-writer)


;; Java Input/OutputStream to non-character port
(define-generics ->binary-input-port ->binary-output-port)

;; 1. InputStream -> <native-input-port>
(define-method (->binary-input-port (<java.io.input-stream> is))
  (java-unwrap (java-new <sisc.data.stream-binary-input-port> is)))

;; 2. OutputStream -> <native-output-port>
(define-method (->binary-output-port (<java.io.output-stream> os)
                                     (<boolean> aflush?))
  (java-unwrap 
   (java-new <sisc.data.scheme-binary-output-port>
     (if aflush?
       (java-new <sisc.io.autoflush-output-stream> os)
       os))))

(define-method (->binary-output-port (<java.io.output-stream> os))
  (->binary-output-port os #f))


;; Java Read/Writer to character port
(define-generics ->character-input-port ->character-output-port)

;; 3. Reader -> <native-character-input-port>
(define-method (->character-input-port (<java.io.reader> reader))
  (java-unwrap (java-new <sisc.data.scheme-character-input-port> reader)))

;; 4. Writer -> <native-character-output-port>
(define-method (->character-output-port (<java.io.writer> writer)
                                        (<boolean> aflush?))
  (java-unwrap 
   (java-new <sisc.data.scheme-character-output-port>
     (if aflush?
       (java-new <sisc.io.autoflush-writer> writer)
       writer))))

(define-method (->character-output-port (<java.io.writer> writer))
  (->character-output-port writer #f))

;; <filter-*-port> -> Java Stream
(define-generics ->jinput-stream ->joutput-stream)

;; 5. <filter-input-port> -> InputStream
(define-method (->jinput-stream (<binary-input-port> in-port))
  (get-input-stream in-port))

;; 6. <character-input-port> -> InputStream (error)
(define-method (->jinput-stream (<character-input-port> in-port))
  (error "Cannot obtain an InputStream from a <character-input-port>"))

;; 8. <character-output-port> -> OutputStream (error)
(define-method (->joutput-stream (<character-output-port> out-port))
  (error "Cannot obtain an OutputStream from a <charater-output-port>"))


;; <native-*-character-port> -> Java Read/Writer
(define-generics ->jreader ->jwriter)

;; 9. <native-character-input-port> => Reader
(define-method (->jreader (<character-input-port> in-port))
  (get-reader in-port))

;; 10. <native-character-output-port> => Writer
(define-method (->jwriter (<character-output-port> out-port))
  (get-writer out-port))
