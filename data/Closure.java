package sisc.data;

import sisc.*;

public class Closure extends Procedure {
    public boolean arity;
    public Symbol[] formals;
    public LexicalEnvironment env;
    public Expression body;
   
    public Closure(boolean arity, Symbol[] formals, Expression body,
		   LexicalEnvironment env) {
	this.arity=arity;
	this.formals=formals;
	this.env=env;
	this.body=body;
    }

    public void apply(Interpreter r) throws ContinuationException {
	try {
	    r.env=new LexicalEnvironment(formals, r.vlr, 
					 env, arity);
	} catch (IllegalArgumentException e) {
	    error(r, "expected "+(arity ? 
				  formals.length-1 : 
				  formals.length)+" arguments to "+this+
		  ", got "+r.vlr.length);
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
}
	
	

