package sisc.compiler;

import java.util.*;
import sisc.data.*;
import sisc.io.*;
import sisc.env.*;
import sisc.reader.*;

/**
 * Analyzer - Scans an s-expression, determining the number
 * of times variables are referenced and set!'ed, and annotating
 * closures' and letrecs' lexical bindings.
 *
 * (lambda formals body) => (lambda #t formals (lexicals ...) body)
 * (letrec bindings body) => (letrec #t bindings (lexicals ...) body)
 */
public abstract class Analyzer extends CompilerConstants {

    protected static final Integer ONE=new Integer(1);
    static final Symbol ANALYZED=Symbol.get("analyzed");

    protected static void inc(Map e, Symbol s) {
        Integer i=(Integer)e.get(s);
        if (i==null) 
            e.put(s, ONE);
        else 
            e.put(s, new Integer(i.intValue()+1));
    }

    protected static boolean nonZero(Object s, Map m) {
        Integer i=(Integer)m.get(s);
        return (i!=null && i.intValue()!=0);
    }

    public static Expression analyze(Expression v, SymbolicEnvironment env) {
        ARecord ar=new ARecord((Value)v);
        analyze(v, ar, env, EMPTYLIST);
        return ar.asExpression();
    }

    protected static Pair analyze(Expression v, ARecord ar, 
                                  SymbolicEnvironment env, Pair lxs) {
        if (v instanceof Symbol) {
            Symbol sym=(Symbol)v;
            inc(ar.references, sym);
            return list(sym);
        } else if (v instanceof Pair && v!=EMPTYLIST) {
            return analyzeApp((Pair)v, ar, env, lxs);
        } else {
            return EMPTYLIST;
        }
    }

    protected static Pair union(Pair p1, Pair p2) {
        Pair rv=EMPTYLIST;
        Pair tail=null;
        while (p1 != EMPTYLIST) {
            if (!truth(memq(p1.car, p2))) {
                rv=new Pair(p1.car, rv);
                if (tail==null) tail=rv;
            }
            p1=(Pair)p1.cdr;
        }
        if (tail != null) {
            tail.cdr=p2;
            return rv;
        } else return p2;
    }

    public static Pair analyzeApp(Pair expr, ARecord ar, 
                                  SymbolicEnvironment env, Pair lxs) {

        Pair rv=EMPTYLIST;
        Value oper=expr.car;
        int eType=Compiler.getExpType(env, oper);
        expr=(Pair)expr.cdr;

        switch (eType) {
        case QUOTE:
            return EMPTYLIST;
        case PROGRAM:
            return mapcar((Pair)expr.car);
        case LAMBDA:
            boolean alreadyAnalyzed=(expr.car==TRUE);

            if (alreadyAnalyzed)
                expr=(Pair)expr.cdr;

            Pair locals=EMPTYLIST;
            Value formals=expr.car;

            if (formals instanceof Symbol) {
                locals=list(formals);
            } else if (formals instanceof Pair) {
                Value p=formals;
                while (p!=EMPTYLIST && p instanceof Pair) {
                    Pair o=(Pair)p;
                    locals=new Pair(o.car, locals);
                    p=o.cdr;
                }
                if (p instanceof Symbol) {
                    locals=new Pair(p, locals);
                }
            }
            if (alreadyAnalyzed)
                expr=(Pair)expr.cdr;
            Pair refs=analyze(((Pair)(expr.cdr)).car, ar, env, 
                              union(locals, lxs));
            Pair locallyFrees=notIn(refs, locals);
            Pair frees=notIn(locallyFrees, lxs);
            Pair setvars=buildRefs(locals, ar.sets); 
            Pair localRefs=buildRefs(locals, ar.references);
            addAll(frees, ar.frees);
            frees=buildRefs(frees, ar.references);
            Pair lexicals=in(lxs, refs);
            if (!alreadyAnalyzed) {
                expr.cdr=new Pair(expr.car, new Pair(lexicals, expr.cdr));
                expr.car=TRUE;
            } 
            return locallyFrees;
        case LETREC: 
            alreadyAnalyzed=(expr.car==TRUE);
            if (alreadyAnalyzed)
                expr=(Pair)expr.cdr;

            Pair letrecRemainder=expr;

            Pair tmpp=(Pair)letrecRemainder.car;

            refs=locals=EMPTYLIST;
            while (tmpp != EMPTYLIST) {
                Pair bp=(Pair)tmpp.car;
                locals=new Pair(bp.car, locals);
                inc(ar.sets, (Symbol)bp.car);
                tmpp=(Pair)tmpp.cdr;
            }
            Pair newLxs=union(locals, lxs);
            tmpp=(Pair)letrecRemainder.car;
            while (tmpp != EMPTYLIST) {
                Pair bp=(Pair)tmpp.car;
                refs=union(analyze(((Pair)bp.cdr).car, ar, env, newLxs), refs);
                tmpp=(Pair)tmpp.cdr;                
            }
            expr=(Pair)expr.cdr;

            if (alreadyAnalyzed) 
                expr=(Pair)expr.cdr; 

            refs=union(analyze(expr.car, ar, env, newLxs), refs);
            locallyFrees=notIn(refs, locals);
            frees=notIn(locallyFrees, lxs);
            addAll(frees, ar.frees);
            lexicals=in(lxs, refs);
            setvars=buildRefs(locals, ar.sets); 
            localRefs=buildRefs(locals, ar.references);
            frees=buildRefs(frees, ar.references);
            if (!alreadyAnalyzed) {
                letrecRemainder.cdr=
                    new Pair(letrecRemainder.car, 
                             new Pair(lexicals, letrecRemainder.cdr));
                letrecRemainder.car=TRUE;
            }
            return locallyFrees;
        case SET:
            Symbol sym=null;
            if (expr.car instanceof Symbol) {
                sym=(Symbol)expr.car;
                inc(ar.references, sym);
                inc(ar.sets, sym);
            }
            expr=(Pair)expr.cdr;
            return new Pair(sym, analyze(expr.car, ar, env, lxs));
        case DEFINE:
            expr=(Pair)expr.cdr;
        case MAKEANNOTATION:
            return analyze(expr.car, ar, env, lxs);
        case APPLICATION:
            rv=union(rv, analyze(oper, ar, env, lxs));
        default:
            if (expr != EMPTYLIST) 
                do {
                    rv=union(analyze(expr.car, ar, env, lxs), rv);
                    expr=(Pair)expr.cdr;
                } while (expr != EMPTYLIST && expr instanceof Pair);
        }
        return rv;
    }

