package sisc.nativefun;

import java.io.*;
import sisc.interpreter.*;
import sisc.data.*;
import sisc.io.ValueWriter;

/**
 * A native procedure is a Scheme procedure whose behavior when
 * applied is implemented in Java code.
 */
public abstract class NativeProcedure extends Procedure implements NamedValue {

    /**
     * A NativeProcedure instance must implement this method, which
     * performs the actual processing specific to that procedure, and
     * returns a Value.
     */
    public abstract Value doApply(Interpreter r) throws ContinuationException;

    public void apply(Interpreter r) throws ContinuationException {
        //long start=System.currentTimeMillis();
        r.lxp=r.nxp;
        r.nxp=null;
        try {
	    r.acc=doApply(r);

	    // If we don't have a next expression, this procedure
	    // application is finished, and the Value rib is 
	    // up for recycling
            if (r.nxp == null) {
                r.returnVLR();
            }
        } catch (ClassCastException cc) {
            error(r, getName(), liMessage(SISCB,"gotunexpectedvalue",
                                     cc.getMessage()));
        } catch (NestedPrimRuntimeException npr) {
            error(r, getName(), npr);
        } catch (RuntimeException re) {
            //re.printStackTrace();
            String msg = re.getMessage();
            if (msg == null) msg = re.toString();
            error(r, getName(), msg);
        }
        //time+=System.currentTimeMillis()-start;
    }

    public static void error(Interpreter r, Value where, 
                             NestedPrimRuntimeException parent) 
        throws ContinuationException {
        SchemeException rootCauseException=parent.getRootCause();
        Pair rootCause=new Pair(new Pair(ERRORK, rootCauseException.e),
                                new Pair(new Pair(FCONT, rootCauseException.f),
                                         rootCauseException.m));
        String parentMessage=parent.getMessage();
        error(r, (parentMessage == null ?
                  list(new Pair(LOCATION, where),
                       new Pair(PARENT, rootCause)) :
                  list(new Pair(MESSAGE, new SchemeString(parentMessage)),
                       new Pair(LOCATION, where),
                       new Pair(PARENT, rootCause))));
    }

    public void display(ValueWriter w) throws IOException {
        displayNamedOpaque(w, "native procedure");
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

