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

import java.io.*;
import sisc.*;

public class Pair extends Value {
    public Value car, cdr;

    public Pair() {
        car=cdr=EMPTYLIST;
    }

    public Pair(Value car, Value cdr) {
        this.car=car;
        this.cdr=cdr;
    }

    public void setCar(Value v) {
	car = v;
    }

    public void setCdr(Value v) {
	cdr = v;
    }

    protected void display(StringBuffer b, boolean write) {
        Pair cv=this;
        do {
            b.append(write ? cv.car.write() : cv.car.display());
            if (cv.cdr instanceof Pair) {
                if (cv.cdr!=EMPTYLIST)
                    b.append(' ');
                cv=(Pair)cv.cdr;
            } else {
                b.append(" . ").append(write ? cv.cdr.write() : 
				       cv.cdr.display());
				     
                break;
            }
        } while (cv!=EMPTYLIST);
    }

    public String display() {
        StringBuffer b=new StringBuffer();
        if (car==QUOTE) {
            b.append('\'').append(((Pair)cdr).car.display());
        } else if (car==UNQUOTE) {
            b.append(',').append(((Pair)cdr).car.display());
        } else if (car==BACKQUOTE) {
            b.append('`').append(((Pair)cdr).car.display());
        } else if (car==UNQUOTE_SPLICING) {
            b.append(",@").append(((Pair)cdr).car.display());
        } else {
            b.append('(');
            display(b, false);
            b.append(')');
        }
        return b.toString();
    }

    public String write() {
        StringBuffer b=new StringBuffer();
        if (car==QUOTE) {
            b.append('\'').append(((Pair)cdr).car.write());
        } else if (car==UNQUOTE) {
            b.append(',').append(((Pair)cdr).car.write());
        } else if (car==BACKQUOTE) {
            b.append('`').append(((Pair)cdr).car.write());
        } else if (car==UNQUOTE_SPLICING) {
            b.append(",@").append(((Pair)cdr).car.write());
        } else {
            b.append('(');
            display(b, true);
            b.append(')');
        }
        return b.toString();
    }

    public boolean valueEqual(Value v) {
        if (!(v instanceof Pair)) return false;
        Pair p=(Pair)v;
        return car.valueEqual(p.car) &&
               cdr.valueEqual(p.cdr);
    }

    protected final static int CONT=1, MUTABLE=2;

    public void serialize(Serializer s, DataOutput dos)
    throws IOException {
        if (SERIALIZATION) {
	    int pflags;
            Pair rv=this;
            boolean cont;
            do {
		cont=!s.seen(rv.cdr) &&
		    rv.cdr instanceof Pair && 
		    rv.cdr != EMPTYLIST;

		pflags=
		    (cont ? CONT : 0) |
		    (rv instanceof ImmutablePair ? 0 : MUTABLE);

                s.serialize(rv.car, dos);
		s.writeBer(pflags, dos);
		
		if (cont)
		    rv=(Pair)rv.cdr;
            } while (cont);
            s.serialize(rv.cdr, dos);
        }
    }

    public void deserialize(Serializer s, DataInput dis)
    throws IOException {
        if (SERIALIZATION) {
            car=(Value)s.deserialize(dis);
            Pair rv=this, tmp, head=rv;
	    int pflags=s.readBer(dis);
            while ((pflags & CONT) != 0) {
                tmp=((pflags & MUTABLE) != 0) ? 
		    new Pair() : 
		    new ImmutablePair();
                rv.cdr=tmp;
                tmp.car=(Value)s.deserialize(dis);
                rv=tmp;
		pflags=s.readBer(dis);
            }
            rv.cdr=(Value)s.deserialize(dis);
        }
    }
}




