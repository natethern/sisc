package sisc.modules.record;

import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.*;

public class Primitives extends IndexedProcedure {

    public static final Symbol SRECORDB =
        Symbol.intern("sisc.modules.record.Messages");

    protected static final int
        RECORD_MAKE = 1,
        RECORDQ = 2,
        RECORD_TYPE = 3,
        RECORD_SET_TYPE = 4,
        RECORD_REF = 5,
        RECORD_SET = 6;

    public static class Index extends IndexedLibraryAdapter {

        public Value construct(int id) {
            return new Primitives(id);
        }

        public Index() {
            define("make-record", RECORD_MAKE);
            define("record?", RECORDQ);
            define("record-type", RECORD_TYPE);
            define("record-type!", RECORD_SET_TYPE);
            define("record-ref", RECORD_REF);
            define("record-set!", RECORD_SET);
        }
    }
    
    public Primitives(int id) {
        super(id);
    }
    
    public Primitives() {}

    public static final Record record(Value o) {
        try {
            return (Record)o;
        } catch (ClassCastException e) { typeError(SRECORDB, "record", o); }
        return null;
    }

    public Value doApply(Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            throwArgSizeException();
        case 1:
            switch (id) {
            case RECORDQ:
                return truth(f.vlr[0] instanceof Record);
            case RECORD_TYPE:
                return record(f.vlr[0]).getType();
            default:
                throwArgSizeException();
            }
        case 2:
            switch (id) {
            case RECORD_MAKE:
                return new Record(f.vlr[0], pairToValues(pair(f.vlr[1])));
            case RECORD_SET_TYPE:
                record(f.vlr[0]).setType(f.vlr[1]);
                return VOID;
            case RECORD_REF:
                return record(f.vlr[0]).getSlot(num(f.vlr[1]).indexValue());
            default:
                throwArgSizeException();
            }
        case 3:
            switch (id) {
            case RECORD_SET:
                record(f.vlr[0]).setSlot(num(f.vlr[1]).indexValue(), f.vlr[2]);
                return VOID;
            default:
                throwArgSizeException();
            }
        default:
            throwArgSizeException();
        }
        return VOID;
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
