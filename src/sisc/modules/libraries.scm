(define *libraries* (make-hashtable eq?))

(define (locate-library lib)
  (define (suffixed-lib ext)
    (find-resource (string-append (symbol->string lib) "." ext)))
  (or (suffixed-lib "slt")
      (suffixed-lib "sll")
      (suffixed-lib "sce")
      (suffixed-lib "scm")))

(define (normalize-lib-name lib)
  (if (symbol? lib) lib (string->symbol lib)))

(define (provide-library lib)
  (hashtable/put! *libraries* lib #t))

(define (require-library lib)
  (synchronized
   *libraries*
   (lambda()
     (let ([lib (normalize-lib-name lib)])
       (or (library-loaded? lib)
           (let ([url (locate-library lib)])
             (if (not url)
                 (error "library ~a not found" lib))
             (load url)
             (provide-library lib)))))))

(define (library-exists? lib)
  (let ([lib (normalize-lib-name lib)])
    (or (library-loaded? lib)
        (and (locate-library lib) #t))))

(define (library-loaded? lib)
  (let ([lib (normalize-lib-name lib)])
    (hashtable/get *libraries* lib)))

(define *thunk-libraries* (make-hashtable eq?))

(define (provide-thunk-library name thunk)
  (hashtable/put! *thunk-libraries* name thunk)
  (provide-library name))

(define (thunk-library name)
  (hashtable/get *thunk-libraries* name))

(define (load-thunk-library name)
  (let ([thunk (call-with-serial-input-file name deserialize)])
    ;;thunk libs return their name when evaluated
    (provide-thunk-library (thunk) thunk)))

(define (save-thunk-library name filename)
  (call-with-serial-output-file filename
    (lambda (port) (serialize (thunk-library name) port))))

(define-simple-syntax (define-library (?name ?req-lib ...) ?expr ...)
  (begin
    (require-library '?req-lib)
    ...
    (let ([thunk (compile '(begin
                             (require-library '?req-lib)
                             ...
                             ?expr ...
                             '?name))])
      (provide-thunk-library (thunk) thunk))))

(define (install)
  (add-file-handler 'slt load-thunk-library))
