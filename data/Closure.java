package sisc.data;

import sisc.*;
import sisc.exprs.Barrier;

public class Closure extends Procedure {
    public boolean arity;
    public int fcount;
    //public long usecount;
    public LexicalEnvironment env;
    public Expression body;
   
    public Closure(boolean arity, int fcount, Expression body,
		   LexicalEnvironment env) {
	this.arity=arity;
	this.fcount=fcount;
	this.env=env;
	this.body=body;
    }

    public void apply(Interpreter r) throws ContinuationException {	
	//usecount++;
	try {
	    r.env=new LexicalEnvironment(fcount, r.vlr, 
					 env, arity);
	} catch (IllegalArgumentException e) {
	    error(r, "expected "+(arity ? fcount - 1 : fcount)
		  +" arguments to "+this+", got "+r.vlr.length);
	}
	r.nxp=body;
    }

    public String display() {
	StringBuffer b=new StringBuffer();
	b.append("#<procedure");
	if (name!=null) 
	    b.append(' ').append(name.display());
	b.append('>');
	return b.toString();
    }
    
    //    protected void finalize() {
	//	System.err.println(justify(""+usecount,10,' ')+" "+name);
    //    }
}
	
	

