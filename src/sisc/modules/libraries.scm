(define *libraries* (make-hashtable eq?))

(define (locate-library lib)
  (define (suffixed-lib ext)
    (find-resource (string-append (symbol->string lib) "." ext)))
  (or (suffixed-lib "scc")
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

(define (load-compiled name)
  (call-with-serial-input-file name
    (lambda (port)
      (let loop ()
        (let ([v (deserialize port)])
          (or (eof-object? v) (begin (v) (loop))))))))

(define (compile-file from to)
  (let ([inf #f]
        [outf #f])
    (dynamic-wind
     (lambda ()
       (set! inf (open-source-input-file from))
       (set! outf (open-serial-output-file to)))
     (lambda ()
       (with-current-url from
         (lambda ()
           (let loop ()
             (let ([e (read-code inf)])
               (or (eof-object? e)
                   (begin (serialize (compile e) outf)
                          (loop))))))))
     (lambda ()
       (close-output-port outf)
       (close-input-port inf)))))

(define (install)
  (add-file-handler 'scc load-compiled))
