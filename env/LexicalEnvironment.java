package sisc.env;

import java.util.*;
import java.io.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class LexicalEnvironment extends Value {
    public LexicalEnvironment parent;
    public Value[] vals;
    public Interpreter r;

    public LexicalEnvironment() {
        this.vals=ZV;
    }

    public LexicalEnvironment(Value[] vals, LexicalEnvironment parent) {
        this.vals=vals;
        this.parent=parent;
    }

    public final LexicalEnvironment reinit(Interpreter r, Closure c) throws ContinuationException {
        parent=c.env;
        this.r=r;
        Value[] v=r.vlr;
        int vl=v.length;
        if (!c.arity) {
            if (vl == c.fcount) {
                vals=v;
                return this;
            }
            error(r, liMessage(SISCB,"notenoughargsto", c.toString(),
                               c.fcount, vl));
            return this;
        }
        
        int sm1=c.fcount-1;
        if (vl < sm1) {
            error(r, liMessage(SISCB,"notenoughargstoinf", c.toString(),
                               sm1, vl));
            return this;
        }

        if (vl > sm1 && !r.vlk) {
            vals=v;
        } else {
            vals=r.createValues(sm1+1);
            System.arraycopy(v, 0, vals, 0, sm1);
        }

        vals[sm1]=valArrayToList(v, sm1, vl-sm1);
        return this;
    }
 
    public LexicalEnvironment(Interpreter r, Closure c) 
	throws ContinuationException {
        reinit(r, c);
    }

    public final Value lookup(int depth, int pos) {
        LexicalEnvironment e = this;
        while(depth-- > 0) 
	    e = e.parent;
	
        return e.vals[pos];
    }

    public final void set(int depth, int pos, Value v) {
        LexicalEnvironment e = this;
        while(depth > 0) {
	    depth--;
	    e = e.parent;
	}
        e.vals[pos]=v;
    }

    public String display() {
        StringBuffer b=new StringBuffer("#<");
        b.append(liMessage(SISCB, "environment"));
        b.append('>');
        return b.toString();
    }

    public void serialize(Serializer s) throws IOException {
        s.writeInt(vals.length);
        for (int i=0; i<vals.length; i++)
            s.writeExpression(vals[i]);
        s.writeExpression(parent);
    }

    public void deserialize(Deserializer s) throws IOException {
        int size=s.readInt();
        vals=new Value[size];
        for (int i=0; i<size; i++)
            vals[i]=(Value)s.readExpression();
        parent = (LexicalEnvironment)s.readExpression();
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
