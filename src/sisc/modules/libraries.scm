(define *libraries* (make-hashtable eq?))

(define (locate-library lib)
  (define (suffixed-lib ext)
    (find-resource (string-append (symbol->string lib) "." ext)))
  (or (suffixed-lib "scc")
      (suffixed-lib "sce")
      (suffixed-lib "scm")))

(define (normalize-lib-name lib)
  (if (symbol? lib) lib (string->symbol lib)))

(define (provide-library lib)
  (hashtable/put! *libraries* lib #t))

(define *tracker* #f)

(define (track item thunk)
  (let ([tracker #f])
    (dynamic-wind
     (lambda ()
       (set! tracker *tracker*)
       (set! *tracker* '()))
     (lambda ()
       (thunk)
       (let ([res (cons item *tracker*)])
         (if tracker (set! tracker (append tracker (list res))))
         res))
     (lambda ()
       (set! *tracker* tracker)))))

(define (require-library lib)
  (synchronized
   *libraries*
   (lambda()
     (let ([lib (normalize-lib-name lib)])
       (or (library-loaded? lib)
           (let ([url (locate-library lib)])
             (if (not url)
                 (error "library ~a not found" lib))
             (track lib (lambda ()
                          (load url)
                          (provide-library lib)))))))))

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
       (set! outf (open-serial-output-port (open-binary-output-file to))))
     (lambda ()
       (with-current-url from
         (lambda ()
           (let loop ()
             (let ([e (read-code inf)])
               (or (eof-object? e)
                   (let ([p (compile e)])
                     (p)
                     (serialize p outf)
                     (loop))))))))
     (lambda ()
       (close-output-port outf)
       (close-input-port inf)))))

(define (install)
  (add-file-handler 'scc load-compiled))
