package sisc.data;

import sisc.*;
import sisc.compiler.*;

public class BuiltinProcedure extends Procedure {
    public int id;
    public Module host;
    public long usecount;

    public BuiltinProcedure(Module host, String name, int id) {
	this(host, Symbol.get(name),id);
    }

    public BuiltinProcedure(Module host, Symbol name, int id) {
	this.id=id;
	this.name=name;
	this.host=host;
    }

     public void apply(Interpreter r) throws ContinuationException {
	r.nxp=null;
	try {
	    //	    long start=System.currentTimeMillis();
	    Value v=host.eval(id, r);
	    if (v!=null) r.acc=v;
	    //	    usecount+=System.currentTimeMillis()-start;
	} catch (ArrayIndexOutOfBoundsException np) {
	    error(r, name, "incorrect number of arguments to procedure");
	} catch (ClassCastException cc) {
	    error(r, name, "got unexpected value "+cc.getMessage());
	} catch (RuntimeException re) {
	    error(r, name, re.getMessage());
	}
    }

    public String display() {
	StringBuffer b=new StringBuffer();
	b.append("#<builtin procedure ").append(name).append('>');
	return b.toString();
    }

    public boolean valueEqual(Value v) {
	return ((BuiltinProcedure)v).id==id &&
	    ((BuiltinProcedure)v).host==host;
    }
    /*    
    public void finalize() {
	System.err.println(justify(""+usecount,10,' ')+" "+name);
	}*/
}

    
