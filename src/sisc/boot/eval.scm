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

;;turn on syntax expansion and optimization

(define current-optimizer (_make-parameter (lambda (x) x)))
  
(set! eval
      (let ([old-eval eval]
            [apply apply]
            [_analyze! _analyze!]
            [sc-expand sc-expand]
            [interaction-environment interaction-environment])
        (lambda (x . env)
          (cond [(and (pair? x) (member (car x) '("noexpand" "analyzeonly")))
                 (apply old-eval
                        (if (equal? (car x) "analyzeonly")
                            (_analyze! (cadr x)
                                       (if (null? env)
                                           (interaction-environment)
                                           (car env)))
                            (cadr x)) env)]
                [(and (null? env) (strict-r5rs-compliance))
                 (error 'eval "expected 2 arguments to procedure, got 1.")]
                [else 
                 (let ([optimizer (current-optimizer)]
                       [old-ie (apply interaction-environment env)]
                       [source #f])
                   (with-failure-continuation
                    (lambda (m e)
                      (interaction-environment old-ie)
                      (throw m e))
                    (lambda ()               
                      (set! source (_analyze!
                                    (optimizer
                                     (sc-expand x '(e) '(e)))
                                    (interaction-environment old-ie)))))
                   (apply old-eval source env))]))))
