package sisc;

import java.util.TreeMap;
import java.util.Iterator;
import sisc.data.*;

public abstract class ModuleAdapter extends Module {
    protected TreeMap bindings=new TreeMap();

    protected void define(String s, int id) {
        Symbol name=Symbol.get(s);
	bindings.put(name, new Integer(id));
    }

    public Symbol[] getModuleBindingNames() {
	Symbol[] slist=new Symbol[bindings.size()];
	int x=0;
	for (Iterator i=bindings.keySet().iterator(); 
	     i.hasNext();) 
	    slist[x++]=(Symbol)i.next();
	return slist;
    }

    public Value getBindingValue(Symbol name) throws NoSuchMethodError {
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

    public static final Module module(Interpreter r, Value o)
    throws ContinuationException {
        try {
            return (Module)o;
        } catch (ClassCastException e) { typeError(r, "native library", o); } return null;
    }
}
