;;; match.ss

;;; Time-stamp: <2000-02-29 14:03:30 eh>

;; [29 Feb 2000]
;; Fixed a case sensitivity bug.

;; Previous changelog listings at end of file.

;;; ============================================================

;; Exp    ::= (match              Exp Clause)
;;         || (trace-match        Exp Clause)
;;         || (match+       (Id*) Exp Clause*)
;;         || (trace-match+ (Id*) Exp Clause*)

;; Clause ::= (Pat Exp+) || (Pat (guard Exp*) Exp+)

;; Pat    ::= (Pat ... . Pat)
;;         || (Pat . Pat)
;;         || ()
;;         || #(Pat* Pat ... Pat*)
;;         || #(Pat*)
;;         || ,Id
;;         || ,[Id*]
;;         || Id

;; YOU'RE NOT ALLOWED TO REFER TO CATA VARS IN GUARDS. (reasonable!)
;; this is now checked at compile-time.

(define-syntax rec
  (syntax-rules ()
    ((_ x e) (letrec ((x e)) x))))

(define (make-list n v)
  (if (zero? n) '()
      (cons v (make-list (- n 1) v))))

;(module match ((match+ match-help match-help1 clause-body let-values**
;                guard-body convert-pat mapper my-backquote extend-backquote
;                sexp-dispatch)
;               (trace-match+ match-help match-help1 clause-body let-values**
;                guard-body convert-pat mapper my-backquote extend-backquote
;                sexp-dispatch)
;               (match match-help match-help1 clause-body let-values**
;                guard-body convert-pat mapper my-backquote extend-backquote
;                sexp-dispatch)
;               (trace-match match-help match-help1 clause-body let-values**
;                guard-body convert-pat mapper my-backquote extend-backquote
;                sexp-dispatch))
 ;(import scheme)

(define-syntax match+
  (lambda (x)
    (syntax-case x ()
      [(_ (ThreadedId ...) Exp Clause ...)
       #'(let f ((ThreadedId ThreadedId) ... (x Exp))
           (match-help _ f x (ThreadedId ...) Clause ...))])))

(define-syntax match
  (lambda (x)
    (syntax-case x ()
      [(_ Exp Clause ...)
       #'(let f ((x Exp))
           (match-help _ f x () Clause ...))])))

(define-syntax trace-match+
  (lambda (x)
    (syntax-case x ()
      [(_ (ThreadedId ...) Name Exp Clause ...)
       #'(letrec ((f (trace-lambda Name (ThreadedId ... x)
                       (match-help _ f x (ThreadedId ...) Clause ...))))
           (f ThreadedId ... x))])))

(define-syntax trace-match
  (lambda (x)
    (syntax-case x ()
      [(_ Name Exp Clause ...)
       #'(letrec ((f (trace-lambda Name (x)
                       (match-help _ f x () Clause ...))))
           (f Exp))])))

;;; ------------------------------

(define-syntax let-values**
  (syntax-rules ()
    ((_ () B0 B ...) (begin B0 B ...))
    ((_ ((Formals Exp) Rest ...) B0 B ...)
     (let-values** (Rest ...) 
       (call-with-values (lambda () Exp)
         (lambda Formals B0 B ...))))))

(define-syntax match-help
  (lambda (x)
    (syntax-case x ()
      ((_ Template Cata Obj ThreadedIds)
       #'(error 'match "Unmatched datum: ~s" Obj))
      ((_ Template Cata Obj ThreadedIds (Pat B0 B ...) Rest ...)
       #'(convert-pat Pat
           (match-help1 Template Cata Obj ThreadedIds 
             (B0 B ...)
             Rest ...))))))

(define-syntax match-help1
  (syntax-rules (guard)
    ((_ PatLit Vars Cdecls Template Cata Obj ThreadedIds
       ((guard G ...) B0 B ...) Rest ...)
     (let ((ls/false (sexp-dispatch Obj PatLit)))
       (if (and ls/false (apply (lambda Vars
                                  (guard-body Cdecls
                                    (extend-backquote Template (and G ...))))
                           ls/false))
           (apply (lambda Vars
                    (clause-body Cata Cdecls ThreadedIds
                      (extend-backquote Template B0 B ...)))
             ls/false)
           (match-help Template Cata Obj ThreadedIds Rest ...))))
    ((_ PatLit Vars Cdecls Template Cata Obj ThreadedIds
       (B0 B ...) Rest ...)
     (let ((ls/false (sexp-dispatch Obj PatLit)))
       (if ls/false
           (apply (lambda Vars
                    (clause-body Cata Cdecls ThreadedIds
                      (extend-backquote Template B0 B ...)))
             ls/false)
           (match-help Template Cata Obj ThreadedIds Rest ...))))))

