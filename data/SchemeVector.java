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

import java.util.Vector;
import sisc.Serializer;
import java.io.*;

public class SchemeVector extends Value {
    public Value[] vals;
    protected int lastUnique=-1;

    public SchemeVector(int count) {
	this(count, Quantity.ZERO);
    }

    public SchemeVector(int count, Value initializer) {
	vals=new Value[count];
	for (int i=0; i<vals.length; i++) {
	    vals[i]=initializer;
	}
    }

    public SchemeVector(Value[] v) {
	vals=v;
    }

    public boolean valueEqual(Value v) {
	if (!(v instanceof SchemeVector)) return false;
	SchemeVector o=(SchemeVector)v;
	if (o.vals.length!=vals.length)
	    return false;

	for (int i=0; i<vals.length; i++) {
	    if (!vals[i].valueEqual(o.vals[i]))
		return false;
	}
	return true;
    }

    public int findEnd() {
        if (lastUnique > -1) return lastUnique;
	if (vals.length>1) {
	    Value v=vals[vals.length-1];
	    for (int i=vals.length-2; i>=0; i--) 
		if (!vals[i].eq(v)) return lastUnique=i+2;
	    return lastUnique=1;
	} 
	return lastUnique=vals.length;
    }
	
    void display(StringBuffer b, boolean write) {
	int l=findEnd();
	for (int i=0; i<l; i++) {
	    b.append((write ? vals[i].write() : vals[i].display()));
	    if (i+1<l) b.append(' ');
	}
    }

    public String display() {
	StringBuffer b=new StringBuffer();
	b.append("#(");
	display(b, false);
	b.append(')');
	return b.toString();
    }

    public void set(int idx, Value v) {
        lastUnique=-1;
	vals[idx]=v;
    }

    public String write() {
	StringBuffer b=new StringBuffer();
	b.append('#').append(vals.length).append('(');
	display(b, true);
	b.append(')');
	return b.toString();
    }

    public Object javaValue() {
	Object[] v=new Object[vals.length];
	for (int i=0; i<vals.length; i++) 
	    v[i]=vals[i].javaValue();
	return v;
    }

    public void serialize(Serializer s, DataOutputStream dos) 
	throws IOException {
	if (SERIALIZATION) {
	    s.writeBer(vals.length, dos);
	    for (int i=0; i<vals.length; i++) {
		s.serialize(vals[i], dos);
	    }
	}
    }

    public SchemeVector() {}

    public void deserialize(Serializer s, DataInputStream dis) 
	throws IOException {
	if (SERIALIZATION) {
	    vals=new Value[s.readBer(dis)];
	    for (int i=0; i<vals.length; i++) {
		vals[i]=(Value)s.deserialize(dis);
	    }
	}
    }
}




