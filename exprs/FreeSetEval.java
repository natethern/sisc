package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class FreeSetEval extends Expression {
    public Symbol lhs;
    public AssociativeEnvironment senv;
    public Box v;

    public FreeSetEval(Symbol lhs, Box v, AssociativeEnvironment senv) {
	this.lhs=lhs;
	this.v=v;
	this.senv=senv;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	try {
	    v.set(r.acc);
	} catch (NullPointerException e) {
	    try {
		Box b=(Box)senv.lookup(lhs);
		v=b;
		b.set(r.acc);
	    } catch (UndefinedException e2) {
		senv.define(lhs, v=new Box(r.acc));
	    } catch (ImmutableException e2) {
		senv.define(lhs, v=new Box(r.acc));
	    }
	} catch (ImmutableException e3) {
	    senv.define(lhs, v=new Box(r.acc));
	}
	if (r.acc instanceof NamedValue) {
	    NamedValue nv=(NamedValue)r.acc;
	    if (nv.name==null)
		nv.name=lhs;
	}
	r.acc=VOID;
	r.nxp=null;
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(FreeSet-val ");
	b.append(lhs).append(')');
	return b.toString();
    }
}