(define-syntax clause-body
  (lambda (x)
    (define build-mapper
      (lambda (vars depth cata tIds)
        (if (zero? depth)
            cata
            (with-syntax ((rest (build-mapper vars (- depth 1) cata tIds))
                          (vars vars)
                          (tIds tIds))
              #'(mapper rest vars tIds)))))
    (syntax-case x ()
      ((_ Cata ((CVar CDepth CFormal ...) ...) (ThreadedId ...) B)
       (with-syntax (((Mapper ...)
                      (map (lambda (formals depth)
                             (build-mapper formals
                               (syntax-object->datum depth)
                               #'Cata
                               #'(ThreadedId ...)))
                        #'((CFormal ...) ...)
                        #'(CDepth ...))))
         #'(let-values** (([ThreadedId ... CFormal ...]
                           (Mapper ThreadedId ... CVar))
                          ...)
             B))))))

(define-syntax guard-body
  (lambda (x)
    (syntax-case x ()
      ((_ ((Cvar Cdepth Cformal ...) ...) B)
       (with-syntax (((CF ...) (apply append #'((Cformal ...) ...))))
         #'(let-syntax
               ((CF
                  (lambda (x)
                    (syntax-case x ()
                      (Name
                        (error 'match
                          "Cannot refer to return-value variable ~s in guard"
                          (syntax-object->datum #'Name))))))
                ...)
             B))))))

(define-syntax convert-pat
  ;; returns sexp-pat x vars x cdecls
  (let ()
    (define main
      (lambda (syn) 
        (syntax-case syn ()
          ((_ syn (kh . kt))
           (let-synvalues* (((a b c) (f #'syn '() '() 0)))
             #'(kh 'a b c . kt))))))
    (define (f syn vars cdecls depth)
      (syntax-case syn (unquote)
        ((unquote [Var ...])
         (with-syntax (((Temp) (generate-temporaries '(x)))
                       (Depth depth))
           (values #'any
                   (cons #'Temp vars)
                   (cons #'[Temp Depth Var ...] cdecls))))
        ((unquote Var)
         (values #'any (cons #'Var vars) cdecls))
        (((unquote [Var ...]) Dots)
         (eq? (syntax-object->datum #'Dots) '...)
         (with-syntax (((Temp) (generate-temporaries '(x)))
                       (Depth+1 (add1 depth)))
           (values #'each-any
                   (cons #'Temp vars)
                   (cons #'[Temp Depth+1 Var ...] cdecls))))
        (((unquote Var) Dots)
         (eq? (syntax-object->datum #'Dots) '...)
         (values #'each-any (cons #'Var vars) cdecls))
        ((Pat Dots)
         (eq? (syntax-object->datum #'Dots) '...)
         (let-synvalues* (((Dpat Dvars Dcdecls)
                           (f #'Pat vars cdecls (add1 depth))))
           (with-syntax ((Size (- (length #'Dvars) (length vars))))
             (values #'#(each Dpat Size) #'Dvars #'Dcdecls))))
        ((Pat Dots . Rest)
         (eq? (syntax-object->datum #'Dots) '...)
         (let-synvalues* (((Rpat Rvars Rcdecls)
                           (f #'Rest vars cdecls depth))
                          ((Dpat Dvars Dcdecls)
                           (f #'(Pat (... ...)) #'Rvars #'Rcdecls
			     (add1 depth))))
           (with-syntax ((Size (- (length #'Dvars) (length #'Rvars)))
                         ((RevRestTl . RevRest) (reverseX #'Rpat '())))
             (values #'#(tail-each Dpat Size RevRest RevRestTl)
                     #'Dvars #'Dcdecls))))
        ((X . Y)
         (let-synvalues* (((Ypat Yvars Ycdecls)
                           (f #'Y vars cdecls depth))
                          ((Xpat Xvars Xcdecls)
                           (f #'X #'Yvars #'Ycdecls depth)))
           (values #'(Xpat . Ypat) #'Xvars #'Xcdecls)))
        (() (values #'() vars cdecls))
	(#(X ...)
	 (let-synvalues* (((Pat Vars CDecls) (f #'(X ...) vars cdecls depth)))
	   (values #'#(vector Pat) #'Vars #'CDecls)))
        (Thing (values #'#(atom Thing) vars cdecls))))
    (define reverseX
      (lambda (ls acc)
        (if (pair? ls)
            (reverseX (cdr ls) (cons (car ls) acc))
            (cons ls acc))))
    (define-syntax let-synvalues*
      (syntax-rules ()
        ((_ () B0 B ...) (begin B0 B ...))
        ((_ (((Formal ...) Exp) Decl ...) B0 B ...)
         (call-with-values (lambda () Exp)
           (lambda (Formal ...)
             (with-syntax ((Formal Formal) ...)
               (let-synvalues* (Decl ...) B0 B ...)))))))
    main))

(define-syntax mapper
  (lambda (x)
    (syntax-case x ()
      ((_ F (RetId ...) (ThreadId ...))
       (with-syntax (((t ...) (generate-temporaries #'(RetId ...)))
                     ((ts ...) (generate-temporaries #'(RetId ...)))
                     ((null ...) (map (lambda (x) #'()) #'(RetId ...))))
         #'(let ((fun F))
            (letrec ((g 
                       (lambda (ThreadId ... ls)
                         (if (null? ls)
                             (values ThreadId ... null ...)
                             (call-with-values
                                 (lambda () (g ThreadId ... (cdr ls)))
                               (lambda (ThreadId ... ts ...)
                                 (call-with-values
                                     (lambda () (fun ThreadId ... (car ls)))
                                   (lambda (ThreadId ... t ...)
                                     (values ThreadId ... (cons t ts) ...)))))))))
              g)))))))

;;; ------------------------------

(define-syntax my-backquote
  (lambda (x)
    (define-syntax with-values
      (syntax-rules ()
        ((_ P C) (call-with-values (lambda () P) C))))
    (define-syntax syntax-lambda
      (lambda (x)
        (syntax-case x ()
          ((_ (Pat ...) Body0 Body ...)
           (with-syntax (((X ...) (generate-temporaries #'(Pat ...))))
             #'(lambda (X ...)
                 (with-syntax ((Pat X) ...)
                   Body0 Body ...)))))))
    (define-syntax with-temp
      (syntax-rules ()
        ((_ V Body0 Body ...)
         (with-syntax (((V) (generate-temporaries '(x))))
           Body0 Body ...))))
    (define-syntax with-temps
      (syntax-rules ()
        ((_ (V ...) (Exp ...) Body0 Body ...)
         (with-syntax (((V ...) (generate-temporaries #'(Exp ...))))
           Body0 Body ...))))
    (define destruct
      (lambda (Orig x depth)
        (syntax-case x (unquote unquote-splicing)
          ;; inner quasiquote
          ((quasiquote Exp)
           ;; note scary hygiene bug here.  Same bug as with elipsis.
           (eq? (syntax-object->datum #'quasiquote) 'quasiquote)
           (with-values (destruct Orig #'Exp (add1 depth))
             (syntax-lambda (Builder Vars Exps)
               (if (null? #'Vars)
                   (values #''(quasiquote Exp) '() '())
                   (values #'(list 'quasiquote Builder) #'Vars #'Exps)))))
          ;; unquote
          ((unquote Exp)
           (zero? depth)
           (with-temp X
             (values #'X (list #'X) (list #'Exp))))
          ((unquote Exp)
           (with-values (destruct Orig #'Exp (sub1 depth))
             (syntax-lambda (Builder Vars Exps)
               (if (null? #'Vars)
                   (values #''(unquote Exp) '() '())
                   (values #'(list 'unquote Builder) #'Vars #'Exps)))))
          ;; splicing
          (((unquote-splicing Exp))
           (zero? depth)
           (with-temp X
             (values #'X (list #'X) (list #'Exp))))
          (((unquote-splicing Exp ...))
           (zero? depth)
           (with-temps (X ...) (Exp ...)
             (values #'(append X ...) #'(X ...) #'(Exp ...))))
          (((unquote-splicing Exp ...) . Rest)
           (zero? depth)
           (with-values (destruct Orig #'Rest depth)
             (syntax-lambda (Builder Vars Exps)
               (with-temps (X ...) (Exp ...)
                 (if (null? #'Vars)
                     (values #'(append X ... 'Rest)
                             #'(X ...) #'(Exp ...))
                     (values #'(append X ... Builder)
                             #'(X ... . Vars) #'(Exp ... . Exps)))))))
          ((unquote-splicing Exp ...)
           (with-values (destruct Orig #'(Exp ...) (sub1 depth))
             (syntax-lambda (Builder Vars Exps)
               (if (null? #'Vars)
                   (values #''(unquote-splicing Exp ...) '() '())
                   (values #'(cons 'unquote-splicing Builder)
                           #'Vars #'Exps)))))
          ;; dots
          (((unquote Exp) Dots)
           (and (zero? depth) (eq? (syntax-object->datum #'Dots) '...))
           (with-temp X
             (values #'X (list #'X) (list #'Exp))))
          (((unquote Exp) Dots . Rest)
           (and (zero? depth) (eq? (syntax-object->datum #'Dots) '...))
           (with-values (destruct Orig #'Rest depth)
             (syntax-lambda (RestBuilder RestVars RestExps)
               (with-syntax ((TailExp
                               (if (null? #'RestVars)
                                   #''Rest
                                   #'RestBuilder)))
                 (with-temp X
                   (values #'(append X TailExp)
                           (cons #'X #'RestVars)
                           (cons #'Exp #'RestExps)))))))
          ((Exp Dots . Rest)
           (and (zero? depth) (eq? (syntax-object->datum #'Dots) '...))
           (with-values (destruct Orig #'Exp depth)
             (syntax-lambda (ExpBuilder (ExpVar ...) (ExpExp ...))
               (if (null? #'(ExpVar ...))
                   (syntax-error Orig "Bad elipsis")
                   (with-values (destruct Orig #'Rest depth)
                     (syntax-lambda (RestBuilder RestVars RestExps)
                       (with-syntax ((TailExp
                                       (if (null? #'RestVars)
                                           #''Rest
                                           #'RestBuilder))
                                     (Orig Orig))
                         (values #'(let f ((ExpVar ExpVar) ...)
                                     (if (and (pair? ExpVar) ...)
                                         (cons
                                           (let ((ExpVar (car ExpVar)) ...)
                                             ExpBuilder)
                                           (f (cdr ExpVar) ...))
                                         (if (and (null? ExpVar) ...)
                                             TailExp
                                             (error 'unquote
                                               "Mismatched lists in ~s"
                                               Orig))))
                                 (append #'(ExpVar ...) #'RestVars)
                                 (append #'(ExpExp ...) #'RestExps)))))))))
	  ;; Vectors
	  (#(X ...)
	   (with-values (destruct Orig #'(X ...) depth)
	     (syntax-lambda (LsBuilder LsVars LsExps)
	       (values #'(list->vector LsBuilder) #'LsVars #'LsExps))))
          ;; random stuff
          ((Hd . Tl)
           (with-values (destruct Orig #'Hd depth)
             (syntax-lambda (HdBuilder HdVars HdExps)
               (with-values (destruct Orig #'Tl depth)
                 (syntax-lambda (TlBuilder TlVars TlExps)
                   (with-syntax ((Hd (if (null? #'HdVars)
                                         #''Hd
                                         #'HdBuilder))
                                 (Tl (if (null? #'TlVars)
                                         #''Tl
                                         #'TlBuilder)))
                     (values #'(cons Hd Tl)
                             (append #'HdVars #'TlVars)
                             (append #'HdExps #'TlExps))))))))
          (OtherThing
            (values #''OtherThing '() '())))))
    ;; macro begins
    (syntax-case x ()
      ((_ Datum)
       (with-values (destruct #'(quasiquote Datum) #'Datum 0)
         (syntax-lambda (Builder (Var ...) (Exp ...))
           (if (null? #'(Var ...))
               #''Datum
               #'(let ((Var Exp) ...)
                   Builder))))))))

(define-syntax extend-backquote
  (lambda (x)
    (syntax-case x ()
      ((_ Template Exp ...)
       (with-syntax ((quasiquote
                       (datum->syntax-object #'Template 'quasiquote)))
         #'(let-syntax ((quasiquote
                          (lambda (x)
                            (syntax-case x ()
                              ((_ Foo) #'(my-backquote Foo))))))
             Exp ...))))))

;;; ------------------------------

(define-syntax with-values
  (syntax-rules ()
    ((_ P C) (call-with-values (lambda () P) C))))

(define-syntax letcc
  (syntax-rules ()
    ((_ V B0 B ...) (call/cc (lambda (V) B0 B ...)))))

(define classify-list
  (lambda (ls)
    (cond
      ((null? ls) 'proper)
      ((not (pair? ls)) 'improper)
      (else
        (let f ((tortoise ls) (hare (cdr ls)))
          (cond
            ((eq? tortoise hare) 'infinite)
            ((null? hare) 'proper)
            ((not (pair? hare)) 'improper)
            (else
              (let ((hare (cdr hare)))
                (cond
                  ((null? hare) 'proper)
                  ((not (pair? hare)) 'improper)
                  (else (f (cdr ls) (cdr hare))))))))))))

(define ilist-copy-flat
  (lambda (ils)
    (let f ((tortoise ils) (hare (cdr ils)))
      (if (eq? tortoise hare)
          (list (car tortoise))
          (cons (car tortoise) (f (cdr tortoise) (cddr hare)))))))

(define sexp-dispatch
  (lambda (obj pat);; #f or list of vars
    (letcc escape
      (let f ((pat pat) (obj obj) (vals '()))
        (cond
          ((eq? pat 'any)
           (cons obj vals))
          ((eq? pat 'each-any)
           ;; handle infinities
           (case (classify-list obj)
             ((proper infinite) (cons obj vals))
             ((improper) (escape #f))))
          ((pair? pat)
             (if (pair? obj)
                 (f (car pat) (car obj) (f (cdr pat) (cdr obj) vals))
                 (escape #f)))
          ((vector? pat)
           (case (vector-ref pat 0)
             ((atom)
              (if (eqv? obj (vector-ref pat 1))
                  vals
                  (escape #f)))
             ((vector)
              (if (vector? obj)
                  (f (vector-ref pat 1) (vector->list obj) vals)
                  (escape #f)))
             ((each)
              ;; if infinite, copy the list as flat, then do the matching,
              ;; then do some set-cdrs. 
              (case (classify-list obj)
                ((improper) (escape #f))
                ((infinite)
                 (let ((each-vals (f pat (ilist-copy-flat obj) '())))
                   (for-each (lambda (x) (set-cdr! (last-pair x) x))
                             each-vals)
                   (append each-vals vals)))
                ((proper)
                 (append
                  (let g ((obj obj))
                    (if (null? obj)
                        (make-list (vector-ref pat 2) '())
                        (map cons 
                             (f (vector-ref pat 1) (car obj) '())
                             (g (cdr obj)))))
                  vals))))
             ((tail-each)
              (when (eq? (classify-list obj) 'infinite) (escape #f))
              (with-values
                  (let g ((obj obj))
                    ;; in-tail?, vals, revtail-left/ls
                    (cond
                      ((pair? obj)
                       (with-values (g (cdr obj))
                         (lambda (in-tail? vals tail-left/ls)
                           (if in-tail?
                               (if (null? tail-left/ls)
                                   (values #f vals (list (car obj)))
                                   (values #t (f (car tail-left/ls)
                                                 (car obj)
                                                 vals)
                                           (cdr tail-left/ls)))
                               (values #f vals
                                       (cons (car obj) tail-left/ls))))))
                      (else
                        (values #t
                                (f (vector-ref pat 4) obj '())
                                (vector-ref pat 3)))))
                (lambda (in-tail? vals tail-left/ls)
                  (if in-tail?
                      (if (null? tail-left/ls)
                          (append (make-list (vector-ref pat 2) '())
                                  vals)
                          (escape #f))
                      (f (vector-ref pat 1) tail-left/ls vals)))))))
          (else
            (if (eqv? obj pat)
                vals
                (escape #f))))))))
;)


#!eof

;;; examples of passing along threaded information.

;;; Try (collect-symbols '(if (x y 'a 'c zz) 'b 'c))
;;; Note that it commonizes the reference to c. 

(define collect-symbols
  (lambda (exp)
    (with-values (collect-symbols-help exp)
      (lambda (symbol-decls exp)
        (match symbol-decls
          (((,symbol-name . ,symbol-var) ...)
           `(let ((,symbol-var (quote ,symbol-name)) ...) ,exp)))))))
(define collect-symbols-help
  (lambda (exp)
    (let ((symbol-env '()))
      (match+ (symbol-env) exp
        (,x
          (guard (symbol? x))
          (values symbol-env x))
        ((quote ,x)
         (guard (symbol? x))
         (let ((pair/false (assq x symbol-env)))
           (if pair/false
               (values symbol-env (cdr pair/false))
               (let ((v (gensym)))
                 (values (cons (cons x v) symbol-env)
                         v)))))
        ((quote ,x)
         (values symbol-env `(quote ,x)))
        ((if ,[t] ,[c] ,[a])
         (values symbol-env `(if ,t ,c ,a)))
        ((,[op] ,[arg] ...)
         (values symbol-env `(,op ,arg ...)))))))

;;; the grammar for this one is just if-exprs and everything else

(define collect-leaves
  (lambda (exp acc)
    (match+ (acc) exp
      ((if ,[] ,[] ,[])
       acc)
      ((,[] ,[] ...)
       acc)
      (,x
        (cons x acc)))))

;; here's something that takes apart quoted stuff. 

(define destruct
  (lambda (datum)
    (match datum
      (() `'())
      ((,[X] . ,[Y])`(cons ,X ,Y))
      (#(,[X] ...) `(vector ,X ...))
      (,thing
	(guard (symbol? thing))
	`',thing)
      (,thing
	thing))))


;; CHANGELOG

;; [24 Feb 2000]
;; Matcher now handles vector patterns.  Quasiquote also handles
;; vector patterns, but does NOT do the csv6.2 optimization of
;; `#(a 1 ,(+ 3 4) x y) ==> (vector 'a 1 (+ 3 4) 'x 'y).
;; Also fixed bug in (P ... . P) matching code. 

;; [23 Feb 2000]
;; KSM fixed bug in unquote-splicing inside quasiquote.

;; [10 Feb 2000]
;; New forms match+ and trace-match+ thread arguments right-to-left.
;; The pattern (P ... . P) now works the way you might expect.
;; Infinite lists are now properly matched (and not matched).
;; Removed the @ pattern.
;; Internal: No longer converting into syntax-case. 

;; [6 Feb 2000]
;; Added expansion-time error message for referring to cata variable
;; in a guard.

;; [4 Feb 2000]
;; Fixed backquote so it can handle nested backquote (oops).
;; Double-backquoted elipses are neutralized just as double-backquoted
;; unquotes are.  So:
;;   `(a ,'(1 2 3) ... b)    =eval=> (a 1 2 3 b)
;;   ``(a ,'(1 2 3) ... b)   =eval=> `(a ,'(1 2 3) ... b)
;;   ``(a ,(,(1 2 3) ...) b) =eval=> `(a ,(1 2 3) b)
;; Added support for
;;   `((unquote-splicing x y z) b) =expand==> (append x y z (list 'b))

;; [1 Feb 2000]
;; Fixed a bug involving forgetting to quote stuff in the revised backquote.
;; Recognized unquote-splicing and signalled errors in the appropriate places.
;; Added support for deep elipses in backquote.
;; Rewrote backquote so it does the rebuilding directly instead of
;; expanding into Chez's backquote. 

;; [31 Jan 2000]
;; Kent Dybvig fixed template bug.

;; [31 Jan 2000]
;; Added the trace-match form, and made guards contain
;; an explicit and expression:
;;    (guard E ...) ==> (guard (and E ...))

;; [26 Jan 2000]
;; Inside the clauses of match expressions, the following
;; transformation is performed inside backquote expressions:
;;    ,v ...      ==> ,@v
;;    (,v ,w) ... ==> ,@(map list v w)
;;    etc.
