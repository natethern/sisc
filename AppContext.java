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

import sisc.*;
import sisc.ser.*;
import sisc.data.*;
import java.util.*;
import java.io.*;

public class AppContext extends Util {

    protected Procedure evaluator;
    protected AssociativeEnvironment symenv;
    public AssociativeEnvironment toplevel_env;

    public AppContext() {
        symenv=toplevel_env=new AssociativeEnvironment();
    }

    public AppContext(AssociativeEnvironment symenv) {
	this.symenv = symenv;
        try {
            toplevel_env=lookupContextEnv(TOPLEVEL);
        } catch (ArrayIndexOutOfBoundsException ue) {
            toplevel_env=symenv;
            symenv.define(TOPLEVEL, toplevel_env);
        }
    }

    public boolean setEvaluator(String s) {
        try {
            evaluator=(Procedure)toplevel_env.lookup(Symbol.get(s));
            return true;
        } catch (ArrayIndexOutOfBoundsException e) {
            return false;
        }
    }

    // Heapfile loading/saving
    public void loadEnv(Interpreter r, SeekableDataInput i)
        throws IOException, ClassNotFoundException {

        Library s=Library.load(i);
        LibraryManager.getInstance().addLibrary(s);

        SchemeBoolean lTRUE=(SchemeBoolean)s.getExpression(0),
            lFALSE=(SchemeBoolean)s.getExpression(1);
        SchemeVoid lVOID=(SchemeVoid)s.getExpression(2);
        EmptyList lEMPTYLIST=(EmptyList)s.getExpression(3);
        EOFObject lEOF=(EOFObject)s.getExpression(4);
        CallFrame lstk=(CallFrame)s.getExpression(5);
        Procedure levaluator=(Procedure)s.getExpression(6);

        AssociativeEnvironment lsymenv=(AssociativeEnvironment)s.getExpression(Symbol.get("symenv"));

        try {
            symenv=lsymenv;
            try {
                toplevel_env=lookupContextEnv(TOPLEVEL);
            } catch (ArrayIndexOutOfBoundsException e) {
                e.printStackTrace();
                throw new IOException("Heap did not contain toplevel environment!");
            }
            evaluator=levaluator;
            TRUE=lTRUE;
            FALSE=lFALSE;
            VOID=lVOID;
            EMPTYLIST=lEMPTYLIST;
            EOF=lEOF;
            setVoids();
        } catch (Exception e) {
            e.printStackTrace();
            throw new IOException(e.getMessage());
        } finally {
            r.pop(lstk);
        }
    }

    public void saveEnv(Interpreter r, OutputStream o, LibraryBuilder lb)
        throws IOException {
        r.save();
        lb.add(TRUE);
        lb.add(FALSE);
        lb.add(VOID);
        lb.add(EMPTYLIST);
        lb.add(EOF);            
        lb.add(r.stk);
        lb.add(evaluator);
        lb.add(Symbol.get("symenv"), symenv);
        
        lb.buildLibrary("sisc", o);
        r.pop(r.stk);
    }

    public AssociativeEnvironment lookupContextEnv(Symbol s) {
        return (AssociativeEnvironment)symenv.lookup(s);
    }

    public void defineContextEnv(Symbol s, AssociativeEnvironment env) {
        symenv.define(s, env);
    }

}
