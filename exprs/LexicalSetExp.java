package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class LexicalSetExp extends Expression {
    public Expression rhs;
    public LexicalSetEval eexpr;

    public LexicalSetExp(int depth, int pos, Expression rhs) {
	this.rhs=rhs;
	this.eexpr = new LexicalSetEval(depth, pos);
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.push(eexpr);
	r.nxp=rhs;
    }

    public String toString(){
	StringBuffer b=new StringBuffer();
	b.append("(Lexical-set-exp ");
	b.append(eexpr.depth).append(':').append(eexpr.pos).append(' ');
	b.append(rhs).append(')');
	return b.toString();
    }
}
