package sisc.modules;

import java.io.*;
import sisc.data.*;
import sisc.exprs.*;
import sisc.interpreter.*;
import sisc.nativefun.*;

import sisc.io.ValueWriter;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;

public class SThread extends ModuleAdapter {

    protected static final Symbol THREADB =
        Symbol.intern("sisc.modules.Messages");

    protected static final Symbol MUTEX=Symbol.get("mutex");

    protected static final int 
        THREADNEW=0, THREADSTART=1, THREADYIELD=2, THREADSLEEP=3,
        THREADINTERRUPT=4, THREADJOIN=5, THREADCURRENT=6,
        THREADQ=7, THREADNOTIFY=8, THREADNOTIFYALL=9,
        THREADWAIT=10, THREADNAME=11, THREADPRIORITY=12, 
        THREADDAEMONQ=13, SETTHREADNAME=14, SETTHREADPRIORITY=15,
        SETTHREADDAEMON=16, THREADSTATE=17, THREADINTERRUPTEDQ=18,
        THREADHOLDSLOCKQ=19, THREADSRUNNING=20, THREADRESULT=21,
        MUTEXNEW=22, MUTEXLOCK=23, MUTEXUNLOCK=24, 
        CONDVARNOTIFY=25, CONDVARNOTIFYALL=26, 
        MUTEXOF=28, MUTEXQ=29, CONDVARQ=30, CONDVARNEW=31;


    protected static Symbol 
	    S_READY=Symbol.get("ready"), S_RUNNING=Symbol.get("running"),
	    S_FINISHED=Symbol.get("finished"), 
	    S_FINISHED_ABNORMALLY=Symbol.get("finished-with-error");

    public SThread() {
        define("thread?", THREADQ);
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

        define("condvar?", CONDVARQ);
        define("condvar/new", CONDVARNEW);
        define("condvar/notify", CONDVARNOTIFY);
        define("condvar/notify-all", CONDVARNOTIFYALL);

        define("mutex?", MUTEXQ);
        define("mutex-of", MUTEXOF);
        define("mutex/new", MUTEXNEW);
        define("mutex/lock!", MUTEXLOCK);
        define("mutex/unlock!", MUTEXUNLOCK);
    }

    public static class CondVar extends Value implements NamedValue {

        public CondVar() {}

        public void display(ValueWriter w) throws IOException {
            displayNamedOpaque(w, "condvar");
        }

        public void c_notify() {
            synchronized(this) {
                notify();
            }
        }

        public void c_notifyall() {
            synchronized(this) {
                notifyAll();
            }
        }
    }

