(if (equal? (getprop 'beta '*environment-variables*)
            '"yes")
    (begin  
      (current-evaluator eval)
      (emit-annotations '#t)
      (emit-debugging-symbols '#t))
    (void))

