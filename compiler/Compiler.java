package sisc.compiler;

import java.util.*;
import java.io.*;
import sisc.data.*;
import sisc.exprs.*;
import sisc.interpreter.*;
import sisc.io.ValueWriter;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.env.SymbolicEnvironment;
import sisc.util.Util;

/**
 * Compiler - Compiles regularized Scheme s-expressions into an
 * AST of SISC Expression objects.
 */
public class Compiler extends Util {

    static void extendenv(SymbolicEnvironment env, String s, int i) {
        Symbol name=Symbol.get(s);
        env.define(name, new Syntax(i));
    }

    static final int
	APP=-1, LAMBDA = 0, _IF=1, BEGIN=2, QUOTE=3, SET=4, DEFINE=5,
	MAKEANNOTATION=6, LETREC=7,
	
	TAIL=1, COMMAND=2, PREDICATE=4, REALTAIL=8;

    public Compiler() {}

    public static void addSpecialForms(SymbolicEnvironment menv) {
        extendenv(menv,"lambda", LAMBDA);
        extendenv(menv,"letrec", LETREC);
        extendenv(menv,"if", _IF);
        extendenv(menv,"begin", BEGIN);
        extendenv(menv,"quote", QUOTE);
        extendenv(menv,"set!", SET);
        extendenv(menv,"define", DEFINE);
        extendenv(menv,"compile-in-annotation", MAKEANNOTATION);
    }

    public Expression compile(Interpreter r, Expression v, ReferenceEnv rt,
                              int context, SymbolicEnvironment env, 
                              Pair an)
    throws ContinuationException {
        if (v==EMPTYLIST) {
	    //we evaluate () to the empty list, which is an "ignorable
	    //error", according to R5RS. Note that presently we never
	    //actually end up in this code since the macro expander
	    //expands () to '().
	    return EMPTYLIST;
	} else if (v instanceof Pair) {
            Pair expr=(Pair)v;
            return compileApp(r,expr,rt,context,env,an);
        } else if (v instanceof Symbol) {
            Symbol sym=(Symbol)v;

            return rt.createReference(sym, env);
        }
        else return v;
    }

    public Expression compile(Interpreter r, Expression v,
                              SymbolicEnvironment env)
    throws ContinuationException {
        Expression e= compile(r, v, new ReferenceEnv(), TAIL, env, null);
        return e;
    }

    final int getExpType(SymbolicEnvironment env, Symbol s) {
        Object h=env.lookup(s);
        if (h == null) return APP;
        if (h instanceof Syntax)
            return ((Syntax)h).synid;
        return APP;
    }

    void setAnnotations(Expression e, Pair p) {
        while (p!=EMPTYLIST) {
            Pair kv=(Pair)p.car;
            e.setAnnotation(symbol(kv.car), kv.cdr);
            p=(Pair)p.cdr;
        }
    }

    boolean isImmediate(Expression e) {
        return (e instanceof Immediate) ||
            ((e instanceof AnnotatedExpr) &&
             (((AnnotatedExpr)e).expr instanceof Immediate));
    }

    Expression makeEvalExp(Expression pre, Expression post) {
        return new EvalExp(pre, post, isImmediate(pre));
    }

