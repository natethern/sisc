package sisc.modules.s2j;

import java.lang.reflect.*;

import sisc.data.*;
import sisc.interpreter.*;

public class Conversion extends Util {

    protected static final int 
        CONV_JBOOLEAN       =1,
        CONV_JCHAR          =2,
        CONV_JBYTE          =3,
        CONV_JSHORT         =4,
        CONV_JINT           =5,
        CONV_JLONG          =6,
        CONV_JFLOAT         =7,
        CONV_JDOUBLE        =8,
        CONV_JSTRING        =9,
        CONV_JARRAY         =10,

        CONV_BOOLEAN        =20,
        CONV_CHARACTER      =21,
        CONV_NUMBER         =22,
        CONV_STRING         =23,
        CONV_SYMBOL         =24,
        CONV_VECTOR         =25,
        CONV_LIST           =26;    

    public Conversion() {

        define("->jboolean"         ,CONV_JBOOLEAN);
        define("->jchar"            ,CONV_JCHAR);
        define("->jbyte"            ,CONV_JBYTE);
        define("->jshort"           ,CONV_JSHORT);
        define("->jint"             ,CONV_JINT);
        define("->jlong"            ,CONV_JLONG);
        define("->jfloat"           ,CONV_JFLOAT);
        define("->jdouble"          ,CONV_JDOUBLE);
        define("->jstring"          ,CONV_JSTRING);
        define("->jarray"           ,CONV_JARRAY);

        define("->boolean"          ,CONV_BOOLEAN);
        define("->character"        ,CONV_CHARACTER);
        define("->number"           ,CONV_NUMBER);
        define("->string"           ,CONV_STRING);
        define("->symbol"           ,CONV_SYMBOL);
        define("->vector"           ,CONV_VECTOR);
        define("->list"             ,CONV_LIST);

    }

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            throwArgSizeException();
        case 1:
            switch(primid) {
            case CONV_JBOOLEAN:
                return makeJObj(truth(f.vlr[0]) ? Boolean.TRUE : Boolean.FALSE);
            case CONV_JCHAR:
                return makeJObj(new Character(character(f.vlr[0])));
            case CONV_JBYTE:
                return makeJObj(new Byte((byte)num(f.vlr[0]).intValue()));
            case CONV_JSHORT:
                return makeJObj(new Short((short)num(f.vlr[0]).intValue()));
            case CONV_JINT:
                return makeJObj(new Integer(num(f.vlr[0]).intValue()));
            case CONV_JLONG:
                return makeJObj(new Long(num(f.vlr[0]).longValue()));
            case CONV_JFLOAT:
                return makeJObj(new Float((float)num(f.vlr[0]).doubleValue()));
            case CONV_JDOUBLE:
                return makeJObj(new Double(num(f.vlr[0]).doubleValue()));
            case CONV_JSTRING:
                byte b = 1;
                java.lang.Integer.toString(b);
                Value v = f.vlr[0];
                if (v instanceof Symbol)
                    return makeJObj(symval(v));
                else if (v instanceof SchemeString)
                    return makeJObj(string(v));
                else
                    typeError(S2JB, "stringorsymbol", v);
            case CONV_BOOLEAN:
                return truth(((Boolean)jobj(f.vlr[0])).booleanValue());
            case CONV_CHARACTER:
                return new SchemeCharacter(((Character)jobj(f.vlr[0])).charValue());
            case CONV_NUMBER:
                Object o = jobj(f.vlr[0]);
                if (o instanceof Byte ||
                    o instanceof Short ||
                    o instanceof Integer ||
                    o instanceof Long)
                    return Quantity.valueOf(((Number)o).longValue());
                else if (o instanceof Float ||
                         o instanceof Double)
                    return Quantity.valueOf(((Number)o).doubleValue());
                else if (o instanceof java.math.BigInteger)
                    return Quantity.valueOf((java.math.BigInteger)o);
                else if (o instanceof java.math.BigDecimal)
                    return Quantity.valueOf((java.math.BigDecimal)o);
                else
                    typeError(S2JB, "jnumber", f.vlr[0]);
            case CONV_STRING:
                o = jobj(f.vlr[0]);
                if (o instanceof String)
                    return new SchemeString((String)o);
                else
                    return new SchemeString(o.toString());
            case CONV_SYMBOL:
                o = jobj(f.vlr[0]);
                if (o instanceof String)
                    return Symbol.intern((String)o);
                else
                    return Symbol.intern(o.toString());
            case CONV_VECTOR:
                o = jobj(f.vlr[0]);
                if (o.getClass().isArray()) {
                    Value[] vals = new Value[Array.getLength(o)];
                    for (int i=0; i < vals.length; i++) {
                        vals[i] = makeJObj(Array.get(o, i));
                    }
                    return new SchemeVector(vals);
                } else
                    typeError(S2JB, "jarray", f.vlr[0]);
            case CONV_LIST:
                o = jobj(f.vlr[0]);
                if (o.getClass().isArray()) {
                    Pair p = EMPTYLIST;
                    for (int i=Array.getLength(o)-1; i>=0; i--) {
                        p = new Pair(makeJObj(Array.get(o, i)), p);
                    }
                    return p;
                } else
                    typeError(S2JB, "jarray", f.vlr[0]);
            default:
                throwArgSizeException();
            }
        case 2:
            switch(primid) {
            case CONV_JARRAY:
                Value o = f.vlr[0];
                Value[] vals = null;
                if (o instanceof Pair)
                    vals = pairToValues(pair(o));
                else if (o instanceof SchemeVector)
                    vals = vec(o).vals;
                else {
                    typeError(S2JB, "listorvector", o);
                }
                Object res = Array.newInstance(jclass(f.vlr[1]), vals.length);
                for (int i=0; i< vals.length; i++) {
                    Array.set(res, i, jobj(vals[i]));
                }
                return makeJObj(res);
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

