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

import java.util.WeakHashMap;
import java.io.*;
import sisc.Serializer;

public class Symbol extends Value implements Singleton, Comparable {

    public static WeakHashMap memo=new WeakHashMap(100);

    public static boolean caseSensitive;

    public static Symbol getUnique(String str) {
        return new Symbol(str);
    }

    public static Symbol intern(String str) {
	synchronized(memo) {
	    Symbol s=(Symbol)memo.get(str);
	    if (s==null) {
		s=new Symbol(str);
		memo.put(str, s);
	    }
	    return s;
	}
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

    public int hashCode() {
        return symval.hashCode();
    }

    private void writeObject(java.io.ObjectOutputStream out)
    throws IOException {
        out.writeObject(symval);
        out.writeBoolean(memo.get(symval)!=null);
    }

    public Object readResolve() throws ObjectStreamException {
        Object replacement=memo.get(symval);
        if (replacement==null) return this;
        return replacement;
    }

    private void readObject(java.io.ObjectInputStream in)
    throws IOException, ClassNotFoundException {
        String s=(String)in.readObject();
        symval=(caseSensitive ? s : s.toLowerCase());
        boolean interned=in.readBoolean();
        if (interned) {
            if (memo.get(symval)==null)
                memo.put(symval, this);
        }
    }

    public void serialize(Serializer s, DataOutputStream dos) throws IOException {
        if (SERIALIZATION) {
	    dos.writeBoolean(memo.containsKey(this));
            dos.writeUTF(symval);
        }
    }

    public Symbol() {}

    public static Expression getValue(DataInputStream dis) throws IOException {
	if (dis.readBoolean())
	    return new Symbol(dis.readUTF());
	else 
	    return intern(dis.readUTF());
    }

    public int compareTo(Object o) {
	if (!(o instanceof Symbol)) return -1;
	return symval.compareTo(((Symbol)o).symval);
    }
}







