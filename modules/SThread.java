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
	NEWTHREAD=0, THREADSTART=1, THREADRETURNVALUE=2, THREADSTATE=3,
	THREADSRUNNING=4, 

	READY=0, RUNNING=1, FINISHED=2;

        protected static Symbol 
	    S_READY=Symbol.get("ready"), S_RUNNING=Symbol.get("running"),
	    S_FINISHED=Symbol.get("finished");

    static ThreadGroup schemeThreads=new ThreadGroup("SISC Threads");

    public SThread() {
        define("new-thread", NEWTHREAD);    
        define("thread-start", THREADSTART);    
	define("thread-return-value", THREADRETURNVALUE);
	define("thread-state", THREADSTATE);
	define("_active-thread-count", THREADSRUNNING);
    }

    class ThreadContext extends Value implements Runnable {
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

	public int getState() {
	    return state;
	}

	public void start() {
	    thread.start();
	}

	public void run() {
	    Interpreter r = Context.enter(parent.ctx, parent.dynenv.copy());
	    state=RUNNING;
	    r.eval(thunk,new Value[]{});
	    rv=r.acc;
	    state=FINISHED;
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

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
	case 0:
            switch(primid) {
	    case THREADSRUNNING:
		return Quantity.valueOf(schemeThreads.activeCount());
            default:
                error(f, "Incorrect number of arguments to procedure "+f.acc);
	    }
        case 1:
            switch(primid) {
            case NEWTHREAD:
		return new ThreadContext(f,proc(f.vlr[0]));
	    case THREADSTART:
		ThreadContext c=tcont(f.vlr[0]);
		c.start();
		return VOID;
	    case THREADRETURNVALUE:
		c=tcont(f.vlr[0]);
		if (c.rv==null)
		    error(f, "Thread has not completed");
		else return c.rv;
	    case THREADSTATE:
		c=tcont(f.vlr[0]);
		switch (c.getState()) {
		case READY:
		    return S_READY;
		case RUNNING:
		    return S_RUNNING;
		case FINISHED:
		    return S_FINISHED;
		} 
            default:
                error(f, "Incorrect number of arguments to procedure "+f.acc);
            }
        default:
            error(f, "Incorrect number of arguments to procedure "+f.acc);
        }
        return VOID;
    }
}
