package sisc.interpreter;

import java.io.*;
import sisc.ser.*;
import sisc.data.*;
import sisc.env.SymbolicEnvironment;
import sisc.util.Util;

public class AppContext extends Util {

    public Procedure evaluator;
    public SymbolicEnvironment symenv;
    public SymbolicEnvironment toplevel_env;
    /*
    protected void finalize() {
        SymbolicEnvironment ct=lookupContextEnv(Symbol.get("*prof*"));
        SymbolicEnvironment cc=lookupContextEnv(Symbol.get("*profc*"));
        for (Iterator i=ct.keys(); i.hasNext();) {
            Symbol key=(Symbol)i.next();
            System.err.println("P"+justify(ct.lookup(key).toString(),
                                           10,' ')+" "+
                               justify(cc.lookup(key).toString(),
                                       10,' ')+" "+
                               key);
        }
    }


    static {
        System.runFinalizersOnExit(true);
    }
    */
    
    private LibraryManager libraries;

    public AppContext() {
    }

    public AppContext(SymbolicEnvironment symenv) {
        this.symenv = symenv;
        try {
            toplevel_env=lookupContextEnv(TOPLEVEL);
        } catch (ArrayIndexOutOfBoundsException ue) {
            toplevel_env=symenv;
            symenv.define(TOPLEVEL, toplevel_env.asValue());
        }
    }

    public boolean setEvaluator(String s) {
        Procedure newEval = (Procedure)toplevel_env.lookup(Symbol.get(s));
        if (newEval != null) {
            evaluator = newEval;
            return true;
        } else {
            return false;
        }
    }

    public Expression getExpression(Symbol name) {
        try {
            return libraries.getExpression(name);
        } catch(java.io.IOException e) { return null; }
    }

    // Heapfile loading/saving
    public void loadEnv(Interpreter r, SeekableDataInput i)
        throws IOException, ClassNotFoundException {

        Library s=Library.load(i);
        
        libraries = new LibraryManager();
        libraries.addLibrary(s);
        
        CallFrame lstk=(CallFrame)s.getExpression(0);
        Procedure levaluator=(Procedure)s.getExpression(1);

        SymbolicEnvironment lsymenv=(SymbolicEnvironment)s.getExpression(SYMENV);
        try {
            symenv=lsymenv;
            try {
                toplevel_env=lookupContextEnv(TOPLEVEL);
            } catch (ArrayIndexOutOfBoundsException e) {
                e.printStackTrace();
                throw new IOException("Heap did not contain toplevel environment!");
            }
            evaluator=levaluator;
        } catch (Exception e) {
            e.printStackTrace();
            throw new IOException(e.getMessage());
        } finally {
            r.pop(lstk);
        }
    }

    public void saveEnv(Interpreter r, OutputStream o, LibraryBuilder lb)
        throws IOException {
        r.push(r.nxp);
        lb.add(r.stk);
        lb.add(evaluator);
        lb.add(SYMENV, symenv.asValue());
        lb.add(TOPLEVEL, toplevel_env.asValue());

        lb.buildLibrary("sisc", o);
        r.pop(r.stk);
    }

    public SymbolicEnvironment lookupContextEnv(Symbol s) {
        SymbolicEnvironment senv = (SymbolicEnvironment)symenv.lookup(s);
        if (senv == null)
            throw new ArrayIndexOutOfBoundsException();
        return senv;
    }

    public void defineContextEnv(Symbol s, SymbolicEnvironment env) {
        symenv.define(s, env.asValue());
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
