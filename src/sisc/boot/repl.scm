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

(define current-exit-handler (make-parameter void))

(define current-default-error-handler
  (make-parameter
   (lambda (m e)
     (let ([exception (make-exception m e)])
       (putprop 'last-exception '*debug* exception)
       (print-exception exception (stack-trace-on-error))))))

(define repl-prompt
  (make-config-parameter "replPrompt" ""))
(define stack-trace-on-error
  (make-config-parameter "stackTraceOnError" #f))

(define (get-last-exception)
  (getprop 'last-exception '*debug*))

(define _exit-handler (make-parameter '()))

(define repl
  (letrec ([repl/read
            (lambda (writer)
              (display "#;")
              (let ([len (- (length (_exit-handler)) 1)])
                (unless (zero? len)
                  (display len)))
              (display (repl-prompt))
              (display "> ")
              ;;read
              (let ([exp (read-code (current-input-port))])
                (if (eof-object? exp) 
                    (if ((current-exit-handler))
                        (exit)
                        (repl/read writer))
                    (begin
                      ;; Consume any whitespace
                      (let loop ()
                        (when (and (char-ready? (current-input-port))
                                   (char-whitespace? (peek-char)))
                          (read-char)
                          (loop)))

                    ;;eval

                      (let ([val (eval exp)])
                        (if (not (void? val))
                            (begin (writer val) (newline)))
                        (repl/read writer))))))])
    (lambda ()
      (current-url
       (string-append
        "file:"
        (let ([dir (getenv "user.dir")])
          (if dir
              (string-append dir (getenv "file.separator"))
              "."))))
      (let ([repl-start #f])
        (call/cc
         (lambda (k)
           (_exit-handler (cons k (_exit-handler)))
           (begin
             (call/cc (lambda (k) 
                        (set! repl-start k)
                        (putprop 'repl '*debug* k)))
             (let loop ()
               (with/fc (lambda (m e)
                          ((current-default-error-handler) m e)
                          (loop))
                 (lambda ()
                   (repl/read
                    (lambda (v)
                      (if (and (getprop 'pretty-print '*toplevel*)
                               (not (circular? v)))
                          (pretty-print v)
                          ;;dynamic wind would be better here, but
                          ;;we don't want to use it in core code
                          (let ([ps (print-shared)])
                            (print-shared #t)
                            (write v)
                            (print-shared ps)))))
                   (void)))))))
        (if ((current-exit-handler))
            (void)
            (repl-start))))))

(define (sisc-cli)
  (with/fc (lambda (m e)
             (display (format "Uncaught error: ~a~%Please report this error to sisc-devel@lists.sourceforge.net~%" m))
             (if (pair? (_exit-handler))
                 (_exit-handler (cdr (_exit-handler))))
             (sisc-cli))
           repl))

(define (exit)
  (let ([k (car (_exit-handler))])
    (_exit-handler (cdr (_exit-handler)))
    (newline)
    (if k (k))))
