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
package sisc;

import sisc.data.*;
import sisc.exprs.*;
import java.util.Stack;
import java.io.*;
import java.lang.ref.*;

public class CallFrame extends Procedure {

    public boolean lock;
    public Expression            nxp;
    public Value[]               vlr;
    public LexicalEnvironment    env;
    public CallFrame              fk;
    public CallFrame          parent;
    
    public CallFrame(Expression n, Value[] v,
                     LexicalEnvironment e,
                     CallFrame f, CallFrame p) {
        nxp=n;
        vlr=v;
        env=e;
        fk=f;
        parent=p;
    }

    public CallFrame capture(Interpreter r) {
        if (!lock) {
            lock=true;

            if (vlr!=null) {
                Value[] nvlr=r.createValues(vlr.length);
                System.arraycopy(vlr,0,nvlr,0,nvlr.length);
                vlr=nvlr;
            }

            if (parent!=null)
                parent.capture(r);

            if (fk!=null)
                fk.capture(r);
        }

        return this;
    }

    public void apply(Interpreter r) throws ContinuationException {
        if (r.vlr.length==1) {
            r.acc=r.vlr[0];
        }
        else r.acc=new Values(r.vlr);
        r.pop(this);
    }

    public String display() {
        return displayNamedOpaque("continuation");
    }

    public void serialize(Serializer s, DataOutput dos) throws IOException {
        if (SERIALIZATION) {
            if (vlr==null)
                dos.writeBoolean(false);
            else {
                dos.writeBoolean(true);
                s.writeBer(vlr.length, dos);
                for (int i=0; i<vlr.length; i++)
                    s.serialize(vlr[i], dos);
            }
            s.serialize(nxp, dos);
            s.serialize(fk, dos);

            s.serialize(parent, dos);
            s.serialize(env, dos);
            dos.writeBoolean(lock);
        }
    }

public CallFrame() {}

    public void deserialize(Serializer s, DataInput dis)
    throws IOException {
        if (SERIALIZATION) {
            vlr=null;
            if (dis.readBoolean()) {
                int size=s.readBer(dis);
                vlr=new Value[size];
                for (int i=0; i<size; i++)
                    vlr[i]=(Value)s.deserialize(dis);
            }
            nxp=s.deserialize(dis);
            fk=(CallFrame)s.deserialize(dis);
            parent=(CallFrame)s.deserialize(dis);
            env=(LexicalEnvironment)s.deserialize(dis);
            lock=dis.readBoolean();
        }
    }
}


