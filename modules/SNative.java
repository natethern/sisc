package sisc.modules;

import java.awt.*;
import java.io.IOException;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.*;

public class SNative extends ModuleAdapter {

    protected static final int
	ASSQ=0, MEMQ=1, ASSOC=6, MEMBER=7,
	CADR=2, CDAR=3, CAAR=4, CDDR=5, NOT=8,
	APPEND=9, MEMV=11, ASSV=12,
	VECTOR=13, LISTREF=14, VALUES=15,
        
        SUBSTRING=17, STRINGORDER=18, STRINGORDERCI=19,
        STRINGUPCASE=20, STRINGDOWNCASE=21,
        MAPCDR=22, MAPCAR=23, REVERSE=24;
    
    static long symid=0;

    public SNative() {
        define("append", APPEND);
        define("assq", ASSQ);
        define("assoc", ASSOC);
        define("assv", ASSV);
        define("caar", CAAR);
        define("cadr", CADR);
        define("cdar", CDAR);
        define("cddr", CDDR);
        define("memq", MEMQ);
        define("member", MEMBER);
        define("list-ref", LISTREF);
        define("memv", MEMV);
        define("not", NOT);
        define("reverse", REVERSE);
        define("string-order", STRINGORDER);
        define("string-downcase", STRINGDOWNCASE);
        define("string-order-ci", STRINGORDERCI);
        define("string-upcase", STRINGUPCASE);
        define("substring", SUBSTRING);
        define("values", VALUES);
        define("vector", VECTOR);
        define("map-cdr", MAPCDR);
        define("map-car", MAPCAR);
    }

    public static final Value cadr(Value p) {
        return ((Pair)((Pair)p).cdr).car;
    }


    public static final Value cddr(Value p) {
        return ((Pair)((Pair)p).cdr).cdr;
    }

    public static boolean jnumQuery(Value v, int mask) {
        return v instanceof Quantity &&
               (((Quantity)v).type & mask)!=0;
    }

