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
package sisc;

import sisc.*;
import sisc.data.*;
import java.util.*;

public class Context extends Util {

    static class ThrowSchemeException extends Expression {
	
	public void eval(Interpreter r) 
	    throws ContinuationException, SchemeRuntimeException {
	    r.nxp=null;
	    Values v=(Values)r.acc;
	    throw new SchemeRuntimeException(v.values[0], 
					     cont(v.values[1]), 
					     cont(v.values[2]));
	}

	public Value express() {
	    return list(Symbol.get("TSException"));
	}
    }
	
	
    //"appname" -> AppContext
    protected static Hashtable apps = new Hashtable();
    //Thread -> Stack{Interpreter}
    protected static Hashtable threads = new Hashtable();
    //Scheme->Java exception conversion FK
    protected static Expression THROW_SCHEME_EXCEPTION=new ThrowSchemeException();

    
    
    /*********** application table maintenance ***********/

    public static void register(String appName, AppContext ctx) {
	apps.put(appName,ctx);
    }

    public static void unregister(String appName) {
	apps.remove(appName);
    }

    public static AppContext lookup(String appName) {
	return (AppContext)apps.get(appName);
    }

    /*********** thread table maintenance ***********/

    protected static Interpreter currentInterpreter() {
	Thread thread = Thread.currentThread();
	Stack stack = (Stack)threads.get(thread);
	if (stack == null) return null;
	return (Interpreter)stack.peek();
    }

    protected static void pushInterpreter(Interpreter r) {
	Thread thread = Thread.currentThread();
	Stack stack = (Stack)threads.get(thread);
	if (stack == null) {
	    stack = new Stack();
	    threads.put(thread, stack);
	}
	stack.push(r);
    }

    protected static Interpreter popInterpreter() {
	Thread thread = Thread.currentThread();
	Stack stack = (Stack)threads.get(thread);
	if (stack == null) return null;
	Interpreter res = (Interpreter)stack.pop();
	if (stack.empty()) threads.remove(thread);
	return res;
    }

    /*********** main interface ***********/

    public static Interpreter enter() {
	Interpreter r = currentInterpreter();
	return enter(r.ctx, r.dynenv);
    }

    public static Interpreter enter(String appName) {
	return enter(lookup(appName), new DynamicEnv());
    }

    public static Interpreter enter(AppContext ctx, DynamicEnv dynenv) {
	Interpreter res = createInterpreter(ctx, dynenv);
	res.fk=res.createFrame(THROW_SCHEME_EXCEPTION, null, null, res.fk, res.stk);
	pushInterpreter(res);
	return res;
    }

    public static void exit() {
	Interpreter r = popInterpreter();
	returnInterpreter(r);
    }

    /*********** resource maintenance ***********/

    /**
     * We could use a pool of interpreters. However,
     * a) interpreter creation is quite cheap, and
     * b) pool maintenance would require thread synchronization
     */
    public static Interpreter createInterpreter(AppContext ctx,
						DynamicEnv dynenv) {
	return new Interpreter(ctx, dynenv);
    }

    public static void returnInterpreter(Interpreter r) {
    }

}
