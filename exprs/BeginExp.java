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

    public Value express() {
	Pair args=list(tail.express());
	for (int i=exprs.length-1; i>=0; i--) {
	    args=new Pair(exprs[i].express(), args);
	}
	return new Pair(sym("Begin-exp"), args);
    }
}




