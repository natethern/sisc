package sisc.nativefun;

import java.io.*;
import sisc.compiler.*;
import sisc.interpreter.*;
import sisc.data.*;
import sisc.io.ValueWriter;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;

/**
 * A Builtin procedure is a Scheme procedure whose behavior when
 * applied is implemented in a host-language Module.  A Builtin procedure
 * contains a host module, and an integer identifying a specific
 * set of behavior in the host module (ie the implementation for one
 * procedure).  
 */
public class BuiltinProcedure extends Procedure implements NamedValue {
    public int id;
    public Module host;

    public BuiltinProcedure(Module host, String name, int id) {
        this(host, Symbol.get(name),id);
    }

    public BuiltinProcedure(Module host, Symbol name, int id) {
        this.id=id;
        setName(name);
        this.host=host;
    }

    public void apply(Interpreter r) throws ContinuationException {
        //long start=System.currentTimeMillis();
        r.lxp=r.nxp;
        r.nxp=null;
        try {
            Value v=host.eval(id, r);
            if (v!=null) r.acc=v;
            if (r.nxp == null) {
                r.returnVLR();
            }
        } catch (ClassCastException cc) {
            error(r, getName(), liMessage(SISCB,"gotunexpectedvalue",
                                     cc.getMessage()));
        } catch (NestedPrimRuntimeException npr) {
            error(r, getName(), npr);
        } catch (RuntimeException re) {
            //re.printStackTrace();
            String msg = re.getMessage();
            if (msg == null) msg = re.toString();
            error(r, getName(), msg);
        }
        //time+=System.currentTimeMillis()-start;
    }

    public static void error(Interpreter r, Value where, 
                             NestedPrimRuntimeException parent) 
        throws ContinuationException {
        SchemeException rootCauseException=parent.getRootCause();
        Pair rootCause=new Pair(new Pair(ERRORK, rootCauseException.e),
                                new Pair(new Pair(FCONT, rootCauseException.f),
                                         rootCauseException.m));
        String parentMessage=parent.getMessage();
        error(r, (parentMessage == null ?
                  list(new Pair(LOCATION, where),
                       new Pair(PARENT, rootCause)) :
                  list(new Pair(MESSAGE, new SchemeString(parent.getMessage())),
                       new Pair(LOCATION, where),
                       new Pair(PARENT, rootCause))));
    }

    public void display(ValueWriter w) throws IOException {
        displayNamedOpaque(w, "builtin procedure");
    }

    public boolean equals(Object v) {
        return (v instanceof BuiltinProcedure) &&
            ((BuiltinProcedure)v).id==id &&
            ((BuiltinProcedure)v).host==host;
    }

    public int hashCode() {
        return host.hashCode() ^ id;
    }

    public void serialize(Serializer s) throws IOException {
        super.serialize(s);
        s.writeModule(host);
        s.writeInt(id);
    }

    public BuiltinProcedure() {}

    public void deserialize(Deserializer s) throws IOException {
        super.deserialize(s);
        host=s.readModule();
        id=s.readInt();
    }

    public boolean visit(ExpressionVisitor v) {
        return super.visit(v) && v.visit(host);
    }

    /*
    // Profiling
        long time;
        
    protected void finalize() {
        System.err.println(justify(""+time, 10, ' ')+" "+name);
    }

    static {
        System.runFinalizersOnExit(true);
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

