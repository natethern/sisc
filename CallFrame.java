package sisc;

import sisc.data.*;
import sisc.exprs.*;
import java.util.Stack;

public class CallFrame extends Procedure {


    //STATIC --------------------
    public boolean lock;
    public Expression            nxp;
    public Value[]                  vlr;
    public LexicalEnvironment    env;
    public CallFrame              fk;
    public CallFrame          parent;

    public CallFrame(Expression n, Value[] v, 
		     LexicalEnvironment e, 
		     CallFrame f, CallFrame p) {
	nxp=n;
	vlr=v;
	env=e;
	fk=f;
	parent=p;
    }

    public int depth() {
	return (parent==null? 1 : 1+parent.depth());
    }

    public String toString(Interpreter r) {
	StringBuffer b=new StringBuffer();
	b.append("[CallFrame nxp:").append(nxp);
	b.append(" vlr:").append(vlr);
	b.append(" env:").append(env);
	b.append(" fk:").append(fk);
	if (parent!=null) b.append("  parent:").append(parent.toString(r));
	b.append(']');
	return b.toString();
    }

    public CallFrame capture() {
	if (!lock) {
	    lock=true;
	    if (vlr!=null) {
		Value[] nvlr=new Value[vlr.length];
		System.arraycopy(vlr,0,nvlr,0,nvlr.length);
		vlr=nvlr;
	    }
	    if (nxp!=null && nxp instanceof Volatile)
		((Volatile)nxp).lock();
	    if (parent!=null)
		parent.capture();
	    if (fk!=null)
		fk.capture();
	}
	return this;
    }

    public void apply(Interpreter r) throws ContinuationException {
	if (r.vlr.length==1) {
	    r.acc=r.vlr[0];
	}
	else r.acc=new Values(r.vlr);
	r.pop(this);
	//	throw new ContinuationException(k);
    }

    public String display() {
	StringBuffer b=new StringBuffer();
	b.append("#<continuation");
	if (name!=null) 
	    b.append(' ').append(name.display());
	b.append('>');
	return b.toString();
    }
}


