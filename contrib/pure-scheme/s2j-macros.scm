; Some macros to ease use of S2J, specifically defining many
; class bindings and generic procedures

(define-syntax define-java-class
  (syntax-rules ()
    ((_ c)
     (putprop (string->symbol 
               (string-append "<" (string-downcase c) ">"))
              '*toplevel* 
              (java-class c)))))

(define-syntax define-generics
  (syntax-rules ()
    ((_ c)
     (define-generic c))
    ((_ c1 c ...)
     (begin (define-generic c1) (define-generics c ...)))))

(define-syntax define-java-classes
  (syntax-rules () 
    ((_ c)
     (define-java-class c))
    ((_ c1 c ...)
     (begin (define-java-class c1) (define-java-classes c ...)))))
