; Some macros to ease use of S2J, specifically defining many
; class bindings and generic procedures

(import syntax-case-helpers)

(define-syntax define-java-class
  (lambda (x)
    (syntax-case x ()
      ((_ name)
       ;shamelessly stolen from s2j.scm
         (with-syntax ((symname (wrap-symbol "<" (syntax name) ">")))
           (syntax (define symname (java-class name))))))))

(define-syntax define-generics 
  (syntax-rules ()
     ((_ c ...)
      (begin (define-generic c) ...))))  

(define-syntax define-java-classes  
 (syntax-rules () 
   ((_ c ...)
    (begin (define-java-class c) ...))))