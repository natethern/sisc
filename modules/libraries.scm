(define (library-path)
  (or (getprop 'library-path '*config-parameters*) "."))

(define *libraries* (make-hashtable))

(define (locate-library lib)
  (let loop ([paths (library-path)])
    (and (not (null? paths))
         (let ([url (normalize-url (car paths) (string-append lib ".scm"))])
           (if (file-exists? url)
               url
               (loop (cdr paths)))))))

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
