package sisc.exprs;

import sisc.*;
import sisc.data.*;
import java.util.*;

public class FillRibExp extends Expression implements Volatile {

    public Expression rands[], last, cleanup;
    public int pos;
    public boolean locked;
    
    public FillRibExp(int pos, Expression rands[], Expression last,
		      Expression cleanup) {
	this.pos=pos;
	this.rands=rands;
	this.last=last;
	this.cleanup=cleanup;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.vlr[pos]=r.acc;

	int np;
        Value tmp;
        for (np=pos-1;
             np>=0 && ((tmp=rands[np].getValue(r)) != null);
             np--) {
            r.vlr[np]=tmp;
        }

	if (np>-1) {
	    if (locked) {
		r.push(r.createRib(np, rands, last, cleanup));
	    } else {
		pos=np;
		r.push(this);
	    }
	    r.nxp=rands[np];
	} else {
	    tmp=last.getValue(r);
	    if (tmp==null) {
		r.push(cleanup);
		r.nxp=last;
	    } else {
		r.acc=tmp;
		r.nxp=cleanup;
	    }
	    r.returnRib(this);
	}
    }

    public void lock() {
	locked=true;
    }

    public String toString() {
	StringBuffer b=new StringBuffer();
	b.append("(FillRib-exp)");
	return b.toString();
    }
}

