package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class LambdaExp extends Expression implements Immediate {
    public boolean infiniteArity;
    public Symbol formals[];
    public Expression body;

    public LambdaExp(Symbol[] formals, Expression body, boolean arity) {
	infiniteArity=arity;
	this.formals=formals;
	this.body=body;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.nxp=null;
	r.acc=new Closure(infiniteArity, formals, body, r.env);
    }

    public Value getValue(Interpreter r) throws ContinuationException {
	return new Closure(infiniteArity, formals, body, r.env);
    }

    public String toString() {
	StringBuffer b=new StringBuffer();
	b.append("(Lambda-exp (");
	for (int i=0; i<formals.length; i++) {
	    b.append(formals[i]).append(' ');
	}
	b.append(")\n\t").append(body).append(')');
	return b.toString();
    }
}