    public Expression compileApp(Interpreter r,
                                 Pair expr, ReferenceEnv rt,
                                 int context, SymbolicEnvironment env,
                                 Pair an)
    throws ContinuationException {

        Expression tmp, rv;

        if (expr.car instanceof Symbol) {
            Symbol s=(Symbol)expr.car;
            int t=getExpType(env, s);
            expr=(Pair)expr.cdr;

            switch (t) {
            case QUOTE:
                rv=expr.car;
                break;
            case LAMBDA:
                boolean infArity=false;
                Symbol[] formals=null;

                if (expr.car instanceof Pair) {
                    formals=argsToSymbols((Pair)expr.car);
                    Pair tmpp=(Pair)expr.car;
                    while (tmpp.cdr instanceof Pair
                            && tmpp.cdr!=EMPTYLIST)
                        tmpp=(Pair)tmpp.cdr;
                    infArity=(tmpp.cdr!=EMPTYLIST);
                } else {
                    infArity=true;
                    formals=new Symbol[] {(Symbol)expr.car};
                }

                
                expr=(Pair)expr.cdr;
                tmp=compile(r, expr.car, new ReferenceEnv(formals, rt), 
                            TAIL | LAMBDA | REALTAIL, env, null);
                rv=new LambdaExp(formals.length, tmp, infArity);
                break;
            case LETREC:
                Pair tmpp=(Pair)expr.car;
                
                Vector formv=new Vector();
                Vector expv=new Vector();

                while (tmpp != EMPTYLIST) {
                    Pair bp=(Pair)tmpp.car;
                    formv.add(bp.car);
                    expv.add(((Pair)bp.cdr).car);
                    tmpp=(Pair)tmpp.cdr;
                }
                
                formals=new Symbol[formv.size()];
                Expression[] rhses=new Expression[expv.size()];
                formv.copyInto(formals);
                expv.copyInto(rhses);

                expr=(Pair)expr.cdr;

                rv=compileLetrec(r, formals, rhses, expr, 
                                 rt, env);
                break;
            case _IF:
                tmp=compile(r, expr.car, rt, PREDICATE, env, null);
                expr=(Pair)expr.cdr;

                Expression conseq=compile(r, expr.car, rt, TAIL | context,
                                          env, null);
                expr=(Pair)expr.cdr;
                Expression altern=compile(r, expr.car, rt, TAIL | context,
                                          env, null);
                rv = new IfEval(conseq, altern);
                rv.annotations = tmp.annotations;
                rv = makeEvalExp(tmp, rv);
                break;
            case BEGIN:
                rv=compileBegin(r, pairToExpVect(expr), context, rt, env);
                break;
            case SET:
                tmp=compile(r, expr.car, rt, 0, env, null);
                expr=(Pair)expr.cdr;
                Expression rhs=compile(r, expr.car, rt, 0, env, null);
                if (tmp instanceof LexicalReferenceExp) {
                    LexicalReferenceExp lre=(LexicalReferenceExp)tmp;

                    rv=new LexicalSetEval(lre.depth, lre.pos);
                } else if (tmp instanceof FreeReferenceExp) {
                    FreeReferenceExp fre=(FreeReferenceExp)tmp;
                    
                    rv=new FreeSetEval(fre.sym, env);
                } else {
                    error(r, liMessage(SISCB, "setlhsnotsymbol"));
                    return null;
                }
                rv.annotations = rhs.annotations;
                rv= makeEvalExp(rhs, rv);
                break;
            case DEFINE:
                Symbol lhs=(Symbol)expr.car;
                expr=(Pair)expr.cdr;
                rhs = compile(r, expr.car, rt, 0, env, null);
                rv = new DefineEval(lhs, env);
                rv.annotations = rhs.annotations;
                rv = makeEvalExp(rhs, rv);
                break;
            case MAKEANNOTATION:
                Value aexpr=expr.car;
                expr=(Pair)expr.cdr;
                Pair annot=null;
                if (expr.car instanceof Pair)
                    annot=pair(expr.car);
                else
                    annot=list(new Pair(OTHER, expr.car));
                rv=compile(r, aexpr, rt, context, env, annot);
                an=null;
                break;
            default:
                Expression[] exps=pairToExpressions(expr);
                compileExpressions(r, exps, rt, 0, env);
                rv = application(compile(r,s,rt,0,env, null), 
                                 exps, context, an);
            }
        } else {
            Expression[] exps=pairToExpressions((Pair)expr.cdr);
            compileExpressions(r, exps, rt, 0, env);
            rv = application(compile(r, expr.car, rt, 0, env, null), 
                             exps, context, an);
        }
        if (an!=null)
            setAnnotations(rv, an);
        return rv;
    }

