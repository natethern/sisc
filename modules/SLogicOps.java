package sisc.modules;

import java.awt.*;
import java.io.IOException;
import sisc.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.*;

public class SLogicOps extends ModuleAdapter {
    protected static final int
	LOGAND=1, LOGOR=2, LOGXOR=3, LOGNOT=4;

    public String getModuleName() {
	return "LogicalOps";
    }

    public SLogicOps() {
        define("logand", LOGAND);
        define("logor",  LOGOR);
        define("logxor", LOGXOR);
        define("lognot", LOGNOT);
    }

    public int fixed(Value v) {
        try {
            Quantity q=(Quantity)v;
            if (q.type==Quantity.FIXEDINT) return q.val;
            else throw new ClassCastException();
        } catch (ClassCastException e) { typeError("fixedinteger", v); }
	return -1;
    }

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        if (primid==LOGNOT) {
            if (f.vlr.length > 1) throwArgSizeException();
            return Quantity.valueOf(~fixed(f.vlr[0]));
        } else {
            int v=fixed(f.vlr[0]);
            switch(primid) {
            case LOGAND:
                for (int i=f.vlr.length-1; i>0; i--)
                    v&=fixed(f.vlr[i]);
                break;
            case LOGOR:
                for (int i=f.vlr.length-1; i>0; i--)
                    v|=fixed(f.vlr[i]);
                break;
            case LOGXOR:
                for (int i=f.vlr.length-1; i>0; i--)
                    v^=fixed(f.vlr[i]);
                break;
            }
            return Quantity.valueOf(v);
        }
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
