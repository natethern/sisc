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
import java.util.*;
import sisc.interpreter.*;
import sisc.ser.*;
import sisc.data.*;
import sisc.env.*;
import sisc.util.Util;

public class GenerateHeap {

    static HashSet r5rs_bindings;

    static String[] bindingNames = new String[] {
        //core forms
        "lambda", "quote", "letrec", "if", "begin", "set!", "define",

        //procedures
        "*", "+", "-", "/", "<", "<=", "=", ">", ">=", "abs", "acos", "angle",
        "append", "apply", "asin", "assoc", "assq", "assv", "atan", "boolean?",
        "call-with-current-continuation", "call-with-input-file",
        "call-with-output-file", "call-with-values", "car", "cdr", "caar",
        "cadr", "cdar", "cddr", "caaar", "caadr", "cadar", "caddr", "cdaar",
        "cdadr", "cddar", "cdddr", "caaaar", "caaadr", "caadar", "caaddr",
        "cadaar", "cadadr", "caddar", "cadddr", "cdaaar", "cdaadr", "cdadar",
        "cdaddr", "cddaar", "cddadr", "cdddar", "cddddr", "ceiling",
        "char->integer", "char-alphabetic?", "char-ci<=?", "char-ci<?",
        "char-ci=?", "char-ci>=?", "char-ci>?", "char-downcase",
        "char-lower-case?", "char-numeric?", "char-ready?", "char-upcase",
        "char-upper-case?", "char-whitespace?", "char<=?", "char<?", "char=?",
        "char>=?", "char>?", "char?", "close-input-port", "close-output-port",
        "complex?", "cons", "cos", "current-input-port", "current-output-port",
        "denominator", "display", "dynamic-wind", "eof-object?", "eq?", "equal?",
        "eqv?", "eval", "even?", "exact->inexact", "exact?", "exp", "expt",
        "floor", "for-each", "force", "gcd", "imag-part", "inexact->exact",
        "inexact?", "input-port?", "integer->char", "integer?",
        "interaction-environment", "lcm", "length", "list", "list->string",
        "list->vector", "list-ref", "list-tail", "list?", "load", "log",
        "magnitude", "make-polar", "make-rectangular", "make-string",
        "make-vector", "map", "max", "member", "memq", "memv", "min", "modulo",
        "negative?", "newline", "not", "null-environment", "null?",
        "number->string", "number?", "numerator", "odd?", "open-input-file",
        "open-output-file", "output-port?", "pair?", "peek-char", "positive?",
        "procedure?", "quotient", "rational?", "rationalize", "read",
        "read-char", "real-part", "real?", "remainder", "reverse", "round",
        "scheme-report-environment", "set-car!", "set-cdr!", "sin", "sqrt",
        "string", "string->list", "string->number", "string->symbol",
        "string-append", "string-ci<=?", "string-ci<?", "string-ci=?",
        "string-ci>=?", "string-ci>?", "string-copy", "string-fill!",
        "string-length", "string-ref", "string-set!", "string<=?", "string<?",
        "string=?", "string>=?", "string>?", "string?", "substring",
        "symbol->string", "symbol?", "tan", "truncate", "values", "vector",
        "vector->list", "vector-fill!", "vector-length", "vector-ref",
        "vector-set!", "vector?", 
        "with-input-from-file", "with-output-to-file",
        "write", "write-char", "zero?"
        };

    static {
        r5rs_bindings=new HashSet(bindingNames.length);
        for (int i=0; i<bindingNames.length; i++)
            r5rs_bindings.add(bindingNames[i]);
    }

