package sisc.compiler;

import sisc.*;
import sisc.data.*;
import sisc.exprs.*;
import java.util.*;

public class Compiler extends Util {
    static HashMap expenv=new HashMap();
    
    static void extendenv(String s, int i) {
	expenv.put(Symbol.get(s), new Integer(i));
    }
    
    static final int 
	APP=-1, LAMBDA = 1, _IF=2, BEGIN=3, QUOTE=4, SET=5, 
	DEFINE=7, _VOID=8, 
	//	PUTPROP=13,

	TAIL=1, COMMAND=2, PROCEDURE=4, PREDICATE=8;

    static {
	extendenv("lambda", LAMBDA);
	extendenv("if", _IF);
	extendenv("begin", BEGIN);
	extendenv("quote", QUOTE);
	extendenv("set!", SET);
	extendenv("define", DEFINE);
	//	extendenv("putprop", PUTPROP);
    }

    static class ReferenceEnv {
	ReferenceEnv parent;
	HashMap ref=new HashMap();
	
	public ReferenceEnv() {}
	public ReferenceEnv(ReferenceEnv parent) {
	    this.parent=parent;
	}

	public ReferenceEnv(Symbol[] s, ReferenceEnv parent) {
	    this(parent);
	    for (int i=0; i<s.length; i++) {
		ref.put(s[i], new Integer(i));
	    }
	}

	public int[] lookup(Symbol s) {
	    Integer r=(Integer)ref.get(s);
	    if (r==null) {
		if (parent!=null) {
		    int[] addr=parent.lookup(s);
		    if (addr!=null) {
			int[] rv=new int[] {addr[0]+1, addr[1]};
			return rv;
		    }
		}
		return null;
	    }
	    return new int[] {0, r.intValue()};
	}
    }

    public Expression compile(Interpreter r, Expression v, ReferenceEnv rt,
			      int context, AssociativeEnvironment env)
	throws ContinuationException {
	if (v==EMPTYLIST) 
	    return EMPTYLIST;
	else if (v instanceof Pair) {
	    Pair expr=(Pair)v;
	    return compileApp(r,expr,rt,context,env);
	} else if (v instanceof Symbol) {
	    Symbol sym=(Symbol)v;

	    int[] ra=rt.lookup(sym);
	    if (ra==null) {
		try {
		    return new FreeReferenceExp(sym, env.getLoc(sym),
						env);
		} catch (UndefinedException e) {
		    return new FreeReferenceExp(sym, -1, env);
		} catch (ClassCastException e) {
		    return new FreeReferenceExp(sym, -1, env);
		}
	    } else return new LexicalReferenceExp(ra[0],ra[1]);
	}
	else return v;
    }

    public Expression compile(Interpreter r, Expression v, 
			      AssociativeEnvironment env) 
	throws ContinuationException {
	return compile(r, v, new ReferenceEnv(), TAIL, env);
    }
    
    int getExpType(Symbol s) {
	Integer i=(Integer)expenv.get(s);
	if (i==null) return APP;
	return i.intValue();
    }			 

    public Expression compileApp(Interpreter r,
				 Pair expr, ReferenceEnv rt,
				 int context, AssociativeEnvironment env) 
	throws ContinuationException {
	if (expr.car instanceof Symbol) {
	    Symbol s=(Symbol)expr.car;
	    int t=getExpType(s);
	    expr=(Pair)expr.cdr;

	    switch (t) {
	    case QUOTE:
		return expr.car;
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
		if (expr.cdr != EMPTYLIST) 
		    expr=new Pair(new Pair(Util.BEGIN, expr));
		Expression body=compile(r, expr.car, 
					new ReferenceEnv(formals, rt), 
					TAIL | LAMBDA, env);
		return new LambdaExp(formals.length, body, infArity);
	    case _IF:
		Expression test=compile(r, expr.car, rt, PREDICATE, env);
		expr=(Pair)expr.cdr;
		if (test instanceof Value) {
		    if (truth((Value)test))
			return compile(r, expr.car, rt, TAIL, env);
		    else {
			expr=(Pair)expr.cdr;
			return compile(r, expr.car, rt, TAIL, env);
		    }
		} else {
		    Expression conseq=compile(r, expr.car, rt, TAIL, env);
		    expr=(Pair)expr.cdr;
		    Expression altern=compile(r, expr.car, rt, TAIL, env);
		    return new IfExp(test, conseq, altern);
		}
	    case BEGIN:
		Vector v=new Vector();
		
		for (; expr!=EMPTYLIST; expr=(Pair)expr.cdr) {
		    v.addElement(expr.car);
		}
		return compileBegin(r, v, context, rt, env);
	    case SET:
		Expression re=compile(r, expr.car, rt, 0, env);
		expr=(Pair)expr.cdr;
		Expression rhs=compile(r, expr.car, rt, 0, env);
		if (re instanceof LexicalReferenceExp) {
		    LexicalReferenceExp lre=(LexicalReferenceExp)re;
		    
		    return new LexicalSetExp(lre.depth, lre.pos, rhs);
		} else if (re instanceof FreeReferenceExp) {
		    FreeReferenceExp fre=(FreeReferenceExp)re;
		    
		    return new FreeSetExp(fre.sym, fre.envLoc, rhs, env);
		} else {
		    error(r, "left-hand-side of set! is not a symbol");
		    return null;
		} 
	    case DEFINE: 
		Symbol lhs=(Symbol)expr.car;
		expr=(Pair)expr.cdr;

		return new DefineExp(lhs, compile(r, expr.car, rt, 0, env));
	    default:
		Expression[] exps=pairToExpressions(expr);
		compileExpressions(r, exps, rt, 0, env);
		return new AppExp(compile(r, s, rt, 0, env),
				  exps, (context & TAIL)!=0);
	    }
	} else if (expr.car instanceof Pair) {
	    Expression[] exps=pairToExpressions((Pair)expr.cdr);
	    compileExpressions(r, exps, rt, 0, env);
	    return new AppExp(compile(r, expr.car, rt, 0, env), 
			      exps, (context & TAIL)!=0);
	} else {
	    System.err.println("{warning: compiler detected application of non-procedure '"+
			       expr.write()+"'}");
	    Expression[] exps=pairToExpressions((Pair)expr.cdr);
	    compileExpressions(r, exps, rt, 0, env);
	    return new AppExp(compile(r, expr.car, rt, 0, env),
			      exps, (context & TAIL)!=0);
	}
	    
    }

    void compileExpressions(Interpreter r, Expression exprs[], ReferenceEnv rt,
			    int context, AssociativeEnvironment env)
	throws ContinuationException {
	for (int i=exprs.length-1; i>=0; i--) 
	    exprs[i]=compile(r, exprs[i], rt, context, env);
    }

    Expression compileBegin(Interpreter r, Vector v, int context,
			    ReferenceEnv rt, AssociativeEnvironment env)
	throws ContinuationException {
	Expression last=compile(r, (Expression)v.lastElement(), rt, 
				TAIL|context, env);
	v.removeElementAt(v.size()-1);

	if (v.size()==0) return last;
	Vector v2=new Vector(v.size());
	for (int i=0; i<v.size(); i++) {
	    Expression e=compile(r, (Expression)v.elementAt(i), 
				 rt, context, env);
	    if (!(e instanceof Immediate)) 
		v2.addElement(e);
	}

	if (v2.size()==0) return last;
	Expression[] exprs=new Expression[v2.size()];
	v2.copyInto(exprs);
	
	return new BeginExp(exprs, last);
    }
}




