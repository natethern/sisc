package sisc.boot;

import sisc.compiler.*;
import sisc.data.*;
import sisc.exprs.*;
import sisc.*;
import java.io.*;
import java.util.zip.GZIPOutputStream;
import java.util.*;

public class GenerateHeap {

    public static void main(String[] args) throws Exception {
	Interpreter r;

	System.out.println("Generating heap: "+args[0]);

	r=new Interpreter(System.in, System.out);
	r.setEvaluator("eval");
	FreeReferenceExp load=new FreeReferenceExp(Symbol.get("load"),
						   null, r.toplevel_env);


	Properties sysProps=System.getProperties();
	for (Iterator ir=sysProps.keySet().iterator(); ir.hasNext();) {
	    String key=(String)ir.next();
	    Symbol s=Symbol.get(key);
	    r.define(s, new SchemeString(sysProps.getProperty(key)), 
		     Util.ENVVARS);
	}

	for (int i=1; i<args.length; i++) {
	    System.out.println("Expanding and compiling "+args[i]+"...");
	    r.interpret(new AppExp(load,
				   (Expression[])
				   new Value[] {new SchemeString(args[i])},
				   false));
	}

	if (!r.setWriter("pretty-print"))
	    r.setWriter("write");

	// Lock in the R5RS environment
	AssociativeEnvironment report_env, top_env;
	report_env=(AssociativeEnvironment)r.symenv.lookup(Util.TOPLEVEL);
	top_env=new AssociativeEnvironment(report_env);
	r.symenv.define(Util.TOPLEVEL, top_env);
	r.symenv.define(Util.REPORT, report_env);

	System.out.println("Saving heap...");

	try {
	    BufferedOutputStream out=
		new BufferedOutputStream(new GZIPOutputStream(new FileOutputStream(args[0])));
	    r.saveEnv(out);
	    out.flush();
	    out.close();
	} catch (Exception e) {
	    System.err.println("Error generating heap:");
	    e.printStackTrace();
	    System.exit(1);

	}
	System.out.println("Heap saved.");
	/*	for (int i=0; i<PrimitiveIds.LASTPRIM; i++) 
		System.err.println(Primitives.primprof[i]+"\t"+i);*/
    }
}


