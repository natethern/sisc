(load-module "sisc.modules.J2S")

(define scheme->java-object 
  (let ([java-integer-class (java/class-for-name "sisc.data.Value")])
    (lambda (o)
      (java/call o "javaValue" #() #()))))

(define java/method-proxy
  (lambda (class methodName)
    (lambda args
      (if (null? args)
	  (java/call class methodName #() #())
	  (let ([argv (list->vector (cdr args))]
		[argprot (list->vector (map java/class-of-object (cdr args)))])
	    (java/call (car args) methodName argprot argv))))))

(define java/has-field
  (lambda (c f)
    (call/fc (lambda () 
	       (java/field-ref c f)
	       #t)
	     (lambda (m e c) #f))))

(define java->scheme-object
  (let ([ins-help (lambda (cs c p)
		    (cons cs (lambda (v)
			       (java/instantiate 
				c 
				(let ([class (java/class-for-name cs)])
				  (vector 
				   (if (java/has-field cs "TYPE")
				       (java/field-ref class "TYPE")
				       class)))
				(vector (p v))))))])
    (let ([identity (lambda (v) v)]
	  [value-type (java/class-for-name "sisc.data.Value")]
	  [java-wrap-type (java/class-for-name "sisc.modules.J2S$JavaObject")]
	  [cstring (java/class-for-name "sisc.data.SchemeString")]
	  [cvect   (java/class-for-name "sisc.data.SchemeVector")]
	  [cnum    (java/class-for-name "sisc.data.Quantity")]
	  [cchar (java/class-for-name "sisc.data.SchemeCharacter")])
      (let ([type-mappings 
	     `(,(ins-help "java.lang.Short" cnum identity) 
	       ,(ins-help "java.lang.Integer" cnum identity) 
	       ,(ins-help "java.lang.Float" cnum identity) 
	       ,(ins-help "java.lang.Double" cnum identity) 
	       ,(ins-help "java.lang.Long" cnum identity) 
	       ,(ins-help "java.lang.String" cstring 
			  (lambda (v)
			    (java/call v "toCharArray" #() #()))))])
	(lambda (x) 
	  (if (and (not (java/instance-of? x java-wrap-type))
		   (java/instance-of? x value-type))
	      x
	      (let ([jtype (assoc (java/get-class-name (java/class-of-object x))
				  type-mappings)])
		(if jtype 
		    ((cdr jtype) x)
		    (error 'java->scheme-object "unable to convert '~s' to a scheme type" x)))))))))

(define java/import
  (lambda (class . prefix)
    (let* ([prefix (if (not (null? prefix)) (car prefix))]
	   [c (if (java/class? class) class (java/class-of-object class))]
	   [methods (java/get-methods c)])
      (let loop ([x methods]) 
	(if (not (null? x))
	    (begin
	      (putprop 
	       (string->symbol
		(let ([postfix (string-downcase (car x))])
		  (if (void? prefix) 
		      postfix
		      (string-append prefix postfix))))
	       '*toplevel* 
	       (java/method-proxy c (car x)))
	      (loop (cdr x))))))))
'(3