package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class AppEval extends Expression {

    public void eval(Interpreter r) throws ContinuationException { 
	try {
	    ((Procedure)r.acc).apply(r);
	} catch (ClassCastException c) {
	    c.printStackTrace();
	    error(r, "Attempt to apply non-procedure '"+r.acc.write()+"'");
	}
    }

    public Value express() {
	return list(sym("App-Eval"));
    }
}
