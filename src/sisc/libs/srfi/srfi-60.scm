(module srfi-60-defs
  (logand 
   logxor
   lognot 
   logcount
   bitwise-if 
   logtest 
   integer-length 
   log2-binary-factors
   logbit? 
   copy-bit
   bit-field 
   copy-bit-field
   arithmetic-shift
   rotate-bit-field
   reverse-bit-field
   integer->list
   list->integer
   booleans->integer)
  (import logicops)
  (include "../../modules/srfi/srfi-60.scm"))

(module srfi-60
  (logand bitwise-and
          logior bitwise-ior
          logxor bitwise-xor
          lognot bitwise-not
          bitwise-if bitwise-merge
          logtest any-bits-set?
          logcount bit-count
          integer-length 
          log2-binary-factors first-set-bit
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
  (import srfi-60-defs)
  (define logior logor)
  (define ash arithmetic-shift)
  (define bitwise-ior logor)
  (define bitwise-xor logxor)
  (define bitwise-and logand)
  (define bitwise-not lognot)
  (define bit-count logcount)
  (define bit-set?   logbit?)
  (define any-bits-set? logtest)
  (define first-set-bit log2-binary-factors)
  (define bitwise-merge bitwise-if))


(display "srfi-60\n")
