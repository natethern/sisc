package sisc.modules;

import sisc.*;
import sisc.data.*;
import sisc.exprs.*;
import java.io.*;
import java.util.*;
import sisc.Serializer;
import sisc.modules.SThread.Monitor;

public class SHashtable extends ModuleAdapter {
    public String getModuleName() {
        return "SHashtable";
    }

    protected static final int 
        HT_MAKE		=1,
        HTQ         =2,
        HT_PUT		=3,
        HT_GET		=4,
        HT_REMOVE	=5,
        HT_CLEAR	=6,
        HT_TO_ALIST	=7,
        ALIST_TO_HT	=8,
        HT_KEYS		=9;
	
    public SHashtable() {

        define("make-hashtable"		,HT_MAKE);
        define("hashtable?"         ,HTQ);
        define("hashtable/put!"		,HT_PUT);
        define("hashtable/get"		,HT_GET);
        define("hashtable/remove!"	,HT_REMOVE);
        define("hashtable/clear!"	,HT_CLEAR);
        define("hashtable->alist"	,HT_TO_ALIST);
        define("alist->hashtable"	,ALIST_TO_HT);
        define("hashtable/keys"		,HT_KEYS);
    }

    public static class SchemeHashtable extends Procedure {

        public HashMap ht;

        public SchemeHashtable() {
            this.ht = new HashMap(0);
        }

        public SchemeHashtable(HashMap ht) {
            this.ht = ht;
        }

        public void addAList(Pair p) {
            for (; p != EMPTYLIST; p = pair(p.cdr)) {
                Pair entry = pair(p.car);
                ht.put(entry.car, entry.cdr);
            }
        }

        public Pair toAList() {
            Iterator i = ht.entrySet().iterator();
            Pair res = EMPTYLIST;
            while(i.hasNext()) {
                Map.Entry e = (Map.Entry)i.next();
                res = new Pair(new Pair((Value)e.getKey(),
                                        (Value)e.getValue()),
                               res);
            }
            return res;
        }

        public void serialize(Serializer s, DataOutput dos)
            throws IOException {
            if (SERIALIZATION) {
                //not the most efficient, but easiest
                s.serialize(toAList(), dos);
            }
        }

        public void deserialize(Serializer s, DataInput dis)
            throws IOException {
            if (SERIALIZATION) {
                //not the most efficient, but easiest
                addAList((Pair)s.deserialize(dis));
            }
        }

        public String display() {
            return "#<hashtable " + ht.size() + ">";
        }

        public void apply(Interpreter r)
            throws ContinuationException {

            r.nxp = null;

            Monitor m = Monitor.of(this);
            m.acquire();
            try {
                switch (r.vlr.length) {
                case 1:
                    r.acc = (Value)ht.get(r.vlr[0]);
                    break;
                case 2:
                    r.acc = (Value)ht.put(r.vlr[0], r.vlr[1]);
                    break;
                default:
                    throw new RuntimeException(liMessage(SISCB, "hashtableargs", display()));
                }
            } finally {
                m.unlock();
            }
            if (r.acc == null) r.acc = FALSE;
        }
    }

    public static final SchemeHashtable shash(Value o) {
        try {
            return (SchemeHashtable)o;
        } catch (ClassCastException e) { typeError("hashtable", o); }
        return null;
    }

    public static final HashMap hash(Value o) {
        return shash(o).ht;
    }

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            switch (primid) {
            case HT_MAKE:
                return new SchemeHashtable();
            default:
                throwArgSizeException();
            }
        case 1:
            switch(primid) {
            case HT_MAKE:
                return new SchemeHashtable((HashMap)hash(f.vlr[0]).clone());
            case HTQ:
                return truth(f.vlr[0] instanceof SchemeHashtable);
            case ALIST_TO_HT: {
                SchemeHashtable res = new SchemeHashtable();
                res.addAList(pair(f.vlr[0]));
                return res;
            }
            default:
                SchemeHashtable h = shash(f.vlr[0]);
                Monitor m = Monitor.of(h);
                m.acquire();
                try {
                    switch(primid) {
                    case HT_CLEAR:
                        h.ht.clear();
                        return VOID;
                    case HT_TO_ALIST:
                        return h.toAList();
                    case HT_KEYS: {
                        Iterator i = h.ht.keySet().iterator();
                        Pair res = EMPTYLIST;
                        while(i.hasNext()) {
                            Value k = (Value)i.next();
                            res = new Pair(k, res);
                        }
                        return res;
                    }
                    default:
                        throwArgSizeException();
                    }
                } finally {
                    m.unlock();
                }
            }
        default:
            Value def = FALSE;
            Value res = null;
            SchemeHashtable h = shash(f.vlr[0]);
            Monitor m = Monitor.of(h);
            m.acquire();
            try {
                switch(primid) {
                case HT_PUT:
                    switch (f.vlr.length) {
                    case 3: break;
                    case 4: def = f.vlr[3]; break;
                    default:
                        throwArgSizeException();
                    }
                    res = (Value)h.ht.put(f.vlr[1], f.vlr[2]);
                    break;
                case HT_GET:
                    switch (f.vlr.length) {
                    case 2: break;
                    case 3: def = f.vlr[2]; break;
                    default:
                        throwArgSizeException();
                    }
                    res = (Value)h.ht.get(f.vlr[1]);
                    break;
                case HT_REMOVE:
                    switch (f.vlr.length) {
                    case 2: break;
                    case 3: def = f.vlr[2];
                    default:
                        throwArgSizeException();
                    }
                    res = (Value)h.ht.remove(f.vlr[1]);
                    break;
                default:
                    throwArgSizeException();
                }
            } finally {
                m.unlock();
            }
            return (res == null) ? def : res;
        }
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
