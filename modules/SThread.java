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
import java.io.*;
import sisc.Serializer;

public class SThread extends ModuleAdapter {
    public String getModuleName() {
	return "Threading";
    }

    protected static final int 
	THREADNEW=0, THREADSTART=1, THREADYIELD=2, THREADSLEEP=3,
	THREADINTERRUPT=4, THREADJOIN=5, THREADCURRENT=6,
	/*<7>*/ THREADNOTIFY=8, THREADNOTIFYALL=9,
	THREADWAIT=10, THREADNAME=11, THREADPRIORITY=12, 
	THREADDAEMONQ=13, SETTHREADNAME=14, SETTHREADPRIORITY=15,
	SETTHREADDAEMON=16, THREADSTATE=17, THREADINTERRUPTEDQ=18,
	THREADHOLDSLOCKQ=19, THREADSRUNNING=20, THREADRESULT=21,
	MONITORNEW=22, MONITORLOCK=23, MONITORUNLOCK=24, 
	MONITORNOTIFY=25, MONITORNOTIFYALL=26, MONITORWAIT=27,

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

	define("thread/_active-thread-count", THREADSRUNNING);

	define("monitor/new", MONITORNEW);
	define("monitor/lock", MONITORLOCK);
	define("monitor/unlock", MONITORUNLOCK);
	define("monitor/wait", MONITORWAIT);
	define("monitor/notify", MONITORNOTIFY);
	define("monitor/notify-all", MONITORNOTIFY);
    }

    public static class Monitor extends NamedValue {
	private int lockCount=0;
	private Thread owner=null;
	private Object condvar=new Object();

	public Value lock(long timeout) {
	    Thread thisThread=null;

	    synchronized(this) {
		if (owner == null) {
		    owner=Thread.currentThread();
		    
		} else if ((thisThread=Thread.currentThread())!= 
			   owner) {
		    
		    long lastAwoken=System.currentTimeMillis();
		    
		    while (lockCount>0) {
			try {
			    this.wait(timeout);
			} catch (InterruptedException ie) {}

			long now=System.currentTimeMillis();
			timeout-=(now-lastAwoken);
			if (timeout <= 0)
			    return FALSE;
			else
			    lastAwoken=now;
		    }
		    owner=thisThread;
		}
		lockCount++;
		return TRUE;
	    }
	}

	public final Value acquire() {
	    Thread thisThread=Thread.currentThread();

	    if (owner==thisThread) 
		lockCount++;
	    else {
		synchronized(this) {
		    while (lockCount>0) {
			try {
			    this.wait();
			} catch (InterruptedException ie) {}
			
		    }
		    lockCount++;
		}
		owner=thisThread;
	    }

	    
	    return TRUE;
	}

	public final void unlock() {
	    if (owner==Thread.currentThread()) {
		if ((--lockCount)==0) {
		    owner=null;
		    synchronized(this) {
			this.notify();
		    }
		}
	    }
	}

	public void m_notify() {
	    synchronized(condvar) {
		condvar.notify();
	    }
	}

	public void m_notifyall() {
	    synchronized(condvar) {
		condvar.notifyAll();
	    }
	}

	public void m_wait() {
	    while (true) {
		try {
		    synchronized(condvar) {
			condvar.wait();
		    }
		    return;
		} catch (InterruptedException e) {}
	    }
	}

	public void m_wait(long timeout) {
	    while (true) {
		try {
		    synchronized(condvar) {
			condvar.wait(timeout);
		    }
		    return;
		} catch (InterruptedException e) {}
	    }
	}

	public String display() {
	    return ((NamedValue)this).displayNamedOpaque("monitor");
	}

        public Monitor() {}

        public void serialize(Serializer s, DataOutput dos)
            throws IOException {
            if (SERIALIZATION) {}
        }

        public void deserialize(Serializer s, DataInput dis)
            throws IOException {
            if (SERIALIZATION) {}
        }
    }

    public static class ThreadContext extends NamedValue implements Runnable {
        protected Interpreter parent;
	protected Procedure thunk;
	protected Thread thread;
	protected int state;
	Value rv;

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
            DynamicEnv newenv = parent.dynenv.copy();
            newenv.wind = FALSE;
	    Interpreter r = Context.enter(parent.ctx, newenv);
	    state=RUNNING;
	    synchronized(this) {
		this.notify();
	    }
	    try {
		rv=r.eval(thunk,new Value[]{});
		state=FINISHED;
	    } catch (SchemeException se) {
		rv=new Values(new Value[] {se.m, se.e, se.f});
		state=FINISHED_ABNORMALLY;
	    } 
	    Context.exit();
	}

        public String display() {
            return ((NamedValue)this).displayNamedOpaque("thread");
        }
    }

    public static final ThreadContext tcont(Value o) {
        try {
            return (ThreadContext)o;
        } catch (ClassCastException e) { typeError("thread context", o); }
	return null;
    }

    public static final Monitor monitor(Value o) {
        try {
            return (Monitor)o;
        } catch (ClassCastException e) { typeError("monitor", o); }
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
	    case MONITORNEW:
		return new Monitor();

		//	    case THREADCURRENT:
		//		return f.dynenv.threadContext;
	    case THREADSRUNNING:
		return Quantity.valueOf(schemeThreads.activeCount());
	    case THREADYIELD:
		Thread.yield();
		return VOID;
            default:
                throwArgSizeException();
	    }
        case 1:
            switch(primid) {
	    case MONITORLOCK:
		return monitor(f.vlr[0]).acquire();
	    case MONITORUNLOCK:
		monitor(f.vlr[0]).unlock();
		return VOID;
	    case MONITORNOTIFY:
		monitor(f.vlr[0]).m_notify();
		return VOID;
	    case MONITORNOTIFYALL:
		monitor(f.vlr[0]).m_notifyall();
		return VOID;
	    case MONITORWAIT:
		monitor(f.vlr[0]).m_wait();
		return VOID;
            case THREADNEW:
		return new ThreadContext(f,proc(f.vlr[0]));
	    case THREADSTART:
		ThreadContext c=tcont(f.vlr[0]);
		c.start();
		while (c.state==READY) {
		    synchronized(c) {
			try {
			    c.wait(500);
			} catch (InterruptedException e) {}
		    }
		}
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
                throwArgSizeException();
            }
	case 2:
	    switch(primid) {
	    case MONITORLOCK:
		long timeout=num(f.vlr[1]).longValue();
		return monitor(f.vlr[0]).lock(timeout);
	    case MONITORWAIT:
		monitor(f.vlr[0]).m_wait(num(f.vlr[1]).longValue());
		return VOID;
	    case THREADJOIN:
		ThreadContext c=tcont(f.vlr[0]);

		if (c.state>=RUNNING) {
		    try {
			c.thread.join(num(f.vlr[1]).intValue());
		    } catch (InterruptedException ie) {}
		    if (c.state==RUNNING) 
			return FALSE;
		    else return stateOf(c);
		} else {
		    throw new RuntimeException("Thread has not yet started");
		}
	    case THREADHOLDSLOCKQ:
		return truth(monitor(f.vlr[0]).owner==tcont(f.vlr[0]).thread);
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
		throwArgSizeException();
	    }
        default:
	    throwArgSizeException();
        }
	return VOID;
    }
}
