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
package sisc.modules;

import sisc.*;
import sisc.data.*;
import sisc.exprs.*;
import java.awt.*;
import java.util.Set;
import java.util.Iterator;

public class SDebug extends ModuleAdapter {

    public String getModuleName() {
        return "Debugging";
    }

    protected static final int 
        EXPRESSV=0, COMPILE=1,
        CONT_VLR=2, CONT_NXP=3, CONT_ENV=4, CONT_FK=5,
        CONT_LOCKQ=6, CONT_PARENT=7, 
        ERROR_CONT_K=8,
        FILLRIBQ=9, FILLRIBEXP=10, FREEXPQ=11, FRESYM=12;

    public SDebug() {
        define("express", EXPRESSV);
        define("compile", COMPILE);
        define("error-continuation-k", ERROR_CONT_K);
        define("continuation-vlr", CONT_VLR);
        define("continuation-nxp", CONT_NXP);
        define("continuation-env", CONT_ENV);
        define("continuation-fk", CONT_FK);
        define("continuation-stk", CONT_PARENT);
        define("continuation-captured?", CONT_LOCKQ);
        define("_fill-rib?", FILLRIBQ);
        define("_fill-rib-exp", FILLRIBEXP);
        define("_free-reference-exp?", FREEXPQ);
        define("_free-reference-symbol", FRESYM);
    }

    class SISCExpression extends Value {
        protected Expression e;
        
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

        public String display() {
            return "#<expression "+e.express().write()+'>';
        }
    }

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 1:
            switch(primid) {
            case FREEXPQ:
                return truth(((SISCExpression)f.vlr[0]).e
                             instanceof FreeReferenceExp);
            case FRESYM:
                return ((FreeReferenceExp)((SISCExpression)f.vlr[0]).e).sym;
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
                return new Closure(false, (short)0, f.compile(f.vlr[0]), f.env);
            case ERROR_CONT_K:
                return (f.vlr[0] instanceof ApplyParentFrame ? 
                        ((ApplyParentFrame)f.vlr[0]).c :
                        f.vlr[0]);
            case CONT_LOCKQ:
                if (f.vlr[0] instanceof ApplyParentFrame)
                    f.vlr[0]=((ApplyParentFrame)f.vlr[0]).c;
                CallFrame cn=cont(f.vlr[0]);
                return truth(cn.vlk);
            case CONT_NXP:
                if (f.vlr[0] instanceof ApplyParentFrame)
                    f.vlr[0]=((ApplyParentFrame)f.vlr[0]).c;
                cn=cont(f.vlr[0]);
                if (cn.nxp==null) return EMPTYLIST;
                return new SISCExpression(cn.nxp);
            case CONT_VLR:
                if (f.vlr[0] instanceof ApplyParentFrame)
                    f.vlr[0]=((ApplyParentFrame)f.vlr[0]).c;
                cn=cont(f.vlr[0]);
                return new SchemeVector(cn.vlr);
            case CONT_ENV:
                if (f.vlr[0] instanceof ApplyParentFrame)
                    f.vlr[0]=((ApplyParentFrame)f.vlr[0]).c;
                cn=cont(f.vlr[0]);
                return cn.env;
            case CONT_PARENT: 
                if (f.vlr[0] instanceof ApplyParentFrame)
                    f.vlr[0]=((ApplyParentFrame)f.vlr[0]).c;
                cn=cont(f.vlr[0]);
                if (cn.parent==null) return EMPTYLIST;
                return cn.parent;
            default:
                throwArgSizeException();
            }
        default:
            throwArgSizeException();
        }
        return VOID;
    }
}
