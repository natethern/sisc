package sisc.exprs;

import sisc.data.*;
import java.io.*;
import sisc.interpreter.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.env.SymbolicEnvironment;

public class FreeReferenceExp extends Expression implements Immediate {
    public Symbol sym;
    private SymbolicEnvironment senv;
    private transient int envLoc=-1;

    public FreeReferenceExp(Symbol s, SymbolicEnvironment senv) {
        this.senv=senv;
        sym=s;
    }

    public void eval(Interpreter r) throws ContinuationException {
        r.nxp=null;
        if (envLoc>=0) {
            r.acc=senv.lookup(envLoc);
        } else {
            //this is an optimization that ensures we short-circuit
            //any DelegatingSymEnvs
            senv = (SymbolicEnvironment)senv.asValue();
            envLoc=senv.getLoc(sym);
            if (envLoc==-1)
                error(r, liMessage(SISCB,"undefinedvar", sym.toString()));
            r.acc=senv.lookup(envLoc);
        } 
    }

    public Value getValue(Interpreter r) throws ContinuationException {
        if (envLoc>=0) {
            return senv.lookup(envLoc);
        } else {
            //this is an optimization that ensures we short-circuit
            //any DelegatingSymEnvs
            senv = (SymbolicEnvironment)senv.asValue();
            try {
                envLoc=senv.getLoc(sym);
            } catch (Exception e) {}
            if (envLoc==-1)
                error(r, liMessage(SISCB,"undefinedvar", sym.toString()));
            return senv.lookup(envLoc);
        }
    }

    public Value express() {
        return list(sym("FreeReference-exp"), sym);
    }

    public void serialize(Serializer s) throws IOException {
        s.writeExpression(sym);
        s.writeSymbolicEnvironment(senv);
    }

    public FreeReferenceExp() {
    }

    public void deserialize(Deserializer s) throws IOException {
        sym=(Symbol)s.readExpression();
        senv=s.readSymbolicEnvironment();
        envLoc=-1;
    }

    public boolean equals(Object o) {
        if (!(o instanceof FreeReferenceExp))
            return false;
        FreeReferenceExp e=(FreeReferenceExp)o;

        return senv.equals(e.senv) && sym.equals(e.sym);
    }

    public int hashCode() {
        return senv.hashCode() ^ sym.hashCode();
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
