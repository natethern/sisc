(module srfi-60
    (logand bitwise-and
	    logior bitwise-ior
	    logxor bitwise-xor
	    lognot bitwise-not
	    bitwise-if bitwise-merge
	    logtest any-bits-set?
	    logcount bit-count
	    integer-length 
	    log2-binary-factors first-bit-set
	    logbit? bit-set?
	    copy-bit
	    bit-field 
	    copy-bit-field
	    ash arithmetic-shift
	    rotate-bit-field
	    reverse-bit-field
	    integer->list
	    list->integer
	    booleans->integer)
    (import logicops)
    (include "../../modules/srfi/srfi-60.scm"))

(display "srfi-60\n")
