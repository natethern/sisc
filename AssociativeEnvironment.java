package sisc;

import sisc.data.*;
import java.util.*;
import java.io.*;

public class AssociativeEnvironment extends NamedValue {

    AssociativeEnvironment parent;
    protected Hashtable  bindings;

    public AssociativeEnvironment() {
	this(5);
    } 
    
    public AssociativeEnvironment(int size) {
	bindings=new Hashtable (size); 
    } 

    public AssociativeEnvironment(AssociativeEnvironment par) {
	this();
	parent=par;
    }

    public AssociativeEnvironment(AssociativeEnvironment par, int size) {
	this(size);
	parent=par;
    }

    public Expression define(Symbol s, Expression val) {
	Expression ov=(Expression)bindings.get(s);
	bindings.put(s,val);
	return ov;
    }

    public Expression lookup(Symbol sym) throws UndefinedException {
	Expression b=(Expression)bindings.get(sym);
	if (b==null)
	    if (parent!=null)
		return parent.lookup(sym);
	    else throw new UndefinedException();
	else return b;
    }
    
    public Expression set(Symbol s, Expression v) {
	Expression b=(Expression)bindings.get(s);
	if (b==null) {
	    if (parent!=null) 
		return parent.set(s,v);
	    bindings.put(s,v);
	    return null;
	} else {
	    bindings.put(s,v);
	    return b;
	}
    }
    
    /**
     * Locks all the Boxes stored in this environment (making them immutable)
     */
    public void lock() {
	for (Iterator enum=bindings.keySet().iterator(); enum.hasNext();) {
	    Object key=enum.next();
	    Object e=bindings.get(key);
	    if (e instanceof Box) 
		((Box)e).lock();
	}
    }

    /*
    public Pair toAssocList() {
	Pair p=EMPTYLIST;

	for (Iterator enum=bindings.keySet().iterator(); enum.hasNext();) {
	    Object key=enum.next();

	    p=new Pair(new Pair((Value)key,
				(Value)bindings.get(key)), p);
	}
	return p;
    }
    */

    public String display() {
	StringBuffer sb=new StringBuffer();
	sb.append("#<environment");
	if (name!=null)
	    sb.append(' ').append(name);
	sb.append('>');
	return sb.toString();
    }
}
