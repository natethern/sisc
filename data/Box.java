package sisc.data;

import java.util.*;
import sisc.data.*;

public class Box extends Value {
    public Expression val;
    protected boolean locked=false;

    public Box(Expression val) {
	this.val=val;
    }

    public void lock() {
	locked=true;
    }

    public void set(Value v) throws ImmutableException {
	if (!locked)
	    val=v;
	else throw new ImmutableException();
    }

    public String display() {
	StringBuffer b=new StringBuffer();
	b.append("#&").append((val instanceof Value ? 
			       ((Value)val).write() : "#<expression>"));
	return b.toString();
    }
    
    public String write() {
	return display();
    }

    public boolean valueEqual(Value v) {
	Box b=(Box)v;
	if (val==null && b.val!=null) return false;
	return ((Value)val).valueEqual((Value)b.val);
    }
}







