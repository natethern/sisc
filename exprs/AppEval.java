package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class AppEval extends Expression {

    public void eval(Interpreter r) throws ContinuationException { 
	try {
	    ((Procedure)r.acc).apply(r);
	} catch (ClassCastException c) {
	    error(r, "Attempt to apply non-procedure '"+r.acc.write()+"'");
	}
    }

    public String toString() {
	StringBuffer b=new StringBuffer();
	b.append("(App-eval)");
	return b.toString();
    }
}
