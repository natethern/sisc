package sisc.modules.hashtable;

import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.modules.SThread.Mutex;

public class Primitives extends IndexedProcedure {

    public static final Symbol SHASHB =
        Symbol.intern("sisc.modules.hashtable.Messages");

    protected static final int HT_MAKE_EQ = 1,
        HT_MAKE_EQV = 2,
        HT_MAKE_EQUAL = 3,
        HTQ = 4,
        HT_PUT = 5,
        HT_GET = 6,
        HT_REMOVE = 7,
        HT_CLEAR = 8,
        HT_SIZE = 9,
        HT_TO_ALIST = 10,
        ALIST_TO_HT_EQ = 11,
        ALIST_TO_HT_EQV = 12,
        ALIST_TO_HT_EQUAL = 13,
        HT_KEYS = 14;

    public static class Index extends IndexedLibraryAdapter {

        public Value construct(int id) {
            return new Primitives(id);
        }

        public Index() {
            define("make-eq-hashtable", HT_MAKE_EQ);
            define("make-eqv-hashtable", HT_MAKE_EQV);
            define("make-equal-hashtable", HT_MAKE_EQUAL);
            define("hashtable?", HTQ);
            define("hashtable/put!", HT_PUT);
            define("hashtable/get", HT_GET);
            define("hashtable/remove!", HT_REMOVE);
            define("hashtable/clear!", HT_CLEAR);
            define("hashtable/size", HT_SIZE);
            define("hashtable->alist", HT_TO_ALIST);
            define("alist->eq-hashtable", ALIST_TO_HT_EQ);
            define("alist->eqv-hashtable", ALIST_TO_HT_EQV);
            define("alist->equal-hashtable", ALIST_TO_HT_EQUAL);
            define("hashtable/keys", HT_KEYS);
        }
    }
    
    public Primitives(int id) {
        super(id);
    }
    
    public Primitives() {}

    public static final Hashtable shash(Value o) {
        try {
            return (Hashtable)o;
        } catch (ClassCastException e) { typeError(SHASHB, "hashtable", o); }
        return null;
    }

    public Value doApply(Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            switch (id) {
            case HT_MAKE_EQ:
                return new EqHashtable();
            case HT_MAKE_EQV:
                return new EqvHashtable();
            case HT_MAKE_EQUAL:
                return new EqualHashtable();
            default:
                throwArgSizeException();
            }
        case 1:
            switch(id) {
            case HTQ:
                return truth(f.vlr[0] instanceof Hashtable);
            case HT_SIZE:
                return Quantity.valueOf(shash(f.vlr[0]).size());
            case ALIST_TO_HT_EQ: {
                Hashtable res = new EqHashtable();
                res.addAList(pair(f.vlr[0]));
                return res;
            }
            case ALIST_TO_HT_EQV: {
                Hashtable res = new EqvHashtable();
                res.addAList(pair(f.vlr[0]));
                return res;
            }
            case ALIST_TO_HT_EQUAL: {
                Hashtable res = new EqualHashtable();
                res.addAList(pair(f.vlr[0]));
                return res;
            }
            default:
                Hashtable h = shash(f.vlr[0]);
                Mutex m = Mutex.of(h);
                m.acquire();
                try {
                    switch(id) {
                    case HT_CLEAR:
                        h.clear();
                        return VOID;
                    case HT_TO_ALIST:
                        return h.toAList();
                    case HT_KEYS: {
                        return h.keys();
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
            Hashtable h = shash(f.vlr[0]);
            Mutex m = Mutex.of(h);
            m.acquire();
            try {
                switch(id) {
                case HT_PUT:
                    switch (f.vlr.length) {
                    case 3: break;
                    case 4: def = f.vlr[3]; break;
                    default:
                        throwArgSizeException();
                    }
                    res = h.put(f.vlr[1], f.vlr[2]);
                    break;
                case HT_GET:
                    switch (f.vlr.length) {
                    case 2: break;
                    case 3: def = f.vlr[2]; break;
                    default:
                        throwArgSizeException();
                    }
                    res = h.get(f.vlr[1]);
                    break;
                case HT_REMOVE:
                    switch (f.vlr.length) {
                    case 2: break;
                    case 3: def = f.vlr[2];
                    default:
                        throwArgSizeException();
                    }
                    res = h.remove(f.vlr[1]);
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
