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
package sisc.exprs;

import sisc.*;
import sisc.data.*;
import java.io.*;

public class AppExp extends Expression {
    public Expression exp, rands[], nxp;
    public boolean nonTail, allImmediate;

    public AppExp(Expression exp, Expression rands[], Expression nxp, 
		  boolean nontail, boolean allImmediate) {
        this.exp=exp;
        this.rands=rands;
        this.nxp = nxp;
        this.nonTail=nontail;
        this.allImmediate=allImmediate;
    }

    public void eval(Interpreter r) throws ContinuationException {

        if (nonTail) 
            r.push(null);

        r.vlr = r.createValues(rands.length);

	    Expression ex;
	    // Load the immediates from right to left
	    for (int i = rands.length-1; i>=0; i--) {
            ex=rands[i];
            if (ex != null)
                r.vlr[i] = ex.getValue(r);
	    }

        if (allImmediate) {
            r.acc=exp.getValue(r);
            r.nxp=nxp;
        } else {
            r.push(nxp);
            r.nxp=exp;
        }
    }

    public Value express() {
        Pair args=EMPTYLIST;
        for (int i=rands.length-1; i>=0; i--) {
            args=new Pair(((rands[i]==null) ? FALSE : rands[i].express()), args);
        }
        args = new Pair(exp.express(), new Pair(nxp.express(), args));
        return new Pair(nonTail ? sym("App-exp") : sym("TailApp-exp"), args);
    }

    public void serialize(Serializer s, DataOutput dos) throws IOException {
        if (SERIALIZATION) {
            s.serialize(exp, dos);
            s.writeBer(rands.length, dos);
            for (int i=0; i<rands.length; i++) {
                s.serialize(rands[i], dos);
            }
            s.serialize(nxp, dos);
            s.writeBer((nonTail ? 2 : 0) |
                       (allImmediate ? 1 : 0), dos);
        }
    }

    public AppExp() {}

    public void deserialize(Serializer s, DataInput dis)
    throws IOException {
        if (SERIALIZATION) {
            exp=s.deserialize(dis);
            int size=s.readBer(dis);
            rands=new Expression[size];
            for (int i=0; i<size; i++) {
                rands[i]=s.deserialize(dis);
            }
            nxp=s.deserialize(dis);
            int flags=s.readBer(dis);
            allImmediate=(flags & 0x1)!=0;
            nonTail=(flags & 0x2)!=0;
        }
    }
}



