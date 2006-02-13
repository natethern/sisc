(import* libraries compile-file)

(load "srfis.scm")

(define target-base "../../../../tmp/")
(define target-dir (string-append target-base "sisc/libs/"))

(with-class-path
    (cons target-base (current-class-path))
  (lambda ()
    (for-each (lambda (name)
                (let ([name (symbol->string name)])
                  (compile-file
                   (string-append name ".scm")
                   (string-append target-dir "srfi/" name ".scc"))))
              srfis)
    (compile-file "srfi.scm" (string-append target-dir "srfi.scc"))))
