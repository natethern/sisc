package sisc.data;

import sisc.*;

public class Values extends Value {
    public Value[] values;

    public Values(Value[] v) {
	values=v;
    }

    public String display() {
	StringBuffer b=new StringBuffer();
	
	for (int i=0; i<values.length; i++) {
	    b.append(values[i].display());
	    if (i+1<values.length) b.append('\n');
	}
	return b.toString();
    }

    public String write() {
	StringBuffer b=new StringBuffer();
	
	for (int i=0; i<values.length; i++) {
	    b.append(values[i].write());
	    if (i+1<values.length) b.append('\n');
	}
	return b.toString();
    }

    public void eval(Interpreter r) throws ContinuationException {
	error(r, "multiple values received in single-value context");
    }
}

