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
	r.acc=getValue(r);
    }

    public Value getValue(Interpreter r) throws ContinuationException {
	try {
	    return lenv.env[envLoc];
	} catch (ArrayIndexOutOfBoundsException aie) {
	    try {
		envLoc=lenv.getLoc(sym);
		return lenv.env[envLoc];
		//		return lenv.lookup(envLoc);
	    } catch (UndefinedException e2) {
		error(r, "undefined variable '"+sym+"'");
		return null;
	    }
	}
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(FreeReference-exp ");
	b.append(sym).append(')');
	return b.toString();
    }
}
