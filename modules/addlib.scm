;; create-library takes a symbol that will be the name of the library,
;; a string naming a file to save the library to, and a number of segments.
;; Each segment is of the form 
;; (symbolic-environment-name . ((binding-name . binding) ...)).  
;; create-library will build a library that will add the association-list 
;; of bindings to the named symbolic environment.  A library can
;; add to more than one symenv by having more than one segment.
  (define-generic add)
(trace 'add)
(module compiled-libraries
    (open-library link-library create-library)
  (import s2j)
  (import generic-procedures)

  (define <sisc.ser.LibraryBuilder> (java-class "sisc.ser.LibraryBuilder"))
  (define <sisc.ser.Library> (java-class "sisc.ser.Library"))
  (define <sisc.ser.SeekableDataInputStream> 
    (java-class "sisc.ser.SeekableDataInputStream"))
  (define <sisc.ser.BufferedRandomAccessInputStream> 
    (java-class "sisc.ser.BufferedRandomAccessInputStream"))
  (define-generic build-library)
  (define-generic get-expression)
  (define-generic load)
  (define index-sym (string->symbol "library index"))

  (define (_create-lib lib . segments)
    (if (null? segments) '()
        (let ((segment1 (car segments))
              (segments (cdr segments)))
          (let ((symenv (car segment1))
                (bindings (map car (cdr segment1))))
            (display "E")
            (add lib symenv bindings)
            (display "F")
            (for-each (lambda (binding)
                              (display "G")
                              (display (cdr (assoc binding (cdr segment1))))
                        (add lib binding (cdr (assoc binding (cdr segment1))))
                        (display "H"))
                      bindings)
            (cons symenv (apply _create-lib (cons lib segments)))))))

  (define (create-library name filename segment1 . segments)
    (let* ((lib (make <sisc.ser.LibraryBuilder> (->jboolean #f)))
           (index (apply _create-lib (cons lib (cons segment1 segments)))))
      (display "A")
      (add lib index-sym index)
      (display "B")
      (call-with-output-file filename
        (lambda (out)
          (display "C")
          (build-library lib (->jstring (symbol->string name)) 
                         ((java-wrap out) 'out))
          (display "D")))))

  (define (open-library filename)
    (load <sisc.ser.Library> (make <sisc.ser.SeekableDataInputStream>
                                   (make <sisc.ser.BufferedRandomAccessInputStream>
                                         (->jstring filename) 
                                         (->jstring "r")))))

  (define (link-library lib)
    (let ((index (java-unwrap (get-expression lib index-sym))))
      (for-each (lambda (symenv)
                  (let ((bindings (java-unwrap (get-expression lib symenv))))
                    (for-each (lambda (binding)
                                (putprop binding symenv 
                                         ;fixme, eventually we want to register
                                         ;the binding for lazy-load
                                         (java-unwrap (get-expression lib binding))))
                              bindings)))
                index))))
  

          

;Support for creating libraries which store a complete module

(module module-serialization 
    (create-module-library get-referenced-bindings classify-bindings)
  (import compiled-libraries)
  (define (interface-exports i) (vector-ref i 1))
  (define (syntax-object-sym i) (vector-ref i 1))
  (define (classify-bindings bindings)
    (let loop ((b bindings) 
               (s '())
               (t '()))
      (if (null? b) 
          (values s t)
          (if (getprop (car b) '*sc-expander*)
              (loop (cdr b) (cons (car b) s) t)
              (loop (cdr b) s (cons (car b) t))))))
  (define (get-referenced-bindings modulename)
    (let ((mod (getprop modulename (get-symbolic-environment '*sc-expander*))))
      ; I'm a little nervous about the hardcoding of the positions of 
      ; important elements here, a better understanding of the psyntax
      ; datastructures would be nice.
      (if (and (pair? mod) (eq? (car mod) 'module))
          (apply append
                 (map (lambda (e)
                        (let ((n (syntax-object-sym e))
                              (procs (vector->list 
                                      (vector-ref (cadr (vector-ref e 2))
                                                  3))))
                          procs))
                      (vector->list (interface-exports (cdr mod)))))
          (error 'get-referenced-procedures "'~a' does not name a module."))))
  (define (create-module-library module filename)
    (call-with-values
        (lambda () 
          (classify-bindings (get-referenced-bindings module)))
      (lambda (sc-expander toplevel)
        (create-library module filename 
                        (cons '*toplevel* (map cons toplevel 
                                               (map (lambda (b) 
                                                      (getprop b '*toplevel*))
                                                    toplevel)))
                        `(*sc-expander* 
                          . ((,module . ,(getprop module '*sc-expander*))
                             ,@(map cons sc-expander
                                    (map (lambda (b) 
                                           (getprop b '*sc-expander*))
                                         sc-expander)))))))))
  

#;(module foo (bar baz)
  (define (foo) 3)
  (define baz 4)
  (define (bar) (foo)))