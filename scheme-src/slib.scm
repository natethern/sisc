;"chez.init" Initialization file for SLIB for Chez Scheme 5.0c	-*-scheme-*-
; Copyright (C) 1993 dorai@cs.rice.edu (Dorai Sitaram)
; Copyright (C) 1991, 1992, 1993, 1994, 1997 Aubrey Jaffer.
; Adapted to version 5.0c by stone@math.grin.edu (John David Stone) 1997
;
;Permission to copy this software, to redistribute it, and to use it
;for any purpose is granted, subject to the following restrictions and
;understandings.
;
;1.  Any copy made of this software must include this copyright notice
;in full.
;
;2.  I have made no warrantee or representation that the operation of
;this software will be error-free, and I am under no obligation to
;provide any services, by way of maintenance, update, or otherwise.
;
;3.  In conjunction with products arising from the use of this
;material, there shall be no use of my name in any advertising,
;promotional, or sales literature without prior written consent in
;each case.

;; The SOFTWARE-TYPE procedure returns a symbol indicating the generic
;; operating system type.  UNIX, VMS, MACOS, AMIGA and MS-DOS are
;; supported.


;; On SISC, we have the misfortune of being run on a multitude of platforms
(define software-type detect-os)

;; The SCHEME-IMPLEMENTATION-TYPE procedure returns a symbol denoting the
;; Scheme implementation that loads this file.

