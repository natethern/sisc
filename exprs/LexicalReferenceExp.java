package sisc.exprs;

import sisc.data.*;
import sisc.*;

public class LexicalReferenceExp extends Expression implements Immediate {

    public int depth, pos;

    public LexicalReferenceExp(int ribcount, int position) {
	depth=ribcount;
	pos=position;
    }

    public void eval(Interpreter r) throws ContinuationException {
	r.nxp=null;
	r.acc=r.env.lookup(depth, pos);
    }
    
    public Value getValue(Interpreter r) throws ContinuationException {
	return r.env.lookup(depth, pos);
    }

    public String toString() {
	return depth+":"+pos;
    }
}







