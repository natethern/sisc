package sisc.data;

public class Pair extends Value {
    public Value car, cdr;

    public Pair() {
	car=cdr=EMPTYLIST;
    }

    public Pair(Value car) {
	this.car=car;
	this.cdr=EMPTYLIST;
    }

    public Pair(Value car, Value cdr) {
	this.car=car;
	this.cdr=cdr;
    }

    public Value car() {
	return car;
    }

    public Value cdr() {
	return cdr;
    }

    protected void display(StringBuffer b, boolean write) {
	if (car==null) b.append("()");
	else
	    b.append((write ? car.write() : car.display()));
	if (cdr == EMPTYLIST) 
	    return;
	else if (cdr==null)
	    b.append("()");
	else if (cdr instanceof Pair) {
	    b.append(' ');
	    ((Pair)cdr).display(b, write);
	} else
	    b.append(" . ").append((write ? cdr.write() : cdr.display()));
    }
	    
    public String display() {
	StringBuffer b=new StringBuffer();
	if (car==QUOTE) {
	    b.append('\'').append(((Pair)cdr).car.display());
	} else if (car==UNQUOTE) {
	    b.append(',').append(((Pair)cdr).car.display());
	} else if (car==BACKQUOTE) {
	    b.append('`').append(((Pair)cdr).car.display());
	} else if (car==UNQUOTE_SPLICING) {
	    b.append(",@").append(((Pair)cdr).car.display());
	} else {
	    b.append('(');
	    display(b, false);
	    b.append(')');
	}
	return b.toString();
    }

    public String write() {
	StringBuffer b=new StringBuffer();
	if (car==QUOTE) {
	    b.append('\'').append(((Pair)cdr).car.write());
	} else if (car==UNQUOTE) {
	    b.append(',').append(((Pair)cdr).car.write());
	} else if (car==BACKQUOTE) {
	    b.append('`').append(((Pair)cdr).car.write());
	} else if (car==UNQUOTE_SPLICING) {
	    b.append(",@").append(((Pair)cdr).car.write());
	} else {
	    b.append('(');
	    display(b, true);
	    b.append(')');
	}
	return b.toString();
    }

    public boolean valueEqual(Value v) {
	if (!(v instanceof Pair)) return false;
	Pair p=(Pair)v;
	return car.equals(p.car) &&
	    cdr.equals(p.cdr);
    }
}
    

	    
		
