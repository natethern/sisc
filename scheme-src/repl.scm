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
;; The SISC read-eval-print-loop

(define current-exit-handler (parameterize void))

(define current-default-error-handler
  (parameterize
   (lambda (message error-cont failure-cont output-port)
     (display message output-port)
     (newline output-port))))

(define repl
  (letrec ([repl-loop
	    (lambda (console-in console-out writer)
	      (display "> " console-out)
	      (let* ([exp (read console-in)]
		     [val (eval exp)])
		(cond [(void? val) (repl-loop console-in console-out writer)]
		      [(eof-object? val) 
		       (if ((current-exit-handler))
			   (void)
			   (repl-loop console-in console-out writer))]
		      [(circular? val)
		       (begin 
			 (display "{Refusing to print non-terminating structure}")
			 (newline)
			 (repl-loop console-in console-out writer))]
		      [else 
		       (begin 
			 (writer val console-out)
			 (newline console-out)
			 (repl-loop console-in console-out writer))])))])
    (lambda args
      (set! _separator (getprop 'file.separator '*environment-variables*))
      (current-directory (getprop 'user.dir '*environment-variables*))
      (letrec ([console-in (if (null? args) (current-input-port)
			    (car args))]
	       [console-out (if (null? args) (current-output-port)
				(cadr args))])
	(let loop ()
	  (call/fc
	   (lambda ()
	     (repl-loop console-in console-out pretty-print)
	     (void))
	   (lambda (m e f)
	     ((current-default-error-handler) m e f console-out)
	     (loop))))))))

(module (foo)
  (define foo 1))
