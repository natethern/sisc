package sisc.modules.hashtable;

import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.*;

public class Primitives extends IndexedProcedure {

    public static final Symbol SHASHB =
        Symbol.intern("sisc.modules.hashtable.Messages");

    protected static final int
        HT_MAKE_EQ = 1,
        HT_MAKE_EQV = 2,
        HT_MAKE_EQUAL = 3,
        HTQ = 4,
        HT_PUT = 5,
        HT_GET = 6,
        HT_REMOVE = 7,
        HT_CLEAR = 8,
        HT_SIZE = 9,
        HT_TO_ALIST = 10,
        HT_ADD_ALIST = 11,
        HT_KEYS = 12,
        HT_THREAD_SAFEQ = 13,
        WHT_MAKE_EQ = 14,
        WHT_MAKE_EQV = 15,
        WHT_MAKE_EQUAL = 16;

    public static class Index extends IndexedLibraryAdapter {

        public Value construct(int id) {
            return new Primitives(id);
        }

        public Index() {
            define("make-eq-hashtable", HT_MAKE_EQ);
            define("make-eqv-hashtable", HT_MAKE_EQV);
            define("make-equal-hashtable", HT_MAKE_EQUAL);
            define("make-eq-weak-hashtable", WHT_MAKE_EQ);
            define("make-eqv-weak-hashtable", WHT_MAKE_EQV);
            define("make-equal-weak-hashtable", WHT_MAKE_EQUAL);
            define("hashtable?", HTQ);
            define("hashtable/put!", HT_PUT);
            define("hashtable/get", HT_GET);
            define("hashtable/remove!", HT_REMOVE);
            define("hashtable/clear!", HT_CLEAR);
            define("hashtable/size", HT_SIZE);
            define("hashtable->alist", HT_TO_ALIST);
            define("hashtable/add-alist!", HT_ADD_ALIST);
            define("hashtable/keys", HT_KEYS);
            define("hashtable/thread-safe?", HT_THREAD_SAFEQ);
        }
    }
    
    public Primitives(int id) {
        super(id);
    }
    
    public Primitives() {}

    private static KeyFactory eqKeyFactory = new EqKeyFactory();
    private static KeyFactory eqvKeyFactory = new EqvKeyFactory();
    private static KeyFactory equalKeyFactory = new EqualKeyFactory();

    public static final Hashtable shash(Value o) {
        try {
            return (Hashtable)o;
        } catch (ClassCastException e) { typeError(SHASHB, "hashtable", o); }
        return null;
    }

    public Value doApply(Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            switch(id) {
            case WHT_MAKE_EQ:
                return new WeakHashtable(eqKeyFactory);
            case WHT_MAKE_EQV:
                return new WeakHashtable(eqvKeyFactory);
            case WHT_MAKE_EQUAL:
                return new WeakHashtable(equalKeyFactory);
            default:
                throwArgSizeException();
            }
        case 1:
            switch (id) {
            case HT_MAKE_EQ:
                return (truth(f.vlr[0]) ?
                        new SynchronizedHashtable(eqKeyFactory) :
                        new Hashtable(eqKeyFactory));
            case HT_MAKE_EQV:
                return (truth(f.vlr[0]) ?
                        new SynchronizedHashtable(eqvKeyFactory) :
                        new Hashtable(eqvKeyFactory));
            case HT_MAKE_EQUAL:
                return (truth(f.vlr[0]) ?
                        new SynchronizedHashtable(equalKeyFactory) :
                        new Hashtable(equalKeyFactory));
            case HTQ:
                return truth(f.vlr[0] instanceof Hashtable);
            default:
                Hashtable h = shash(f.vlr[0]);
                switch(id) {
                case HT_CLEAR:
                    h.clear();
                    return VOID;
                case HT_TO_ALIST:
                    return h.toAList();
                case HT_KEYS:
                    return h.keys();
                case HT_SIZE:
                    return Quantity.valueOf(h.size());
                case HT_THREAD_SAFEQ:
                    return truth(h instanceof SynchronizedHashtable);
                default:
                    throwArgSizeException();
                }
            }
        default:
            Value def = FALSE;
            Value res = null;
            Hashtable h = shash(f.vlr[0]);
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
            case HT_ADD_ALIST:
                switch (f.vlr.length) {
                case 2: h.addAList(pair(f.vlr[1])); return h;
                default:
                    throwArgSizeException();
                }
            default:
                throwArgSizeException();
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
