package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class LambdaExp extends Expression implements Immediate {
    public boolean infiniteArity;
    public int fcount;
    public Expression body;

    public LambdaExp(int s, Expression body, boolean arity) {
	infiniteArity=arity;
	fcount=s;
	this.body=body;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.nxp=null;
	r.acc=new Closure(infiniteArity, fcount, body, r.env);
    }

    public Value getValue(Interpreter r) throws ContinuationException {
	return new Closure(infiniteArity, fcount, body, r.env);
    }

    public Value express() {
	return list(sym("Lambda-exp"), new Quantity(fcount), body.express());
    }
}






