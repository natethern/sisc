package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class DefineExp extends Expression {
    public Symbol lhs;
    public Expression rhs;

    public DefineExp(Symbol lhs, Expression rhs) {
	this.lhs=lhs;
	this.rhs=rhs;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.vlr=new Value[1];
	r.push(r.createRib(0, new Expression[] {rhs}, 
			   lhs, DEFINEEVAL));
	r.nxp=rhs;
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(Define-exp ");
	b.append(lhs).append(' ');
	b.append(rhs);
	b.append(')');
	return b.toString();
    }
}
