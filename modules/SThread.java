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
package sisc.modules;

import sisc.*;
import sisc.data.*;
import sisc.exprs.*;

public class SThread extends ModuleAdapter {
    public String getModuleName() {
	return "Threading";
    }

    protected static final int 
	THREADNEW=0, THREADSTART=1, THREADYIELD=2, THREADSLEEP=3,
	THREADINTERRUPT=4, THREADJOIN=5, THREADCURRENT=6,
	THREADSYNCHRONIZED=7, THREADNOTIFY=8, THREADNOTIFYALL=9,
	THREADWAIT=10, THREADNAME=11, THREADPRIORITY=12, 
	THREADDAEMONQ=13, SETTHREADNAME=14, SETTHREADPRIORITY=15,
	SETTHREADDAEMON=16, THREADSTATE=17, THREADINTERRUPTEDQ=18,
	THREADHOLDSLOCKQ=19, THREADSRUNNING=20, THREADRESULT=21,

	READY=0, RUNNING=1, FINISHED=2, FINISHED_ABNORMALLY=3;

        protected static Symbol 
	    S_READY=Symbol.get("ready"), S_RUNNING=Symbol.get("running"),
	    S_FINISHED=Symbol.get("finished"), 
	    S_FINISHED_ABNORMALLY=Symbol.get("finished-with-error");

    static ThreadGroup schemeThreads=new ThreadGroup("SISC Threads");

    public SThread() {
        define("thread/new", THREADNEW);    
        define("thread/start", THREADSTART);    
        define("thread/yield", THREADYIELD);    
        define("thread/interrupt", THREADINTERRUPT);
	define("thread/join", THREADJOIN);
	define("thread/result", THREADRESULT);
	define("thread/current", THREADCURRENT);
	define("thread/synchronized", THREADSYNCHRONIZED);
	define("thread/notify", THREADNOTIFY);
	define("thread/notify-all", THREADNOTIFYALL);
	define("thread/wait", THREADWAIT);
	define("thread/name", THREADNAME);
	define("thread/name!", SETTHREADNAME);
	define("thread/priority", THREADPRIORITY);
	define("thread/daemon?", THREADDAEMONQ);
	define("thread/daemon!", SETTHREADDAEMON);
	define("thread/priority!", SETTHREADPRIORITY);
	define("thread/state", THREADSTATE);
	define("thread/interrupted?", THREADINTERRUPTEDQ);
	define("thread/holds-lock?", THREADHOLDSLOCKQ);
	define("_active-thread-count", THREADSRUNNING);
    }

    class ThreadContext extends Value implements Runnable {
        protected Interpreter parent;
	protected Procedure thunk;
	protected Thread thread;
	protected int state;
	Value rv;

	class CatchException extends Expression {
	    
	    public void eval(Interpreter r) throws ContinuationException {
		r.nxp=null;
		rv=r.acc;
		state=FINISHED_ABNORMALLY;
	    }

	    public Value express() {
		return list(sym("CatchException-exp"));
	    }
	    
	    public String display() {
		return "#<continuation>";
	    }
	}

        ThreadContext(Interpreter parent, Procedure thunk) {
	    this.parent = parent;
	    this.thunk = thunk;
	    thread=new Thread(schemeThreads, this);
	    state=READY;
        }

	public Value getResult(Interpreter r) throws ContinuationException {
	    if (state < FINISHED) {
		throw new RuntimeException("Thread has not yet terminated.");
	    } else if (state == FINISHED) {
		return rv;
	    } else {
		r.acc=rv;
		throw new ContinuationException(r.fk);
	    }
	}

	public int getState() {
	    return state;
	}

	public void start() {
	    thread.start();
	}

	public void run() {
	    Interpreter r = Context.enter(parent.ctx, parent.dynenv.copy());
	    state=RUNNING;
	    r.fk=new CallFrame(new CatchException(), null, null, null, null);
	    r.eval(thunk,new Value[]{});
	    if (state<FINISHED) {
		rv=r.acc;
		state=FINISHED;
	    }
	    Context.exit();
	}

        public String display() {
            return "#<thread>";
        }
    }

    public static final ThreadContext tcont(Value o) {
        try {
            return (ThreadContext)o;
        } catch (ClassCastException e) { typeError("thread context", o); }
	return null;
    }

    static Symbol stateOf(ThreadContext c) {
	switch (c.getState()) {
	case READY:
	    return S_READY;
	case RUNNING:
	    return S_RUNNING;
	case FINISHED:
	    return S_FINISHED;
	case FINISHED_ABNORMALLY:
	    return S_FINISHED_ABNORMALLY;
	default:
	    return null;
	}
    } 

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
	case 0:
            switch(primid) {
		//	    case THREADCURRENT:
		//		return f.dynenv.threadContext;
	    case THREADSRUNNING:
		return Quantity.valueOf(schemeThreads.activeCount());
	    case THREADYIELD:
		Thread.yield();
		return VOID;
            default:
                throw new RuntimeException( "incorrect number of arguments to procedure");
	    }
        case 1:
            switch(primid) {
            case THREADNEW:
		return new ThreadContext(f,proc(f.vlr[0]));
	    case THREADSTART:
		ThreadContext c=tcont(f.vlr[0]);
		c.start();
		return VOID;
	    case THREADINTERRUPT:
		c=tcont(f.vlr[0]);
		c.thread.interrupt();
		return VOID;
	    case THREADNAME:
		return new SchemeString(tcont(f.vlr[0]).thread.getName());
	    case THREADPRIORITY:
		return Quantity.valueOf(tcont(f.vlr[0]).thread.getPriority());
	    case THREADDAEMONQ:
		return truth(tcont(f.vlr[0]).thread.isDaemon());
	    case THREADRESULT:
		return tcont(f.vlr[0]).getResult(f);
	    case THREADJOIN:
		c=tcont(f.vlr[0]);
		if (c.state>=RUNNING) {
		    try {
			c.thread.join();
		    } catch (InterruptedException ie) {}
		} else {
		    error(f, "Thread has not yet started");
		}
	    case THREADSTATE:
		c=tcont(f.vlr[0]);
		return stateOf(c);
            default:
                throw new RuntimeException( "incorrect number of arguments to procedure");
            }
	case 2:
	    switch(primid) {
	    case THREADJOIN:
		ThreadContext c=tcont(f.vlr[0]);

		if (c.state>=RUNNING) {
		    try {
			c.thread.join(num(f.vlr[1]).longValue());
		    } catch (InterruptedException ie) {}
		    if (c.state==RUNNING) 
			return FALSE;
		    else return stateOf(c);
		} else {
		    throw new RuntimeException("Thread has not yet started");
		}
	    case SETTHREADPRIORITY:
		tcont(f.vlr[0]).thread.setPriority(num(f.vlr[1]).intValue());
		return VOID;
	    case SETTHREADDAEMON:
		tcont(f.vlr[0]).thread.setDaemon(truth(f.vlr[1]));
		return VOID;
	    case SETTHREADNAME:
		c=tcont(f.vlr[0]);
		c.thread.setName(string(f.vlr[1]));
		return VOID;
	    default:
		throw new RuntimeException( "incorrect number of arguments to procedure");
	    }
        default:
	    throw new RuntimeException( "incorrect number of arguments to procedure");
        }
    }
}
