package sisc.compiler;

import java.util.*;
import sisc.data.*;
import sisc.exprs.*;
import sisc.exprs.fp.*;
import sisc.env.SymbolicEnvironment;
import sisc.env.*;
import sisc.nativefun.FixableProcedure;
import sisc.interpreter.AppContext;
import sisc.interpreter.Context;
import sisc.interpreter.ContinuationException;
import sisc.interpreter.Interpreter;
import sisc.io.*;
import sisc.reader.*;

/**
 * Compiler - Compiles regularized Scheme s-expressions into an
 * AST of SISC Expression objects.
 *
 * From v1.9 on, the Compiler expects analyzed s-expressions which 
 * have been annotated with various information about the code
 * including free variables, lexically referenced variables, etc.  
 * The default compile() entrypoint will call the Analyzer implicitly
 * unless instructed not to, so one may still pass fully-expanded but
 * unanalyzed Scheme code.
 *
 * The format for the annotations may change in the future, but is currently:
 * 
 * (program (referenced-var-list ...) (set-var-list ...) (free-var-list ...) 
 *          
 *  <s-expression>)
 * 
 * TODO:  Make output a valid Scheme program by moving #t into the body
 * (#%lambda #t <formals> (lexically-referenced-vars ...) <body>)
 * (#%letrec #t <bindings (lexically-referenced-vars ...) <body>)
 */
public class Compiler extends CompilerConstants {
        
    public Compiler() {}

    public static void addSpecialForms(SymbolicEnvironment menv) {
    	for (Iterator i=SYNTACTIC_TOKENS.keySet().iterator(); i.hasNext();) {
            Object ns=i.next();
            if (ns instanceof String) {
        		String name=(String)ns;
		      	extendenv(menv,name,(Syntax)SYNTACTIC_TOKENS.get(name));
            }
    	}
    }

