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

import sisc.Util;
import java.util.Hashtable;
import java.io.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class SchemeCharacter extends Value {
    static final Hashtable humanReadables=new Hashtable(8);

    static {
        humanReadables.put(new SchemeCharacter(' '), "#\\space");
        humanReadables.put(new SchemeCharacter('\u0008'), "#\\backspace");
        humanReadables.put(new SchemeCharacter('\u007f'), "#\\rubout");
        humanReadables.put(new SchemeCharacter('\u000c'), "#\\page");
        humanReadables.put(new SchemeCharacter('\t'), "#\\tab");
        humanReadables.put(new SchemeCharacter('\n'), "#\\newline");
        humanReadables.put(new SchemeCharacter('\r'), "#\\return");
        humanReadables.put(new SchemeCharacter((char)0), "#\\nul");
    }

    public char c;

    public SchemeCharacter(char c) {
        this.c=c;
    }

    public String display() {
        return ""+c;
    }

    public String write() {
        String hr=(String)humanReadables.get(this);
        if (hr!=null) return hr;
        StringBuffer b=new StringBuffer();
        b.append("#\\");
        if (c<128 && c>31)
            b.append(c);
        else b.append(justify(Integer.toOctalString(c),3,'0'));
        return b.toString();
    }

    public boolean eq(Object v) {
        return (v instanceof SchemeCharacter &&
                ((SchemeCharacter)v).c==c);
    }

    public int hashCode(){
        return (int)c;
    }

    public void serialize(Serializer s) throws IOException {
        if (SERIALIZATION) {
            s.writeChar(c);
        }
    }

    public SchemeCharacter() {}

    public void deserialize(Deserializer s) throws IOException {
        if (SERIALIZATION) {
            c=s.readChar();
        }
    }
}

