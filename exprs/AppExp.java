package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class AppExp extends Expression {
    public Expression rator, rands[];
    public boolean nonTail;

    public AppExp(Expression rator, Expression rands[], boolean nontail) {
	this.rator=rator;
	this.rands=rands;
	this.nonTail=nontail;
    }


    public void eval(Interpreter r) throws ContinuationException { 
	if (nonTail) {
	    r.nxp=null;
	    r.save();
	}

	r.vlr=new Value[rands.length];

	// Fill the rib right to left with immediates until non-imm.
	// encountered
	int i=rands.length-1;
	Value tmp;
	for (; i>=0 && ((tmp=rands[i].getValue(r)) != null); i--)
	    r.vlr[i]=tmp;
	
	// If not all were immediate, push a fillrib, otherwise
	// go straight to eval
	if (i>-1) {
	    r.push(r.createFillRib(i, rands, rator, APPEVAL));
	    r.nxp=rands[i];
	} else {
	    tmp=rator.getValue(r);
	    if (tmp==null) { 
		r.push(APPEVAL);
		r.nxp=rator;
	    } else {
		r.acc=tmp;
		r.nxp=APPEVAL;
	    }
	}
    }

    public Value express() {
	Pair args=EMPTYLIST;
	for (int i=rands.length-1; i>=0; i--) {
	    args=new Pair(rands[i].express(), args);
	}
	args=new Pair(rator.express(), args);
	return new Pair(nonTail ? sym("App-exp") : sym("TailApp-exp"), args);
    }
}
