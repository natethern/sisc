(load-module "sisc.modules.J2S")

(define number->java-integer 
  (let* ([java-integer-class (java/class-for-name "java.lang.Integer")]
         [cons-type (vector (java/field-ref java-integer-class "TYPE"))]
	 [quantity-class (java/class-for-name "sisc.data.Quantity")])
    (lambda (n)
      (if (number? n) 
          (java/instantiate java-integer-class cons-type 
                            (vector (java/call n "intValue" #() #())))
          (error 'number->java-integer "~s is not a number" n)))))

	