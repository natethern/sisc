package sisc.modules;

import sisc.io.*;
import sisc.data.*;
import sisc.exprs.*;
import sisc.interpreter.*;
import sisc.nativefun.*;
import java.util.Set;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import java.io.IOException;

import sisc.util.ExpressionVisitor;
import sisc.util.FreeReference;
import sisc.util.UndefinedVarException;

public class Debugging extends IndexedProcedure {

    protected static final int EXPRESSV = 0,
        COMPILE = 1,
        CONT_VLR = 2,
        CONT_NXP = 3,
        CONT_ENV = 4,
        CONT_FK = 5,
        CONT_VLK = 6,
        CONT_PARENT = 7,
        ERROR_CONT_K = 8,
        FILLRIBQ = 9,
        FILLRIBEXP = 10,
        FREEXPQ = 11,
        FRESYM = 12,
        QTYPE = 13,
        UNRESOLVEDREFS = 14;

    public static class Index extends IndexedLibraryAdapter {

        public Value construct(int id) {
            return new Debugging(id);
        }
        
        public Index() {
            define("express", EXPRESSV);
            define("_compile", COMPILE);
            define("error-continuation-k", ERROR_CONT_K);
            define("continuation-vlk", CONT_VLK);
            define("continuation-vlr", CONT_VLR);
            define("continuation-nxp", CONT_NXP);
            define("continuation-env", CONT_ENV);
            define("continuation-fk", CONT_FK);
            define("continuation-stk", CONT_PARENT);
            define("_fill-rib?", FILLRIBQ);
            define("_fill-rib-exp", FILLRIBEXP);
            define("_free-reference-exp?", FREEXPQ);
            define("_free-reference-symbol", FRESYM);
            define("quantity-type", QTYPE);
            define("unresolved-references", UNRESOLVEDREFS);
        }
    }
    
    public static class SISCExpression extends Value {
        public Expression e;
        
        SISCExpression(Expression e) {
            this.e=e;
        }

        public Value setAnnotation(Symbol key, Value v) {
            return e.setAnnotation(key, v);
        }
 
        public Set getAnnotationKeys() {
            return e.getAnnotationKeys();
        }

        public Value getAnnotation(Symbol key) {
            return e.getAnnotation(key);
        }

        public void display(ValueWriter w) throws IOException {
            w.append("#<").append(liMessage(SISCB, "expression")).append(' ').append(e.express()).append('>');
        }

        public void serialize(Serializer s) throws IOException {
            s.writeExpression(e);
        }

        public void deserialize(Deserializer s) throws IOException {
            e=s.readExpression();
        }

        public boolean visit(ExpressionVisitor v) {
            return v.visit(e);
        }

    }

    public Debugging(int id) {
        super(id);
    }
    
    public Debugging() {}

    CallFrame getCont(Value v) {
        if (v instanceof ApplyParentFrame)
            return ((ApplyParentFrame)v).c;
        else return cont(v);
    }
    
    public Value doApply(Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            switch(id) {
            case UNRESOLVEDREFS:
                FreeReference[] refs = FreeReference.allReferences();
                Pair res = EMPTYLIST;
                for (int i = 0; i < refs.length; i++) {
                    FreeReference ref = refs[i];
                    try {
                        ref.resolve();
                    } catch (UndefinedVarException ex) {
                        res = new Pair(ref.getName(), res);
                    }
                }
                return res;
            default:
                throwArgSizeException();
            }
        case 1:
            switch(id) {
            case QTYPE:
                return Quantity.valueOf(num(f.vlr[0]).type);
            case FREEXPQ:
                return truth(((SISCExpression)f.vlr[0]).e
                             instanceof FreeReferenceExp);
            case FRESYM:
                return ((FreeReferenceExp)((SISCExpression)f.vlr[0]).e).getSym();
            case FILLRIBQ:
                return truth(f.vlr[0] instanceof SISCExpression &&
                             ((SISCExpression)f.vlr[0]).e instanceof FillRibExp);
            case FILLRIBEXP:
                return new SISCExpression(((FillRibExp)((SISCExpression)f.vlr[0]).e).exp);
            case EXPRESSV:
                if (f.vlr[0] instanceof SISCExpression) {
                    return ((SISCExpression)f.vlr[0]).e.express();
                } else {
                    Closure c=(Closure)f.vlr[0];
                    return list(c.arity ? sym("infinite") : sym("finite"),
                                Quantity.valueOf(c.fcount), c.body.express());
                }
            case COMPILE:
                return new Closure(false, (short)0, 
                                   f.compile(f.vlr[0]), ZV, new int[0]);
            case ERROR_CONT_K:
                return getCont(f.vlr[0]);
            case CONT_VLK:
                return truth(getCont(f.vlr[0]).vlk);
            case CONT_NXP:
                CallFrame cn=getCont(f.vlr[0]);
                if (cn.nxp==null) return EMPTYLIST;
                return new SISCExpression(cn.nxp);
            case CONT_VLR:
                return new SchemeVector(getCont(f.vlr[0]).vlr);
            case CONT_ENV:
                return new Values(getCont(f.vlr[0]).env);
            case CONT_PARENT: 
                cn=getCont(f.vlr[0]);
                if (cn.parent==null) return EMPTYLIST;
                return cn.parent;
            default:
                throwArgSizeException();
            }
        case 2:
            switch (id) {
            case COMPILE:
                return new Closure(false, (short)0, 
                                   f.compile(f.vlr[0], env(f.vlr[1])), 
                                   ZV, new int[0]);
            default:
                throwArgSizeException();
            }
        default:
            throwArgSizeException();
        }
        return VOID;
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
