;; create-library takes a symbol that will be the name of the library,
;; a string naming a file to save the library to, and a number of segments.
;; Each segment is of the form 
;; (symbolic-environment-name . ((binding-name . binding) ...)).  
;; create-library will build a library that will add the association-list 
;; of bindings to the named symbolic environment.  A library can
;; add to more than one symenv by having more than one segment.

(import s2j)
(import generic-procedures)

(define <sisc.ser.LibraryBuilder> (java-class "sisc.ser.LibraryBuilder"))
(define <sisc.ser.Library> (java-class "sisc.ser.Library"))
(define <sisc.ser.SeekableDataInputStream> 
  (java-class "sisc.ser.SeekableDataInputStream"))
(define <sisc.ser.BufferedRandomAccessInputStream> 
  (java-class "sisc.ser.BufferedRandomAccessInputStream"))
(define <sisc.util.Util> (java-class "sisc.util.Util"))
(define <sisc.ser.LibraryAE> (java-class "sisc.ser.LibraryAE"))

(define-generic get-parent)
(define-generic add)
(define-generic build-library)
(define-generic get-local-expression)
(define-generic add-binding)
(define-generic get-entry-point)
(define-generic url)

(define index-sym (string->symbol "library index"))
(define segment-str "segment ")

(define (_create-lib lib . segments)
  (if (null? segments) '()
      (let ((segment1 (car segments))
            (segments (cdr segments)))
        (let ((symenv (car segment1))
              (bindings (map car (cdr segment1))))
          (if (null? bindings)
              (apply _create-lib (cons lib segments))
              (let ((symenv-id (string->symbol
                                (string-append 
                                 segment-str
                                 (symbol->string symenv)))))
                (add lib (java-wrap symenv-id) (java-wrap bindings))
                (for-each (lambda (binding)
                            (add lib
                                 (java-wrap binding)
                                 (java-wrap 
                                  (cdr (assoc binding (cdr segment1))))))
                          bindings)
                (cons symenv-id (apply _create-lib (cons lib segments)))))))))

(define (create-library name filename segment1 . segments)
  (let* ((lib (make <sisc.ser.LibraryBuilder> (->jboolean #f)))
         (index (apply _create-lib (cons lib (cons segment1 segments)))))
    (add lib (java-wrap index-sym) (java-wrap index))
    (call-with-output-file filename
      (lambda (out)
        (build-library lib (->jstring name) ((java-wrap out) 'out))))))

(define open-library
  (let () 
    (define-generic load)
    (lambda (filename)
      (load <sisc.ser.Library>
            (url <sisc.util.Util> (normalize-url (current-url) filename))))))

(define (link-library lib)
  (for-each
   (lambda (symenv-id)
     (let* ((symenv-id-str (symbol->string symenv-id))
            (symenv-sym (string->symbol
                         (substring 
                          symenv-id-str
                          (string-length segment-str)
                          (string-length symenv-id-str))))
            (isLae #f)
            (symenv (let loop ((se (get-symbolic-environment symenv-sym)))
                      (cond [(instance-of? 
                              se <sisc.ser.LibraryAE>)
                             (begin (set! isLae #t) se)]
                            [(not (java-null? (get-parent se)))
                             (loop (get-parent se))]
                            [else se]))))
                                   
       (for-each 
        (lambda (binding)
          (if isLae
              (add-binding symenv lib (java-wrap binding)
                           (get-entry-point lib (java-wrap binding)))
              (putprop binding symenv
                       (java-unwrap
                        (get-local-expression lib (java-wrap binding))))))
        (java-unwrap
         (get-local-expression lib (java-wrap symenv-id))))))
   (java-unwrap (get-local-expression lib (java-wrap index-sym)))))

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
        (error 'get-referenced-bindings "'~a' does not name a module." 
               modulename))))

(define (getprops props table)
  (map (lambda (p) (cons p (getprop p table))) props))
(define (create-library-from-module libname filename . modules)
  (let ((modules (if (null? modules) (list libname) modules)))
    (call-with-values
        (lambda () 
          (classify-bindings
           (apply append (map get-referenced-bindings modules))))
      (lambda (sc-expander toplevel)
        (create-library
         libname filename 
         (cons '*toplevel* (getprops toplevel '*toplevel*))
         `(*sc-expander* 
           . (,@(getprops modules '*sc-expander*)
              ,@(getprops sc-expander '*sc-expander*))))))))
