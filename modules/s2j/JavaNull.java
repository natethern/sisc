package sisc.modules.s2j;

import java.lang.reflect.*;

import sisc.data.*;
import sisc.interpreter.*;

import java.io.IOException;

import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class JavaNull extends JavaObject {

    public byte getObjType() {
        return JNULL;
    }

    public JavaNull() {}

    public void serialize(Serializer s) throws IOException {
        s.writeUTF(Util.nameType((Class)obj));
    }

    public void deserialize(Deserializer s) throws IOException {
        obj = Util.resolveType(s.readUTF());
    }

    public JavaNull(Class c) {
        this.obj = c;
    }

    public Object get() {
        return null;
    }

    public Class classOf() {
        return (Class)obj;
    }

    public String display() {
        StringBuffer b=new StringBuffer();
        b.append("#<jnull ");
        b.append(obj);
        b.append('>');
        return b.toString();
    }

    public boolean eq(Object v) {
        return (this == v || (v instanceof JavaNull
                              && obj == ((JavaNull)v).obj));
    }

    public boolean valueEqual(Value v) {
        //all java-nulls are equal?
        return (v instanceof JavaNull);
    }

    public void apply(Interpreter r)
        throws ContinuationException {
        r.nxp = null;
        error(r, liMessage(Util.S2JB, "cannotapplynull"));
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
