; If loaded, instructs init.pp not to load SNative
(putprop 'LITE '*sisc* #t)
(define stack-trace-on-error
  (lambda args #f))
