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
package sisc.debug;

import sisc.*;
import sisc.data.*;
import java.awt.*;

public class SDebug extends ModuleAdapter {
    public String getModuleName() {
	return "Debugging";
    }

    protected static final int 
	EXPRESSV=0, COMPILE=1,
	CONT_VLR=2, CONT_NXP=3, CONT_ENV=4, CONT_FK=5,
	CONT_LOCKQ=6;

    public SDebug() {
        define("express", EXPRESSV);
        define("compile", COMPILE);
        define("continuation-vlr", CONT_VLR);
        define("continuation-nxp", CONT_NXP);
        define("continuation-env", CONT_ENV);
        define("continuation-fk", CONT_FK);
        define("continuation-captured?", CONT_LOCKQ);
    }

    class SISCExpression extends Value {
        protected Expression e;

        SISCExpression(Expression e) {
            this.e=e;
        }

        public String display() {
            return "#<expression "+e.express().write()+'>';
        }
    }

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 1:
            switch(primid) {
            case EXPRESSV:
                Closure c=(Closure)f.vlr[0];
                return list(c.arity ? sym("infinite") : sym("finite"),
                            Quantity.valueOf(c.fcount), c.body.express());
            case COMPILE:
                return new Closure(false, (short)0, f.compile(f.vlr[0]), f.env);
            case CONT_LOCKQ:
                CallFrame cn=cont(f.vlr[0]);
                return truth(cn.lock);
            case CONT_NXP:
                cn=cont(f.vlr[0]);
                if (cn.nxp==null) return EMPTYLIST;
                return new SISCExpression(cn.nxp);
            case CONT_VLR:
                cn=cont(f.vlr[0]);
                return new SchemeVector(cn.vlr);
            case CONT_ENV:
                cn=cont(f.vlr[0]);
                return cn.env;
            default:
                throwArgSizeException();
            }
        default:
	    throwArgSizeException();
        }
	return VOID;
    }
}
