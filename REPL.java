/* 
 * The contents of this file are subject to the Mozilla Public
 * License Version 1.1 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy of
 * the License at http://www.mozilla.org/MPL/
 * 
 * Software distributed under the License is distributed on an "AS
 * IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * rights and limitations under the License.
 * 
 * The Original Code is the Second Interpreter of Scheme Code (SISC).
 * 
 * The Initial Developer of the Original Code is Scott G. Miller.
 * Portions created by Scott G. Miller are Copyright (C) 2000-2001
 * Scott G. Miller.  All Rights Reserved.
 * 
 * Contributor(s):
 * Matthias Radestock 
 * 
 * Alternatively, the contents of this file may be used under the
 * terms of the GNU General Public License Version 2 or later (the
 * "GPL"), in which case the provisions of the GPL are applicable 
 * instead of those above.  If you wish to allow use of your 
 * version of this file only under the terms of the GPL and not to
 * allow others to use your version of this file under the MPL,
 * indicate your decision by deleting the provisions above and
 * replace them with the notice and other provisions required by
 * the GPL.  If you do not delete the provisions above, a recipient
 * may use your version of this file under either the MPL or the
 * GPL.
 */
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
    protected PrintWriter out,err;
    protected InputStream in;

    public REPL(InputStream in, OutputStream out, OutputStream err, 
		String[] args) {
	this.in=in;
	this.out=new PrintWriter(out);
	this.err=new PrintWriter(err);
	this.out.print("SISC");
	this.out.flush();
	r=new Interpreter(in, out);
	r.setEvaluator("eval");
	try {
	    r.loadEnv(new GZIPInputStream(
		       new BufferedInputStream(
                        new FileInputStream(
			     System.getProperty("HEAP","sisc.heap"))),
			   48000));
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
	r.define(Symbol.get("version"), new SchemeString(Util.VERSION), Util.SISC);
	File[] roots=File.listRoots();
	SchemeString[] rootss=new SchemeString[roots.length];
	for (int i=0; i<roots.length; i++) 
	    try {
		rootss[i]=new SchemeString(roots[i].getCanonicalPath());
	    } catch (IOException e) {}
	r.define(Symbol.get("fs-roots"), Util.valArrayToList((Value[])rootss,
							     0, rootss.length), 
		 Util.SISC);

	this.out.println(" ("+Util.VERSION+")");
	this.out.println(Quantity.reportLibraryType());
	this.out.flush();
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
		err.println("System error: "+e.toString());
		continue start;
	    }
	} while (false);
	//System.runFinalizersOnExit(true);
    }

    public static void main(String[] args) throws Exception {
	REPL r=new REPL(System.in, System.out, System.err, args);
	r.start();
    }
}
