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
package sisc.boot;

import java.io.*;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.util.*;
import java.util.zip.*;
import java.util.zip.GZIPInputStream;
import sisc.*;
import sisc.compiler.*;
import sisc.data.*;
import sisc.exprs.*;

public class GenerateHeap {

    public static void main(String[] args) throws Exception {
        String inHeap = null;
        String outHeap = null;
        int i;

        for (i = 0; i < args.length; i++) {
          if ("-in".equalsIgnoreCase(args[i]))
            inHeap = args[++i];
          else if ("-out".equalsIgnoreCase(args[i]))
            outHeap = args[++i];
          else if ("-files".equalsIgnoreCase(args[i])) {
            i++;
            break;
          }
        }

        if (outHeap == null) {
          System.out.println("Output heap file name has not been specified!");
          System.exit(1);
        }

	AppContext ctx = new AppContext(sisc.compiler.Compiler.addSpecialForms(new AssociativeEnvironment()));

	Context.register("main", ctx);

        Interpreter r = Context.enter("main");
	new Primitives().initialize(r);
        ctx.setEvaluator("eval");

        FreeReferenceExp load=new FreeReferenceExp(Symbol.get("load"),
                              -1, r.ctx.toplevel_env);

        if (inHeap != null) {
          System.out.println("Reading input heap: " + inHeap);
          ctx.loadEnv(r, new DataInputStream(
                             new BufferedInputStream(
                                 new GZIPInputStream(
                                     new BufferedInputStream(
                                         new FileInputStream(inHeap),
                                         90000)))));
        }

        r.define(Symbol.get("version"), new SchemeString(Util.VERSION), Util.SISC);
        Properties sysProps=System.getProperties();
        for (Iterator ir=sysProps.keySet().iterator(); ir.hasNext();) {
            String key=(String)ir.next();
            Symbol s=Symbol.get(key);
            r.define(s, new SchemeString(sysProps.getProperty(key)),
                     Util.ENVVARS);
        }

        System.out.println("Generating heap: "+outHeap);

        for (; i<args.length; i++) {
            System.out.println("Expanding and compiling "+args[i]+"...");
            r.interpret(new AppExp(load,
                                   (Expression[])
                                   new Value[] {new SchemeString(args[i])},
                                   false));
        }

        // Lock in the R5RS environment
        AssociativeEnvironment report_env, top_env, sisc_env;
        report_env=r.lookupContextEnv(Util.TOPLEVEL);
        report_env.trim();
        top_env=new AssociativeEnvironment(report_env);
        sisc_env=r.lookupContextEnv(Util.SISC);
        r.defineContextEnv(Util.TOPLEVEL, top_env);
	r.defineContextEnv(Util.REPORT, report_env);
	r.defineContextEnv(Util.SISC, sisc_env);
        //	report_env.lock();
        report_env.name=Symbol.get("r5rs");
        top_env.name=Symbol.get("top-level");
        sisc_env.name=Symbol.get("sisc");

        System.out.println("Saving heap...");

        try {
            DataOutputStream out=new DataOutputStream(
                                     new GZIPOutputStream(
                                         new BufferedOutputStream(
                                             new FileOutputStream(outHeap))));
            ctx.saveEnv(r,out);
            out.flush();
            out.close();
        } catch (Exception e) {
            System.err.println("Error generating heap:");
            e.printStackTrace();
            System.exit(1);

        }
        System.out.println("Heap saved.");

	Context.exit();
    }
}


