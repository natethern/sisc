package sisc.exprs;

import sisc.*;
import sisc.data.*;

public class ApplyValuesContEval extends Expression {
    public Procedure consumer;

    public ApplyValuesContEval(Procedure c) {
	consumer=c;
    }

    public void eval(Interpreter r) throws ContinuationException {
	try {
	    r.vlr=((Values)r.acc).values;
	} catch (ClassCastException c) {
	    r.vlr=new Value[] {r.acc};
	}
	r.nxp=APPEVAL;
	r.acc=(Value)consumer;
    }

    public String display() {
	return "#<system continuation>";
    }

    public Value express() {
	return list(sym("ApplyValuesContEval"));
    }

}
