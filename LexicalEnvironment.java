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

    public LexicalEnvironment() {
	this(new Value[0]);
    }

    LexicalEnvironment(Value[] v, LexicalEnvironment parent) {
	this.vals=v;
	this.parent=parent;
    }

    public LexicalEnvironment(Value[] v) {
	this((short)v.length, v, null);
    }

    public LexicalEnvironment(short s, Value[] v, LexicalEnvironment parent) {
	this(s, v, parent, false);
    }

    public LexicalEnvironment(short s, Value[] v, LexicalEnvironment parent,
			      boolean infiniteArity) throws IllegalArgumentException {
	this.parent=parent;

	if (infiniteArity) {
	    short sm1=(short)(s-1);
	    if (v.length < sm1) 
		throw new IllegalArgumentException();
	    vals=new Value[s];
	    System.arraycopy(v, 0, vals, 0, sm1);
	    vals[sm1]=valArrayToList(v, sm1, v.length-sm1);

	} else {
	    if (v.length!=s) 
		throw new IllegalArgumentException();
	    vals=v;
	}
    }

    public Value lookup(short depth, short pos) {
	LexicalEnvironment e = this;
	while(depth-- > 0) e = e.parent;
	return e.vals[pos];
    }

    public void set(short depth, short pos, Value v) {
	LexicalEnvironment e = this;
	while(depth-- > 0) e = e.parent;
	e.vals[pos]=v;
    }

    public String display() {
	return "#<environment>";
    }

    public void serialize(Serializer s, DataOutputStream dos) throws IOException {
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

    public void deserialize(Serializer s, DataInputStream dis) 
	throws IOException {
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




