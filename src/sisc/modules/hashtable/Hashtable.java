package sisc.modules.hashtable;

import sisc.data.*;
import sisc.interpreter.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;
import java.io.IOException;
import sisc.io.ValueWriter;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;
import sisc.util.Util;
import sisc.modules.SThread.Mutex;

public abstract class Hashtable extends Value {

    private HashMap ht;

    public Hashtable() {
        this.ht = new HashMap(0);
    }

    protected abstract Object makeKey(Value k);

    protected abstract Value getKey(Object o);

    public Value get(Value k) {
        return (Value)ht.get(makeKey(k));
    }

    public Value put(Value k, Value v) {
        return (Value)ht.put(makeKey(k), v);
    }

    public Value remove(Value k) {
        return (Value)ht.remove(makeKey(k));
    }

    public int size() {
        return ht.size();
    }

    public void clear() {
        ht.clear();
    }

    private Value getMapKey(Map.Entry e) {
        return getKey(e.getKey());
    }

    private Value getMapValue(Map.Entry e) {
        return (Value)e.getValue();
    }

    public void addAList(Pair p) {
        for (; p != EMPTYLIST; p = pair(p.cdr)) {
            Pair entry = pair(p.car);
            put(entry.car, entry.cdr);
        }
    }

    public Pair toAList() {
        Iterator i = ht.entrySet().iterator();
        Pair res = EMPTYLIST;
        while(i.hasNext()) {
            Map.Entry e = (Map.Entry)i.next();
            res = new Pair(new Pair(getMapKey(e), getMapValue(e)), res);
        }
        return res;
    }

    public Pair keys() {
        Iterator i = ht.keySet().iterator();
        Pair res = EMPTYLIST;
        while(i.hasNext()) {
            res = new Pair(getKey(i.next()), res);
        }
        return res;
    }

    public boolean valueEqual(Value v) {
        if (!(v instanceof Hashtable)) return false;
        Hashtable o = (Hashtable)v;
        int sz = o.size();
        if (size() != sz) return false;
        for (Iterator i = ht.entrySet().iterator(); i.hasNext();) {
            Map.Entry e = (Map.Entry)i.next();
            if (!getMapValue(e).valueEqual(o.get(getMapKey(e))))
                return false;
        }
        return true;
    }

    public int valueHashCode() {
        int res = 0;
        for (Iterator i = ht.entrySet().iterator(); i.hasNext();) {
            Map.Entry e = (Map.Entry)i.next();
            res +=
                getMapKey(e).valueHashCode() ^
                getMapValue(e).valueHashCode();
        }
        return res;
    }

    public void serialize(Serializer s) throws IOException {
        s.writeInt(ht.size());
        Iterator i = ht.entrySet().iterator();
        while(i.hasNext()) {
            Map.Entry e = (Map.Entry)i.next();
            s.writeExpression(getMapKey(e));
            s.writeExpression(getMapValue(e));
        }
    }

    public void deserialize(Deserializer s) throws IOException {
        int sz = s.readInt();
        for (int i=0; i<sz; i++) {
            Expression key = s.readExpression();
            Expression val = s.readExpression();
            put((Value)key, (Value)val);
        }
    }

    public boolean visit(ExpressionVisitor v) {
        Iterator i = ht.entrySet().iterator();
        while(i.hasNext()) {
            Map.Entry e = (Map.Entry)i.next();
            if (!v.visit(getMapKey(e))) return false;
            if (!v.visit(getMapValue(e))) return false;
        }
        return true;
    }

    public void display(ValueWriter w) throws IOException {
        w.append("#<").append(Util.liMessage(Primitives.SHASHB, "hashtable"));
        Iterator i = ht.entrySet().iterator();
        while(i.hasNext()) {
            Map.Entry e = (Map.Entry)i.next();
            w.append(" (")
                .append(getMapKey(e))
                .append(" . ")
                .append(getMapValue(e))
                .append(")");
        }
        w.append('>');
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
 * Portions created by Scott G. Miller are Copyright (C) 2000-2002
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
