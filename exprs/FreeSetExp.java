package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class FreeSetExp extends Expression {
    public Expression rhs;
    public FreeSetEval eexpr;

    public FreeSetExp(Symbol lhs, int envLoc, Expression rhs,
		      AssociativeEnvironment lenv) {
	this.rhs=rhs;
	this.eexpr = new FreeSetEval(lhs,envLoc, lenv);
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.push(eexpr);
	r.nxp=rhs;
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(Set-exp)");
	b.append(eexpr.lhs).append(' ');
	b.append(rhs).append(')');
	return b.toString();
    }
}
