package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class BeginExp extends Expression {
    public Expression exprs[], tail;

    public BeginExp(Expression[] exprs, Expression tail) {
	this.exprs=exprs;
	this.tail=tail;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.push(tail);
	for (int i=exprs.length-1; i>0; i--)
	    if (exprs[i].getValue(r)==null) 
		r.push(exprs[i]);
	Value tmp=exprs[0].getValue(r);
	if (tmp==null) 
	    r.nxp=exprs[0];
	else 
	    r.pop(r.stk);

    }

    public String toString() {
	StringBuffer b=new StringBuffer();
	b.append("(begin-exp");
	for (int i=0; i<exprs.length; i++) {
	    b.append(' ').append(exprs[i]);
	}
	b.append(' ').append(tail).append(')');
	return b.toString();
    }
}




