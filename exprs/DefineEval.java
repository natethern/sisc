package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class DefineEval extends Expression {

    public void eval(Interpreter r) throws ContinuationException { 
	Symbol lhs=symbol(r,r.acc);
	Value rhs=r.vlr[0];
	if (rhs instanceof NamedValue) {
	    NamedValue nv=(NamedValue)rhs;
	    if (nv.name==null)
		nv.name=lhs;
	}

	r.define(lhs, rhs, TOPLEVEL);
	r.acc=VOID;
	r.nxp=null;
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(Define-eval)");
	return b.toString();
    }
}




