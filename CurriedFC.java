package sisc;

import sisc.data.Procedure;
import sisc.data.Value;
import java.io.*;

public class CurriedFC extends Procedure {
    protected Procedure p;
    public CurriedFC(Procedure p) {
	this.p=p;
    }
    
    public void apply(Interpreter r) throws ContinuationException {
	Value[] vr=r.createValues(3);
	try {
	    System.arraycopy(r.vlr, 0, vr, 0, 2);
	} catch (ArrayIndexOutOfBoundsException e) {
	    error(r, "expected 3 arguments to procedure #<continuation>, got "+r.vlr.length);;
	}
	r.vlr=vr;
	r.vlr[2]=p;
	r.acc=p;
	r.nxp=APPEVAL;
    }

    public String display() {
	return "#<failure continuation>";
    }

    public CurriedFC() {}
    public void deserialize(Serializer s, DataInput dis)
	throws IOException {
	p=(Procedure)s.deserialize(dis);
    }
    public void serialize(Serializer s, DataOutput dos)
	throws IOException {
	s.serialize(p, dos);
    }
}

