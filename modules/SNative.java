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
package sisc.modules;

import sisc.*;
import sisc.data.*;
import java.awt.*;
import java.io.IOException;

public class SNative extends ModuleAdapter {
    public String getModuleName() {
	return "NativeProcedures";
    }

    protected static final int
	ASSQ=0, MEMQ=1, ASSOC=6, MEMBER=7,
	CADR=2, CDAR=3, CAAR=4, CDDR=5, CADDR=17, NOT=8,
	APPEND=9, EQV=10, MEMV=11, ASSV=12,
	VECTOR=13, LISTREF=14, VALUES=15, READLINE=16;
    
    static long symid=0;

    public SNative() {
        define("assq", ASSQ);
        define("memq", MEMQ);
        define("vector", VECTOR);
        define("assoc", ASSOC);
        define("member", MEMBER);
        define("append2", APPEND);
        define("not", NOT);
        define("eqv?", EQV);
        define("assv", ASSV);
        define("memv", MEMV);
        define("caar", CAAR);
        define("cadr", CADR);
        define("cdar", CDAR);
        define("cddr", CDDR);
	define("caddr", CADDR);
        define("list-ref", LISTREF);
        define("values", VALUES);
        define("read-line", READLINE);
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

    protected boolean eqv(Value v1, Value v2) {
        return v1.eq(v2) ||
               ((jnumQuery(v1, Quantity.EXACT) &&
                 jnumQuery(v2, Quantity.EXACT)) ||
                (jnumQuery(v1, Quantity.INEXACT) &&
                 jnumQuery(v2, Quantity.INEXACT))) &&
               v1.valueEqual(v2);
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
        default:
            switch(f.vlr.length) {
            case 0:
                switch(primid) {
                case READLINE:
                    try {
                        String s=f.dynenv.in.getReader().readLine();
                        if (s==null) return EOF;
                        return new SchemeString(s);
                    } catch (IOException e) {
                        throw new RuntimeException(e.getMessage());
                    }
                default:
                    throwArgSizeException();
                }
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
		case CADDR:
		    return ((Pair)((Pair)pair(f.vlr[0]).cdr).cdr).car;
                case READLINE:
                    try {
                        String s=inport(f.vlr[0]).getReader().readLine();
                        if (s==null) return EOF;
                        return new SchemeString(s);
                    } catch (IOException e) {
                        throw new RuntimeException(e.getMessage());
                    }
                default:
                    throwArgSizeException();
                }
            case 2:
                switch(primid) {
                case APPEND:
                    Pair p1=pair(f.vlr[0]);
                    Value v=f.vlr[1];
                    if (p1==EMPTYLIST)
                        return v;
                    Pair p3=list(p1.car);
                    p1=(Pair)p1.cdr;
                    Pair p4=p3;
                    while (p1!=EMPTYLIST) {
                        p3=(Pair)(p3.cdr=new Pair());
                        p3.car=p1.car;
                        p1=(Pair)p1.cdr;
                    }
                    p3.cdr=v;
                    return p4;
                case EQV:
                    Value v1=f.vlr[0];
                    Value v2=f.vlr[1];
                    return truth(eqv(v1,v2));
                case LISTREF:
                    p1=pair(f.vlr[0]);
                    for (int l=num(f.vlr[1]).intValue(); l>0; l--) {
                        p1=(Pair)p1.cdr;
                    }
                    return p1.car;
                case ASSV:
                    v1=f.vlr[0];
                    p1=pair(f.vlr[1]);
                    while (p1!=EMPTYLIST) {
                        Pair assc=pair(p1.car);
                        if (eqv(assc.car,v1))
                            return assc;
                        p1=pair(p1.cdr);
                    }
                    return FALSE;
                case ASSQ:
                    v1=f.vlr[0];
                    p1=pair(f.vlr[1]);
                    while (p1!=EMPTYLIST) {
                        Pair assc=pair(p1.car);
                        if (assc.car.eq(v1))
                            return assc;
                        p1=pair(p1.cdr);
                    }
                    return FALSE;
                case MEMQ:
                    v1=f.vlr[0];
                    p1=pair(f.vlr[1]);
                    while (p1!=EMPTYLIST) {
                        if (p1.car.eq(v1))
                            return p1;
                        p1=pair(p1.cdr);
                    }
                    return FALSE;
                case MEMV:
                    v1=f.vlr[0];
                    p1=pair(f.vlr[1]);
                    while (p1!=EMPTYLIST) {
                        if (eqv(p1.car,v1))
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

