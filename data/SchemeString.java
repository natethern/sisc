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
import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class SchemeString extends Value {

    protected char[] data_c;
    protected String data_s;
    protected boolean sync_c, sync_s;

    public SchemeString() {}

    public SchemeString(String s) {
        data_s=s; 
        sync_s=true;
    }

    public SchemeString(char[] data) {
        data_c=data;
        sync_c=true;
    }

    public final boolean stringRepAvailable() {
        return sync_s;
    }

    public final boolean charRepAvailable() {
        return sync_c;
    }

    public String asString() {
        if (sync_s)
            return data_s;
        else {
            data_s=new String(data_c);
            sync_s=true;
            return data_s;
        }
    }

    public char[] asCharArray() {
        if (sync_c) 
            return data_c;
        else {
            data_c=data_s.toCharArray();
            sync_c=true;
            return data_c;
        }
    }

    public int length() {
        if (sync_c) return data_c.length;
        else return data_s.length();
    }

    public char charAt(int index) {
        if (sync_c) return data_c[index];
        else return data_s.charAt(index);
    }

    public boolean valueEqual(Value v) {
        if (!(v instanceof SchemeString)) return false;
        SchemeString o=(SchemeString)v;
        if (sync_s) {
            return o.asString().equals(data_s);
        } else {
            if (o.sync_c) {
                char[] oc=o.data_c;
                if (data_c.length!=oc.length) return false;
                for (int i=0; i<oc.length; i++) {
                    if (data_c[i]!=oc[i]) return false;
                }
                return true;
            } else {
                return asString().equals(o.data_s);
            }
        }
    }

    public SchemeString append(SchemeString other) {
        if (sync_c) {
            char[] oc=other.asCharArray();
            char[] newstr=new char[data_c.length + oc.length];
            System.arraycopy(data_c, 0, newstr, 0, data_c.length);
            System.arraycopy(oc, 0, newstr, data_c.length, oc.length);
            return new SchemeString(newstr);
        } else {
            return new SchemeString(data_s+other.asString());
        }
            
    }

    String display(boolean write) {
        if (!write) return asString();

        StringBuffer b=new StringBuffer();
        b.append('"');
        int lastGood=0;
        asCharArray();
        for (int i=0; i<data_c.length; i++) {
            char escapeChar;
            switch(data_c[i]) {
            case '"':  escapeChar = '"'; break;
            case '\\': escapeChar = '\\'; break;
            case '\b': escapeChar = 'b'; break;
            case '\t': escapeChar = 't'; break;
            case '\n': escapeChar = 'n'; break;
            case '\f': escapeChar = 'f'; break;
            default: continue;
            }
            
            b.append(data_c, lastGood, i-lastGood);
            b.append('\\').append(escapeChar);
            lastGood=i+1;
        }

        b.append(data_c, lastGood, data_c.length-lastGood);
        b.append('"');
        return b.toString();
    }

    public void set(int k, char c) {
        asCharArray()[k]=c;
        if (sync_s) {
            sync_s=false;
            data_s=null;
        }
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

    public void serialize(Serializer s) throws IOException {
        s.writeUTF(asString());
    }

    public void deserialize(Deserializer s) throws IOException {
        data_s=s.readUTF();
        sync_s=true;
    }
}


