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

(define current-optimizer (parameterize (current-optimizer)))

(define current-default-error-handler
  (parameterize
   (lambda (m e)
     (let ([exception (make-exception m e)])
       (putprop 'last-exception '*debug* exception)
       (print-exception exception #f)))))

(define (get-last-exception)
  (getprop 'last-exception '*debug*))

(define _exit-handler (parameterize '()))

(define repl
  (letrec ([repl-k (parameterize)]
           [repl/eval-print-loop
            (lambda (exp writer)
              ;;eval
              (let ([val (eval exp)])
                (cond [(void? val) (repl/read writer)]
                      [(circular? val)
                       (begin
                         (if (print-shared)
                             (write val)
                             (display "{Refusing to print non-terminating structure}"))
                         (newline)
                         (repl/read writer))]
                      [else 
                       (begin 
                         ;;print
                         (writer val)
                         (newline)
                         ;;loop
                         (repl/read writer))])))]
           [repl/read
            (lambda (writer)
              (display (format "#;~a> " (let ((len (- (length (_exit-handler))
                                                      1)))
                                          (if (zero? len) ""  len))))
              ;;read
              (let ([exp (read-code (current-input-port))])
                (if (eof-object? exp) 
                    (if ((current-exit-handler))
                        (exit)
                        (repl/read writer))
                    (repl/eval-print-loop exp writer))))])
    (putprop 'repl '*debug* repl-k)
    (lambda ()
      (current-url
       (string-append
        "file:"
        (let ([dir (getprop 'user.dir '*environment-variables*)])
          (if dir
              (string-append dir (getprop 'file.separator
                                          '*environment-variables*))
              "."))))
      (let ([repl-start #f])
        (call/cc
         (lambda (k)
           (_exit-handler (cons k (_exit-handler)))
           (begin
             (call/cc 
              (lambda (k)
                (set! repl-start k)
                (repl-k k)))
             (let loop ()
               (with/fc
                (lambda (m e)
                  ((current-default-error-handler) m e)
                  (loop))
                (lambda ()
                  (repl/read (if (getprop 'pretty-print '*toplevel*)
                                 pretty-print
                                 write))
                  (void)))))))
        (if ((current-exit-handler))
            (void)
            (repl-start))))))

(define (exit)
  (let ([k (car (_exit-handler))])
    (_exit-handler (cdr (_exit-handler)))
    (newline)
    (if k (k))))
