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

import java.util.*;
import java.io.*;
import sisc.data.*;

public class LexicalEnvironment extends Value {
    public LexicalEnvironment parent;
    public Value[] vals;
    //    public boolean locked;

    public LexicalEnvironment() {
        this.vals=ZV;
    }

    public LexicalEnvironment(Interpreter r, Closure c) 
	throws ContinuationException {
        parent=c.env;
        Value[] v=r.vlr;
        int vl=v.length;
        if (!c.arity) {
            if (vl == c.fcount) {
                vals=v;
                return;
            }
            error(r, liMessage(SISCB,"notenoughargsto", c.write(),
                               c.fcount, vl));
            return;
        }
        
        int sm1=c.fcount-1;
        if (vl < sm1) {
            error(r, liMessage(SISCB,"notenoughargstoinf", c.write(),
                               sm1, vl));
            return;
        }

        if (vl > sm1 && !r.vlk) {
            vals=v;
        } else {
            vals=r.createValues(sm1+1);
            System.arraycopy(v, 0, vals, 0, sm1);
        }

        vals[sm1]=valArrayToList(v, sm1, vl-sm1);
    }

    public final Value lookup(int depth, int pos) {
        LexicalEnvironment e = this;
        while(depth-- > 0) 
	    e = e.parent;
	
        return e.vals[pos];
    }

    public final void set(int depth, int pos, Value v) {
        LexicalEnvironment e = this;
        while(depth > 0) {
	    depth--;
	    e = e.parent;
	}
        e.vals[pos]=v;
    }

    public String display() {
        return "#<environment>";
    }

    public void serialize(Serializer s, DataOutput dos) throws IOException {
        if (SERIALIZATION) {
	    //dos.writeBoolean(locked);
            s.writeBer(vals.length, dos);
            for (int i=0; i<vals.length; i++)
                s.serialize(vals[i], dos);
            if (parent==null)
                dos.writeBoolean(false);
            else {
                dos.writeBoolean(true);
                s.serialize(parent, dos);
            }
        }
    }

    public void deserialize(Serializer s, DataInput dis)
    throws IOException {
        if (SERIALIZATION) {
	    //locked=dis.readBoolean();
            int size=s.readBer(dis);
            vals=new Value[size];

            for (int i=0; i<size; i++)
                vals[i]=(Value)s.deserialize(dis);

            if (dis.readBoolean()) {
                parent=(LexicalEnvironment)s.deserialize(dis);
            }
            else parent=null;
        }
    }
}




