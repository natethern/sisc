package sisc;

import java.util.HashMap;
import sisc.data.*;

public class AssociativeEnvironment extends NamedValue {
    
    protected static final float EXPFACT=1.5F;
    protected HashMap symbolMap;
    public Value[] env;
    protected int nextFree;

    public AssociativeEnvironment(AssociativeEnvironment cloneFrom) {
	symbolMap=(HashMap)cloneFrom.symbolMap.clone();
	nextFree=cloneFrom.nextFree;
	env=new Value[nextFree];
	System.arraycopy(cloneFrom.env, 0, env, 0, nextFree);
    }

    public AssociativeEnvironment() {
	env=new Value[50];
	nextFree=0;
	symbolMap=new HashMap(50);
    }

    protected void expand() {
	synchronized(symbolMap) {
	    Value[] newenv=new Value[(int)(env.length*EXPFACT)];
	    System.arraycopy(env, 0, newenv, 0, env.length);
	    nextFree=env.length;
	    env=newenv;
	}
    }

    public void trim() {
	synchronized(symbolMap) {
	    Value[] newenv=new Value[nextFree];
	    System.arraycopy(env, 0, newenv, 0, nextFree);
	    env=newenv;
	}
    }

    public int set(Symbol s, Value v) {
	Integer i=(Integer)symbolMap.get(s);
	try {
	    int iv=i.intValue();
	    env[iv]=v;
	    return iv;
	} catch (NullPointerException np) {
	    return define(s, v);
	} 
    }

    public int set(int envLoc, Value v) {
	env[envLoc]=v;
	return envLoc;
    }

    public int define(Symbol s, Value v) {
	synchronized(symbolMap) {
	    if (nextFree >= env.length)
		expand();
	    symbolMap.put(s, new Integer(nextFree));
	    env[nextFree]=v;
	    return nextFree++;
	}
    }

    public int getLoc(Symbol s) {
	Integer i=(Integer)symbolMap.get(s);
	return (i==null ? -1 : i.intValue());
    }

    public Value lookup(Symbol s) {
	Integer i=(Integer)symbolMap.get(s);
	if (i==null)
	    throw new ArrayIndexOutOfBoundsException();
	else return env[i.intValue()];
    }

    public Value lookup(int envLoc) {
	return env[envLoc];
    }

    public String display() {
	StringBuffer sb=new StringBuffer();
	sb.append("#<environment");
	if (name!=null)
	    sb.append(' ').append(name);
	sb.append('>');
	return sb.toString();
    }

}