    protected final Pair reverse(Pair p) {
        Pair n=EMPTYLIST;
        while (p!=EMPTYLIST) {
            n=new Pair(p.car, n);
            p=(Pair)p.cdr;
        }
        return n;
    }

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(primid) {
        case VECTOR:
            Value res = new SchemeVector(f.vlr);
            f.vlr = null;
            return res;
        case VALUES:
            if (f.vlr.length==1) return f.vlr[0];
            else {
                res = new Values(f.vlr);
                f.vlr = null;
                return res;
            }
        case APPEND:
            switch (f.vlr.length) {
            case 0: return EMPTYLIST;
            case 1: return pair(f.vlr[0]);
            default:
                Pair head_pair=null, tmp_pair, current_pair=null;
                
                int x=0;
                do {
                    Pair working_pair = pair(f.vlr[x]);
                    while (working_pair != EMPTYLIST) {
                        if (current_pair == null) {
                            head_pair=current_pair=new Pair(working_pair.car, 
                                                            null);
                        } else {
                            tmp_pair=new Pair(working_pair.car, EMPTYLIST);
                            current_pair.cdr=tmp_pair;
                            current_pair=tmp_pair;
                        }
                        working_pair=(Pair)working_pair.cdr;
                    }
                } while (((++x) + 1) < f.vlr.length);
                if (head_pair == null)
                    return f.vlr[x];
                else 
                    current_pair.cdr=f.vlr[x];
                return head_pair;
            }
        default:
            switch(f.vlr.length) {
            case 1:
                switch(primid) {
                case NOT: return truth(f.vlr[0]) ? FALSE : TRUE;
                case CADR:
                    return ((Pair)pair(f.vlr[0]).cdr).car;
                case CDAR:
                    return ((Pair)pair(f.vlr[0]).car).cdr;
                case CAAR:
                    return ((Pair)pair(f.vlr[0]).car).car;
                case CDDR:
                    return ((Pair)pair(f.vlr[0]).cdr).cdr;
                case STRINGUPCASE:
                    SchemeString str=str(f.vlr[0]);
                    return new SchemeString(str.asString().toUpperCase());
                case STRINGDOWNCASE:
                    str=str(f.vlr[0]);
                    return new SchemeString(str.asString().toLowerCase());
                case MAPCDR:
                    Value lists=f.vlr[0];
                    Pair c=EMPTYLIST;
                    while (lists != EMPTYLIST) {
                        Pair p1=pair(lists);
                        c=new Pair(((Pair)p1.car).cdr, c);
                        lists=p1.cdr;
                    }
                    return reverse(c);
                case MAPCAR:
                    lists=f.vlr[0];
                    c=EMPTYLIST;
                    while (lists != EMPTYLIST) {
                        Pair p1=pair(lists);
                        c=new Pair(((Pair)p1.car).car, c);
                        lists=p1.cdr;
                    }
                    return reverse(c);
                case REVERSE:
                    return reverse(pair(f.vlr[0]));
                default:
                    throwArgSizeException();
                }
            case 2:
                switch(primid) {
                case LISTREF:
                    Pair p1=pair(f.vlr[0]);
                    for (int l=num(f.vlr[1]).intValue(); l>0; l--) {
                        p1=(Pair)p1.cdr;
                    }
                    return p1.car;
                case ASSV:
                    Value v1=f.vlr[0];
                    p1=pair(f.vlr[1]);
                    while (p1!=EMPTYLIST) {
                        Pair assc=pair(p1.car);
                        if (assc.car.eqv(v1))
                            return assc;
                        p1=pair(p1.cdr);
                    }
                    return FALSE;
                case ASSQ:
                    v1=f.vlr[0];
                    p1=pair(f.vlr[1]);
                    while (p1!=EMPTYLIST) {
                        Pair assc=pair(p1.car);
                        if (assc.car == v1)
                            return assc;
                        p1=pair(p1.cdr);
                    }
                    return FALSE;
                case MEMQ:
                    v1=f.vlr[0];
                    p1=pair(f.vlr[1]);
                    while (p1!=EMPTYLIST) {
                        if (p1.car == v1)
                            return p1;
                        p1=pair(p1.cdr);
                    }
                    return FALSE;
                case MEMV:
                    v1=f.vlr[0];
                    p1=pair(f.vlr[1]);
                    while (p1!=EMPTYLIST) {
                        if (p1.car.eqv(v1))
                            return p1;
                        p1=pair(p1.cdr);
                    }
                    return FALSE;
                case ASSOC:
                    v1=f.vlr[0];
                    p1=pair(f.vlr[1]);
                    while (p1!=EMPTYLIST) {
                        Pair assc=pair(p1.car);
                        if (assc.car.valueEqual(v1))
                            return assc;
                        p1=pair(p1.cdr);
                    }
                    return FALSE;
                case MEMBER:
                    v1=f.vlr[0];
                    p1=pair(f.vlr[1]);
                    while (p1!=EMPTYLIST) {
                        if (p1.car.valueEqual(v1))
                            return p1;
                        p1=pair(p1.cdr);
                    }
                    return FALSE;
                case STRINGORDER:
                    SchemeString str=str(f.vlr[0]);
                    SchemeString str2=str(f.vlr[1]);
                    return Quantity.valueOf(str.asString().compareTo(str2.asString()));
                case STRINGORDERCI:
                    str=str(f.vlr[0]);
                    str2=str(f.vlr[1]);
                    return Quantity.valueOf(str.asString().compareToIgnoreCase(str2.asString()));
                default:
                    throwArgSizeException();
                }
            case 3:
                switch (primid) {
                case SUBSTRING:
                    SchemeString str=str(f.vlr[0]);
                    int lidx=num(f.vlr[1]).indexValue();
                    int uidx=num(f.vlr[2]).indexValue();
                    if (str.stringRepAvailable())
                        return new SchemeString(str.asString().substring(lidx, uidx));
                    else {
                        int len=uidx-lidx;
                        char[] cdata=str.asCharArray();
                        char[] newstr=new char[len];
                        System.arraycopy(cdata, lidx, newstr, 0, len);
                        return new SchemeString(newstr);
                    }
                default:
                    throwArgSizeException();
                }
	    default:
		throwArgSizeException();
            }
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
