;;this should go into std-modules.scm
(module _r5rs
  ;;we don't export macros, so the following are NOT included:
  ;;and begin cond delay do let let* let-syntax letrec-syntax
  ;;or quasiquote quote set!
  (_*
   _+
   _-
   _/
   _<
   _<=
   _=
   _>
   _>=
   _abs
   _acos
   _angle
   _append
   _apply
   _asin
   _assoc
   _assq
   _assv
   _atan
   _boolean?
   _call-with-current-continuation
   _call-with-input-file
   _call-with-output-file
   _call-with-values
   _car
   _cdr
   _caar
   _cadr
   _cdar
   _cddr
   _caaar
   _caadr
   _cadar
   _caddr
   _cdaar
   _cdadr
   _cddar
   _cdddr
   _caaaar
   _caaadr
   _caadar
   _caaddr
   _cadaar
   _cadadr
   _caddar
   _cadddr
   _cdaaar
   _cdaadr
   _cdadar
   _cdaddr
   _cddaar
   _cddadr
   _cdddar
   _cddddr
   _ceiling
   _char->integer
   _char-alphabetic?
   _char-ci<=?
   _char-ci<?
   _char-ci=?
   _char-ci>=?
   _char-ci>?
   _char-downcase
   _char-lower-case?
   _char-numeric?
   _char-ready?
   _char-upcase
   _char-upper-case?
   _char-whitespace?
   _char<=?
   _char<?
   _char=?
   _char>=?
   _char>?
   _char?
   _close-input-port
   _close-output-port
   _complex?
   _cons
   _cos
   _current-input-port
   _current-output-port
   _denominator
   _display
   _dynamic-wind
   _eof-object?
   _eq?
   _equal?
   _eqv?
   _eval
   _even?
   _exact->inexact
   _exact?
   _exp
   _expt
   _floor
   _for-each
   _force
   _gcd
   _imag-part
   _inexact->exact
   _inexact?
   _input-port?
   _integer->char
   _integer?
   _interaction-environment
   _lcm
   _length
   _list
   _list->string
   _list->vector
   _list-ref
   _list-tail
   _list?
   _load
   _log
   _magnitude
   _make-polar
   _make-rectangular
   _make-string
   _make-vector
   _map
   _max
   _member
   _memq
   _memv
   _min
   _modulo
   _negative?
   _newline
   _not
   _null-environment
   _null?
   _number->string
   _number?
   _numerator
   _odd?
   _open-input-file
   _open-output-file
   _output-port?
   _pair?
   _peek-char
   _positive?
   _procedure?
   _quotient
   _rational?
   _rationalize
   _read
   _read-char
   _real-part
   _real?
   _remainder
   _reverse
   _round
   _scheme-report-environment
   _set-car!
   _set-cdr!
   _sin
   _sqrt
   _string
   _string->list
   _string->number
   _string->symbol
   _string-append
   _string-ci<=?
   _string-ci<?
   _string-ci=?
   _string-ci>=?
   _string-ci>?
   _string-copy
   _string-fill!
   _string-length
   _string-ref
   _string-set!
   _string<=?
   _string<?
   _string=?
   _string>=?
   _string>?
   _string?
   _substring
   _symbol->string
   _symbol?
   _tan
   ;_transcript-off
   ;_transcript-on
   _truncate
   _values
   _vector
   _vector->list
   _vector-fill!
   _vector-length
   _vector-ref
   _vector-set!
   _vector?
   _with-input-from-file
   _with-output-to-file
   _write
   _write-char
   _zero?)
  (define _*			*)
  (define _+			+)
  (define _-			-)
  (define _/			/)
  (define _<			<)
  (define _<=			<=)
  (define _=			=)
  (define _>			>)
  (define _>=			>=)
  (define _abs			abs)
  (define _acos			acos)
  (define _angle		angle)
  (define _append		append)
  (define _apply		apply)
  (define _asin			asin)
  (define _assoc		assoc)
  (define _assq			assq)
  (define _assv			assv)
  (define _atan			atan)
  (define _boolean?		boolean?)
  (define _call-with-current-continuation	call-with-current-continuation)
  (define _call-with-input-file		call-with-input-file)
  (define _call-with-output-file	call-with-output-file)
  (define _call-with-values		call-with-values)
  (define _car			car)
  (define _cdr			cdr)
  (define _caar			caar)
  (define _cadr			cadr)
  (define _cdar			cdar)
  (define _cddr			cddr)
  (define _caaar		caaar)
  (define _caadr		caadr)
  (define _cadar		cadar)
  (define _caddr		caddr)
  (define _cdaar		cdaar)
  (define _cdadr		cdadr)
  (define _cddar		cddar)
  (define _cdddr		cdddr)
  (define _caaaar		caaaar)
  (define _caaadr		caaadr)
  (define _caadar		caadar)
  (define _caaddr		caaddr)
  (define _cadaar		cadaar)
  (define _cadadr		cadadr)
  (define _caddar		caddar)
  (define _cadddr		cadddr)
  (define _cdaaar		cdaaar)
  (define _cdaadr		cdaadr)
  (define _cdadar		cdadar)
  (define _cdaddr		cdaddr)
  (define _cddaar		cddaar)
  (define _cddadr		cddadr)
  (define _cdddar		cdddar)
  (define _cddddr		cddddr)
  (define _ceiling		ceiling)
  (define _char->integer	char->integer)
  (define _char-alphabetic?	char-alphabetic?)
  (define _char-ci<=?		char-ci<=?)
  (define _char-ci<?		char-ci<?)
  (define _char-ci=?		char-ci=?)
  (define _char-ci>=?		char-ci>=?)
  (define _char-ci>?		char-ci>?)
  (define _char-downcase	char-downcase)
  (define _char-lower-case?	char-lower-case?)
  (define _char-numeric?	char-numeric?)
  (define _char-ready?		char-ready?)
  (define _char-upcase		char-upcase)
  (define _char-upper-case?	char-upper-case?)
  (define _char-whitespace?	char-whitespace?)
  (define _char<=?		char<=?)
  (define _char<?		char<?)
  (define _char=?		char=?)
  (define _char>=?		char>=?)
  (define _char>?		char>?)
  (define _char?		char?)
  (define _close-input-port	close-input-port)
  (define _close-output-port	close-output-port)
  (define _complex?		complex?)
  (define _cons			cons)
  (define _cos			cos)
  (define _current-input-port	current-input-port)
  (define _current-output-port	current-output-port)
  (define _denominator		denominator)
  (define _display		display)
  (define _dynamic-wind		dynamic-wind)
  (define _eof-object?		eof-object?)
  (define _eq?			eq?)
  (define _equal?		equal?)
  (define _eqv?			eqv?)
  (define _eval			eval)
  (define _even?		even?)
  (define _exact->inexact	exact->inexact)
  (define _exact?		exact?)
  (define _exp			exp)
  (define _expt			expt)
  (define _floor		floor)
  (define _for-each		for-each)
  (define _force		force)
  (define _gcd			gcd)
  (define _imag-part		imag-part)
  (define _inexact->exact	inexact->exact)
  (define _inexact?		inexact?)
  (define _input-port?		input-port?)
  (define _integer->char	integer->char)
  (define _integer?		integer?)
  (define _interaction-environment	interaction-environment)
  (define _lcm			lcm)
  (define _length		length)
  (define _list			list)
  (define _list->string		list->string)
  (define _list->vector		list->vector)
  (define _list-ref		list-ref)
  (define _list-tail		list-tail)
  (define _list?		list?)
  (define _load			load)
  (define _log			log)
  (define _magnitude		magnitude)
  (define _make-polar		make-polar)
  (define _make-rectangular	make-rectangular)
  (define _make-string		make-string)
  (define _make-vector		make-vector)
  (define _map			map)
  (define _max			max)
  (define _member		member)
  (define _memq			memq)
  (define _memv			memv)
  (define _min			min)
  (define _modulo		modulo)
  (define _negative?		negative?)
  (define _newline		newline)
  (define _not			not)
  (define _null-environment	null-environment)
  (define _null?		null?)
  (define _number->string	number->string)
  (define _number?		number?)
  (define _numerator		numerator)
  (define _odd?			odd?)
  (define _open-input-file	open-input-file)
  (define _open-output-file	open-output-file)
  (define _output-port?		output-port?)
  (define _pair?		pair?)
  (define _peek-char		peek-char)
  (define _positive?		positive?)
  (define _procedure?		procedure?)
  (define _quotient		quotient)
  (define _rational?		rational?)
  (define _rationalize		rationalize)
  (define _read			read)
  (define _read-char		read-char)
  (define _real-part		real-part)
  (define _real?		real?)
  (define _remainder		remainder)
  (define _reverse		reverse)
  (define _round		round)
  (define _scheme-report-environment		scheme-report-environment)
  (define _set-car!		set-car!)
  (define _set-cdr!		set-cdr!)
  (define _sin			sin)
  (define _sqrt			sqrt)
  (define _string		string)
  (define _string->list		string->list)
  (define _string->number	string->number)
  (define _string->symbol	string->symbol)
  (define _string-append	string-append)
  (define _string-ci<=?		string-ci<=?)
  (define _string-ci<?		string-ci<?)
  (define _string-ci=?		string-ci=?)
  (define _string-ci>=?		string-ci>=?)
  (define _string-ci>?		string-ci>?)
  (define _string-copy		string-copy)
  (define _string-fill!		string-fill!)
  (define _string-length	string-length)
  (define _string-ref		string-ref)
  (define _string-set!		string-set!)
  (define _string<=?		string<=?)
  (define _string<?		string<?)
  (define _string=?		string=?)
  (define _string>=?		string>=?)
  (define _string>?		string>?)
  (define _string?		string?)
  (define _substring		substring)
  (define _symbol->string	symbol->string)
  (define _symbol?		symbol?)
  (define _tan			tan)
  ;(define _transcript-off	transcript-off)
  ;(define _transcript-on	transcript-on)
  (define _truncate		truncate)
  (define _values		values)
  (define _vector		vector)
  (define _vector->list		vector->list)
  (define _vector-fill!		vector-fill!)
  (define _vector-length	vector-length)
  (define _vector-ref		vector-ref)
  (define _vector-set!		vector-set!)
  (define _vector?		vector?)
  (define _with-input-from-file	with-input-from-file)
  (define _with-output-to-file	with-output-to-file)
  (define _write		write)
  (define _write-char		write-char)
  (define _zero?		zero?))

