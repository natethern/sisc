package sisc.data;

import java.io.*;
import sisc.interpreter.*;
import sisc.io.ValueWriter;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.env.LexicalEnvironment;
import sisc.util.ExpressionVisitor;

public class Closure extends Procedure implements NamedValue {
    public boolean arity;
    public int fcount;
    public LexicalEnvironment env;
    public Expression body;

    public Closure(boolean arity, int fcount, Expression body,
                   LexicalEnvironment env) {
        this.arity=arity;
        this.fcount=fcount;
        this.env=env;
        this.body=body;
        while (env!=null && !env.locked) {
            env.locked=true;		
            env=env.parent;
        }
    }

    private final Value[] matchArgs(Interpreter r)
        throws ContinuationException {
        Value[] v=r.vlr;
        int vl=v.length;
        if (!arity) {
            if (vl == fcount) {
                if (r.vlk) {
                    Value[] v2=r.createValues(vl);
                    System.arraycopy(v, 0, v2, 0, vl);
                    return v2;
                } else return v;
            }
            error(r, liMessage(SISCB,"notenoughargsto", toString(),
                                         fcount, vl));
            return null;
        }
        
        int sm1=fcount-1;
        if (vl < sm1) {
            error(r, liMessage(SISCB,"notenoughargstoinf", toString(),
                               sm1, vl));
            return null;
        }
        Value[] vals;
        if (vl > sm1 && !r.vlk) {
            vals=v;
        } else {
            vals=r.createValues(fcount);
            System.arraycopy(v, 0, vals, 0, sm1);
        }

        vals[sm1]=valArrayToList(v, sm1, vl-sm1);
        return vals;
    }

    public void apply(Interpreter r) throws ContinuationException {
        r.newEnv(matchArgs(r), env);
        r.nxp=body;
        r.vlr=ZV;
    }

    public void display(ValueWriter w) throws IOException {
        displayNamedOpaque(w, "procedure");
    }

    public void serialize(Serializer s) throws IOException {
        long attr=(long)fcount << 1;
        if (arity) attr|=1;
        s.writeLong(attr);
        s.writeExpression(env);
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
        env=(LexicalEnvironment)s.readExpression();
        body=s.readExpression();
    }

    public boolean visit(ExpressionVisitor v) {
        return super.visit(v) && v.visit(env) && v.visit(body);
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