    protected Expression compile(Interpreter r, Expression v, Pair sets,
                              ReferenceFactory rf, 
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
            return compileApp(r,expr,sets,rf,context,env,an);
        } else if (v instanceof Symbol) {
            Symbol sym=(Symbol)v;

            return rf.createReference(sym, sets, env);
        }
        else return v;
    }

    protected Expression compile(Interpreter r, Expression v, Pair sets,
                                 SymbolicEnvironment env) 
        throws ContinuationException {

        return compile(r, v, sets, new ReferenceFactory(),
                       REALTAIL | TAIL, env, null);
    }

    public Expression compile(Interpreter r, Expression v,
                              SymbolicEnvironment env) 
        throws ContinuationException {
        Expression e=compile(r, v, EMPTYLIST, new ReferenceFactory(),
                             REALTAIL | TAIL, env, null);
        return e;
    }

    public static final int getExpType(SymbolicEnvironment env, Value s) {
    	if (s instanceof Syntax) {
            return ((Syntax)s).synid;
        } else if (s instanceof Symbol){
            Object h = env.lookup((Symbol)s);
            if (h != null && (h instanceof Syntax))
                return ((Syntax) h).synid;
    	}
        return APPLICATION;
    }

    void addAnnotations(Expression e, Map m) {
        if (m!=null)
            if (e.annotations == null)
                e.annotations = m;
            else 
                e.annotations.putAll(m);
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

    protected int[][] resolveCopies(ReferenceFactory rf, 
                                    Symbol[] lexicals) {
        List locs=new ArrayList(5), lexs=new ArrayList(5);
        for (int i=lexicals.length-1; i>=0; i--) {
            Ref t=rf.fetchRefType(lexicals[i]);
            if (t!=null) {
                if (t.lcl)
                    locs.add(new Integer(t.idx));
                else lexs.add(new Integer(t.idx));
            }
        }
        int rv[][]=new int[2][];
        
        rv[0]=new int[locs.size()];
        rv[1]=new int[lexs.size()];
        for (int i=0; i<locs.size(); i++) {
            rv[0][i]=((Integer)locs.get(i)).intValue();
        }
                                
        for (int i=0; i<lexs.size(); i++) {
            rv[1][i]=((Integer)lexs.get(i)).intValue();
        }
        return rv;
    }

    public int[] findBoxes(Symbol[] formals, Pair sets) {
        ArrayList v=new ArrayList(5);
        for (int i=0; i<formals.length; i++) {
            if (assq(formals[i], sets)!=FALSE)
                v.add(new Integer(i));
        }
        int[] boxes=new int[v.size()];
        for (int i=0; i<boxes.length; i++)
            boxes[i]=((Integer)v.get(i)).intValue();
        return boxes;
    }

    public Expression compileApp(Interpreter r,
                                 Pair expr, Pair sets, ReferenceFactory rf,
                                 int context, SymbolicEnvironment env,
                                 Pair an)
    throws ContinuationException {

        Expression tmp, rv;
        
        Value oper=expr.car;
        int eType=getExpType(env, oper);
        expr=(Pair)expr.cdr;
        
        switch (eType) {
        case QUOTE:
            rv=expr.car;
            break;
        case PROGRAM:
            //References
            expr=(Pair)expr.cdr;
            //Sets
            sets=append((Pair)expr.car, sets);
            expr=(Pair)expr.cdr;
            //Frees
            expr=(Pair)expr.cdr;
            rv=compile(r, expr.car, sets, rf, TAIL | LAMBDA | REALTAIL, 
                       env, null);
            break;
        case FIX:
            FixableProcedure proc=(FixableProcedure)env.lookup(symbol(expr.car));
            expr=(Pair)expr.cdr;            
            Expression[] exps=pairToExpressions(expr);
            compileExpressions(r, exps, sets, rf, 0, env);
            switch(exps.length) {
            case 0: rv=new FixedAppExp_0(proc); break;
            case 1: rv=new FixedAppExp_1(proc,(Immediate)exps[0]); break;
            case 2: rv=new FixedAppExp_2(proc,(Immediate)exps[0],(Immediate)exps[1]); break;
            case 3: rv=new FixedAppExp_3(proc,(Immediate)exps[0],(Immediate)exps[1],(Immediate)exps[2]); break;
            default:
                error(r, "Compiler error: cannot fix procedure of argcount > 3");
                rv=null;
            }
            break;
        case LAMBDA:
        	{
	            boolean infArity=false;
	            // Skip #t
	            expr=(Pair)expr.cdr;
	
	            Symbol[] formals=null;
	            int fcount;
	            Value ftmp=expr.car;
	            if (ftmp instanceof Pair && ftmp != EMPTYLIST) {
	                formals=argsToSymbols((Pair)ftmp);
	                do {
	                    ftmp=((Pair)ftmp).cdr; 
	                } while (ftmp != EMPTYLIST && ftmp instanceof Pair);
	                infArity=ftmp instanceof Symbol;
	            } else if (expr.car instanceof Symbol) {
	                formals=new Symbol[] {(Symbol)expr.car};
	                infArity=true;
	            } else {
	                formals=new Symbol[0];
	            }
	            
	            expr=(Pair)expr.cdr;
	
	            Symbol[] lexicalSyms=argsToSymbols((Pair)expr.car);
	            expr=(Pair)expr.cdr;
	            
	            ReferenceFactory nf=new ReferenceFactory(formals, lexicalSyms);
	
	            tmp=compile(r, expr.car, sets, nf, TAIL | LAMBDA | REALTAIL, 
	                        env, null);
	            int[][] copies=resolveCopies(rf, lexicalSyms);
	            int[] boxes=findBoxes(formals, sets);
	            rv=new LambdaExp(formals.length, 
	                             tmp, infArity, copies[0], copies[1], 
	                             (boxes.length==0 ? null :boxes));
        	}
            break;
        case LETREC:
        	{
	            // Skip the #t marker
	            expr=(Pair)expr.cdr;
	
	            Pair tmpp=(Pair)expr.car;
	
	            Vector formv=new Vector();
	            Vector expv=new Vector();
	            
	            while (tmpp != EMPTYLIST) {
	                Pair bp=(Pair)tmpp.car;
	
	                formv.add(bp.car);
	                expv.add(((Pair)bp.cdr).car);
	                tmpp=(Pair)tmpp.cdr;
	            }
	            
	            Symbol[] formals=new Symbol[formv.size()];
	            Expression[] rhses=new Expression[expv.size()];
	            formv.copyInto(formals);
	            expv.copyInto(rhses);
	
	            expr=(Pair)expr.cdr;
	            Symbol[] lexicalSyms=argsToSymbols((Pair)expr.car);
	            expr=(Pair)expr.cdr;
	            
	            rv=compileLetrec(r, formals, lexicalSyms, rhses, expr.car, 
	                             sets, rf, env, context);
        	}
	        break;
        case _IF:
            tmp=compile(r, expr.car, sets, rf, PREDICATE, env, null);
            expr=(Pair)expr.cdr;
            
            Expression conseq=compile(r, expr.car, sets, rf, TAIL | context,
                                      env, null);
            expr=(Pair)expr.cdr;
            Expression altern=compile(r, expr.car, sets, rf, TAIL | context,
                                      env, null);
            //if (isImmediate(conseq) && isImmediate(altern))
            //rv=new IfEval_imm(conseq, altern);
            //            else 
               rv=new IfEval(conseq, altern);

            rv.annotations = tmp.annotations;
            rv = makeEvalExp(tmp, rv);
            break;
        case BEGIN:
            rv=compileBegin(r, pairToExpressions(expr), context, sets, rf, env);
            break;
        case SET:
            Symbol sym=(Symbol)expr.car;
            tmp=compile(r, sym, sets, rf, 0, env, null);
            expr=(Pair)expr.cdr;
            Expression rhs=compile(r, expr.car, sets, rf, 0, env, null);
            if (tmp instanceof FreeReferenceExp) 
                rv=new FreeSetEval(sym, env);
            else
                rv=new SetboxEval(((UnboxExp)tmp).ref);
            rv.annotations = rhs.annotations;
            rv= makeEvalExp(rhs, rv);
            break;
        case DEFINE:
            Symbol lhs=(Symbol)expr.car;
            expr=(Pair)expr.cdr;
            rhs = compile(r, expr.car, sets, rf, 0, env, null);
            rv = new DefineEval(lhs, env);
            addAnnotations(rv, rhs.annotations);
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
            rv=compile(r, aexpr, sets, rf, context, env, annot);
            an=null;
            break;
        case APPLICATION:
        case UNKNOWN:
            exps=pairToExpressions(expr);
            compileExpressions(r, exps, sets, rf, 0, env);
            Expression operout=compile(r,oper,sets, rf,0,env, null);
            rv = application(r, operout, exps, context, an, env);
            break;
        default:
            error(r, "Unsupported syntactic type ["+eType+"].  Should never happen!");
            rv=null;
        }
        if (an!=null)
            setAnnotations(rv, an);
        return rv;
    }

    public Expression compileLetrec(Interpreter r,
                                    Symbol[] formals, Symbol[] lexicals,
                                    Expression[] rands,
                                    Expression body, Pair sets, 
                                    ReferenceFactory rf, 
                                    SymbolicEnvironment env, int context) 
        throws ContinuationException {
        ReferenceFactory nrf=new ReferenceFactory(formals, lexicals);
        compileExpressions(r, rands, sets, nrf, 0, env);
        boolean allImmediate=true;

        Expression nxp=new LetrecEval(compile(r, body, sets, nrf,
                                              context | TAIL | LAMBDA, 
                                              env, null));
        
        /* If we're emitting debugging symbols, annotate the AppEval
           with the name of the procedure. 
        */
        if (r.dynenv.emitDebuggingSymbols)
            nxp.setAnnotation(PROCNAME, _LETREC);

        Expression lastRand = VOID;

        for (int i= 0; i<rands.length; i++) {
            if (!isImmediate(rands[i])) {
                addAnnotations(nxp, lastRand.annotations);

                nxp=new FillRibExp(lastRand, i, nxp, allImmediate);

                /* If we're emitting debugging symbols, annotate the
                 * FillRibExps with the names of the functions in the 
                 * operator position.
                 */
                if (r.dynenv.emitDebuggingSymbols &&
                    rands[i] instanceof AppExp) {
                    AppExp ae=(AppExp)rands[i];
                    if (ae.exp instanceof FreeReferenceExp) {
                        nxp.setAnnotation(PROCNAME, 
                                          ((FreeReferenceExp)ae.exp).sym);
                    } else if (ae.exp instanceof LexicalReferenceExp) {
                        Symbol varName=(Symbol)((LexicalReferenceExp)ae.exp)
                            .getAnnotation(VARNAME, null);
                        if (varName != null)
                            nxp.setAnnotation(PROCNAME, varName);
                    }
                } 

                lastRand = rands[i];
                rands[i] = null;
                allImmediate=false;
            }
        }
        addAnnotations(nxp, lastRand.annotations);
        int[][] copies=resolveCopies(rf, lexicals);
        return new LetrecExp(lastRand, rands, nxp, copies[0], copies[1], allImmediate);
    }

    public final Expression application(Interpreter r, 
                                        Expression rator, Expression rands[], 
                                        int context, Pair annotation,
                                        SymbolicEnvironment env) throws ContinuationException{
        if (rator instanceof Value && 
            !(rator instanceof Procedure) &&
            !(rator instanceof AnnotatedExpr)) {
            System.err.println(warn("nonprocappdetected",((Value)rator).synopsis()));
        }
        Expression nxp = new AppEval((context & REALTAIL) != 0);
        
        if (annotation!=null)
            setAnnotations(nxp, annotation);

        /* If we're emitting debugging symbols, annotate the AppEval
           with the name of the procedure. 
        */
        if (r.dynenv.emitDebuggingSymbols)
            if (rator instanceof FreeReferenceExp) {
                nxp.setAnnotation(PROCNAME, ((FreeReferenceExp)rator).sym);
            } else if (rator instanceof LexicalReferenceExp &&
                       rator.getAnnotation(VARNAME, null) !=null) {
                nxp.setAnnotation(PROCNAME, rator.getAnnotation(VARNAME));
            }

        Expression lastRand = rator;
        boolean allImmediate=isImmediate(rator);

        for (int i= 0; i<rands.length; i++) {
            if (!isImmediate(rands[i])) {
                addAnnotations(nxp, lastRand.annotations);
                nxp = new FillRibExp(lastRand, i, nxp, allImmediate);

                /* If we're emitting debugging symbols, annotate the
                 * FillRibExps with the names of the functions in the 
                 * operator position.
                 */

                if (r.dynenv.emitDebuggingSymbols &&
                    rands[i] instanceof AppExp) {
                    AppExp ae=(AppExp)rands[i];
                    if (ae.exp instanceof FreeReferenceExp) {
                        nxp.setAnnotation(PROCNAME, 
                                          ((FreeReferenceExp)ae.exp).sym);
                    } else if (ae.exp instanceof LexicalReferenceExp) {
                        Symbol varName=(Symbol)((LexicalReferenceExp)ae.exp)
                            .getAnnotation(VARNAME, null);
                        if (varName != null)
                            nxp.setAnnotation(PROCNAME, varName);
                    }
                } 

                lastRand = rands[i];
                rands[i] = null;
                allImmediate=false;
            }
        }
        addAnnotations(nxp, lastRand.annotations);

        if (allImmediate) {
            if (rator instanceof FreeReferenceExp) {
                Symbol ratorsym=((FreeReferenceExp)rator).sym;
                if ((r.dynenv.inlinePrimitives == TRUE) ||
                    (r.dynenv.inlinePrimitives instanceof Pair && 
                     truth(memq(ratorsym, (Pair)r.dynenv.inlinePrimitives)))) {
                    Value ratorval=env.lookup(ratorsym);
                    if (ratorval instanceof FixableProcedure) {
                        FixableProcedure proc=(FixableProcedure)ratorval;
                        switch (rands.length) {
                        case 0: return new FixedAppExp_0(proc);
                        case 1: return new FixedAppExp_1(proc, 
                                                         (Immediate)rands[0]); 
                        case 2: return new FixedAppExp_2(proc, 
                                                         (Immediate)rands[0],
                                                         (Immediate)rands[1]); 
                        case 3: return new FixedAppExp_3(proc, 
                                                         (Immediate)rands[0],
                                                         (Immediate)rands[1],
                                                         (Immediate)rands[2]);
                        }
                    }
                }
            } 
            return new AppExp(lastRand, rands, nxp, true);
        } else 
            return new AppExp(lastRand, rands, nxp, false);
    }

    void compileExpressions(Interpreter r, Expression exprs[], 
                            Pair sets, ReferenceFactory rf, 
                            int context, SymbolicEnvironment env)
        throws ContinuationException {
        for (int i=exprs.length-1; i>=0; i--) 
            exprs[i]=compile(r, exprs[i], sets, rf,context, env, null);
    }

    Expression compileBegin(Interpreter r, Expression[] v, int context,
                            Pair sets, ReferenceFactory rf,
                            SymbolicEnvironment env)
    throws ContinuationException {        
        Expression last=compile(r, v[v.length - 1], sets, rf,
                                TAIL | context, env, null);
        //if (v.size()==1) return last;
        
        Expression be=last;
        for (int i = v.length - 2; i >= 0; --i) {
            Expression e=compile(r, v[i],
                                 sets, rf, COMMAND, env, null);
            addAnnotations(be, e.annotations);
            be = makeEvalExp(e, be);
        }
        return be;
    }

    static class Ref {
        int idx;
        boolean lcl;

        public Ref(boolean lcl, int idx) {
            this.lcl=lcl;
            this.idx=idx;
        }
    }
            
    static class ReferenceFactory {
        Symbol[] locals, lexicals;

        public ReferenceFactory() {}

        public ReferenceFactory(Symbol[] lcls, Symbol[] lxcls) {
            locals=lcls;
            lexicals=lxcls;
        }

        public Ref fetchRefType(Symbol s) {
            if (locals!=null) 
                for (int i=locals.length-1; i>=0; i--) {
                    if (locals[i]==s) 
                        return new Ref(true, i);
                }
            if (lexicals != null) 
                for (int i=lexicals.length-1; i>=0; i--) {
                    if (lexicals[i]==s) 
                        return new Ref(false, i);
                }
            return null;
        }
            
        public Expression createReference(Symbol s, Pair sets,
                                          SymbolicEnvironment env) {
            Ref r=fetchRefType(s);

            if (r==null) 
                return new FreeReferenceExp(s,env);

            Immediate ref;
            if (r.lcl) 
                ref=new LocalReferenceExp(r.idx);
            else ref=new LexicalReferenceExp(r.idx);
            
            if (assq(s, sets)!=FALSE)
                return new UnboxExp(ref);
            else return (Expression)ref;
        }
    }

    public static void main(String[] args) throws Exception {
        Context.register("main", new AppContext());
        Interpreter r=Context.enter("main");
        Parser p=new Parser(new Lexer());
        InputPort in=new StreamInputPort(System.in);
        SymbolicEnvironment env=new MemorySymEnv();
        Compiler.addSpecialForms(env);
        new sisc.modules.SimplePrimitives.Index().bindAll(r, env);        
        new sisc.modules.ComplexPrimitives.Index().bindAll(r, env);        
        Compiler c=new Compiler();
        Expression v=c.compile(r, p.nextExpression(in), env);
        System.out.println(v.express());
        System.err.println(r.interpret(v));
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
