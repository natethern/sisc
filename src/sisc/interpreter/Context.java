package sisc.interpreter;

import java.util.*;
import sisc.env.DynamicEnvironment;
import sisc.util.Util;
import sisc.REPL;

/**
 * Context is a utility class which facilitates Java to Scheme
 * calls in SISC.
 * 
 * Typically, this involves obtaining an Interpreter for a given
 * initialized {@link sisc.interpreter.AppContext}, using the Interpreter for one or more 
 * evaluations, then exiting the context, as follows:
 * <pre>
 *   AppContext ctx = ...
 *   Interpreter r=Context.enter(ctx);
 *   r.eval(someProcedure, new Value[] { ... some arguments ... });
 *   Context.exit();
 * </pre>
 * Alternately, one can use the SchemeCaller supported visitor pattern
 * to allow Context to handle the management of the Interpreter Context,
 * as follows:
 * <pre>
 *   Object returnValue=Context.execute(ctx, mySchemeCaller);
 * </pre>
 * The provided SchemeCaller instance's execute method is invoked with
 * an Interpreter which is automatically obtained and then returned when
 * the call completes.  The return value of the ScheemCaller's execute
 * method is returned from the Context method.
 *
 * @see SchemeCaller
 * @see AppContext
 * @see Interpreter
 */
public abstract class Context extends Util {

    //"appname" -> AppContext
    private static Map apps =
        Collections.synchronizedMap(new HashMap());
    //Thread -> Context
    private static Map threads =
        Collections.synchronizedMap(new WeakHashMap());

    private static volatile AppContext defaultAppContext;

    /*********** application table maintenance ***********/

    /**
     * @deprecated
     */
    public static void register(String appName, AppContext ctx) {
        apps.put(appName,ctx);
    }
    
    /**
     * @deprecated
     */
    public static void unregister(String appName) {
        apps.remove(appName);
    }
    
    /**
     * @deprecated
     */
    public static AppContext lookup(String appName) {
        return (AppContext)apps.get(appName);
    }

    /*********** thread context lookup ***********/

    public static ThreadContext lookupThreadContext(Thread thread) {
        ThreadContext tctx = (ThreadContext)threads.get(thread);
        if (tctx == null) {
            tctx = new ThreadContext();
            threads.put(thread, tctx);
        }
        return tctx;
    }

    public static ThreadContext lookupThreadContext() {
        return lookupThreadContext(Thread.currentThread());
    }

    /*********** main interface ***********/

    /**
     * Fetches the current Interpreter, if this is an internal call (that is,
     * Scheme->Java.
     */
    public static Interpreter currentInterpreter() {
        ThreadContext tctx = lookupThreadContext();
        return tctx.currentInterpreter();
    }

    /**
     * Sets the <i>default AppContext</i>, which is used sparingly whenever
     * a call originates from uncontrolled Java source that involves 
     * the Scheme environment.  For example, Java serialization initiated
     * by a web application server.
     * 
     * @param ctx the AppContext to make the default.
     */
    public synchronized static void setDefaultAppContext(AppContext ctx) {
        defaultAppContext = ctx;
    }

    /**
     * Returns the currently set default AppContext, or creates
     * a new AppContext with default values if non was already set,
     * and attempts to initialize it with the default heap.
     * 
     */
    public synchronized static AppContext getDefaultAppContext() {
        if (defaultAppContext == null) {
            setDefaultAppContext(new AppContext());
            try {
                Interpreter r = Context.enter(defaultAppContext);
                REPL.loadDefaultHeap(r);
            } finally {
                Context.exit();
            }
        }

        return defaultAppContext;
    }

    /**
     * Returns the AppContext of any current interpreter in an internal call.
     */
    public static AppContext currentAppContext() {
        Interpreter r = currentInterpreter();
        return (r == null ? getDefaultAppContext() : r.getCtx());
    }

    /**
     * Returns an Interpreter for the current application context,
     * preserving the existing interpreter in an internal call, or
     * getting a new one for the default AppContext in an 
     * external call.
     *
     * @see Interpreter
     */
    public static Interpreter enter() {
        Interpreter r = currentInterpreter();
        return (r == null ? enter(getDefaultAppContext()) : r);
    }

    /**
       Returns a new Interpreter instance with the same
       AppContext and DynamicEnvironment of the argument
       instance.  

       The ThreadContext's hostThread will be set to a SchemeThread
       wrapping the current thread.
       
       Necessary when re-using the same Interpreter instance
       in a different thread.
       
       @see Interpreter
    */
    public static Interpreter enter(Interpreter r) {
        return enter(r.dynenv);
    }

    /**
     *
     * @deprecated use {@link #enter(AppContext)} instead
     */
    public static Interpreter enter(String appName) {
        return enter(lookup(appName));
    }
    
    /**
     * Returns an Interpreter for the given AppContext, creating
     * a new DynamicEnvironment for the Interpreter. 
     */
    public static Interpreter enter(AppContext ctx) {
        return enter(new DynamicEnvironment(ctx));
    }
    
    /**
     * Returns an Interpreter for the given DynamicEnvironment.
     */
    public static Interpreter enter(DynamicEnvironment dynenv) {
        ThreadContext tctx = lookupThreadContext();
        Interpreter res = createInterpreter(tctx, dynenv);
        tctx.setHostThread(res, Thread.currentThread());
        tctx.pushInterpreter(res);
        return res;
    }

    /**
     * Exits the current context, releasing the current
     * Interpreter.
     */
    public static void exit() {
        ThreadContext tctx = lookupThreadContext();
        Interpreter r = tctx.popInterpreter();
        returnInterpreter(r);
    }

    public static Object execute(SchemeCaller caller) {
        return execute(currentInterpreter().dynenv, caller);
    }

    /**
     * @deprecated use {@link #execute(AppContext, SchemeCaller)} instead
     */
    public static Object execute(String appName, SchemeCaller caller) {
        return execute(lookup(appName), caller);
    }

    /**
     * Obtains a reference to an Interpreter context 
     * and calls caller.execute(Interpreter) with that
     * reference.  Once execute returns, the Interpreter
     * is freed, and the return value of caller.execute()
     * is returned from this method.
     * 
     * NB: It is critical that the Interpreter reference provided
     * during the call is used only in the thread which calls this
     * method.  New threads should obtain a different Interpreter via
     * this or enter() calls.
     */
    public static Object execute(AppContext ctx, SchemeCaller caller) {
        return execute(new DynamicEnvironment(ctx), caller);
    }
    
    public static Object execute(DynamicEnvironment env, SchemeCaller caller) {
        Interpreter r=Context.enter(env);
        //Hold this reference.  Necessary because ThreadContext references
        //hostThread only weakly, which is in turn necessary so that
        //when threads terminate their associated SISC resources are
        //garbage collected.  In this case, however, we want to guarantee that during 
        //the lifetime of the call, the SchemeThread wrapper object
        //remains available        
        Object t=r.tctx.hostThread.get();

        try {
            return caller.execute(r);
        } finally {
            if (r!=null)
                Context.exit();
        }
    }
    
    /*********** resource maintenance ***********/

    /**
     * We could use a pool of interpreters. However,
     * a) interpreter creation is quite cheap, and
     * b) pool maintenance would require thread synchronization
     */
    private static Interpreter createInterpreter(ThreadContext tctx,
                                                 DynamicEnvironment dynenv) {
        return new Interpreter(tctx, dynenv);
    }

    private static void returnInterpreter(Interpreter r) {
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
