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
(load "debug.scm")

(define (make-error-message location message)
  (if location
      (if message
          (format "Error in ~a: ~a" location message)
          (format "Error in ~a." location))
      (if message
          (format "Error: ~a" message)
          "Error.")))


(define current-default-error-handler
  (parameterize
   (letrec ((eh
             (lambda (message error-cont)
               (cond [(null? message) "Error."]
                     [(not (pair? message)) message]
                     [(assoc 'message message) => 
                      (lambda (mr)
                        (make-error-message 
                         (cond [(assoc 'location message) => cdr] 
                               [else #f])
                         (cdr mr)))]
                     [(assoc 'location message) =>
                      (lambda (lr)
                        (make-error-message (cdr lr) #f))]
                     [(assoc 'parent message) =>
                      (lambda (p)
                        (let ((p (cdr p)))
                          (let ((m (assoc 'message p))
                                (e (assoc 'error-continuation p)))
                            (let ((submessage
                                   (eh (and m (cdr m)) 
                                       (and e (cdr e))
                                       (and c (cdr c)))))
                              (cond [(assoc 'location message) =>
                                     (lambda (lr)
                                        (format 
                                         "Error in nested call from ~a:~% ~a"
                                         (cdr lr) submessage))]
                                    [else
                                      (format "Error in nested call:~% ~a"
                                              submessage)])))))]
                     [else (make-error-message #f #f)]))))
     (lambda (m e o)
       (display (eh m e) o)
       (newline o)
       (putprop 'last-error '*sisc* 
                (cons `(error-continuation . ,(error-continuation-k e))
                      (if m 
                          (cond [(null? m) '()]
                                [(pair? m) m]
                                [else (list (cons 'message m))]) 
                          '())))))))

(define _exit-handler (parameterize))

(define repl
  (letrec ([repl/eval-print-loop
            (lambda (exp console-in console-out writer)
              ;;eval
              (let ([val (eval exp)])
                (cond [(void? val) (repl/read console-in console-out writer)]
                      [(circular? val)
                       (begin 
                         (display "{Refusing to print non-terminating structure}")
                         (newline)
                         (repl/read console-in console-out writer))]
                      [else 
                       (begin 
                         ;;print
                         (writer val console-out)
                         (newline console-out)
                         ;;loop
                         (repl/read console-in console-out writer))])))]
           [repl/read
            (lambda (console-in console-out writer)
              (display "> " console-out)
              ;;read
              (let ([exp (read-with-annotations console-in #t)])
                (if (eof-object? exp) 
                    (if ((current-exit-handler))
                        (void)
                        (repl/read console-in console-out writer))
                    (repl/eval-print-loop exp console-in 
                                          console-out writer))))])
    (lambda args
      (current-url
       (string-append
        "file:"
        (let ([dir (getprop 'user.dir '*environment-variables*)])
          (if dir
              (string-append dir (getprop 'file.separator
                                          '*environment-variables*))
              "."))))
      (let ([repl-start #f])
        (letrec ([console-in (if (null? args) (current-input-port)
                                 (car args))]
                 [console-out (if (null? args) (current-output-port)
                                  (cadr args))])
          (call/cc
           (lambda (k)
             (_exit-handler k)
             (begin
               (call/cc 
                (lambda (k)
                  (set! repl-start k)))
               (let loop ()
                 (with/fc
                  (lambda (m e)
                    ((current-default-error-handler) m e console-out)
                    (loop))
                  (lambda ()
                    (repl/read console-in console-out pretty-print)
                    (void)))))))
          (if ((current-exit-handler))
              (void)
              (repl-start)))))))

(define (exit)
  (let ([k (_exit-handler)])
    (if k (k))))