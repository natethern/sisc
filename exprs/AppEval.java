package sisc.exprs;

import sisc.*;
import sisc.data.*;
import java.io.*;

public class AppEval extends Expression {

    public void eval(Interpreter r) throws ContinuationException {
        /* To allow break of execution (turadg)
         */
        if (PERMITINTERRUPTS && r.tctx.interrupt) {
           r.push(this);
           r.push(r.acc);
           r.nxp=null;
           r.tctx.interrupt = false;
           error(r, liMessage(SISCB, "evaluationinterrupted"));
        }

        try {
            ((Procedure)r.acc).apply(r);
        } catch (ClassCastException c) {
            error(r, liMessage(SISCB,"nonprocapp", r.acc.synopsis()));
        }
    }

    public Value express() {
        return list(sym("App-Eval"));
    }

    public AppEval() {}

    public boolean equals(Object o) {
        if (!(o instanceof AppEval)) return false;
        AppEval other=(AppEval)o;
        return (annotations!=null ? 
                annotations.equals(other.annotations) :
                other.annotations == null);
    }

    public int hashCode() {
        return 0x37895f61 ^ (annotations == null ? 0 : 
                             annotations.hashCode());
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
