package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class FreeSetEval extends Expression {
    public Symbol lhs;
    public AssociativeEnvironment senv;
    public int envLoc;

    public FreeSetEval(Symbol lhs, int e, AssociativeEnvironment senv) {
	this.lhs=lhs;
	envLoc=e;
	this.senv=senv;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	try {
	    senv.env[envLoc]=r.acc;
	} catch (ArrayIndexOutOfBoundsException aie) {
	    envLoc=senv.set(lhs, r.acc);
	}

	if (r.acc instanceof NamedValue) {
	    NamedValue nv=(NamedValue)r.acc;
	    if (nv.name==null)
		nv.name=lhs;
	}

	r.acc=VOID;
	r.nxp=null;
    }

    public Value express() {
	return list(sym("FreeSet-eval"), lhs);
    }
}
