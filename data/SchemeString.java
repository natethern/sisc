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

public class SchemeString extends Value {
    public char[] stringdata;

    public SchemeString() {}

    public SchemeString(String s) {
        this(s.toCharArray());
    }

    public SchemeString(char[] data) {
        stringdata=data;
    }

    public boolean valueEqual(Value v) {
        if (!(v instanceof SchemeString)) return false;
        char[] o=((sisc.data.SchemeString)v).stringdata;
        if (stringdata.length!=o.length) return false;
        for (int i=0; i<o.length; i++) {
            if (stringdata[i]!=o[i]) return false;
        }
        return true;
    }

    public SchemeString append(SchemeString other){
        char[] newstr=new char[stringdata.length + other.stringdata.length];
        System.arraycopy(stringdata, 0, newstr, 0, stringdata.length);
        System.arraycopy(other.stringdata, 0,
                         newstr, stringdata.length,
                         other.stringdata.length);
        return new SchemeString(newstr);
    }

    String display(boolean write) {
        StringBuffer b=new StringBuffer();
        if (write) {
            b.append('"');
            int lastGood=0;
            for (int i=0; i<stringdata.length; i++)
                if (stringdata[i]=='"' || stringdata[i]=='\\') {
                    b.append(stringdata, lastGood, i-lastGood);
                    b.append('\\').append(stringdata[i]);
                    lastGood=i+1;
                }
            b.append(stringdata, lastGood, stringdata.length-lastGood);
            b.append('"');
        } else
            b.append(stringdata);
        return b.toString();
    }

    public void set(int k, char c) {
        stringdata[k]=c;
    }

    public String display() {
        return display(false);
    }

    public String write() {
        return display(true);
    }

    public String toString() {
        return write();
    }

    public Object javaValue() {
        return new String(stringdata);
    }

    public void serialize(Serializer s, DataOutputStream dos) throws IOException {
        if (SERIALIZATION) {
            dos.writeUTF(new String(stringdata));
        }
    }

    public void deserialize(Serializer s, DataInputStream dis)
    throws IOException {
        if (SERIALIZATION) {
            stringdata=dis.readUTF().toCharArray();
        }
    }
}


