;; define-struct ala MzScheme
;; implementation by Matthias Radestock <matthias@sorted.org>
(define-syntax define-struct
  (lambda (x)
    (syntax-case x ()
      ((_ name (field ...))
       (let* ((name-syntax (syntax name))
              (name-string (symbol->string (syntax-object->datum
                                            name-syntax))))
         (with-syntax ((make-name (wrap-symbol "make-" name-syntax ""))
                       (name? (wrap-symbol "" name-syntax "?"))
                       ((field-getter ...)
                        (map (lambda (f)
                               (wrap-symbol
                                (string-append name-string "-")
                                (datum->syntax-object name-syntax f)
                                ""))
                             (syntax-object->datum (syntax (field ...)))))
                       ((field-setter ...)
                        (map (lambda (f)
                               (wrap-symbol
                                (string-append "set-" name-string "-")
                                (datum->syntax-object name-syntax f)
                                "!"))
                             (syntax-object->datum (syntax (field ...))))))
           (syntax
            (define-record-type name (make-name field ...)
              name?
              (field field-getter field-setter) ...))))))))
