package sisc;

import sisc.data.*;
import java.util.*;
import java.io.*;

public class AssociativeEnvironment extends NamedValue implements Serializable {

    AssociativeEnvironment parent;
    protected Hashtable  bindings;

    public AssociativeEnvironment() {
	this(5);
    } 
    
    public AssociativeEnvironment(int size) {
	bindings=new Hashtable (size); 
	//	define(THIS, this);
    } 

    /*
    public AssociativeEnvironment(Hashtable bindings) {
	this.bindings=(Hashtable)bindings.clone();
	define(THIS, this);
    }
    */
    public AssociativeEnvironment(AssociativeEnvironment par) {
	this();
	parent=par;
    }

    public AssociativeEnvironment(AssociativeEnvironment par, int size) {
	this(size);
	parent=par;
    }
    /*
    public AssociativeEnvironment(AssociativeEnvironment clone, AssociativeEnvironment par) {
	bindings=(Hashtable )clone.bindings.clone();
	define(THIS, this);
	parent=par;
    }
    */

    public Expression define(Symbol s, Expression val) {
	Expression ov=(Expression)bindings.get(s);
	bindings.put(s,val);
	return ov;
    }

    public AssociativeEnvironment lookupHost(Symbol sym) throws UndefinedException {
	Expression b=(Expression)bindings.get(sym);
	if (b==null)
	    if (parent!=null)
		return parent.lookupHost(sym);
	    else throw new UndefinedException();
	else return this;
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
	    if (parent!=null) {
		return parent.set(s,v);
	    }
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
	    Symbol key=(Symbol)enum.next();
	    Object e=bindings.get(key);
	    if (e instanceof Box) {
		((Box)e).lock();
	    }
	}
    }


    public Pair toAssocList() {
	Pair p=EMPTYLIST;

	for (Iterator enum=bindings.keySet().iterator(); enum.hasNext();) {
	    Object key=enum.next();

	    p=new Pair(new Pair((Value)key,
				(Value)bindings.get(key)), p);
	}
	return p;
    }

    public String display() {
	StringBuffer sb=new StringBuffer();
	sb.append("#<environment");
	if (name!=null)
	    sb.append(' ').append(name);
	sb.append('>');
	return sb.toString();
    }

    public boolean valueEqual(Expression v) {
	return false;
    }

    public AssociativeEnvironment copy() {
	Pair assoc=toAssocList();
	AssociativeEnvironment newEnv=new AssociativeEnvironment();
	while (assoc!=EMPTYLIST) {
	    Pair bind=(Pair)assoc.car;
	    try {
		newEnv.define((Symbol)bind.car, bind.cdr);
	    } catch (Exception e) {}
	    assoc=(Pair)assoc.cdr;
	}
	return newEnv;
    }

    public void merge(AssociativeEnvironment sibling) {
	for (Iterator i=sibling.bindings.keySet().iterator(); i.hasNext();) {
	    Symbol key=(Symbol)i.next();
	    bindings.put(key, sibling.bindings.get(key));
	}
    }
		
}
