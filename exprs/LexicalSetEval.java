package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class LexicalSetEval extends Expression {
    public int depth, pos;

    public LexicalSetEval(int depth, int pos) {
	this.depth=depth;
	this.pos=pos;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	r.env.set(depth, pos, r.acc);
	r.acc=VOID;
	r.nxp=null;
    }

    public Value express() {
	return list(sym("LexicalSet-eval"), 
		    new Pair(new Quantity(depth), new Quantity(pos)));
    }
}
