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
import sisc.compiler.*;
import java.io.*;

public class BuiltinProcedure extends Procedure {
    public int id;
    public Module host;

    public BuiltinProcedure(Module host, String name, int id) {
	this(host, Symbol.get(name),id);
    }

    public BuiltinProcedure(Module host, Symbol name, int id) {
	this.id=id;
	this.name=name;
	this.host=host;
    }

     public void apply(Interpreter r) throws ContinuationException {
	r.nxp=null;
	try {
	    Value v=host.eval(id, r);
	    if (v!=null) r.acc=v;
	} catch (ArrayIndexOutOfBoundsException np) {
	    error(r, name, "incorrect number of arguments to procedure");
	} catch (ClassCastException cc) {
	    error(r, name, "got unexpected value "+cc.getMessage());
	} catch (RuntimeException re) {
	    error(r, name, re.getMessage());
	}
    }

    public String display() {
	return displayNamedOpaque("builtin procedure");
    }

    public boolean valueEqual(Value v) {
	return ((BuiltinProcedure)v).id==id &&
	    ((BuiltinProcedure)v).host==host;
    }

    public void serialize(Serializer s, 
			  DataOutputStream dos) throws IOException {
	if (SERIALIZATION) {
	    s.serializeModule(host, dos);
	    s.writeBer(id, dos);
	    s.serialize(name, dos);
	}
    }

    public BuiltinProcedure() {}

    public void deserialize(Serializer s, 
			    DataInputStream dis) 
	throws IOException {
	if (SERIALIZATION) {
	    host=s.retrieveModule(dis);
	    id=s.readBer(dis);
	    name=(Symbol)s.deserialize(dis);
	}
    }
}	
	
    
