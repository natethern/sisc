package sisc;

import java.util.*;
import java.io.*;
import sisc.data.*;

public class LexicalEnvironment extends Value {
    public LexicalEnvironment parent;
    public Value[] vals;

    public LexicalEnvironment() {
	this(new Value[0]);
    }

    public LexicalEnvironment(Value[] v) {
	this(v.length, v, null);
    }

    public LexicalEnvironment(int s, Value[] v, LexicalEnvironment parent) {
	this(s, v, parent, false);
    }

    public LexicalEnvironment(int s, Value[] v, LexicalEnvironment parent,
			      boolean infiniteArity) throws IllegalArgumentException {
	this.parent=parent;

	if (infiniteArity) {
	    int sm1=s-1;
	    if (v.length < sm1) 
		throw new IllegalArgumentException();
	    vals=new Value[s];
	    System.arraycopy(v, 0, vals, 0, sm1);
	    vals[sm1]=valArrayToList(v, sm1, v.length-sm1);

	} else {
	    if (v.length!=s) 
		throw new IllegalArgumentException();
	    vals=v;
	}
    }

    public Value lookup(int depth, int pos) {
	LexicalEnvironment e = this;
	while(depth-- > 0) e = e.parent;
	return e.vals[pos];
    }

    public void set(int depth, int pos, Value v) {
	LexicalEnvironment e = this;
	while(depth-- > 0) e = e.parent;
	e.vals[pos]=v;
    }

    public String display() {
	return "#<environment>";
    }
}




