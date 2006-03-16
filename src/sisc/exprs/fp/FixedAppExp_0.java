package sisc.exprs.fp;

import java.io.*;

import sisc.compiler.Compiler;
import sisc.data.*;
import sisc.exprs.AppExp;
import sisc.exprs.FillRibExp;
import sisc.exprs.FreeReferenceExp;
import sisc.interpreter.*;
import sisc.nativefun.FixableProcedure;
import sisc.nativefun.NestedPrimRuntimeException;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;
import sisc.util.FreeReference;
import sisc.util.UndefinedVarException;

public class FixedAppExp_0 extends Expression 
    implements Immediate, OptimisticExpression {

    transient FixableProcedure proc;
    public FreeReference ref;
    public OptimisticHost host;
    public int uexpPosition;

    public FixedAppExp_0(FreeReference ref) {
        this.ref=ref;
    }

    public void setHost(OptimisticHost host, int uexpPos) {
        this.host=host;
        uexpPosition=uexpPos;
    }

    public void eval(Interpreter r) throws ContinuationException {
        r.nxp=null;
        r.acc=getValue(r);
    }

    public Value doGetValue(FixableProcedure proc, Interpreter r) throws ContinuationException {
        return proc.apply();
    }

    public Value getValue(Interpreter r) throws ContinuationException {
        try {
            Expression e = ref.getValue();
            if (e != proc) {
                //If the definition has changed (or has never been
                //seen before) check if its still fixable.  If not,
                //revert to the safe expression
                if (e instanceof FixableProcedure) {
                    proc = (FixableProcedure)e;
                } else {
                    revert(r);
                }
            }
            return doGetValue(proc, r);
        } catch (UndefinedVarException uve) {
            error(r, liMessage(SISCB,"undefinedvar", uve.var));
        } catch (NestedPrimRuntimeException npr) {
            Procedure.error(r, getName(), npr);
        } catch (OptimismUnwarrantedException uwe) {
            throw uwe;
        } catch (RuntimeException re) {
            //re.printStackTrace();
            String msg = re.getMessage();
            if (msg == null)
                msg = re.toString();
            error(r, ref.getName(), msg, re);
        }
        // Should be unreachable;
        return null;
    }

    protected void revert(Interpreter r) {
        revert(r, ZV);
    }

    protected void revert(Interpreter r, Expression[] rands) {
        if (host == null) {
            Procedure.throwPrimException(liMessage(SISCB, "nosafeexpr"));
        }
        try {
            AppExp safeExpr=(AppExp)Compiler.application(r, new FreeReferenceExp(ref), rands, 0, getAnnotations(), r.getCtx().symenv);

            if (safeExpr instanceof OptimisticExpression) {
                ((OptimisticExpression)safeExpr).setHost(host, uexpPosition);
            }
            host.alter(r, uexpPosition, safeExpr);
            throw new OptimismUnwarrantedException();
        } catch (ContinuationException ce) {
            Procedure.throwPrimException(ce.getMessage());
        }
    }

    public Value express() {
        return list(sym("FixedAppExp"), ref.getName());
    }

    public void serialize(Serializer s) throws IOException {
        ref.serialize(s);
        s.writeExpression((Expression)host);
        s.writeInt(uexpPosition);
    }

    public FixedAppExp_0() {
        ref=new FreeReference();
    }

    public void deserialize(Deserializer s) throws IOException {
        ref.deserialize(s);
        host=(OptimisticHost)s.readExpression();
        uexpPosition=s.readInt();
    }

    public boolean visit(ExpressionVisitor v) {
        return ref.visit(v) && v.visit((Expression)host);
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
