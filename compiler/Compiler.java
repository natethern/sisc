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
package sisc.compiler;

import sisc.*;
import sisc.data.*;
import sisc.exprs.*;
import java.util.*;

public class Compiler extends Util {
    
    static class Syntax extends NamedValue {
	int synid;

	public Syntax(int synid) {
	    this.synid=synid;
	}

	public void eval(Interpreter r) throws ContinuationException {
	    error(r, "invalid context for syntax-identifier "+name);
	}

	public String display() {
	    return "#!"+synid;
	}
    }

    static void extendenv(AssociativeEnvironment env, String s, int i) {
	Symbol name=Symbol.get(s);
	env.set(name, new Syntax(i));
    }
    
    static final int 
	APP=-1, LAMBDA = 1, _IF=2, BEGIN=3, QUOTE=4, SET=5, 
	DEFINE=7, 
	TAIL=1, COMMAND=2, PROCEDURE=4, PREDICATE=8;

    public Compiler(AssociativeEnvironment menv) {
	extendenv(menv,"lambda", LAMBDA);
	extendenv(menv,"if", _IF);
	extendenv(menv,"begin", BEGIN);
	extendenv(menv,"quote", QUOTE);
	extendenv(menv,"set!", SET);
	extendenv(menv,"define", DEFINE);
    }

    static class ReferenceEnv {
	ReferenceEnv parent;
	HashMap ref=new HashMap();
	int[] rv=new int[2];
	
	public ReferenceEnv() {}
	public ReferenceEnv(ReferenceEnv parent) {
	    this.parent=parent;
	}

	public ReferenceEnv(Symbol[] s, ReferenceEnv parent) {
	    this(parent);
	    for (int i=0; i<s.length; i++) {
		ref.put(s[i], new Short((short)i));
	    }
	}

	public Expression createReference(Symbol s, AssociativeEnvironment env) {
	    short lev=-1;
	    ReferenceEnv ctx=this;
	    Short r=null;
	    while (r==null && ctx!=null) {
		r=(Short)ctx.ref.get(s);
		ctx=ctx.parent;
		lev++;
	    }
	    
	    if (r==null) 
		return new FreeReferenceExp(s, env.getLoc(s), env);
	    else 
		return new LexicalReferenceExp(lev, r.shortValue());
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

	    return rt.createReference(sym, env);
	}
	else return v;
    }

    public Expression compile(Interpreter r, Expression v, 
			      AssociativeEnvironment env) 
	throws ContinuationException {
	Expression e= compile(r, v, new ReferenceEnv(), TAIL, env);
	return e;
    }
    
    int getExpType(AssociativeEnvironment env, Symbol s) {
	try {
	    Object h=env.lookup(s);
	    
	    if (h instanceof Syntax) 
		return ((Syntax)h).synid;

	} catch (ArrayIndexOutOfBoundsException ab) {
	}
	return APP;
    }			 

    public Expression compileApp(Interpreter r,
				 Pair expr, ReferenceEnv rt,
				 int context, AssociativeEnvironment env) 
	throws ContinuationException {
	if (expr.car instanceof Symbol) {
	    Symbol s=(Symbol)expr.car;
	    int t=getExpType(env, s);
	    expr=(Pair)expr.cdr;

	    switch (t) {
	    case QUOTE:
		return expr.car;
		//	    case _VOID:
		//return VOID;
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
		return new LambdaExp((short)formals.length, body, infArity);
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
				  exps, (context & TAIL)==0);
	    }
	} else if (expr.car instanceof Pair) {
	    Expression[] exps=pairToExpressions((Pair)expr.cdr);
	    compileExpressions(r, exps, rt, 0, env);
	    return new AppExp(compile(r, expr.car, rt, 0, env), 
			      exps, (context & TAIL)==0);
	} else {
	    System.err.println("{warning: compiler detected application of non-procedure '"+
			       expr.write()+"'}");
	    Expression[] exps=pairToExpressions((Pair)expr.cdr);
	    compileExpressions(r, exps, rt, 0, env);
	    return new AppExp(compile(r, expr.car, rt, 0, env),
			      exps, (context & TAIL)==0);
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
				TAIL & context, env);
	v.removeElementAt(v.size()-1);

	if (v.size()==0) return last;
	Vector v2=new Vector(v.size());
	for (int i=0; i<v.size(); i++) {
	    Expression e=compile(r, (Expression)v.elementAt(i), 
				 rt, COMMAND, env);
	    if (!(e instanceof Immediate)) 
		v2.addElement(e);
	}

	if (v2.size()==0) return last;
	Expression[] exprs=new Expression[v2.size()];
	v2.copyInto(exprs);
	
	return new BeginExp(exprs, last);
    }
}