(module r5rs
  ;;we don't export macros, so the following are NOT included:
  ;;and begin cond delay do let let* let-syntax letrec-syntax
  ;;or quasiquote quote set!
  (*
   +
   -
   /
   <
   <=
   =
   >
   >=
   abs
   acos
   angle
   append
   apply
   asin
   assoc
   assq
   assv
   atan
   boolean?
   call-with-current-continuation
   call-with-input-file
   call-with-output-file
   call-with-values
   car
   cdr
   caar
   cadr
   cdar
   cddr
   caaar
   caadr
   cadar
   caddr
   cdaar
   cdadr
   cddar
   cdddr
   caaaar
   caaadr
   caadar
   caaddr
   cadaar
   cadadr
   caddar
   cadddr
   cdaaar
   cdaadr
   cdadar
   cdaddr
   cddaar
   cddadr
   cdddar
   cddddr
   ceiling
   char->integer
   char-alphabetic?
   char-ci<=?
   char-ci<?
   char-ci=?
   char-ci>=?
   char-ci>?
   char-downcase
   char-lower-case?
   char-numeric?
   char-ready?
   char-upcase
   char-upper-case?
   char-whitespace?
   char<=?
   char<?
   char=?
   char>=?
   char>?
   char?
   close-input-port
   close-output-port
   complex?
   cons
   cos
   current-input-port
   current-output-port
   denominator
   display
   dynamic-wind
   eof-object?
   eq?
   equal?
   eqv?
   eval
   even?
   exact->inexact
   exact?
   exp
   expt
   floor
   for-each
   force
   gcd
   imag-part
   inexact->exact
   inexact?
   input-port?
   integer->char
   integer?
   interaction-environment
   lcm
   length
   list
   list->string
   list->vector
   list-ref
   list-tail
   list?
   load
   log
   magnitude
   make-polar
   make-rectangular
   make-string
   make-vector
   map
   max
   member
   memq
   memv
   min
   modulo
   negative?
   newline
   not
   null-environment
   null?
   number->string
   number?
   numerator
   odd?
   open-input-file
   open-output-file
   output-port?
   pair?
   peek-char
   positive?
   procedure?
   quotient
   rational?
   rationalize
   read
   read-char
   real-part
   real?
   remainder
   reverse
   round
   scheme-report-environment
   set-car!
   set-cdr!
   sin
   sqrt
   string
   string->list
   string->number
   string->symbol
   string-append
   string-ci<=?
   string-ci<?
   string-ci=?
   string-ci>=?
   string-ci>?
   string-copy
   string-fill!
   string-length
   string-ref
   string-set!
   string<=?
   string<?
   string=?
   string>=?
   string>?
   string?
   substring
   symbol->string
   symbol?
   tan
   ;_transcript-off
   ;_transcript-on
   truncate
   values
   vector
   vector->list
   vector-fill!
   vector-length
   vector-ref
   vector-set!
   vector?
   with-input-from-file
   with-output-to-file
   write
   write-char
   zero?)
  (import _r5rs)
  (define *			_*)
  (define +			_+)
  (define -			_-)
  (define /			_/)
  (define <			_<)
  (define <=			_<=)
  (define =			_=)
  (define >			_>)
  (define >=			_>=)
  (define abs			_abs)
  (define acos			_acos)
  (define angle			_angle)
  (define append		_append)
  (define apply			_apply)
  (define asin			_asin)
  (define assoc			_assoc)
  (define assq			_assq)
  (define assv			_assv)
  (define atan			_atan)
  (define boolean?		_boolean?)
  (define call-with-current-continuation	_call-with-current-continuation)
  (define call-with-input-file	_call-with-input-file)
  (define call-with-output-file	_call-with-output-file)
  (define call-with-values	_call-with-values)
  (define car			_car)
  (define cdr			_cdr)
  (define caar			_caar)
  (define cadr			_cadr)
  (define cdar			_cdar)
  (define cddr			_cddr)
  (define caaar			_caaar)
  (define caadr			_caadr)
  (define cadar			_cadar)
  (define caddr			_caddr)
  (define cdaar			_cdaar)
  (define cdadr			_cdadr)
  (define cddar			_cddar)
  (define cdddr			_cdddr)
  (define caaaar		_caaaar)
  (define caaadr		_caaadr)
  (define caadar		_caadar)
  (define caaddr		_caaddr)
  (define cadaar		_cadaar)
  (define cadadr		_cadadr)
  (define caddar		_caddar)
  (define cadddr		_cadddr)
  (define cdaaar		_cdaaar)
  (define cdaadr		_cdaadr)
  (define cdadar		_cdadar)
  (define cdaddr		_cdaddr)
  (define cddaar		_cddaar)
  (define cddadr		_cddadr)
  (define cdddar		_cdddar)
  (define cddddr		_cddddr)
  (define ceiling		_ceiling)
  (define char->integer		_char->integer)
  (define char-alphabetic?	_char-alphabetic?)
  (define char-ci<=?		_char-ci<=?)
  (define char-ci<?		_char-ci<?)
  (define char-ci=?		_char-ci=?)
  (define char-ci>=?		_char-ci>=?)
  (define char-ci>?		_char-ci>?)
  (define char-downcase		_char-downcase)
  (define char-lower-case?	_char-lower-case?)
  (define char-numeric?		_char-numeric?)
  (define char-ready?		_char-ready?)
  (define char-upcase		_char-upcase)
  (define char-upper-case?	_char-upper-case?)
  (define char-whitespace?	_char-whitespace?)
  (define char<=?		_char<=?)
  (define char<?		_char<?)
  (define char=?		_char=?)
  (define char>=?		_char>=?)
  (define char>?		_char>?)
  (define char?			_char?)
  (define close-input-port	_close-input-port)
  (define close-output-port	_close-output-port)
  (define complex?		_complex?)
  (define cons			_cons)
  (define cos			_cos)
  (define current-input-port	_current-input-port)
  (define current-output-port	_current-output-port)
  (define denominator		_denominator)
  (define display		_display)
  (define dynamic-wind		_dynamic-wind)
  (define eof-object?		_eof-object?)
  (define eq?			_eq?)
  (define equal?		_equal?)
  (define eqv?			_eqv?)
  (define eval			_eval)
  (define even?			_even?)
  (define exact->inexact	_exact->inexact)
  (define exact?		_exact?)
  (define exp			_exp)
  (define expt			_expt)
  (define floor			_floor)
  (define for-each		_for-each)
  (define force			_force)
  (define gcd			_gcd)
  (define imag-part		_imag-part)
  (define inexact->exact	_inexact->exact)
  (define inexact?		_inexact?)
  (define input-port?		_input-port?)
  (define integer->char		_integer->char)
  (define integer?		_integer?)
  (define interaction-environment	_interaction-environment)
  (define lcm			_lcm)
  (define length		_length)
  (define list			_list)
  (define list->string		_list->string)
  (define list->vector		_list->vector)
  (define list-ref		_list-ref)
  (define list-tail		_list-tail)
  (define list?			_list?)
  (define load			_load)
  (define log			_log)
  (define magnitude		_magnitude)
  (define make-polar		_make-polar)
  (define make-rectangular	_make-rectangular)
  (define make-string		_make-string)
  (define make-vector		_make-vector)
  (define map			_map)
  (define max			_max)
  (define member		_member)
  (define memq			_memq)
  (define memv			_memv)
  (define min			_min)
  (define modulo		_modulo)
  (define negative?		_negative?)
  (define newline		_newline)
  (define not			_not)
  (define null-environment	_null-environment)
  (define null?			_null?)
  (define number->string	_number->string)
  (define number?		_number?)
  (define numerator		_numerator)
  (define odd?			_odd?)
  (define open-input-file	_open-input-file)
  (define open-output-file	_open-output-file)
  (define output-port?		_output-port?)
  (define pair?			_pair?)
  (define peek-char		_peek-char)
  (define positive?		_positive?)
  (define procedure?		_procedure?)
  (define quotient		_quotient)
  (define rational?		_rational?)
  (define rationalize		_rationalize)
  (define read			_read)
  (define read-char		_read-char)
  (define real-part		_real-part)
  (define real?			_real?)
  (define remainder		_remainder)
  (define reverse		_reverse)
  (define round			_round)
  (define scheme-report-environment	_scheme-report-environment)
  (define set-car!		_set-car!)
  (define set-cdr!		_set-cdr!)
  (define sin			_sin)
  (define sqrt			_sqrt)
  (define string		_string)
  (define string->list		_string->list)
  (define string->number	_string->number)
  (define string->symbol	_string->symbol)
  (define string-append		_string-append)
  (define string-ci<=?		_string-ci<=?)
  (define string-ci<?		_string-ci<?)
  (define string-ci=?		_string-ci=?)
  (define string-ci>=?		_string-ci>=?)
  (define string-ci>?		_string-ci>?)
  (define string-copy		_string-copy)
  (define string-fill!		_string-fill!)
  (define string-length		_string-length)
  (define string-ref		_string-ref)
  (define string-set!		_string-set!)
  (define string<=?		_string<=?)
  (define string<?		_string<?)
  (define string=?		_string=?)
  (define string>=?		_string>=?)
  (define string>?		_string>?)
  (define string?		_string?)
  (define substring		_substring)
  (define symbol->string	_symbol->string)
  (define symbol?		_symbol?)
  (define tan			_tan)
  ;(define transcript-off	_transcript-off)
  ;(define transcript-on	_transcript-on)
  (define truncate		_truncate)
  (define values		_values)
  (define vector		_vector)
  (define vector->list		_vector->list)
  (define vector-fill!		_vector-fill!)
  (define vector-length		_vector-length)
  (define vector-ref		_vector-ref)
  (define vector-set!		_vector-set!)
  (define vector?		_vector?)
  (define with-input-from-file	_with-input-from-file)
  (define with-output-to-file	_with-output-to-file)
  (define write			_write)
  (define write-char		_write-char)
  (define zero?			_zero?))