    public Expression compileLetrec(Interpreter r,
                                    Symbol[] formals, Expression[] rands,
                                    Pair body, ReferenceEnv rt, 
                                    SymbolicEnvironment env) 
        throws ContinuationException {
        ReferenceEnv nrt=new ReferenceEnv(formals, rt);
        compileExpressions(r, rands, nrt, 0, env);
        boolean allImmediate=true;
        Expression nxp=new LetrecEval(compile(r, body.car, nrt, 
                                              TAIL | LAMBDA, env, null));
        Expression lastRand = VOID;
        for (int i= 0; i<rands.length; i++) {
            if (!isImmediate(rands[i])) {
                nxp.annotations = lastRand.annotations;
                nxp = new FillRibExp(lastRand, i, nxp, allImmediate);
                lastRand = rands[i];
                rands[i] = null;
                allImmediate=false;
            }
        }
        if (lastRand.annotations != null)
            nxp.annotations = lastRand.annotations;
        return new LetrecExp(lastRand, rands, nxp, allImmediate);
    }

    public final Expression application(Expression rator, Expression rands[], 
                                        int context, Pair annotation) {
        if (rator instanceof Value && 
	    !(rator instanceof Procedure) &&
	    !(rator instanceof AnnotatedExpr))

            System.err.println(warn("nonprocappdetected",((Value)rator).synopsis()));
        Expression nxp = new AppEval();
        if (annotation!=null)
            setAnnotations(nxp, annotation);
        Expression lastRand = rator;
        boolean allImmediate=isImmediate(rator);
        for (int i= 0; i<rands.length; i++) {
            if (!isImmediate(rands[i])) {
                nxp.annotations = lastRand.annotations;
                nxp = new FillRibExp(lastRand, i, nxp, allImmediate);
                lastRand = rands[i];
                rands[i] = null;
                allImmediate=false;
            }
        }
        if (lastRand.annotations != null)
            nxp.annotations = lastRand.annotations;
        return new AppExp(lastRand, rands, nxp, allImmediate);
    }

    void compileExpressions(Interpreter r, Expression exprs[], 
                               ReferenceEnv rt,
                               int context, SymbolicEnvironment env)
        throws ContinuationException {
        for (int i=exprs.length-1; i>=0; i--) 
            exprs[i]=compile(r, exprs[i], rt, context, env, null);
    }

    Expression compileBegin(Interpreter r, Vector v, int context,
                            ReferenceEnv rt, SymbolicEnvironment env)
    throws ContinuationException {        
        Expression last=compile(r, (Expression)v.lastElement(), rt,
                                TAIL | context, env, null);
        //if (v.size()==1) return last;
        
        Expression be=last;
        for (int i=v.size()-2; i>=0; i--) {
            Expression e=compile(r, (Expression)v.elementAt(i),
                                 rt, COMMAND, env, null);
            be.annotations = e.annotations;
            be = makeEvalExp(e, be);
        }
        return be;
    }

    public static class Syntax extends NamedValue {
        int synid;

        public Syntax(int synid) {
            this.synid=synid;
        }

        public void eval(Interpreter r) throws ContinuationException {
            error(r, liMessage(SISCB, "invalidsyncontext", name.toString()));
        }

        public void display(ValueWriter w) throws IOException {
            w.append("#!").append(Integer.toString(synid));
        }

        public Syntax() {}

        public void deserialize(Deserializer s) throws IOException {
            super.deserialize(s);
            synid=s.readInt();
        }

        public void serialize(Serializer s) throws IOException {
            super.serialize(s);
            s.writeInt(synid);
        }
    }

    static class ReferenceEnv {
        ReferenceEnv parent;
        Hashtable ref=new Hashtable(5);


        public ReferenceEnv() {}

        public ReferenceEnv(Symbol[] s, ReferenceEnv parent) {
            this.parent=parent;
            for (int i=0; i<s.length; i++) {
                ref.put(s[i], new Integer(i));
            }
        }

        public Expression createReference(Symbol s, SymbolicEnvironment env) {
            int lev=-1;
            ReferenceEnv ctx=this;
            Integer r=null;
            while (r==null && ctx!=null) {
                r=(Integer)ctx.ref.get(s);
                ctx=ctx.parent;
                lev++;
            }

            if (r==null)
                return new FreeReferenceExp(s, env);
            else
                return new LexicalReferenceExp(lev, r.intValue());
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
