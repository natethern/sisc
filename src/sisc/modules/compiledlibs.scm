;; create-library takes a symbol that will be the name of the library,
;; a string naming a file to save the library to, and a number of segments.
;; Each segment is of the form 
;; (symbolic-environment-name . ((binding-name . binding) ...)).  
;; create-library will build a library that will add the association-list 
;; of bindings to the named symbolic environment.  A library can
;; add to more than one symenv by having more than one segment.

(define-java-classes
  <sisc.ser.library-builder>
  <sisc.ser.library>
  <sisc.util.util>
  (<sisc.ser.library-ae> |sisc.ser.LibraryAE|))

(define-generic-java-methods
  get-parent
  add
  load
  build-library
  get-local-expression
  add-symbolic-bindings
  url
  next
  has-next
  binding-keys
  iterator)

(define-generic-java-field-accessor :out)

(define index-sym (string->symbol "library index"))
(define segment-str "segment ")

(define (_create-lib lib . segments)
  (if (null? segments) '()
      (let ((segment1 (car segments))
            (segments (cdr segments)))
        (let ((symenv (car segment1))
              (bindings (map-car (cdr segment1))))
          (if (null? bindings)
              (apply _create-lib lib segments)
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
                (cons symenv-id (apply _create-lib lib segments))))))))

(define (create-library name filename segment1 . segments)
  (let* ((lib (java-new <sisc.ser.library-builder> (->jboolean #f)))
         (index (apply _create-lib lib segment1 segments)))
    (add lib (java-wrap index-sym) (java-wrap index))
    (call-with-binary-output-file filename
      (lambda (out)
        (build-library lib (->jstring name) (:out (java-wrap out)))))))

(define (open-library filename)
  (load (java-null <sisc.ser.library>)
        (url (java-null <sisc.util.util>)
             (java-wrap (normalize-url (current-url)  filename)))))

(define (find-base-library se)
  (cond [(instance-of? se <sisc.ser.library-ae>)
         (values se #t)]
        [(not (java-null? (get-parent se)))
         (find-base-library (get-parent se))]
        [else (values se #f)]))

(define (find-symbolic-environment symenv-sym)
  (with/fc (lambda (m e)
             (let ([e (null-environment 0)])
               (set-symbolic-environment! symenv-sym e)
               (set-annotation! e 'name symenv-sym)
               e))
    (lambda () (get-symbolic-environment symenv-sym))))

(define (link-library lib)
  (define (get-lib-expression id)
    (get-local-expression lib (java-wrap id)))
  (define (link-symenv symenv-id)
    (call-with-values
        (lambda ()
          (find-base-library
           (java-wrap
            (find-symbolic-environment
             (let ([symenv-id-str (symbol->string symenv-id)])
               (string->symbol
                (substring symenv-id-str
                           (string-length segment-str)
                           (string-length symenv-id-str))))))))
      (lambda (symenv lae?)
        (let ([symlist (get-lib-expression symenv-id)])
          (if lae?
              (add-symbolic-bindings symenv lib symlist)
              (for-each (lambda (binding)
                          (putprop binding
                                   (java-unwrap symenv)
                                   (java-unwrap
                                    (get-lib-expression binding))))
                        (java-unwrap symlist)))))))
  (for-each link-symenv (java-unwrap (get-lib-expression index-sym))))

(define (find-bindings prefix env)
  (define (binding-matches? binding)
    (let ([s1 (symbol->string binding)]
          [mpl (string-length prefix)])
      (and (> (string-length s1) mpl)
           (string=? prefix (substring s1 0 mpl)))))
  (let ([it (iterator (binding-keys (java-wrap env)))])
    (let loop ([acc '()])
      (if (->boolean (has-next it))
          (let ([b (java-unwrap (next it))])
            (loop (if (binding-matches? b)
                      (cons b acc)
                      acc)))
          acc))))

(define (module-bindings modulename)
  (let ((mod (getprop modulename (get-symbolic-environment '*sc-expander*))))
    (if (and (pair? mod) (eq? (car mod) 'module))
        (let ([prefix (string-append "@" (symbol->string modulename) "::")])
          (map (lambda (env)
                 (find-bindings prefix (get-symbolic-environment env)))
               '(*sc-expander* *toplevel*)))
        (error 'module-bindings "'~a' does not name a module." 
               modulename))))

(define (module-metadata-bindings modulename)
  (let* ((env-name (string->symbol
                    (string-append "@" (symbol->string modulename))))
         (env (with/fc
              (lambda (m e) #f)
              (lambda ()
                (get-symbolic-environment env-name)))))
                 
    (if env
        (let ([it (iterator (binding-keys (java-wrap env)))])
          (let loop ([acc '()])
            (if (->boolean (has-next it))
                (let ([b (java-unwrap (next it))])
                  (loop (cons (cons b (getprop b env)) acc)))
                (cons env-name acc))))
        (list env-name))))

(define (getprops props table)
  (map (lambda (p) (cons p (getprop p table))) props))

(define (create-library-from-module libname filename . modules)
  (let* ([modules (if (null? modules) (list libname) modules)]
         [bindings (map module-bindings modules)]
         [metadata (map module-metadata-bindings modules)])
    (apply create-library
           (append 
            (list libname filename
                  `(*toplevel*
                    . (,@(getprops (apply append (map cadr bindings))
                                   '*toplevel*)))
                  `(*sc-expander* 
                    . (,@(getprops modules '*sc-expander*)
                       ,@(getprops (apply append (map car bindings))
                                   '*sc-expander*))))
            metadata))))
     
