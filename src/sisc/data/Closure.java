package sisc.data;

import java.io.*;
import sisc.interpreter.*;
import sisc.io.ValueWriter;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;
import sisc.env.LexicalUtils;

public class Closure extends Procedure implements NamedValue {
    public boolean arity;
    public int fcount, boxes[];
    private transient int bl;
    public Value[] env;
    public Expression body;

    public Closure(boolean arity, int fcount, Expression body,
                   Value[] env, int[] boxes) {
        this.arity=arity;
        this.fcount=fcount;
        this.env=env;
        this.body=body;
        this.boxes=boxes;
        bl=(boxes == null ? -1 : boxes.length-1);
    }

    private final Value[] matchArgs(Interpreter r)
        throws ContinuationException {
        /**
           It is safe to use the vlr directly as our arg array,
           without copying. That is because any future or concurrent
           modification of the vlr is impossible since a) this code is
           the *application* of a function, so all writing to vlr in
           order to supply the arguments will have been done, b) k
           invocations copy the vlr before modification.
        **/
        Value[] vals;
        final Value[] vlr = r.vlr;
        final int vl = vlr.length;
        if (!arity) {
            if (vl != fcount) {
                error(r, liMessage(SISCB,"notenoughargsto", toString(),
                                   fcount, vl));
                return null;
            }
            vals=vlr;
        } else {        
            final int sm1=fcount-1;
            if (vl < sm1) {
                error(r, liMessage(SISCB,"notenoughargstoinf", toString(),
                                   sm1, vl));
                return null;
            }
            if (vl < fcount) {
                vals=r.createValues(fcount);
                System.arraycopy(vlr, 0, vals, 0, sm1);
                r.returnVLR(); //NB: this checks vlk first
            } else {
                vals=vlr;
            }

            vals[sm1]=valArrayToList(vlr, sm1, vl-sm1);
        }

        for (int i=bl; i>=0; i--) {
            int bi=boxes[i];
            vals[bi]=new Box(vals[bi]);
        }
        return vals;
    }

    public void apply(Interpreter r) throws ContinuationException {
     r.lcl= matchArgs(r);
        r.env=env;
        r.nxp=body;
    }

    public void display(ValueWriter w) throws IOException {
        displayNamedOpaque(w, "procedure");
    }

    public void serialize(Serializer s) throws IOException {
        long attr=(long)fcount << 1;
        if (arity) attr|=1;
        s.writeLong(attr);
        LexicalUtils.writeIntArray(s, boxes);
        CallFrame.writeValueArray(s,env);
        s.writeExpression(body);
    }

    public Value express() {
        return new Pair(sym("closure"), list(truth(arity), Quantity.valueOf(fcount), body.express()));
    }

    public Closure() {}

    public void deserialize(Deserializer s) throws IOException {
        long attr=s.readLong();
        fcount=(int)(attr>>1);
        arity=(attr&1)!=0;
        boxes=LexicalUtils.readIntArray(s);
        bl=(boxes == null ? -1 : boxes.length-1);
        env=CallFrame.readValueArray(s);
        body=s.readExpression();
    }

    public boolean visit(ExpressionVisitor v) {
        return super.visit(v) && CallFrame.visitValueArray(v, env) && 
            v.visit(body);
    }

    /*
    //Profiling
    long ec=0;

    static {
        System.runFinalizersOnExit(true);
    }

    protected void finalize() {
        if (name!=null) {
            System.err.println("C"+justify(""+ec, 10, ' ')+" "+name);
        }
    }           
    */
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