;;our srfi-0 implementation relies on this
(define *features* '())
(define (add-feature feature)
  (if (not (memq feature *features*))
      (set! *features* (cons feature *features*))))

(module srfi-0 (cond-expand)
  (include "srfi/srfi-0.scm")
  (add-feature 'srfi-0))

(module srfi-8
  (receive)
  (include "srfi/srfi-8.scm")
  (add-feature 'srfi-8))

(module _srfi-23 (_error)
  (define _error error))

(module srfi-23 (error)
  (import _srfi-23)
  (define (error msg . args)
    (if (null? args)
        (_error msg)
        (_error (string-append msg ": ~a") (apply list args))))
  (add-feature 'srfi-23))

(module optional-args
  (check-arg
   :optional
   (let-optionals* %let-optionals*)
   error
   bitwise-and)
  (import _srfi-23)
  (define (error msg . args)
    (cond
     ((null? args)
      (_error msg))
     ((= (length args) 1)
      (_error (string-append msg ": ~a") (car args)))
     (else
      (_error (string-append msg " in ~a: ~a") (car args) (cdr args)))))
  (define (bitwise-and . args)
    (error "bitwise-and not implemented"))
  (include "optional-args.scm"))

(module srfi-1
  (cons
   list
   xcons cons* make-list list-tabulate list-copy circular-list iota
   pair? null?
   proper-list? circular-list? dotted-list? not-pair? null-list?
   list=
   car cdr list-ref
   caar cadr cdar cddr
   caaar caadr cadar caddr cdaar cdadr cddar cdddr
   caaaar caaadr caadar caaddr cadaar cadadr caddar cadddr
   cdaaar cdaadr cdadar cdaddr cddaar cddadr cdddar cddddr
   first second third fourth fifth sixth seventh eighth ninth tenth
   car+cdr
   take drop
   take-right drop-right
   take! drop-right! split-at split-at! last last-pair
   length length+
   append concatenate reverse
   append! concatenate! reverse!
   append-reverse append-reverse!
   zip unzip1 unzip2 unzip3 unzip4 unzip5
   count
   map for-each
   fold unfold pair-fold reduce fold-right unfold-right pair-fold-right
   reduce-right append-map append-map!
   map! pair-for-each filter-map map-in-order
   filter partition remove
   filter! partition! remove!
   member memq memv
   find find-tail any every
   list-index
   take-while drop-while take-while!
   span break span! break!
   delete delete-duplicates delete! delete-duplicates!
   assoc assq assv
   alist-cons alist-copy
   alist-delete alist-delete!
   lset<= lset= lset-adjoin
   lset-union lset-union!
   lset-intersection lset-intersection!
   lset-difference lset-difference!
   lset-xor lset-xor!
   lset-diff+intersection lset-diff+intersection!)
  (import* r5rs
           for-each
           cons pair? null? car cdr set-car! set-cdr!
           list append reverse length list-ref
           memq memv assq assv
           caar cadr cdar cddr
           caaar caadr cadar caddr cdaar cdadr cddar cdddr
           caaaar caaadr caadar caaddr cadaar cadadr caddar cadddr
           cdaaar cdaadr cdadar cdaddr cddaar cddadr cdddar cddddr)
  (import optional-args)
  (import srfi-8) ;RECEIVE
  (include "srfi/srfi-1.scm")
  (add-feature 'srfi-1))

(module srfi-2 (and-let*)
  (import srfi-23) ;ERROR
  (include "srfi/srfi-2.scm")
  (add-feature 'srfi-2))

(module srfi-5 (let)
  (include "srfi/srfi-5.scm")
  (add-feature 'srfi-5))

(module _srfi-6 (_open-input-string _open-output-string _get-output-string)
  (define _open-input-string	open-input-string)
  (define _open-output-string	open-input-string)
  (define _get-output-string	get-output-string))

(module srfi-6 (open-input-string open-output-string get-output-string)
  (import _srfi-6)
  (define open-input-string	_open-input-string)
  (define open-output-string	_open-output-string)
  (define get-output-string	_get-output-string)
  (add-feature 'srfi-6))

(module srfi-7 (program)
  (import srfi-0)
  (include "srfi/srfi-7.scm")
  (add-feature 'srfi-7))

(module srfi-9
  ((define-record-type
     make-record-type record-constructor record-predicate
     define-record-field record-accessor record-modifier)
   record?
   vector?)
  (import* r5rs (real-vector? vector?))
  (import srfi-23) ;ERROR
  (include "srfi/srfi-9.scm")
  (add-feature 'srfi-9))

(module srfi-11
  (let-values let*-values)
  (include "srfi/srfi-11.scm")
  (add-feature 'srfi-11))

(native-module srfi-12-native "sisc.modules.SRFI12")

(module srfi-12
  (current-exception-handler
   with-exception-handler
   handle-exceptions
   abort
   signal
   condition?
   make-composite-condition
   make-property-condition
   condition-predicate
   condition-property-accessor)
  (import srfi-12-native)
  (include "srfi/srfi-12.scm")
  (add-feature 'srfi-12))

(module srfi-14
  (char-set?
   char-set= char-set<=
   char-set-hash 
   char-set-cursor char-set-ref char-set-cursor-next end-of-char-set?
   char-set-fold char-set-unfold char-set-unfold!
   char-set-for-each char-set-map
   char-set-copy char-set
   list->char-set  string->char-set 
   list->char-set! string->char-set! 
   char-set-filter  ucs-range->char-set  ->char-set
   char-set-filter! ucs-range->char-set!
   char-set->list char-set->string
   char-set-size char-set-count char-set-contains?
   char-set-every char-set-any
   char-set-adjoin  char-set-delete 
   char-set-adjoin! char-set-delete!
   char-set-complement  char-set-union  char-set-intersection  
   char-set-complement! char-set-union! char-set-intersection! 
   char-set-difference  char-set-xor  char-set-diff+intersection
   char-set-difference! char-set-xor! char-set-diff+intersection!
   char-set:lower-case		char-set:upper-case	char-set:title-case
   char-set:letter		char-set:digit		char-set:letter+digit
   char-set:graphic		char-set:printing	char-set:whitespace
   char-set:iso-control		char-set:punctuation	char-set:symbol
   char-set:hex-digit		char-set:blank		char-set:ascii
   char-set:empty		char-set:full)
  (import srfi-9) ;DEFINE-RECORD-TYPE
  (import optional-args)
  (define %latin1->char integer->char)
  (define %char->latin1 char->integer)
  (include "srfi/srfi-14.scm")
  (add-feature 'srfi-14))

(module srfi-13
  (string-map
   string-map!
   string-fold       string-unfold
   string-fold-right string-unfold-right 
   string-tabulate string-for-each string-for-each-index
   string-every string-any
   string-hash string-hash-ci
   string-compare string-compare-ci
   string=    string<    string>    string<=    string>=    string<>
   string-ci= string-ci< string-ci> string-ci<= string-ci>= string-ci<> 
   string-downcase  string-upcase  string-titlecase  
   string-downcase! string-upcase! string-titlecase! 
   string-take string-take-right
   string-drop string-drop-right
   string-pad string-pad-right
   string-trim string-trim-right string-trim-both
   string-filter string-delete
   string-index string-index-right 
   string-skip  string-skip-right
   string-count
   string-prefix-length string-prefix-length-ci
   string-suffix-length string-suffix-length-ci
   string-prefix? string-prefix-ci?
   string-suffix? string-suffix-ci?
   string-contains string-contains-ci
   string-copy! substring/shared
   string-reverse string-reverse! reverse-list->string
   string-concatenate string-concatenate/shared string-concatenate-reverse
   string-append/shared
   xsubstring string-xcopy!
   string-null?
   string-join
   string-tokenize
   string-replace
   string->list string-copy string-fill! 
   string? make-string string-length string-ref string-set! 
   string string-append list->string
   make-kmp-restart-vector string-kmp-partial-search kmp-step
   string-parse-start+end
   string-parse-final-start+end
   let-string-start+end
   check-substring-spec
   substring-spec-ok?)
  (import* r5rs 
           string? make-string string-length string-ref string-set!
           string string-append list->string)
  (import srfi-8) ;RECEIVE
  (import srfi-14)
  (import optional-args)
  (define char-cased? char-alphabetic?)
  (define char-titlecase char-upcase)
  (include "srfi/srfi-13.scm")
  (add-feature 'srfi-13))

(module srfi-16 (case-lambda)
  (import srfi-23) ;ERROR
  (include "srfi/srfi-16.scm")
  (add-feature 'srfi-16))

(module srfi-24 ()
  ;;this srfi is natively supported by our syntax expander
  (add-feature 'srfi-24))
;; 
;; The contents of this file are subject to the Mozilla Public
;; License Version 1.1 (the "License"); you may not use this file
;; except in compliance with the License. You may obtain a copy of
;; the License at http://www.mozilla.org/MPL/
;; 
;; Software distributed under the License is distributed on an "AS
;; IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
;; implied. See the License for the specific language governing
;; rights and limitations under the License.
;; 
;; The Original Code is the Second Interpreter of Scheme Code (SISC).
;; 
;; The Initial Developer of the Original Code is Scott G. Miller.
;; Portions created by Scott G. Miller are Copyright (C) 2000-2001
;; Scott G. Miller.  All Rights Reserved.
;; 
;; Contributor(s):
;; Matthias Radestock 
;; 
;; Alternatively, the contents of this file may be used under the
;; terms of the GNU General Public License Version 2 or later (the
;; "GPL"), in which case the provisions of the GPL are applicable 
;; instead of those above.  If you wish to allow use of your 
;; version of this file only under the terms of the GPL and not to
;; allow others to use your version of this file under the MPL,
;; indicate your decision by deleting the provisions above and
;; replace them with the notice and other provisions required by
;; the GPL.  If you do not delete the provisions above, a recipient
;; may use your version of this file under either the MPL or the
;; GPL.
;;
