package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class FreeReferenceExp extends Expression implements Immediate {
    public Symbol sym;
    public AssociativeEnvironment lenv; 
    public int envLoc;

    public FreeReferenceExp(Symbol s, int envLoc, 
			    AssociativeEnvironment lenv) {
	this.lenv=lenv;
	sym=s;
	this.envLoc=envLoc;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.nxp=null;
	if (envLoc==-1) { 
	    envLoc=lenv.getLoc(sym);
	    if (envLoc==-1)
		error(r, "undefined variable '"+sym+"'");
	}
	r.acc= lenv.env[envLoc];
    }

    public Value getValue(Interpreter r) throws ContinuationException {
	if (envLoc==-1) { 
	    envLoc=lenv.getLoc(sym);
	    if (envLoc==-1)
		error(r, "undefined variable '"+sym+"'");
	}
	return lenv.env[envLoc];
    }

    public Value express() {
	return list(sym("FreeReference-exp"), sym);
    }
}
