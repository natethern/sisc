package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class IfEval extends Expression {
    public Expression conseq, altern;

    public IfEval(Expression conseq, Expression altern) {
	this.conseq=conseq;
	this.altern=altern;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.nxp = (truth(r.acc) ? conseq : altern);
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(If-eval ");
	b.append(conseq).append(' ');
	b.append(altern).append(')');
	return b.toString();
    }
}






