package sisc;

import java.text.*;
import java.util.*;
import sisc.data.*;

public abstract class ModuleAdapter extends Module {
    protected TreeMap bindings=new TreeMap();

    protected void define(String s, int id) {
        Symbol name=Symbol.get(s);
	bindings.put(name, new Integer(id));
    }

    public Symbol[] getModuleBindingNames(Interpreter r) {
	Symbol[] slist=new Symbol[bindings.size()];
	int x=0;
	for (Iterator i=bindings.keySet().iterator(); 
	     i.hasNext();) 
	    slist[x++]=(Symbol)i.next();
	return slist;
    }


    public Value getBindingValue(Interpreter r, Symbol name) throws NoSuchMethodError {
	Integer i=(Integer)bindings.get(name);
	try {
	    int inum=i.intValue();
	    return new BuiltinProcedure(this, name, inum);
	} catch (NullPointerException n) {
	    throw new NoSuchMethodError();
	}
    }

    public float getModuleVersion() {
	return 0.0f;
    }
}