    protected static void addAll(Pair p, Set s) {
        while (p!=EMPTYLIST) {
            s.add(p.car);
            p=(Pair)p.cdr;
        }
    }
    
    protected static Pair buildRefs(Pair vals, Map o) {
        Pair rv=EMPTYLIST;
        while (vals!=EMPTYLIST) {
            Integer i=(Integer)o.get(vals.car);
            if (i!=null && i.intValue()>0)
                rv=new Pair(new Pair(vals.car, Quantity.valueOf(i.intValue())),
                            rv);
            vals=(Pair)vals.cdr;
        }
        return rv;
    }

    protected static Pair in(Pair vals, Pair s) {
        Pair rv=EMPTYLIST;
        while (vals!=EMPTYLIST) {
            if (truth(memq(vals.car, s))) 
                rv=new Pair(vals.car,rv);
            vals=(Pair)vals.cdr;
        }
        return reverse(rv);
    }

    protected static Pair notIn(Pair vals, Pair s) {
        Pair rv=EMPTYLIST;
        while (vals!=EMPTYLIST) {
            if (!truth(memq(vals.car, s))) 
                rv=new Pair(vals.car,rv);
            vals=(Pair)vals.cdr;
        }
        return rv;
    }

    public static void main(String[] args) throws Exception {
        Parser p=new Parser(new Lexer());
        InputPort in=new StreamInputPort(System.in);
        SymbolicEnvironment env=new MemorySymEnv();
        Compiler.addSpecialForms(env);
        Expression v;
        while ((v=p.nextExpression(in)) != EOF) {
            Expression vo=Analyzer.analyze(v,env);
            System.out.println(vo);
        }
    }
}




/*
 * The contents of this file are subject to the Mozilla Public
 * License Version 1.1 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy of
 * the License at http://www.mozilla.org/MPL/
 * 
 * Software distributed under the License is distributed on an "AS
 * IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * rights and limitations under the License.
 * 
 * The Original Code is the Second Interpreter of Scheme Code (SISC).
 * 
 * The Initial Developer of the Original Code is Scott G. Miller.
 * Portions created by Scott G. Miller are Copyright (C) 2000-2001
 * Scott G. Miller.  All Rights Reserved.
 * 
 * Contributor(s):
 * Matthias Radestock 
 * 
 * Alternatively, the contents of this file may be used under the
 * terms of the GNU General Public License Version 2 or later (the
 * "GPL"), in which case the provisions of the GPL are applicable 
 * instead of those above.  If you wish to allow use of your 
 * version of this file only under the terms of the GPL and not to
 * allow others to use your version of this file under the MPL,
 * indicate your decision by deleting the provisions above and
 * replace them with the notice and other provisions required by
 * the GPL.  If you do not delete the provisions above, a recipient
 * may use your version of this file under either the MPL or the
 * GPL.
 */