    public static class Mutex extends Value implements NamedValue {
        private transient int lockCount=0;
        private transient Thread owner=null;

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
                    if ((--lockCount)==0) {
                        owner=null;
                        this.notify();
                    }
                }
            }
        }

        public final void unlockAll() {
            if (owner==Thread.currentThread()) {
                synchronized(this) {
                    lockCount=0;
                    owner=null;
                    this.notify();
                }
            }
        }

        public void unlock(CondVar condvar) {
            while (true) {
                try {
                    synchronized(condvar) {
                        unlockAll();
                        condvar.wait();
                    }
                    return;
                } catch (InterruptedException e) {}
            }
        }

        public Value unlock(CondVar condvar, long timeout) {
            while (true) {
                try {
                    synchronized(condvar) {
                        unlockAll();
                        long start=System.currentTimeMillis();
                        condvar.wait(timeout);
                        // This is only a best guess.
                        if ((System.currentTimeMillis() - start) >= timeout)
                            return FALSE;
                    }
                    return TRUE;
                } catch (InterruptedException e) {}
            }
        }

        public void display(ValueWriter w) throws IOException {
            displayNamedOpaque(w, "mutex");
        }

        public static Mutex of(Value v) {
            synchronized(v) {
                Value m = v.getAnnotation(MUTEX);
                if (m==FALSE) {
                    m=new Mutex();
                    v.setAnnotation(MUTEX, m);
                }
                return mutex(m);
            }
        }

        public Mutex() {}

        public void serialize(Serializer ser) throws IOException {
            if (lockCount > 0 || owner != null)
                warn("serializinglockedmutex");
        }

        public boolean visit(ExpressionVisitor v) {
            return super.visit(v);
        }
    }

    public static final SchemeThread sthread(Value o) {
        try {
            return (SchemeThread)o;
        } catch (ClassCastException e) { typeError(THREADB, 
                                                   "sthread", o); }
        return null;
    }

    public static final Mutex mutex(Value o) {
        try {
            return (Mutex)o;
        } catch (ClassCastException e) { typeError(THREADB,
                                                   "mutex", o); }
        return null;
    }

    public static final CondVar condvar(Value o) {
        try {
            return (CondVar)o;
        } catch (ClassCastException e) { typeError(THREADB, 
                                                   "condvar", o); }
        return null;
    }

    static Symbol stateOf(SchemeThread c) {
        switch (c.getState()) {
        case SchemeThread.READY:
            return S_READY;
        case SchemeThread.RUNNING:
            return S_RUNNING;
        case SchemeThread.FINISHED:
            return S_FINISHED;
        case SchemeThread.FINISHED_ABNORMALLY:
            return S_FINISHED_ABNORMALLY;
        default:
            return null;
        }
    } 

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            switch(primid) {
            case MUTEXNEW:
                return new Mutex();
            case CONDVARNEW:
                return new CondVar();
            case THREADCURRENT:
                SchemeThread t=Context.lookupThreadContext().hostThread;
                if (t==null) return FALSE;
                else return t;
            case THREADSRUNNING:
                return Quantity.valueOf(SchemeThread.schemeThreads.activeCount());
            case THREADYIELD:
                Thread.yield();
                return VOID;
            default:
                throwArgSizeException();
            }
        case 1:
            switch(primid) {
            case THREADQ:
                return truth(f.vlr[0] instanceof SchemeThread);
            case MUTEXQ:
                return truth(f.vlr[0] instanceof Mutex);
            case CONDVARQ:
                return truth(f.vlr[0] instanceof CondVar);
            case MUTEXOF:
                return Mutex.of(f.vlr[0]);
            case MUTEXLOCK:
                return mutex(f.vlr[0]).acquire();
            case MUTEXUNLOCK:
                mutex(f.vlr[0]).unlock();
                return TRUE;
            case CONDVARNOTIFY:
                condvar(f.vlr[0]).c_notify();
                return VOID;
            case CONDVARNOTIFYALL:
                condvar(f.vlr[0]).c_notifyall();
                return VOID;
            case THREADNEW:
                return new SchemeThread(f,proc(f.vlr[0]));
            case THREADSTART:
                SchemeThread c=sthread(f.vlr[0]);
                c.start();
                while (c.state==SchemeThread.READY) {
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
                Context.lookupThreadContext(c.thread).interrupt=true;
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
                if (c.state>=SchemeThread.RUNNING) {
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
            case MUTEXUNLOCK:
                mutex(f.vlr[0]).unlock(condvar(f.vlr[1]));
                return TRUE;
            case MUTEXLOCK:
                long timeout=num(f.vlr[1]).longValue();
                return mutex(f.vlr[0]).lock(timeout);
            case THREADJOIN:
                SchemeThread c=sthread(f.vlr[0]);

                if (c.state>=SchemeThread.RUNNING) {
                    try {
                        c.thread.join(num(f.vlr[1]).indexValue());
                    } catch (InterruptedException ie) {}
                    if (c.state==SchemeThread.RUNNING) 
                        return FALSE;
                    else return stateOf(c);
                } else {
                    throw new RuntimeException(liMessage(THREADB,"threadnotstarted"));
                }
            case THREADHOLDSLOCKQ:
                return truth(mutex(f.vlr[0]).owner==sthread(f.vlr[0]).thread);
            case SETTHREADPRIORITY:
                sthread(f.vlr[0]).thread.setPriority(num(f.vlr[1]).indexValue());
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
        case 3:
            switch(primid) {
            case MUTEXUNLOCK:
                return mutex(f.vlr[0]).unlock(condvar(f.vlr[1]), 
                                              num(f.vlr[2]).longValue());
            default:
                throwArgSizeException();
            }
        default:
            throwArgSizeException();
        }
        return VOID;
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
