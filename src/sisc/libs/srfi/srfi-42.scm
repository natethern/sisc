(require-library 'sisc/libs/srfi/srfi-23)

(module srfi-42
    ((do-ec do-ec:do ec-simplify)
     list-ec
     append-ec
     string-ec
     string-append-ec
     vector-ec
     vector-of-length-ec
     sum-ec
     product-ec
     min-ec
     max-ec
     any?-ec
     every?-ec
     (first-ec ec-guarded-do-ec)
     last-ec
     fold-ec
     fold3-ec
     ;;the following really shouldn't be exported, but because
     ;;omprehensions assume generators are macros in their own right
     ;;we need to do this.
     :do
     :let
     (:parallel :parallel-1)
     (:while :while-1 :while-2)
     (:until :until-1)
     :list
     :string
     (:vector ec-:vector-filter)
     :integers
     :range
     :real-range
     :char-range
     :port
     :dispatched
     (: :-dispatch))
  (import srfi-23)
  (include "../../modules/srfi/srfi-42/ec.scm"))

(display "srfi-42\n")
