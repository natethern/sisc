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
import sisc.data.*;
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
            symenv.set(TOPLEVEL, toplevel_env);
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
    public void loadEnv(Interpreter r, DataInputStream i) throws IOException {
        if (SERIALIZATION) {
            Serializer s=new Serializer(r);
            CallFrame lstk=(CallFrame)s.deserialize(i);
            AssociativeEnvironment lsymenv=(AssociativeEnvironment)s.deserialize(i);
            Procedure levaluator=(Procedure)s.deserialize(i);
            SchemeBoolean lTRUE=(SchemeBoolean)s.deserialize(i),
                                lFALSE=(SchemeBoolean)s.deserialize(i);
            SchemeVoid lVOID=(SchemeVoid)s.deserialize(i);
            EmptyList lEMPTYLIST=(EmptyList)s.deserialize(i);
            EOFObject lEOF=(EOFObject)s.deserialize(i);

            try {
                symenv=lsymenv;
                try {
                    toplevel_env=lookupContextEnv(TOPLEVEL);
                } catch (ArrayIndexOutOfBoundsException e) {
                    throw new IOException("Heap did not contain toplevel environment!");
                }
                evaluator=levaluator;
                TRUE=lTRUE;
                FALSE=lFALSE;
                VOID=lVOID;
                EMPTYLIST=lEMPTYLIST;
                EOF=lEOF;
            } catch (Exception e) {
		e.printStackTrace();
                throw new IOException(e.getMessage());
            } finally {
                r.pop(lstk);
            }
        } else {
            ObjectInputStream ois=new ObjectInputStream(i);
	    CallFrame lstk = null;
            try {
                lstk=(CallFrame)ois.readObject();
                AssociativeEnvironment lsymenv=(AssociativeEnvironment)ois.readObject();
                Procedure levaluator=(Procedure)ois.readObject();
                SchemeBoolean lTRUE=(SchemeBoolean)ois.readObject(),
                                    lFALSE=(SchemeBoolean)ois.readObject();
                SchemeVoid lVOID=(SchemeVoid)ois.readObject();
                EmptyList lEMPTYLIST=(EmptyList)ois.readObject();
                EOFObject lEOF=(EOFObject)ois.readObject();


                symenv=lsymenv;
                try {
                    toplevel_env=lookupContextEnv(TOPLEVEL);
                } catch (ArrayIndexOutOfBoundsException e) {
                    throw new IOException("Heap did not contain toplevel environment!");
                }
                evaluator=levaluator;
                TRUE=lTRUE;
                FALSE=lFALSE;
                VOID=lVOID;
                EMPTYLIST=lEMPTYLIST;
                EOF=lEOF;
            } catch (Exception e) {
		e.printStackTrace();
                throw new IOException(e.getMessage());
            } finally {
                r.pop(lstk);
            }
        }
    }

    public void saveEnv(Interpreter r, DataOutputStream o) throws IOException {
        r.save();
        if (SERIALIZATION) {
            Serializer s=new Serializer(r);
            s.serialize(r.stk, o);
            s.serialize(symenv, o);
            s.serialize(evaluator, o);
            s.serialize(TRUE, o);
            s.serialize(FALSE, o);
            s.serialize(VOID,o);
            s.serialize(EMPTYLIST,o);
            s.serialize(EOF,o);
            o.flush();
        } else {
            ObjectOutputStream out=new ObjectOutputStream(o);
            out.writeObject(r.stk);
            out.writeObject(symenv);
            out.writeObject(evaluator);
            out.writeObject(TRUE);
            out.writeObject(FALSE);
            out.writeObject(VOID);
            out.writeObject(EMPTYLIST);
            out.writeObject(EOF);
            out.flush();
        }

        r.pop(r.stk);
    }

    public AssociativeEnvironment lookupContextEnv(Symbol s) {
	return (AssociativeEnvironment)symenv.lookup(s);
    }

}
