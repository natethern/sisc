package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class DefineExp extends Expression {
    public Expression lhs,rhs,env; 

    public DefineExp(Expression lhs, Expression rhs, Expression env) {
	this.lhs=lhs;
	this.rhs=rhs;
	this.env=env;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.vlr=new Value[2];

	//	r.push(lhs);
	Expression tail=(env==null ? quote(TOPLEVEL) : env);
	r.push(r.createRib(1, new Expression[] {rhs, tail}, 
			   lhs, DEFINEEVAL));
	
	r.nxp=tail;
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(Define-exp ");
	b.append(lhs).append(' ');
	b.append(rhs).append(')');
	return b.toString();
    }
}
