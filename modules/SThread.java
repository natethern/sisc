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
import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class SThread extends ModuleAdapter {
    public String getModuleName() {
        return "Threading";
    }

    static final Symbol THREADB=Symbol.intern("Threading"),
        MONITOR=Symbol.get("monitor");

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
        MONITORFOR=28,

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

        define("monitor-of", MONITORFOR);
        define("monitor/new", MONITORNEW);
        define("monitor/lock", MONITORLOCK);
        define("monitor/unlock", MONITORUNLOCK);
        define("monitor/wait", MONITORWAIT);
        define("monitor/notify", MONITORNOTIFY);
        define("monitor/notify-all", MONITORNOTIFY);
    }

    public static class CondVar extends NamedValue {
        public CondVar() {};

        public String display() {
            return displayNamedOpaque("condvar");
        }
    }

    public static class Monitor extends NamedValue {
        private transient int lockCount=0;
        private transient Thread owner=null;
        private CondVar condvar=new CondVar();

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
                synchronized(this) {
                    synchronized(condvar) {
                        if ((--lockCount)==0) {
                            owner=null;
                            this.notify();
                        }
                    }
                }
            }
        }

        public final void unlockAll() {
            if (owner==Thread.currentThread()) {
                synchronized(this) {
                    synchronized(condvar) {
                        lockCount=0;
                        owner=null;
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
                        unlockAll();
                        condvar.wait();
                    }
                    acquire();
                    return;
                } catch (InterruptedException e) {}
            }
        }

        public void m_wait(long timeout) {
            while (true) {
                try {
                    synchronized(condvar) {
                        unlockAll();
                        condvar.wait(timeout);
                        acquire();
                    }
                    return;
                } catch (InterruptedException e) {}
            }
        }

        public String display() {
            return ((NamedValue)this).displayNamedOpaque("monitor");
        }

        public static Monitor of(Value v) {
            synchronized(v) {
                Value m = v.getAnnotation(MONITOR);
                if (m==FALSE) {
                    m=new Monitor();
                    v.setAnnotation(MONITOR, m);
                }
                return monitor(m);
            }
        }

        public Monitor() {}

        public void serialize(Serializer ser) throws IOException {
            if (lockCount > 0 || owner != null)
                warn("serializinglockedmonitor");
            ser.writeExpression(condvar);
        }

        public void deserialize(Deserializer ser) throws IOException {
            condvar=(CondVar)ser.readExpression();
        }
    }

    public static class SchemeThread extends NamedValue implements Runnable {
        protected AppContext ctx;
        protected DynamicEnv env;
        protected Procedure thunk;
        protected Thread thread;
        protected Interpreter interp;
        protected int state;
        Value rv;

        SchemeThread(Interpreter parent, Procedure thunk) {
            this.ctx = parent.ctx;
            this.env = parent.dynenv.copy();
            this.env.wind = FALSE;
            this.thunk = thunk;
            thread=new Thread(schemeThreads, this);
            state=READY;
        }

        public Value getResult(Interpreter r) throws ContinuationException {
            if (state < FINISHED) {
                throw new RuntimeException(liMessage(THREADB,"threadnotyetterminated"));
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
            interp = Context.enter(ctx, env);
            state=RUNNING;
            synchronized(this) {
                this.notify();
            }
            try {
                rv=interp.eval(thunk,new Value[]{});
                state=FINISHED;
            } catch (SchemeException se) {
                rv=new Values(new Value[] {se.m, se.e});
                state=FINISHED_ABNORMALLY;
            } 
            Context.exit();
        }

        public String display() {
            return ((NamedValue)this).displayNamedOpaque("thread");
        }
    }

    public static final SchemeThread sthread(Value o) {
        try {
            return (SchemeThread)o;
        } catch (ClassCastException e) { typeError("sthread", o); }
        return null;
    }

    public static final Monitor monitor(Value o) {
        try {
            return (Monitor)o;
        } catch (ClassCastException e) { typeError("monitor", o); }
        return null;
    }

    static Symbol stateOf(SchemeThread c) {
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
            case MONITORFOR:
                return Monitor.of(f.vlr[0]);
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
                return new SchemeThread(f,proc(f.vlr[0]));
            case THREADSTART:
                SchemeThread c=sthread(f.vlr[0]);
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
                c=sthread(f.vlr[0]);
                c.thread.interrupt();
                c.interp.abortEvaluation();
                return VOID;
            case THREADNAME:
                return new SchemeString(sthread(f.vlr[0]).thread.getName());
            case THREADPRIORITY:
                return Quantity.valueOf(sthread(f.vlr[0]).thread.getPriority());
            case THREADDAEMONQ:
                return truth(sthread(f.vlr[0]).thread.isDaemon());
            case THREADRESULT:
                return sthread(f.vlr[0]).getResult(f);
            case THREADJOIN:
                c=sthread(f.vlr[0]);
                if (c.state>=RUNNING) {
                    try {
                        c.thread.join();
                    } catch (InterruptedException ie) {}
                } else {
                    error(f, liMessage(THREADB,"threadnotstarted"));
                }
            case THREADSTATE:
                c=sthread(f.vlr[0]);
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
                SchemeThread c=sthread(f.vlr[0]);

                if (c.state>=RUNNING) {
                    try {
                        c.thread.join(num(f.vlr[1]).intValue());
                    } catch (InterruptedException ie) {}
                    if (c.state==RUNNING) 
                        return FALSE;
                    else return stateOf(c);
                } else {
                    throw new RuntimeException(liMessage(THREADB,"threadnotstarted"));
                }
            case THREADHOLDSLOCKQ:
                return truth(monitor(f.vlr[0]).owner==sthread(f.vlr[0]).thread);
            case SETTHREADPRIORITY:
                sthread(f.vlr[0]).thread.setPriority(num(f.vlr[1]).intValue());
                return VOID;
            case SETTHREADDAEMON:
                sthread(f.vlr[0]).thread.setDaemon(truth(f.vlr[1]));
                return VOID;
            case SETTHREADNAME:
                c=sthread(f.vlr[0]);
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
