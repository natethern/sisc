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
import java.util.jar.*;
import java.util.*;
import java.net.*;

public class REPL extends Thread {
    public Interpreter r;


    public REPL(Interpreter r) {
        this.r = r;
    }

    public static boolean initializeInterpreter(Interpreter r, String[] args) throws ClassNotFoundException {
        try {
            r.ctx.loadEnv(r,
			  new DataInputStream(
                            new BufferedInputStream(
                               new GZIPInputStream(
                                  new BufferedInputStream(
                                      new FileInputStream(
                                          System.getProperty("HEAP","sisc.heap")),
                                      90000))
			       )));
        } catch (IOException e) {
            System.err.println("\nError loading heap!");
            e.printStackTrace();
	    return false;
        }

	Symbol loadSymb = Symbol.get("load");
        for (int i=0; i<args.length; i++) {
	    try {
		r.eval((Procedure)r.ctx.toplevel_env.lookup(loadSymb),
		       new Value[]{new SchemeString(args[i])});
	    } catch (SchemeException se) {
		System.err.println("Error during load: "+se.getMessage());
	    }
        }

        Properties sysProps=System.getProperties();
        for (Iterator ir=sysProps.keySet().iterator(); ir.hasNext();) {
            String key=(String)ir.next();
            Symbol s=Symbol.get(key);
            r.define(s, new SchemeString(sysProps.getProperty(key)),
                     Util.ENVVARS);
        }
        // ovidiu: No need to version, as it is read from the heap
        // file. Should we do the same with the rest of the
        // properties?
//         r.define(Symbol.get("version"), new SchemeString(Util.VERSION), Util.SISC);
        File[] roots=File.listRoots();
        SchemeString[] rootss=new SchemeString[roots.length];
        for (int i=0; i<roots.length; i++)
            rootss[i]=new SchemeString(roots[i].getPath());
        r.define(Symbol.get("fs-roots"), Util.valArrayToList((Value[])rootss,
                 0, rootss.length),
                 Util.SISC);
	return true;
    }

    public void run() {
	r= Context.enter("main");
	try {
	    Symbol replSymb = Symbol.get("repl");
	    try {
		r.ctx.toplevel_env.lookup(replSymb);
	    } catch (ArrayIndexOutOfBoundsException aiob) {
		System.err.println("Fatal error: Heap not found or does not contain repl.");
		return;
	    }
	    do {
		try {
		    r.eval((Procedure)r.ctx.toplevel_env.lookup(replSymb),
			   new Values[]{});
		    break;
		} catch (SchemeException e) {
		    System.err.println("Uncaught error: "+e.getMessage());
		} catch (Exception e) {
		    e.printStackTrace();
		    System.err.println("System error: "+e.toString());
		}
	    } while (true);
	} finally {
	    Context.exit();
	}
    }

    public static void main(String[] args) throws Exception {

        boolean server = false;
        InetAddress bindAddr = null;
        int port = 0;

        java.util.Vector fargs = new java.util.Vector();

        for (int iArg=0; iArg < args.length; iArg++) {
            String arg = args[iArg];
            if (arg.equals("--server")) {
                server = true;
                continue;
            }
            if (arg.equals("--host")) {
                iArg++;
                bindAddr = InetAddress.getByName(args[iArg]);
                continue;
            }
            if (arg.equals("--port")) {
                iArg++;
                port = Integer.parseInt(args[iArg]);
                continue;
            }
            fargs.add(arg);
        }

        PrintWriter pout=new PrintWriter(System.out);
        PrintWriter perr=new PrintWriter(System.err);
        pout.print("SISC");
        pout.flush();

	AppContext ctx = new AppContext();
	Context.register("main", ctx);
        Interpreter r = Context.enter("main");
        if (initializeInterpreter(r,(String[])fargs.toArray(new String[0]))) {
	
	    pout.println(" ("+Util.VERSION+")");
	    pout.flush();

	    if (server) {
		ServerSocket ssocket = new ServerSocket(port, 50, bindAddr);
		pout.println("Listening on " + ssocket.getInetAddress().toString() + ":" + ssocket.getLocalPort());
		pout.flush();
		for (;;) {
		    Socket client = ssocket.accept();
		    pout.println("Accepting connection from " + client.getInetAddress().toString());
		    pout.flush();
		    DynamicEnv dynenv = new DynamicEnv(new InputPort(new BufferedReader(new InputStreamReader(client.getInputStream()))),
						       new OutputPort(new PrintWriter(client.getOutputStream()), true));
		    REPL repl = new SocketREPL(dynenv, client);
		    repl.start();
		}
	    }
	    else {
		REPL repl=new REPL(r);
		repl.start();
	    }
	    
	    Context.exit();
	}
    }
/*
     protected void finalize() {
	 System.gc();
	 for (int i=0; i<Closure.anons.size(); i++) {
	     Pair p=(Pair)Closure.anons.elementAt(i);
	     System.err.println("C"+Util.justify(p.cdr.toString(), 10,'0')+"\t"+p.car.write());
 	}
     }
*/
}

class SocketREPL extends REPL {

    public Socket s;
    public DynamicEnv dynenv;

    public SocketREPL(DynamicEnv dynenv, Socket s) {
        super(null);
	this.dynenv = dynenv;
        this.s = s;
    }

    public void run() {
	r = Context.enter("main");
	r.dynenv = dynenv;
        super.run();
	Context.exit();
        try {
            s.close();
        }
        catch(IOException e) {}
    }
}

