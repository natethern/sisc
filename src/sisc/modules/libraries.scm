(define *libraries* (make-hashtable eq?))

(define (locate-library lib)
  (define (suffixed-lib ext)
    (find-resource (string-append (symbol->string lib) "." ext)))
  (or (suffixed-lib "sll")
      (suffixed-lib "sce")
      (suffixed-lib "scm")))

(define (normalize-lib-name lib)
  (if (symbol? lib) lib (string->symbol lib)))

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
             (hashtable/put! *libraries* lib #t)))))))

(define (library-exists? lib)
  (let ([lib (normalize-lib-name lib)])
    (or (library-loaded? lib)
        (and (locate-library lib) #t))))

(define (library-loaded? lib)
  (let ([lib (normalize-lib-name lib)])
    (hashtable/get *libraries* lib)))
