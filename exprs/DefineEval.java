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
	r.define(lhs, rhs, TOPLEVEL);

	r.acc=VOID;
	r.nxp=null;
    }

    public Value express() {
	return list(sym("Define-eval"), lhs);
    }
}




