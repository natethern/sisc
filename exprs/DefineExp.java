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

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(Define-exp ");
	b.append(defineEval).append(' ');
	b.append(rhs);
	b.append(')');
	return b.toString();
    }
}
