package sisc.data;

import sisc.env.*;
import sisc.interpreter.*;
import sisc.io.ValueWriter;
import java.io.IOException;

public class SchemeThread extends NamedValue implements Runnable {
    public static final int READY=0, RUNNING=1, FINISHED=2, FINISHED_ABNORMALLY=3;

    public static final ThreadGroup 
        schemeThreads=new ThreadGroup("SISC Threads");

    public AppContext ctx;
    public DynamicEnvironment env;
    public Procedure thunk;
    public Thread thread;
    public int state;
    Value rv;
    
    public SchemeThread(String appName,
                        Procedure thunk) {
        this(Context.enter(appName), thunk);
    }

    public SchemeThread(Interpreter r, Procedure thunk) {
        this.ctx = r.ctx;
        this.env = r.dynenv.copy();
        this.env.wind = FALSE;
        this.thunk = thunk;
        thread=new Thread(schemeThreads, this);
        state=READY;

    }
    
    public Value getResult(Interpreter r) throws ContinuationException {
        if (state < FINISHED) {
            throw new RuntimeException(liMessage(SISCB,"threadnotyetterminated"));
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
        Interpreter interp = Context.enter(ctx, env);
        Context.lookupThreadContext().hostThread=this;

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
    
    public void display(ValueWriter w) throws IOException {
        displayNamedOpaque(w, "thread");
    }
}

