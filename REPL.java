package sisc;

import java.io.*;
import java.util.zip.*;
import java.util.jar.*;
import java.util.*;
import java.net.*;
import sisc.compiler.*;
import sisc.data.*;
import sisc.exprs.*;
import sisc.ser.*;
import sisc.io.*;
import sisc.interpreter.*;
import sisc.env.DynamicEnvironment;
import sisc.util.Util;

public class REPL {

    public SchemeThread primordialThread;
    public String appName;

    public REPL(String appName, DynamicEnvironment dynenv, Procedure repl) {
        this(appName, repl);
        primordialThread.env = dynenv;
    }

    public REPL(String appName, Procedure repl) {
        this(appName, new SchemeThread(appName, repl));
    }
    
    public REPL(String appName, SchemeThread primordialThread) {
        this.primordialThread = primordialThread;
        this.appName = appName;
    }
    
    public static SeekableInputStream findHeap() {
        try {
            String heapLocation=Util.getSystemProperty("sisc.heapfile", null);
            SeekableInputStream heap = null;
            if (heapLocation==null) {
                URL heapURL=ClassLoader.getSystemResource("sisc.shp");
                if (heapURL==null)
                    heap=
                        new BufferedRandomAccessInputStream("sisc.shp","r",1,8192);
                else
                    heap=new MemoryRandomAccessInputStream(heapURL.openStream());
                //                else 
                //  heap=heapURL.openStream();
            } else 
                heap=//new MemoryRandomAccessInputStream(new FileInputStream(heapLocation));
                    new BufferedRandomAccessInputStream(heapLocation, "r", 1, 8192);

            return heap;
        } catch (Exception e) {
        }
        return null;
    }

    public static Value read(Interpreter r, String expr) throws IOException {
        InputPort ip=new ReaderInputPort(new StringReader(expr));
        return r.dynenv.parser.nextExpression(ip);
    }

    public static String simpleErrorToString(Pair p) {
        StringBuffer b=new StringBuffer();
        String location=null;
        String message=null;
        Pair parent = null;
        while (p!=Util.EMPTYLIST && (location==null || message==null)) {
            Pair cp=(Pair)p.car;
            if (cp.car.equals(Util.MESSAGE))
                message=cp.cdr.toString();
            else if (cp.car.equals(Util.LOCATION))
                location=cp.cdr.toString();
            else if (cp.car.equals(Util.PARENT))
                parent=(Pair)cp.cdr;
            p=(Pair)p.cdr;
        }
        if (location==null)
            b.append(Util.liMessage(Util.SISCB, "error"));
        else 
            b.append(Util.liMessage(Util.SISCB, "errorinwhere", location));
        if (message!=null) 
            b.append(": ").append(message);
        else
            b.append('.');
        if (parent!=null)
            b.append("\n  ").append(simpleErrorToString(parent));
        return b.toString();
    }
        
    public static boolean initializeInterpreter(Interpreter r,
                                                String[] args,
                                                SeekableInputStream in)
        throws ClassNotFoundException {

        try {
            r.ctx.loadEnv(r, new SeekableDataInputStream(in));
        } catch (IOException e) {
            System.err.println("\n"+Util.liMessage(Util.SISCB, 
                                                   "errorloadingheap"));
            e.printStackTrace();
            return false;
        }

        try {
            Properties sysProps=System.getProperties();
            for (Iterator ir=sysProps.keySet().iterator(); ir.hasNext();) {
                String key=(String)ir.next();
                Symbol s=Symbol.get(key);
                r.define(s, new SchemeString(sysProps.getProperty(key)),
                         Util.ENVVARS);
            }
        } catch (java.security.AccessControlException ace) {}

        Symbol loadSymb = Symbol.get("load");
        for (int i=0; i<args.length; i++) {
            try {
                r.eval((Procedure)r.ctx.toplevel_env.lookup(loadSymb),
                       new Value[]{new SchemeString(args[i])});
            } catch (SchemeException se) {
                Value vm=se.m;
                if (vm instanceof Pair) {
                    String errormessage=simpleErrorToString((Pair)vm);
                    System.err.println(errormessage);
                } else {
                    System.err.println(Util.liMessage(Util.SISCB, "errorduringload")+vm);
                }
            }
        }

        try {
            Properties sysProps=System.getProperties();
            for (Iterator ir=sysProps.keySet().iterator(); ir.hasNext();) {
                String key=(String)ir.next();
                String val=sysProps.getProperty(key);
                r.define(Symbol.get(key),
                         new SchemeString(val),
                         Util.ENVVARS);
                if (key.startsWith("sisc.")) {
                    try {
                        r.define(Symbol.get(key.substring(5)),
                                 read(r, val),
                                 Util.SISCCONF);
                    } catch (IOException e) {
                        r.define(Symbol.get(key.substring(5)),
                                 new SchemeString(val),
                                 Util.SISCCONF);
                    }
                }
            }
            File[] roots=File.listRoots();
            SchemeString[] rootss=new SchemeString[roots.length];
            for (int i=0; i<roots.length; i++)
                rootss[i]=new SchemeString(roots[i].getPath());
            r.define(Symbol.get("fs-roots"),
                     Util.valArrayToList((Value[])rootss, 0, rootss.length),
                     Util.SISC);
        } catch (java.security.AccessControlException ace) {}
        
        try {
            r.eval("(initialize)");
        } catch (SchemeException se) {
            System.err.println(Util.liMessage(Util.SISCB, "errorduringinitialize")+
                               simpleErrorToString((Pair)se.m));
        } catch (IOException e) {
            System.err.println(Util.liMessage(Util.SISCB, "errorduringinitialize")+
                               e.getMessage());
        }
        
        return true;
    }

