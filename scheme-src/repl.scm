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

(define (make-error-message location message)
  (if location
      (if message
          (format "Error in ~a: ~a" location message)
          (format "Error in ~a." location))
      (if message
          (format "Error: ~a" message)
          "Error.")))

(define current-optimizer (parameterize (cond [(getprop 'opt:optimize
                                                        '*toplevel*) =>
                                                (lambda (x) x)]
                                              [else (lambda (x) x)])))

(define current-default-error-handler
  (parameterize
   (letrec ((eh
             (lambda (message error-cont)
               (cond [(null? message) "Error."]
                     [(not (pair? message)) message]
                     [(assoc 'parent message) =>
                      (lambda (p)
                        (let ((p (cdr p)))
                          (let ((e (assoc 'error-continuation p))
                                (mm (assoc 'message message)))
                            (let ((submessage
                                   (eh p (and e (cdr e)))))
                              (cond [(assoc 'location message) =>
                                     (lambda (lr)
                                       (if mm
                                           (format 
                                            "Error in nested call from ~a: ~a~% ~a"
                                            (cdr lr) (cdr mm) submessage)
                                           (format 
                                            "Error in nested call from ~a:~% ~a"
                                            (cdr lr) submessage)))]
                                    [else
                                      (if mm
                                          (format "Error in nested call: ~a~% ~a" 
                                                  (cdr mm) submessage)
                                          (format "Error in nested call:~% ~a"
                                                  submessage))])))))]
                     [(assoc 'message message) => 
                      (lambda (mr)
                        (make-error-message 
                         (cond [(assoc 'location message) => cdr] 
                               [else #f])
                         (cdr mr)))]
                     [(assoc 'location message) =>
                      (lambda (lr)
                        (make-error-message (cdr lr) #f))]
                     [else (make-error-message #f #f)]))))
     (lambda (m e)
       (display (eh m e))
       (newline)
       (putprop 'last-error '*debug* (cons m e))))))

(define _exit-handler (parameterize))

(define repl
  (letrec ([repl-k (parameterize)]
           [repl/eval-print-loop
            (lambda (exp writer)
              ;;eval
              (let ([val (eval exp)])
                (cond [(void? val) (repl/read writer)]
                      [(circular? val)
                       (begin 
                         (display "{Refusing to print non-terminating structure}")
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
              (display "> ")
              ;;read
              (let ([exp (read-code (current-input-port))])
                (if (eof-object? exp) 
                    (if ((current-exit-handler))
                        (void)
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
           (_exit-handler k)
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
  (let ([k (_exit-handler)])
    (if k (k))))
