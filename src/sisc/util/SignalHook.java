/*
 * Created on Jan 31, 2004
 *
 * Class to trap OS signals without relying on the existance of 
 * the unsupported Sun signal handling classes.
 */
package sisc.util;

import java.lang.reflect.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sisc.data.Procedure;
import sisc.interpreter.Context;
import sisc.interpreter.Interpreter;
import sisc.interpreter.SchemeException;

/**
 * @author scgmille
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class SignalHook implements InvocationHandler {

    static Method handle;
    static Class csignal, csignalHandler;
    static Constructor sigcons;
    static Object SIG_DFL;
    static Object sigHook;
    
    //Determine if we even *have* sun.misc.*
    static {
        try {
            csignal=Class.forName("sun.misc.Signal");
            csignalHandler=Class.forName("sun.misc.SignalHandler");
        } catch (ClassNotFoundException cnf) { System.err.println(cnf);}
    }

    static {
        if (csignalHandler != null) {
            try {
                handle=csignal.getMethod("handle", new Class[] {csignal, csignalHandler});
                SIG_DFL=csignalHandler.getField("SIG_DFL").get(null);
                sigHook=Proxy.newProxyInstance(csignalHandler.getClassLoader(),
                                               new Class[] { csignalHandler },
                                               new SignalHook()); 
                sigcons=csignal.getConstructor(new Class[] {String.class});
            } catch (Exception nsm) {
                nsm.printStackTrace();
                csignalHandler=null;
            }
        }
    }    
    
    static Map handlers=new HashMap();
    
    public static void addHandler(String signame, Procedure proc) {
        if (csignalHandler==null) return;
        Object signal=null;
        try {
            signal=sigcons.newInstance(new Object[] {signame});
        } catch (Exception ie) {
            return;
        }
        List l=(List)handlers.get(signal);
        if (l==null) {
            l=new ArrayList();
            handlers.put(signal, l);
            addHandler(signame, proc);
            try {
                handle.invoke(null, new Object[] {signal,sigHook});
            } catch (IllegalArgumentException ill) {
                // The underlying VM doesn't support overriding this
                // signal, so we ignore it.
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        l.add(proc);
    }
    
    public static void removeHandler(String signame, Procedure proc) {
        if (csignalHandler==null) return;
        Object signal=null;
        try {
            signal=sigcons.newInstance(new Object[] {signame});
        } catch (Exception ie) {
            return;
        }

        List l=(List)handlers.get(signal);
        if (l!=null) {
            l.remove(proc);
            if (l.isEmpty()) {
                try {
                    handle.invoke(null, new Object[] {signal,SIG_DFL});
                } catch (Exception iae) {}
                handlers.remove(signal);
            }
        }
    }
    
    public Object invoke(Object o, Method m, Object[] a) {
        try {
            if (a==null || a.length!=1) return null;
            Object signal=a[0];
            List l=(List)handlers.get(signal);
            if (l!=null) {
                Interpreter r=Context.enter("main");
                for (int i=0; i<l.size(); i++) {
                    Procedure proc=(Procedure)l.get(i);
                    try {
                        r.eval(proc, Util.ZV);
                    } catch (SchemeException e) {
                        e.printStackTrace();
                    }
                }
                Context.exit();
            }        
        } catch (Throwable t) {
            t.printStackTrace();
        }
            return null;

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
