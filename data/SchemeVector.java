package sisc.data;

public class SchemeVector extends Value {
    public Value[] vals;

    public SchemeVector(int count) {
	this(count, Quantity.ZERO);
    }

    public SchemeVector(int count, Value initializer) {
	vals=new Value[count];
	for (int i=0; i<vals.length; i++) {
	    vals[i]=initializer;
	}
    }

    public SchemeVector(Value[] v) {
	vals=v;
    }

    public boolean valueEqual(Value v) {
	if (!(v instanceof SchemeVector)) return false;
	SchemeVector o=(SchemeVector)v;
	if (o.vals.length!=vals.length)
	    return false;

	for (int i=0; i<vals.length; i++) {
	    if (!vals[i].valueEqual(o.vals[i]))
		return false;
	}
	return true;
    }

    int findEnd() {
	if (vals.length>1) {
	    Value v=vals[vals.length-1];
	    for (int i=vals.length-2; i>=0; i--) 
		if (!vals[i].eq(v)) return i+2;
	    return 1;
	} 
	return vals.length;
    }
	
    void display(StringBuffer b, boolean write) {
	int l=findEnd();
	System.err.println(l);
	for (int i=0; i<l; i++) {
	    b.append((write ? vals[i].write() : vals[i].display()));
	    if (i+1<l) b.append(' ');
	}
    }

    public String display() {
	StringBuffer b=new StringBuffer();
	b.append('#').append('(');
	display(b, false);
	b.append(')');
	return b.toString();
    }

    public void set(int idx, Value v) {
	vals[idx]=v;
    }

    public String write() {
	StringBuffer b=new StringBuffer();
	b.append('#').append(vals.length).append('(');
	display(b, true);
	b.append(')');
	return b.toString();
    }
}




