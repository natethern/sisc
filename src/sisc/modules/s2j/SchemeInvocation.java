package sisc.modules.s2j;

import java.lang.reflect.*;
import sisc.data.*;
import sisc.interpreter.*;

public class SchemeInvocation implements InvocationHandler {
    protected AppContext ctx;
    protected Procedure proc;

    static Method hashCodeMeth;
    static Method equalsMeth;
    static Method toStringMeth;

    static {
        try {
            hashCodeMeth = Object.class.getMethod("hashCode", new Class[]{});
            equalsMeth = Object.class.getMethod("equals", new Class[]{java.lang.Object.class});
            toStringMeth = Object.class.getMethod("toString", new Class[]{});
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(sisc.util.Util.liMessage(Util.S2JB, "reqmethodnotfound"));
        }
    }

    public SchemeInvocation(AppContext ctx, Procedure proc) {
        this.ctx = ctx;
        this.proc = proc;
    }

    public Object invoke(Object proxy, Method m, Object[] args)
        throws Throwable {
        //intercept hashCode, equals and toString
        //in order to avoid infinite recursion
        if (m.getDeclaringClass() == Object.class) {
            if (m.equals(hashCodeMeth)) {
                //better than returning a constant;
                //this works because a proxy can only have one
                //invocation handler
                return new Integer(hashCode());
            } else if (m.equals(equalsMeth)) {
                return new Boolean(proxy == args[0]);
            } else if (m.equals(toStringMeth)) {
                return "proxy";
            }
        }
        Interpreter r = Context.enter(ctx, new sisc.env.DynamicEnvironment());
        Pair p = Util.EMPTYLIST;
        if (args != null) { //for some reason args can be null
            Class[] pTypes = m.getParameterTypes();
            for (int i=args.length-1; i>=0; i--) {
                p = new Pair(Util.makeJObj(args[i], pTypes[i]), p);
            }
        }
        Value res = null;
        try {
            res = r.eval(proc, new Value[] {Util.makeJObj(proxy, Object.class),
                                            Util.makeJObj(m, Method.class),
                                            p});
        } catch (SchemeException e) {
            throw Util.javaException(e);
        }
        Context.exit();
        return Util.jobj(res);
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
