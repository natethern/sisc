package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class FreeReferenceExp extends Expression implements Immediate {
    public Symbol sym;
    public AssociativeEnvironment lenv; 
    public Box v;

    public FreeReferenceExp(Symbol s, Box v, AssociativeEnvironment lenv) {
	this.lenv=lenv;
	sym=s;
	this.v=v;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.nxp=null;
	r.acc=getValue(r);
    }

    public Value getValue(Interpreter r) throws ContinuationException {
	try {
	    if (!v.shadowed())
		return (Value)v.val;
	    else throw new NullPointerException();
	} catch (NullPointerException e) {
	    try {
		v=(Box)lenv.lookup(sym);
		return (Value)v.val; 
	    } catch (UndefinedException e2) {
		error(r, "undefined variable '"+sym+"'");
		return null;
	    }
	}
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(FreeReference-exp ");
	b.append(v).append(')');
	return b.toString();
    }
}