(define scheme-implementation-type
  (lambda () 'sisc))

;; The SCHEME-IMPLEMENTATION-VERSION procedure returns a string describing
;; the version of the Scheme implementation that loads this file.

(define scheme-implementation-version
  (lambda () (getprop 'version '*sisc*)))

;; The GETENV returns the value of a shell environment variable.

;; In some implementations of Chez Scheme, this can be done with foreign
;; procedures.  However, I [JDS] am using the HP version, which does not
;; support them, so a different approach is needed.
;;
;; Here's the version that doesn't work on HPs:
;;
;; (provide-foreign-entries '("getenv"))
;; 
;; (define getenv
;;   (foreign-procedure "getenv"
;;     (string) string))
;;
;; And here's a version that parses the value out of the output of the
;; /bin/env command:

(define getenv
  (lambda (env-var)
    (getprop (string->symbol env-var) '*environment-variables*)))

;; The IMPLEMENTATION-VICINITY procedure returns a string giving the
;; pathname of the directory that includes any auxiliary files used by this
;; Scheme implementation.

(define implementation-vicinity
  (let ((library-path (string-append
                       (or (getprop 'home '*config-parameters*)
                           (error "You must define the sisc.home property"))
                       "/")))
    (lambda () library-path)))

;; The LIBRARY-VICINITY procedure returns the pathname of the directory
;; where Scheme library functions reside.

(define library-vicinity
  (let ((library-path (string-append
                       (or (getprop 'slib '*config-parameters*)
                           (error "You must define the sisc.slib property"))
                       "/")))
    (lambda () library-path)))

;;; (home-vicinity) should return the vicinity of the user's HOME
;;; directory, the directory which typically contains files which
;;; customize a computer environment for a user.

(define home-vicinity
  (let ((home-path (string-append (getenv "user.home") "/")))
    (lambda () home-path)))

;; The OUTPUT-PORT-WIDTH procedure returns the number of graphic characters
;; that can reliably be displayed on one line of the standard output port.

(define output-port-width
  (lambda arg
    (let ((env-width-string "79"))
      (if (and env-width-string
               (let loop ((remaining (string-length env-width-string)))
                 (or (zero? remaining)
                     (let ((next (- remaining 1)))
                       (and (char-numeric? (string-ref env-width-string
                                                       next))
                            (loop next))))))
          (- (string->number env-width-string) 1)
          79))))

;; The OUTPUT-PORT-HEIGHT procedure returns the number of lines of text
;; that can reliably be displayed simultaneously in the standard output
;; port.

(define output-port-height
  (lambda arg
    (let ((env-height-string "24"))
      (if (and env-height-string
               (let loop ((remaining (string-length env-height-string)))
                 (or (zero? remaining)
                     (let ((next (- remaining 1)))
                       (and (char-numeric? (string-ref env-height-string
                                                       next))
                            (loop next))))))
          (string->number env-height-string)
          24))))

;; *FEATURES* is a list of symbols describing features of this
;; implementation; SLIB procedures sometimes consult this list to figure
;; out whether to attempt some incompletely standard operation.

(define *features*
 '(source    ; Chez Scheme can load Scheme source files, with the
	      ;   command (slib:load-source "filename") -- see below.

   char-ready? delay dynamic-wind format defmacro
   full-continuation getenv ieee-p1178 macro multiarg/and-
   multiarg-apply pretty-print rationalize 
   rev3-procedures rev3-report rev4-optional-procedures rev4-report
   string-port values with-file rev5-procedures rev5-report 
   rev5-optional-procedures))

(define *defmacros*
  (list (cons 'defmacro
	      (lambda (name parms . body)
		`(set! *defmacros* (cons (cons ',name (lambda ,parms ,@body))
					 *defmacros*))))))
(define (defmacro? m) (and (assq m *defmacros*) #t))

(define (macroexpand-1 e)
  (if (pair? e) (let ((a (car e)))
		  (cond ((symbol? a) (set! a (assq a *defmacros*))
				     (if a (apply (cdr a) (cdr e)) e))
			(else e)))
      e))

(define (macroexpand e)
  (if (pair? e) (let ((a (car e)))
		  (cond ((symbol? a)
			 (set! a (assq a *defmacros*))
			 (if a (macroexpand (apply (cdr a) (cdr e))) e))
			(else e)))
      e))

(define base:eval eval)
(define (defmacro:eval x) (base:eval (defmacro:expand* x)))
(define (defmacro:expand* x)
  (require 'defmacroexpand) (apply defmacro:expand* x '()))

;; Chez's (FORMAT F . A) corresponds to SLIB's (FORMAT #F F . A)

(define sisc:format format)

(define format
  (lambda (where how . args)
    (let ((str (apply sisc:format how args)))
      (cond ((not where) str)
	    ((eq? where #t) (display str))
	    (else (display str where))))))

;; Chez's NIL variable is bound to '(); SLIB's is bound to #F.

(define nil #f)

;; SLIB provides identifiers for the TAB (ASCII 9) and FORM-FEED (ASCII 12)
;; characters.

(define slib:tab #\tab)
(define slib:form-feed #\014)

;; The following definitions implement a few widely useful procedures that
;; Chez Scheme does not provide or provides under a different name.

;; The RENAME-FILE procedure constructs and executes a Unix mv command to
;; change the name of a file.

;(define rename-file
;  (lambda (src dst)
;    (system (string-append "mv " src " " dst))))

;; The CURRENT-ERROR-PORT procedure returns a port to which error
;; messages are to be displayed; this is the original standard output
;; port (even if the program subsequently changes the current output port
;; somehow).

(define current-error-port
  (let ((port (current-output-port)))
    (lambda () port)))

;; SLIB provides its own version of the ERROR procedure.

(define slib:error
  (lambda args
    (let ((port (current-error-port))
	  (strport (open-output-string)))
;      (display "Error: " strport)
      (for-each (lambda (x) (display x strport)) args)
      (error (get-output-string strport)))))

;; The TMPNAM procedure constructs and returns a temporary file name,
;; presumably unique and not a duplicate of one already existing.

(define tmpnam
  (let ((cntr 100))
    (lambda ()
      (set! cntr (+ 1 cntr))
      (let ((tmp (string-append "slib_" (number->string cntr))))
        (if (file-exists? tmp) (tmpnam) tmp)))))

;; The FORCE-OUTPUT requires buffered output that has been written to a
;; port to be transferred all the way out to its ultimate destination.
;unsupported in sisc
(define force-output void)

;; CHAR-CODE-LIMIT is the number of characters in the character set; only
;; non-negative integers less than CHAR-CODE-LIMIT are eligible as
;; arguments to INTEGER->CHAR.

; SISC supports unicode
(define char-code-limit 65536)

(define most-positive-fixnum (- (ashl 1 31) 1))

;; The IDENTITY procedure returns its argument without change.

(define identity 
  (lambda (x) x))

;; The GENTEMP procedure generates unused symbols and marks them as
;; belonging to the SLIB package.

(define gentemp
  (let ((*gensym-counter* -1))
    (lambda ()
      (set! *gensym-counter* (+ *gensym-counter* 1))
      (string->symbol
       (string-append "slib:G" (number->string *gensym-counter*))))))

;; The IN-VICINITY procedure is simply STRING-APPEND, conventionally used
;; to attach a directory pathname to the name of a file that is expected to
;; be in that directory.

(define in-vicinity string-append)

;; For backward compatability, the SCHEME-FILE-SUFFIX procedure is defined
;; to return the string ".scm".  Note, however, that ".ss" is a common Chez
;; file suffix.

(define scheme-file-suffix
  (lambda () ".scm"))

;; SLIB appropriates Chez Scheme's EVAL procedure.

(define slib:eval eval)
(define macro:eval slib:eval)

(define slib:eval-load
  (lambda (<pathname> evl)
    (if (not (file-exists? <pathname>))
        (set! <pathname> (string-append <pathname> (scheme-file-suffix))))
    (call-with-input-file <pathname>
      (lambda (port)
        (let ((old-load-pathname *load-pathname*))
          (set! *load-pathname* <pathname>)
          (do ((o (read port) (read port)))
              ((eof-object? o))
            (evl o))
          (set! *load-pathname* old-load-pathname))))))

;; SLIB:EXIT is the implementation procedure that exits, or returns
;; if exiting is not supported.

(define slib:sisc:quit
  (let ((arg (call-with-current-continuation identity)))
    (cond ((procedure? arg) arg)
	  (else (exit)))))


(define slib:exit
  (lambda args
    (cond ((null? args) (slib:sisc:quit #t))
	  ((eqv? #t (car args)) (slib:sisc:quit #t))
	  ((eqv? #f (car args)) (slib:sisc:quit #f))
	  ((zero? (car args)) (slib:sisc:quit #t))
	  (else (slib:sisc:quit #f)))))

;; The SLIB:LOAD-SOURCE procedure, given a string argument, should attach
;; the appropriate file suffix to the string and load the file named
;; by the resulting string.

(define slib:load-source
  (lambda (f) (load (string-append f (scheme-file-suffix)))))

;;; defmacro:load and macro:load also need the default suffix.

(define macro:load slib:load-source)

;; The SLIB:LOAD-COMPILED procedure, given a string argument, finds and
;; loads the file, assumed to have been compiled.

(define slib:load-compiled load)

;; SLIB:LOAD can now be defined to load SLIB files.

(define slib:load slib:load-source)
(define defmacro:load slib:load)

;; Load the REQUIRE package.

(slib:load (in-vicinity (library-vicinity) "require"))

(define (1- x) (- x 1))
(define (1+ x) (+ x 1))
