package sisc;

import java.util.*;
import java.io.*;
import sisc.data.*;

public class LexicalEnvironment extends Value implements Serializable {
    public LexicalEnvironment parent;
    public Symbol[] syms;    
    public Value[] vals;

    public LexicalEnvironment() {
	this(new Symbol[0], new Value[0]);
    }

    public LexicalEnvironment(Symbol[] s, Value[] v) {
	this(s,v,null);
    }

    public LexicalEnvironment(Symbol[] s, Value[] v, 
			      LexicalEnvironment parent) {
	this(s,v,parent,false);
    }

    public LexicalEnvironment(Symbol[] s, Value[] v, 
			      LexicalEnvironment parent,
			      boolean infiniteArity) throws IllegalArgumentException {
	this.parent=parent;
	syms=s;
	if (infiniteArity) {
	    if (v.length < s.length - 1) 
		throw new IllegalArgumentException();
	    vals=new Value[syms.length];
	    System.arraycopy(v,0,vals,0,syms.length-1);
	    vals[vals.length-1]=valArrayToList(v, syms.length-1, 
					       v.length-(syms.length-1));
	    /*	    for (int i=0; i<vals.length; i++) 
		System.err.print(" "+vals[i]);
		System.err.println("!");*/
	} else {
	    if (v.length!=s.length) 
		throw new IllegalArgumentException();
	    vals=v;
	}
    }

    public Value lookup(int depth, int pos) {
	LexicalEnvironment e = this;
	while(depth-- > 0) e = e.parent;
	return e.vals[pos];
    }

    public Expression lookup(Symbol s) throws UndefinedException {
	for (int i=0; i<syms.length; i++) {
	    if (syms[i]==s) 
		return vals[i];
	} 
	if (parent!=null) return parent.lookup(s);
	throw new UndefinedException();
    }

    public void set(int depth, int pos, Value v) {
	LexicalEnvironment e = this;
	while(depth-- > 0) e = e.parent;
	e.vals[pos]=v;
    }

    public Expression set(Symbol s, Expression v) throws UndefinedException {
	for (int i=0; i<syms.length; i++) {
	    if (syms[i]==s) {
		Expression temp=vals[i];
		vals[i]=(Value)v;
		return temp;
	    }
	}
	if (parent!=null) {
	    return parent.set(s, v);
	}
	throw new UndefinedException();
    }
	
    public String display() {
	return "#<environment>";
    }

    public void look() {
	if (parent!=null)
	    parent.look();
	for (int i=0; i<syms.length; i++) 
	    System.err.println(i+":"+syms[i]+"=>"+vals[i]);
	System.err.println("---");

    }

    public boolean valueEqual(Value v) {
	return false;
    }

}




