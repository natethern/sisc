package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class IfExp extends Expression {
    public Expression test;
    public IfEval eexp;

    public IfExp(Expression test, Expression conseq, Expression altern) {
	this.test=test;
	this.eexp = new IfEval(conseq,altern);
    }

    public void eval(Interpreter r) throws ContinuationException { 
	Value tmp=test.getValue(r);
	if (tmp==null) {
	    r.push(this.eexp);
	    r.nxp=test;
	} else {
	    r.nxp=(tmp==FALSE ? eexp.altern : eexp.conseq);
	}
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(If-exp ");
	b.append(test).append(' ');
	b.append(eexp.conseq).append(' ');
	b.append(eexp.altern).append(')');
	return b.toString();
    }
}
