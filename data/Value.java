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
package sisc.data;

import sisc.*;
import java.io.*;

public abstract class Value extends Expression implements Immediate {

    public abstract String display();

    public String synopsis() {
	return synopsis(DEFAULT_SYNOPSIS_LENGTH);
    }

    /** 
     * Only this function need be overridden
     */
    public String synopsis(int limit) {
	String v=write();
	if (v.length() > limit)
	    return write().substring(0,limit)+"...";
	else return v;
    }

    public String write() {
        return display();
    }

    public boolean equals(Object v) {
        return eq(v);
    }

    public boolean eq(Object v) {
        return this==v;
    }

    public boolean valueEqual(Value v) {
        return eq(v) || equals(v);
    }

    public String toString() {
        return display();
    }

    public void eval(Interpreter r) throws ContinuationException {
        r.acc=this;
        r.nxp=null;
    }

    public Value getValue(Interpreter r) throws ContinuationException {
        return this;
    }

    public Value express() {
        return this;
    }
}






