package sisc;

import sisc.compiler.*;
import sisc.data.*;
import sisc.exprs.*;
import java.io.*;
import java.util.zip.*;
import java.util.*;

public class REPL extends Thread {
    public Interpreter r;
    protected Procedure writeFunc;

    public REPL(InputStream in, OutputStream out, String[] args) {
	System.out.print("SISC");
	System.out.flush();
	r=new Interpreter(in, out);
	r.setEvaluator("eval");
	try {
	    r.loadEnv(new BufferedInputStream(new GZIPInputStream(new BufferedInputStream(new FileInputStream(System.getProperty("HEAP","sisc.heap"))),48000), 65536));
	} catch (IOException e) {
	    System.err.println("Error loading heap!");
	    e.printStackTrace();
	}
	    FreeReferenceExp load=new FreeReferenceExp(Symbol.get("load"),
						       -1, r.toplevel_env);
	for (int i=0; i<args.length; i++) {
	    Value[] v=new Value[1];
	    v[0]=new SchemeString(args[i]);
	    r.interpret(new AppExp(load,
				   (Expression[])v,
				   false));
	}

	Properties sysProps=System.getProperties();
	for (Iterator ir=sysProps.keySet().iterator(); ir.hasNext();) {
	    String key=(String)ir.next();
	    Symbol s=Symbol.get(key);
	    r.define(s, new SchemeString(sysProps.getProperty(key)), 
		     Util.ENVVARS);
	}
	System.out.println(" ("+Util.VERSION+")");
	System.out.println(Quantity.reportLibraryType());
    }

    public void run() {
	Value v=null;
	FreeReferenceExp repl=new FreeReferenceExp(Symbol.get("repl"),
						   -1, r.toplevel_env);
	start:
	do {
	    try {
		r.interpret(new AppExp(repl, new Expression[0],
				       false));
	    } catch (Exception e) {
		System.err.println("System error: "+e.toString());
		continue start;
	    }
	} while (false);
	//System.runFinalizersOnExit(true);
    }

    public static void main(String[] args) throws Exception {
	REPL r=new REPL(System.in, System.out, args);
	r.start();
    }
}
