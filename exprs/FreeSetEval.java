package sisc.exprs;

import java.io.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.env.SymbolicEnvironment;
import sisc.util.ExpressionVisitor;

public class FreeSetEval extends Expression {
    public Symbol lhs;
    private SymbolicEnvironment senv;
    private transient int envLoc=-1;

    public FreeSetEval(Symbol lhs, SymbolicEnvironment senv) {
        this.lhs=lhs;
        this.senv=senv;
    }

    public void eval(Interpreter r) throws ContinuationException {
        if (envLoc>=0) {
            senv.set(envLoc, r.acc);
        } else {
            //this is an optimization that ensures we short-circuit
            //any DelegatingSymEnvs
            senv = (SymbolicEnvironment)senv.asValue();
            try {
                envLoc=senv.getLoc(lhs);
                senv.set(envLoc, r.acc);
            } catch (ArrayIndexOutOfBoundsException np) {
                //Variable is not bound.  Raise an error.
                error(r, SETBANG, liMessage(SISCB,"unboundset", lhs.toString()));
            }
        }

        updateName(r.acc, lhs);
        
        r.acc=VOID;
        r.nxp=null;
    }

    public Value express() {
        return list(sym("FreeSet-eval"), lhs);
    }

    public void serialize(Serializer s) throws IOException {
        s.writeExpression(lhs);
        s.writeSymbolicEnvironment(senv);
    }

    public FreeSetEval() {}

     public void deserialize(Deserializer s) throws IOException {
         lhs=(Symbol)s.readExpression();
         senv=s.readSymbolicEnvironment();
         envLoc=-1;
    }

    public boolean equals(Object o) {
        if (!(o instanceof FreeSetEval))
            return false;
        FreeSetEval e=(FreeSetEval)o;
        return lhs.equals(e.lhs) && senv.equals(e.senv);
    }

    public int hashCode() {
        return lhs.hashCode() ^ senv.hashCode();
    }

    public void visit(ExpressionVisitor v) {
        v.visit(lhs);
        v.visit(senv);
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
