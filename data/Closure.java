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

public class Closure extends Procedure {
    public boolean arity;
    public int fcount;
    public LexicalEnvironment env;
    public Expression body;
    
    public Closure(boolean arity, int fcount, Expression body,
		   LexicalEnvironment env) {
	this.arity=arity;
	this.fcount=fcount;
	this.env=env;
	this.body=body;
    }

    public void apply(Interpreter r) throws ContinuationException {	
	r.env=new LexicalEnvironment(fcount, r.vlr, 
				     env, arity, r, this);
	r.nxp=body;
    }

    public String display() {
	return displayNamedOpaque("procedure");
    }

    public void serialize(Serializer s, DataOutputStream dos) throws IOException {
	if (SERIALIZATION) {
	    s.serialize(name, dos);
	    dos.writeBoolean(arity);
	    s.writeBer(fcount, dos);
	    s.serialize(env, dos);
	    s.serialize(body, dos);
	}
    }

    public Closure() {}

    public void deserialize(Serializer s, DataInputStream dis) 
	throws IOException {
	if (SERIALIZATION) {
	    name=(Symbol)s.deserialize(dis);
	    arity=dis.readBoolean();
	    fcount=s.readBer(dis);
	    env=(LexicalEnvironment)s.deserialize(dis);
	    body=s.deserialize(dis);
	}
    }
}	
	







