package sisc;

import sisc.data.*;
import sisc.exprs.FreeReferenceExp;

public abstract class Module extends Util implements java.io.Serializable {

    protected void define(Interpreter r, String s, int id) {
	Symbol name=Symbol.get(s);
	try {
	    r.toplevel_env.define(name, new Box(new BuiltinProcedure(this, name, id)));
	} catch (EnvironmentLockedException e) {
	    e.printStackTrace();
	}
    }

    public abstract void initialize(Interpreter r);

    public abstract Value eval(int primid, Interpreter f) 
	throws ContinuationException;
}
