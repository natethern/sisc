package sisc.interpreter;

import java.io.*;
import sisc.data.*;
import sisc.io.ValueWriter;
import sisc.util.ExpressionVisitor;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class CallFrame extends Procedure {

    public Expression            nxp;
    public Value[]               vlr, lcl, env;
    public boolean               vlk, cap[];
    public CallFrame              fk, parent;

    public CallFrame(Expression n, Value[] v,
                     boolean vlk, Value[] l, Value[] e,
                     CallFrame f, CallFrame p,
                     boolean[] cap) {
        nxp=n;
        vlr=v;
        this.vlk=vlk;
        env=e;
        lcl=l;
        fk=f;
        parent=p;
        this.cap=cap;
    }

    public final void copyVLR(Interpreter r) {
        if (vlr!=null) {
            int l=vlr.length;
            Value[] nvlr=r.createValues(l);
            System.arraycopy(vlr, 0, nvlr, 0, l);
            vlr=nvlr;
            cap=null;
        }
    }

    public final CallFrame capture(Interpreter r) {
        //Returning a safe frame is an optimization. k invocation
        //makes frames safe as necessary but it cannot make the top
        //frame safe. That's because frames are made safe by cloning
        //them and then swivelling the child frame's parent pointer,
        //but the top frame has no child frame. So without this
        //optimization, any invocation of the k potentially requires a
        //cloning of the captured frame in order to obtain a safe vlr.
        //NB: this is not a cost-free optimization: if no further ks
        //were captured from the same frame then the cloning is
        //unnecessary (and wouldn't occur without this "optimization").

        CallFrame toReturn=makeSafe(r);

        // Set the captured flags all the way to the root,
        // including our unsafe doppleganger
        CallFrame w=this;
        boolean lastWasLocked=false;
        do {
            lastWasLocked=w.vlk;
            w.vlk=true;
            if (w.nxp!=null)
                w.nxp.setCaptured(r, w);
            w=w.parent;
        } while (w!=null && !lastWasLocked); 

        return toReturn;
    }
    
    public final CallFrame makeSafe(Interpreter r) {
        CallFrame cv=cloneFrame(r);
        cv.vlk=true;
        cv.copyVLR(r);
        return cv;
    }

    public final void setCaptured(Interpreter r, int pos) {
        if (vlr!=null) {
            if (cap==null) {
                cap=new boolean[vlr.length];
            }
            if (pos<vlr.length) {
                cap[pos]=true;
            }
        }
    }

    protected final CallFrame cloneFrame(Interpreter r) {
        return r.createFrame(nxp, vlr, vlk, lcl, env, fk, parent);
    }

    public void display(ValueWriter w) throws IOException {    
        displayNamedOpaque(w, "continuation"); 
    }

    public static boolean visitValueArray(ExpressionVisitor v, Value[] va) {
        if (va==null) return true;
        for (int i=0; i<va.length; i++) 
            if (!v.visit(va[i])) return false;
        return true;
    }

    public boolean visit(ExpressionVisitor v) {
        return visitValueArray(v, vlr) && visitValueArray(v,lcl) && 
            visitValueArray(v,env) && v.visit(nxp) && v.visit(fk) && 
            v.visit(parent);
    }

    public void apply(Interpreter r) throws ContinuationException {
        if (r.vlr.length==1) 
            r.acc=r.vlr[0];
        else 
            r.acc=new Values(r.vlr);

        r.pop(this);
    }

    public static void writeValueArray(Serializer s, Value[] v) throws IOException {
        if (v==null) s.writeInt(0);
        else {
            s.writeInt(v.length);
            for (int i=0; i<v.length; i++) {
                s.writeExpression(v[i]);
            }
        }
    }
    
    public static Value[] readValueArray(Deserializer s) throws IOException {
        int l=s.readInt();
        Value[] v=new Value[l];
        for (int i=0; i<v.length; i++) {
            v[i]=(Value)s.readExpression();
        }
        return v;
    }

    public void serialize(Serializer s) throws IOException {
        s.writeBoolean(vlk);
        if (vlr==null)
            s.writeBoolean(false);
        else {
            s.writeBoolean(true);
            writeValueArray(s,vlr);
            s.writeInt(cap==null ? 0 : cap.length);
            if (cap!=null)
                for (int i=0; i<cap.length; i++) 
                    s.writeBoolean(cap[i]);
        }
        writeValueArray(s,lcl);
        writeValueArray(s,env);
        s.writeExpression(nxp);
        s.writeExpression(fk);
        s.writeExpression(parent);
    }

    public CallFrame() {}

    public void deserialize(Deserializer s) throws IOException {
        vlk=s.readBoolean();
        vlr=null;
        if (s.readBoolean()) {
            vlr=readValueArray(s);
            int capsize=s.readInt();
            if (capsize>0) {
                cap=new boolean[capsize];
                for (int i=0; i<capsize; i++) 
                    cap[i]=s.readBoolean();
            }
        }
        lcl=readValueArray(s);
        env=readValueArray(s);
        nxp=s.readExpression();
        fk=(CallFrame)s.readExpression();
        parent=(CallFrame)s.readExpression();
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
