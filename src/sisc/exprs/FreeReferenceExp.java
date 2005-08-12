package sisc.exprs;

import sisc.data.*;

import java.io.*;
import sisc.interpreter.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.env.SymbolicEnvironment;
import sisc.exprs.fp.OptimisticExpression;
import sisc.exprs.fp.OptimisticHost;
import sisc.util.ExpressionVisitor;
import sisc.util.FreeReference;
import sisc.util.UndefinedVarException;

public class FreeReferenceExp extends Expression 
    implements Immediate, OptimisticExpression {

    public class NonImmediateFreeReferenceExp extends Expression {

        FreeReferenceExp base;
        
        public NonImmediateFreeReferenceExp(FreeReferenceExp base) {
            this.base=base;
        }
        
        /* (non-Javadoc)
         * @see sisc.data.Expression#eval(sisc.interpreter.Interpreter)
         */
        public void eval(Interpreter r) throws ContinuationException {
            base.eval(r);
        }

        /* (non-Javadoc)
         * @see sisc.data.Expression#express()
         */
        public Value express() {
            return list(sym("NIFreeReference-exp"), ref.getName());
        }
    }
    
    private FreeReference ref;
    private OptimisticHost host;
    private int uexpPosition;

    public FreeReferenceExp(FreeReference ref) {
        this.ref = ref;
    }
    
    public FreeReferenceExp(Symbol sym, SymbolicEnvironment senv) {
        this(new FreeReference(sym, senv));
    }

    public Symbol getSym() {
        return ref.getName();
    }

    public void eval(Interpreter r) throws ContinuationException {
        r.nxp = null;
        r.acc = getValue(r);
    }

    public Value getValue(Interpreter r) throws ContinuationException {
        try {
            return ref.getValue();
        } catch (UndefinedVarException e) {
            error(r, liMessage(SISCB,"undefinedvar", e.var));
            host.alter(r, uexpPosition, new NonImmediateFreeReferenceExp(this));
            return null; //won't get here
        }
    }

    public void serialize(Serializer s) throws IOException {
        ref.serialize(s);
    }

    public Value express() {
        return list(sym("FreeReference-exp"), ref.getName());
    }

    public void deserialize(Deserializer s) throws IOException {
        ref.deserialize(s);
    }

    public FreeReferenceExp() {
        ref = new FreeReference();
    }

    public boolean equals(Object o) {
        if (!(o instanceof FreeReferenceExp))
            return false;
        FreeReferenceExp e = (FreeReferenceExp)o;
        return ref.equals(e.ref);
    }

    public int hashCode() {
        return ref.hashCode();
    }

    public boolean visit(ExpressionVisitor v) {
        return ref.visit(v);
    }

    public FreeReference getReference() {
        return ref;
    }

    public void setHost(OptimisticHost host, int uexpPosition) {
        this.host=host;
        this.uexpPosition=uexpPosition;
    }

    public void dropSafe() {
        host=null;
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
