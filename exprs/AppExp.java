package sisc.exprs;

import sisc.*;
import sisc.data.*;
import java.io.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class AppExp extends Expression {
    public Expression exp, rands[], nxp;
    public boolean allImmediate;

    public AppExp(Expression exp, Expression rands[], Expression nxp, 
                  boolean allImmediate) {
        this.exp=exp;
        this.rands=rands;
        this.nxp = nxp;
        this.allImmediate=allImmediate;
    }

    public void eval(Interpreter r) throws ContinuationException {

        r.newVLR(rands.length);

        if (allImmediate) {
            r.nxp=nxp;
            r.acc=exp.getValue(r);
        } else {
            r.push(nxp);
            r.nxp=exp;
        }

	    Expression ex;
	    // Load the immediates from right to left
	    for (int i = rands.length-1; i>=0; i--) {
            ex=rands[i];
            if (ex != null)
                r.vlr[i] = ex.getValue(r);
	    }

    }

    public Value express() {
        Pair args=EMPTYLIST;
        for (int i=rands.length-1; i>=0; i--) {
            args=new Pair(((rands[i]==null) ? FALSE : rands[i].express()), args);
        }
        args = new Pair(exp.express(), new Pair(nxp.express(), args));
        return new Pair(sym("App-exp"), args);
    }

    public void serialize(Serializer s) throws IOException {
        s.writeExpression(exp);
        s.writeInt(rands.length);
        for (int i=0; i<rands.length; i++) {
            s.writeExpression(rands[i]);
        }
        s.writeExpression(nxp);
        s.writeBoolean(allImmediate);
    }

    public AppExp() {}

    public void deserialize(Deserializer s) throws IOException {
        exp=s.readExpression();
        int size=s.readInt();
        rands=new Expression[size];
        for (int i=0; i<size; i++) {
            rands[i]=s.readExpression();
        }
        nxp=s.readExpression();
        allImmediate=s.readBoolean();
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