    public void go() {
        try {
            primordialThread.env.out.write("SISC ("+Util.VERSION+") - " + 
                                           appName + "\n");
        } catch (IOException e) {}

        if (primordialThread.thunk == null) {
            System.err.println(Util.liMessage(Util.SISCB, "heapnotfound"));
            return;
        }

        primordialThread.start();
    }

    public static void main(String[] argv) throws Exception {
        Map args=parseOpts(argv);

        SeekableInputStream heap = findHeap();
        if (heap==null) {
            System.err.println(Util.liMessage(Util.SISCB, "noheap"));
            return;
        }

        AppContext ctx = new AppContext();
        Context.register("main", ctx);
        Interpreter r = Context.enter("main");
        if (!initializeInterpreter(r, 
                                   (String[])((Vector)args.get("files")).toArray(new String[0]),
                                   heap))
            return;
        Context.exit();

        boolean noRepl=args.get("no-repl")!=null;
        boolean call=args.get("call-with-args")!=null;

        String expr=(String)args.get("eval");
        if (expr!=null) {
            if (!call)
                System.out.println(r.eval(expr));
            else r.eval(expr);
        }

        String func=(String)args.get("call-with-args");
        if (func!=null) {
            Procedure fun=Util.proc(r.eval(func));
            Vector av=(Vector)args.get("argv");
            SchemeString[] sargs=new SchemeString[av.size()];
            for (int i=0; i<sargs.length; i++) 
                sargs[i]=new SchemeString((String)av.elementAt(i));
            Value v=r.eval(fun, sargs);
            if (noRepl) {
                if (v instanceof Quantity)
                    System.exit(((Quantity)v).intValue());
                else if (v instanceof SchemeVoid)
                    System.exit(0);
                else System.out.println(v);
            }
        }
            
        if (noRepl) return;

        if (args.get("server")!=null) {
            ServerSocket ssocket = new ServerSocket(Integer.parseInt((String)args.get("port")), 50, 
                                                    InetAddress.getByName((String)args.get("host")));
            System.out.println("Listening on " + ssocket.getInetAddress().toString() + ":" + ssocket.getLocalPort());
            System.out.flush();
            listen("main", ssocket);
        } else {
            Procedure p=(Procedure)
                r.ctx.toplevel_env.lookup(Symbol.get("sisc-cli"));
            REPL repl = new REPL("main",p);
            repl.go();
        }
    }

    public static void listen(String app, ServerSocket ssocket)
        throws IOException {
        for (;;) {
            Socket client = ssocket.accept();
            DynamicEnvironment dynenv = new DynamicEnvironment(new SourceInputPort(new BufferedInputStream(client.getInputStream()), "console"),
                                                               new StreamOutputPort(client.getOutputStream(), true));
            Interpreter r=Context.enter(app);
            Procedure p=(Procedure)
                r.ctx.toplevel_env.lookup(Symbol.get("sisc-cli"));
            Context.exit();
            SchemeThread t = new SchemeSocketThread(app, p, client);
            t.env = dynenv;
            REPL repl = new REPL(app, t);
            repl.go();
        }
    }
    
    public static class SchemeSocketThread extends SchemeThread {

        public Socket s;
        
        public SchemeSocketThread(String appName, Procedure thunk, Socket s) {
            super(appName, thunk);
            this.s = s;
        }

        public void run() {
            super.run();
            try {
                s.close();
            } catch(IOException e) {}
        }

    }

    static final int SWITCH=0, OPTION=1;
    static final String[][] opts=new String[][] {
        {"s","server"},
        {"h","host"},
        {"p","port"},
        {"e","eval"},
        {"c","call-with-args"},
        {"x","no-repl"},
    };
    static final int optTypes[]=new int[] {
        SWITCH, OPTION, OPTION, OPTION, OPTION, SWITCH};
                                                  
    public static Map parseOpts(String[] args) {
        Map m=new HashMap();
        Vector files=new Vector();
        int x=0;
        while (x<args.length) {
            String a=args[x];
            int y;
            if (a.startsWith("-")) {
                if (a.startsWith("--")) 
                    y=1;
                else 
                    y=0;
                a=a.substring(y+1);
                if ("".equals(a)) {
                    Vector params=new Vector();
                    if (y==0) 
                        params.addElement("-");
                    else {
                        while (++x<args.length) {
                            params.addElement(args[x]);
                        }
                    }
                    m.put("argv", params);
                    break;
                } else {
                    for (int i=0; i<opts.length; i++) {
                        if (opts[i][y].equals(a)) {
                            switch (optTypes[i]) {
                            case OPTION:
                                m.put(opts[i][1], args[++x]);
                                break;
                            case SWITCH:
                                m.put(opts[i][1], Boolean.TRUE);
                                break;
                            }
                            break;
                        }
                    }
                }
            } else {
                files.addElement(args[x]);
            }
            x++;
        }
        m.put("files", files);
        return m;
    }
}
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
