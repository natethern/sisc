(define *libraries* (make-hashtable))

(define (locate-library lib)
  (or (find-resource (string-append lib ".sce"))
      (find-resource (string-append lib ".scm"))))

(define (require-library lib)
  (synchronized
   *libraries*
   (lambda()
     (or (library-loaded? lib)
         (let ([url (locate-library lib)])
           (if (not url)
               (error "library ~a not found" lib))
           (load url)
           (*libraries* (string->symbol lib) #t))))))

(define (library-exists? lib)
  (or (library-loaded? lib)
      (and (locate-library lib) #t)))

(define (library-loaded? lib)
  (*libraries* (string->symbol lib)))
