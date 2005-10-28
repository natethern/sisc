(require-library 'sisc/libs/srfi/srfi-9)

(module srfi-25
    (array?
     make-array
     shape
     array
     array-rank
     array-start
     array-end
     array-ref
     array-set!
     share-array)
  (import srfi-9)
  (include "../../modules/srfi/srfi-25/as-srfi-9-record.scm")
  ;;pick one of three alternative implementations
  (include "../../modules/srfi/srfi-25/ix-ctor.scm")
  (include "../../modules/srfi/srfi-25/op-ctor.scm")
  ;;(include "../../modules/srfi/srfi-25/ix-mbda.scm")
  ;;(include "../../modules/srfi/srfi-25/op-mbda.scm")
  ;;(include "../../modules/srfi/srfi-25/ix-tter.scm")
  ;;(include "../../modules/srfi/srfi-25/op-tter.scm")
  (include "../../modules/srfi/srfi-25/array.scm")
  (add-feature 'srfi-25))
