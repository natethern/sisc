package sisc.interpreter;

import java.io.*;
import java.lang.ref.*;
import sisc.*;
import sisc.data.*;
import sisc.exprs.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.env.LexicalEnvironment;

public class CallFrame extends Procedure {

    public Expression            nxp;
    public Value[]               vlr;
    public boolean               vlk;
    public LexicalEnvironment    env;
    public CallFrame              fk;
    public CallFrame          parent;

    public CallFrame(Expression n, Value[] v,
                     boolean vlk,
                     LexicalEnvironment e,
                     CallFrame f, CallFrame p) {
        nxp=n;
        vlr=v;
        this.vlk=vlk;
        env=e;
        fk=f;
        parent=p;
    }
    
    public CallFrame capture(Interpreter r) {
        CallFrame rv;
        if (vlk) {
            rv=clone(r);
        } else {
            vlk=true;
            rv=this;
        }
        rv.capture(r, null, null);

        return rv;
    }

    protected void capture(Interpreter r, 
                           Value[] parentOld, Value[] parentNew) {
        vlk=true;
        Value[] vo=vlr;

        if (vlr==parentOld)
            vlr=parentNew;
        else if (vlr!=null) {
            Value[] nvlr=r.createValues(vlr.length);
            System.arraycopy(vlr, 0, nvlr, 0, vlr.length);
            vlr=nvlr;
        }
        
        if (parent!=null) {
            if (parent.vlk)
                parent=parent.clone(r);
            parent.capture(r, vo, vlr);
        }
        
        if (fk!=null) {
            if (fk.vlk)
                fk=fk.clone(r);
            fk.capture(r, vo, vlr);
        }
    }

    protected CallFrame clone(Interpreter r) {
        return new CallFrame(nxp, vlr, vlk, env, fk, parent);
    }
            
    public void apply(Interpreter r) throws ContinuationException {
        if (r.vlr.length==1) 
            r.acc=r.vlr[0];
        else 
	    r.acc=new Values(r.vlr);

        r.pop(this);
    }

    public String display() {
        return displayNamedOpaque("continuation");
    }

    public void serialize(Serializer s) throws IOException {
        if (vlr==null)
            s.writeBoolean(false);
        else {
            s.writeBoolean(true);
            s.writeInt(vlr.length);
            for (int i=0; i<vlr.length; i++)
                s.writeExpression(vlr[i]);
        }
        s.writeExpression(nxp);
        s.writeExpression(fk);

        s.writeExpression(parent);
        s.writeExpression(env);
        s.writeBoolean(vlk);
    }

    public CallFrame() {}

    public void deserialize(Deserializer s) throws IOException {
        vlr=null;
        if (s.readBoolean()) {
            int size=s.readInt();
            vlr=new Value[size];
            for (int i=0; i<size; i++)
                vlr[i]=(Value)s.readExpression();
        }

        nxp=s.readExpression();
        fk=(CallFrame)s.readExpression();
        parent=(CallFrame)s.readExpression();
        env=(LexicalEnvironment)s.readExpression();
        vlk=s.readBoolean();
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
