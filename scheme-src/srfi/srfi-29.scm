; SRFI-29 implementation
; This is a non-portable implementation that relies on Java 
; for detection of the locale, SISC for symbolic environments
; to store translations, and Java to store/retrieve bundles
;
; (C) 2002 Scott G. Miller
;
; Currently unfinished, need to implement working store and load bundle,
; but they aren't required to be SRFI-29 compliant.

;;An SRFI-28 and SRFI-29 compliant version of format.  It requires
;;SRFI-23 for error reporting.
(define format
  (lambda (format-string . objects)
    (let ((buffer (open-output-string)))
      (let loop ((format-list (string->list format-string))
                 (objects objects)
                 (object-override #f))
        (cond ((null? format-list) (get-output-string buffer))
              ((char=? (car format-list) #\~)
               (cond ((null? (cdr format-list))
                      (error 'format "Incomplete escape sequence"))
                     ((char-numeric? (cadr format-list))
                      (let posloop ((fl (cddr format-list))
                                    (pos (string->number
                                          (string (cadr format-list)))))
                        (cond ((null? fl)
                               (error 'format "Incomplete escape sequence"))
                              ((and (eq? (car fl) '#\@)
                                    (null? (cdr fl)))
                                    (error 'format "Incomplete escape sequence"))
                              ((and (eq? (car fl) '#\@)
                                    (eq? (cadr fl) '#\*))
                               (loop (cddr fl) objects (list-ref objects pos)))
                              (else
                                (posloop (cdr fl)
                                         (+ (* 10 pos)
                                            (string->number
                                             (string (car fl)))))))))
                     (else
                       (case (cadr format-list)
                         ((#\a)
                          (cond (object-override
                                 (begin
                                   (display object-override buffer)
                                   (loop (cddr format-list) objects #f)))
                                ((null? objects)
                                 (error 'format "No value for escape sequence"))
                                (else
                                  (begin
                                    (display (car objects) buffer)
                                    (loop (cddr format-list)
                                          (cdr objects) #f)))))
                         ((#\s)
                          (cond (object-override
                                 (begin
                                   (display object-override buffer)
                                   (loop (cddr format-list) objects #f)))
                                ((null? objects)
                                 (error 'format "No value for escape sequence"))
                                (else
                                  (begin
                                    (write (car objects) buffer)
                                    (loop (cddr format-list)
                                          (cdr objects) #f)))))
                         ((#\%)
                          (if object-override
                              (error 'format "Escape sequence following positional override does not require a value"))
                          (display #\newline buffer)
                          (loop (cddr format-list) objects #f))
                        ((#\~)
                          (if object-override
                              (error 'format "Escape sequence following positional override does not require a value"))
                          (display #\~ buffer)
                          (loop (cddr format-list) objects #f))
                         (else
                           (error 'format "Unrecognized escape sequence"))))))
              (else (display (car format-list) buffer)
                    (loop (cdr format-list) objects #f)))))))

(define current-language
  (let ([old-lang #f]
        [<java.util.Locale> (java-class "java.util.Locale")])
    (define-generic get-default)
    (define-generic get-language)
    (let ([current-locale (get-default <java.util.Locale>)])
      (set! old-lang (string->symbol
                      (string-downcase
                       (->string (get-language current-locale))))))
    (lambda args
      (cond [(null? args) old-lang]
            [(symbol? (car args))
             (begin
               (set! old-lang (car args)))
            [else (error 'current-language "given language is not a symbol")])))))

(define current-country
  (let ([old-country #f]
        [<java.util.Locale> (java-class "java.util.Locale")])
    (define-generic get-default)
    (define-generic get-country)
    (let ([current-locale (get-default <java.util.Locale>)])
      (set! old-country (string->symbol 
                         (string-downcase
                          (->string (get-country current-locale))))))
    (lambda args
      (cond [(null? args) old-country]
            [(symbol? (car args))
             (set! old-country (car args))]
            [else (error 'current-country "given country is not a symbol")]))))


(define current-locale-details
  (let ([old-variant #f]
        [<java.util.Locale> (java-class "java.util.Locale")])
    (define-generic get-default)
    (define-generic get-variant)
    (let ([current-locale (get-default <java.util.Locale>)])
      (let ([vc (->string (get-variant current-locale))])
        (set! old-variant
          (if (equal? vc "")
              '()
              (list (string->symbol
                     (string-downcase vc)))))))
    (lambda args
      (cond [(null? args) old-variant]
            [(and (list? (car arg))
                  (andmap symbol? (car args)))
             (set! old-variant (car args))]
            [else (error 'current-locale-details "given variant is not a list of symbols")]))))

(define (current-locale-specifier)
  `(,(current-language)
    ,(current-country)
    ,@(current-locale-details)))

(define rdc 
  (lambda (ls)
    (cond [(null? ls) (error 'rdc "cannot take the rdc of the emptylist")]
          [(null? (cdr ls)) '()]
          [else (cons (car ls) (rdc (cdr ls)))])))

(define (bundle-specifier->symbol bundle-specifier)
  (let ((bundle-name (with-output-to-string
                         (lambda ()
                           (display (car bundle-specifier))
                           (if (not (null? (cdr bundle-specifier)))
                               (for-each (lambda (component)
                                           (display #\_)
                                           (display component))
                                         (cdr bundle-specifier)))))))
    (string->symbol bundle-name)))

(define (localized-template package-name message-template-name)
  (let loop ((bundle-specifier `(,package-name ,@(current-locale-specifier))))
    (if (null? bundle-specifier)
        #f
        (let ((bundle-name (bundle-specifier->symbol bundle-specifier)))
          (cond [(getprop bundle-name '*i18n*) =>
                 (lambda (bundle)
                   (let ((template (assq message-template-name bundle)))
                     (if template (cdr template)
                         (loop (rdc bundle-specifier)))))]
                [else (loop (rdc bundle-specifier))])))))

(define (declare-bundle! bundle-specifier association-list)
  (putprop (bundle-specifier->symbol bundle-specifier) 
           '*i18n* association-list))

(define (store-bundle bundle-specifier)
  #f)

(define (load-bundle! bundle-specifier)
  #f)
