package sisc;

import sisc.data.Procedure;
import sisc.data.Value;
import java.io.*;

public class CurriedFC extends Procedure {
    protected Procedure p, fk;

    public CurriedFC(Procedure p, Procedure fk) {
	this.p=p;
	this.fk=fk;
    }
    
    public void apply(Interpreter r) throws ContinuationException {
	Value[] vr=r.createValues(3);
	try {
	    System.arraycopy(r.vlr, 0, vr, 0, 2);
	} catch (ArrayIndexOutOfBoundsException e) {
	    error(r, "expected 3 arguments to procedure #<continuation>, got "+r.vlr.length);;
	}
	r.vlr=vr;
	r.vlr[2]=fk;
	r.acc=p;
	r.nxp=APPEVAL;
    }

    public String display() {
	return "#<failure continuation>";
    }

    public Value express() {
	return list(sym("curried-fc"), p.express());
    }

    public CurriedFC() {}
    public void deserialize(Serializer s, DataInput dis)
	throws IOException {
	p=(Procedure)s.deserialize(dis);
	fk=(Procedure)s.deserialize(dis);
    }

    public void serialize(Serializer s, DataOutput dos)
	throws IOException {
	s.serialize(p, dos);
	s.serialize(fk, dos);
    }
}

