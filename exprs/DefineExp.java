package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class DefineExp extends Expression {
    public Expression rhs;
    public DefineEval defineEval;

    public DefineExp(Symbol lhs, Expression rhs) {
	defineEval=new DefineEval(lhs);
	this.rhs=rhs;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.push(defineEval);
	r.nxp=rhs;
    }

    public Value express() {
	return list(sym("Define-exp"), defineEval.express(), rhs.express());
    }
}
