package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class AppExp extends Expression {
    public Expression rator, rands[];
    public boolean tailPos;

    public AppExp(Expression rator, Expression rands[], boolean tail) {
	this.rator=rator;
	this.rands=rands;
	tailPos=tail;
    }


    public void eval(Interpreter r) throws ContinuationException { 
	if (!tailPos) {
	    r.nxp=null;
	    r.save();
	}
	r.vlr=new Value[rands.length];

	int i;
	//	S%ystem.err.println(rator);
	Value tmp;
	for (i=rands.length-1;
	     i>=0 && ((tmp=rands[i].getValue(r)) != null);
	     i--) {
	    r.vlr[i]=tmp;
	}

	
	if (i>-1) {
	    r.push(r.createRib(i, rands, rator, APPEVAL));
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

    public String toString() {
	StringBuffer b=new StringBuffer();
	b.append(tailPos ? "(TailApp-exp " :"(App-exp ");
	b.append(rator).append(' ');
	for (int i=0; i<rands.length; i++) {
	    b.append(rands[i]).append(' ');
	}
	b.append(')');
	return b.toString();
    }
}
