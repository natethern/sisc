package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class DefineEval extends Expression {
    public Symbol lhs;
    
    public DefineEval(Symbol lhs) {
	this.lhs=lhs;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	Value rhs=r.acc;
	if (rhs instanceof NamedValue) {
	    NamedValue nv=(NamedValue)rhs;
	    if (nv.name==null)
		nv.name=lhs;
	}
	try {
	    r.define(lhs, rhs, TOPLEVEL);
	} catch (EnvironmentLockedException e) {
	    error(r,"environment is immutable");
	}

	r.acc=VOID;
	r.nxp=null;
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(Define-eval").append(' ').append(lhs).append(')');
	return b.toString();
    }
}




