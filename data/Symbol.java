package sisc.data;

import java.io.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class Symbol extends Value {

    public static boolean caseSensitive;

    public static Symbol getUnique(String str) {
        return new Symbol(str);
    }

    public static Symbol intern(String str) {
        return MemoizedSymbol.intern(str);
    }

    public static Symbol get(String str) {
        int l = str.length();
        if (l>1 && str.charAt(0)=='|' && str.charAt(l-1) == '|')
            return intern(str.substring(1,l-1));
        else
            return intern(caseSensitive ? str : str.toLowerCase());
    }

    public String symval;

    public Symbol(String symval) {
        this.symval=symval;
    }

    public Symbol normalize() {
        return Symbol.get(symval.toLowerCase());
    }

    public String display() {
        return symval;
    }
    
    public String write() {
        if (symval.toLowerCase().equals(symval))
            return symval;
        else {
            StringBuffer b=new StringBuffer("|");
            b.append(symval).append('|');
            return b.toString();
        }
    }

    public Symbol() {}

    public void serialize(Serializer s) throws IOException {
        s.writeUTF(symval);
    }

    public void deserialize(Deserializer s) throws IOException {
        symval = s.readUTF();
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