    static SymbolicEnvironment[] classify(SymbolicEnvironment base, 
                                          LibraryBuilder lb) {
        SymbolicEnvironment[] rv=new SymbolicEnvironment[2];
        rv[0]=new LibraryAE((Symbol)null, lb);
        rv[1]=base;
        rv[1].setParent(rv[0]);

        HashMap r5rs=new HashMap();

        //Note the  R5RS bindings so we can transfer them to the
        //bottommost env.
        for (Iterator i=base.keys(); i.hasNext();) {
            Symbol key=(Symbol)i.next();
            if (r5rs_bindings.contains(key.symval)) {
                Value v=base.lookup(key);
                r5rs.put(key, v);
                rv[0].define(key, v);
            }
        }

        Map baseMap=base.getSymbolMap();
        for (Iterator i=r5rs.keySet().iterator(); i.hasNext();) {
            Symbol n=(Symbol)i.next();
            baseMap.remove(n);
            if (base instanceof LibraryAE) {
                ((LibraryAE)base).ignore(n);
            }
        }
        return rv;
    }

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

        LibraryBuilder lb=new LibraryBuilder();
        MemorySymEnv symenv=new MemorySymEnv(Symbol.get("symenv"));
        MemorySymEnv toplevel=new LibraryAE((Symbol)null, lb);
        toplevel.setName(Util.TOPLEVEL);
        sisc.compiler.Compiler.addSpecialForms(toplevel);
        symenv.define(Util.TOPLEVEL, toplevel);
        
        // Set this initially, so the optimizer can do its core forms
        // check without error
        symenv.define(Util.SISC_SPECIFIC, toplevel);
        AppContext ctx = new AppContext(symenv);
        
        Context.register("main", ctx);
        
        Interpreter r = Context.enter("main");
        new sisc.modules.Primitives().bindAll(r, r.ctx.toplevel_env);
        new sisc.modules.Annotations().bindAll(r, r.ctx.toplevel_env);
        new sisc.modules.io.IO().bindAll(r, r.ctx.toplevel_env);
        ctx.setEvaluator("eval");
        
        
        Symbol loadSymb = Symbol.get("load");
        
        if (inHeap != null) {
            System.out.println("Reading input heap: " + inHeap);
            ctx.loadEnv(r, new SeekableDataInputStream(new BufferedRandomAccessInputStream(inHeap, "r", 1, 8192)));
        }
        
        r.define(Symbol.get("version"), new SchemeString(Util.VERSION), Util.SISC);
        Properties sysProps=System.getProperties();
        Iterator ir;
        for (ir=sysProps.keySet().iterator(); ir.hasNext();) {
            String key=(String)ir.next();
            Symbol s=Symbol.get(key);
            r.define(s, new SchemeString(sysProps.getProperty(key)),
                     Util.ENVVARS);
        }

        System.out.println("Generating heap: "+outHeap);

        for (; i<args.length; i++) {
            System.out.println("Expanding and compiling "+args[i]+"...");
            try {
                r.eval((Procedure)r.ctx.toplevel_env.lookup(loadSymb),
                       new Value[] {new SchemeString(args[i])});
            } catch (SchemeException se) {
                System.err.println("Error during expand: "+se.getMessage());
            }
        }
        
        //clearing env vars
        for (ir=sysProps.keySet().iterator(); ir.hasNext();) {
            String key=(String)ir.next();
            Symbol s=Symbol.get(key);
            r.define(s, Util.FALSE, Util.ENVVARS);
        }

        System.err.println("Partitioning bindings...");
        SymbolicEnvironment[] results=classify(r.lookupContextEnv(Util.TOPLEVEL), lb);
        SymbolicEnvironment sisc_specific, r5rs, top_level;
        r5rs=results[0];
        sisc_specific=results[1];

        r.ctx.toplevel_env=top_level=new MemorySymEnv(new LibraryAE(sisc_specific, lb), Util.TOPLEVEL);
        r5rs.setName(Util.REPORT);
        sisc_specific.setName(Util.SISC_SPECIFIC);
        
        r.defineContextEnv(Util.TOPLEVEL, top_level);
        r.defineContextEnv(Util.REPORT, r5rs);
        r.defineContextEnv(Util.SISC_SPECIFIC, sisc_specific);


        System.out.println("Saving heap...");

        try {
            OutputStream out= //new GZIPOutputStream(
                                 new BufferedOutputStream(
                                    new FileOutputStream(outHeap));
            ctx.saveEnv(r,out,lb);
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


