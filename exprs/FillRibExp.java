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
import java.util.*;
import java.io.*;

public class FillRibExp extends Expression implements Volatile {

    public Expression rands[], last, cleanup;
    public int pos;
    public boolean locked;

    public FillRibExp(int pos, Expression rands[], Expression last,
                      Expression cleanup) {
        this.pos=pos;
        this.rands=rands;
        this.last=last;
        this.cleanup=cleanup;
    }

    public void eval(Interpreter r) throws ContinuationException {
        r.vlr[pos]=r.acc;

        int np=pos-1;
	Value tmp;

        for (np=pos-1;
                np>=0 && ((tmp=rands[np].getValue(r)) != null);
                np--) {
            r.vlr[np]=tmp;
        }

        if (np < 0) {
            tmp=last.getValue(r);
            if (tmp==null) {
                r.push(cleanup);
                r.nxp=last;
            } else {
                r.acc=tmp;
                r.nxp=cleanup;
            }
            r.returnFillRib(this);
        } else {
            if (locked) {
                r.push(r.createFillRib(np, rands, last, cleanup));
            } else {
                pos=np;
                r.push(this);
            }
            r.nxp=rands[np];
        }
    }

    public void lock() {
        locked=true;
    }

    public Value express() {
        return list(sym("FillRib-exp"), rands[pos].express(), last.express());
    }

    public void serialize(Serializer s, DataOutputStream dos) throws IOException {
        if (SERIALIZATION) {
            s.writeBer(rands.length, dos);
            for (int i=0; i<rands.length; i++)
                s.serialize(rands[i], dos);
            s.serialize(last, dos);
            s.serialize(cleanup, dos);
            s.writeBer(pos, dos);
            dos.writeBoolean(locked);
        }
    }

    public FillRibExp() {}

    public void deserialize(Serializer s, DataInputStream dis)
    throws IOException {
        if (SERIALIZATION) {
            int size=s.readBer(dis);
            rands=new Expression[size];
            for (int i=0; i<size; i++)
                rands[i]=s.deserialize(dis);
            last=s.deserialize(dis);
            cleanup=s.deserialize(dis);
            pos=s.readBer(dis);

            locked=dis.readBoolean();
        }
    }
}


