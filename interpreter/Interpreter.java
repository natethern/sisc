package sisc.interpreter;

import java.lang.ref.*;
import java.io.*;
import java.util.*;
import sisc.io.*;
import sisc.data.*;
import sisc.compiler.*;
import sisc.exprs.*;
import sisc.env.*;
import sisc.compiler.Compiler;
import sisc.util.Util;

/**
 * The SISC engine.
 * 
 * Interpreter is the SISC engine.  It contains the engine registers,
 * and the main loop responsible for repeatedly executing the
 * <tt>nxp</tt> register and maintaining the stack. Interpreter also
 * localizes all thread-specific information.  One Interpreter
 * instance must exist per executing Scheme thread.
 */
public class Interpreter extends Util {

    public static class ThrowSchemeException extends Expression {
	
        public void eval(Interpreter r) 
            throws ContinuationException, SchemeRuntimeException {
            r.nxp=null;
            Values v=(Values)r.acc;
            throw new SchemeRuntimeException(v.values[0], 
                                             proc(v.values[1]), 
                                             v.values.length>2 ? 
                                             proc(v.values[2]) :
                                             //If we are at the top of the
                                             //stack, use a default fk
                                             (r.fk == null ? top_fk : r.fk));
        }

        public Value express() {
            return list(Symbol.get("TSException"));
        }
    }

    //the compiler is stateless; if that ever changes it would need to
    //be moved to the dynenv
    public static Compiler compiler = new Compiler();

    public AppContext ctx;
    public ThreadContext tctx;
    public DynamicEnvironment dynenv;

    //ACCOUNTING REGISTERS
    public CallFrame             lcf, llcf;//used for continuation capture
    public Expression            lxp;      //used only for debugging
    public boolean               vlk;      //vlk, when true, indicates the
                                           //frame was captured.
    public boolean             cap[];      //Indicates which vlr positions
                                           //contained a k capture.

    //ACTIVITY REGISTERS
    public Value                 acc;
    public Expression            nxp;
    public Value[]               vlr;
    public LexicalEnvironment    env;     
    public CallFrame             stk, 
                                  fk;

    //Scheme->Java exception conversion FK
    static CallFrame top_fk = new CallFrame(new ThrowSchemeException(),
                                            null, false, null, null, null,
                                            null);
    static {
        top_fk.vlk = true;
        // This creates a loop in the stack, which will be a problem for
        // any code checking for null as the bottom of the stack.  However,
        // the only code in SISC which does this is CallFrame.capture(), which
        // will also break when vlk=true.
        top_fk.fk=top_fk;
    }

    public Interpreter(AppContext ctx, ThreadContext tctx, DynamicEnvironment dynenv) {
        fk=top_fk;
        this.ctx = ctx;
        this.tctx = tctx;
        this.dynenv = dynenv;

        // Set l*cf to a dummy frame, so we dont have to null check 
        // in returnFrame
        llcf=lcf=new CallFrame(null, null, true, null, null, null, null);
    }

    public Expression compile(Value v) throws ContinuationException {
        return compiler.compile(this, v, ctx.toplevel_env);
    }

    public Expression compile(Value v, SymbolicEnvironment env)
        throws ContinuationException {
        return compiler.compile(this, v, env);
    }

    protected Value interpret(Expression e) throws SchemeException {
        stk=createFrame(null, null, false, null, top_fk, null, null);
        nxp=e;
        interpret();
        return acc;
    }
    
    protected void interpret() throws SchemeException {
        try {
            do {
                try {
                    do {
                        while (nxp==null) 
                            pop(stk);
                        //                        System.err.println(nxp);
                        nxp.eval(this);
                    } while (true);
                } catch (ContinuationException ce) {
                    pop(ce.k);
                }
            } while (true);
        } catch (NullPointerException done) {
            if (nxp!=null) 
                throw done;
        } catch (SchemeRuntimeException rte) {
            throw rte.promote();
        }
    }

    public final void newVLR(int size) {
        vlk=false;
        cap=null;
        vlr=createValues(size);
    }

    public final void pop(CallFrame c) {
        cap=c.cap;
        nxp=c.nxp;
        vlr=c.vlr;
        env=c.env;
        fk=c.fk;
        stk=c.parent;
        vlk=c.vlk;
        returnFrame(llcf);
        llcf=lcf;
        lcf=c;
    }

    public final void push(Expression nxp) {
        stk=createFrame(nxp, vlr, vlk, env, fk, stk, cap);
    }

    public final void setVLR(int pos, Value v) {
        if (cap!=null) {
            for (int i=pos; i>=0; i--) {
                if (cap[i]) {
                    if (i+1 < vlr.length)
                        cap[i+1]=false;
                    llcf.parent=lcf=lcf.makeSafe(this);
                    vlr=lcf.vlr;
                    break;
                }
            }
        }
        vlr[pos]=v;
    }

    /**
     * Parses and evaluates s-expression(s) from an input port
     * 
     * @param port input port
     * @return The value of the last evaluated s-expression
     * @exception IOException Raised if the port does not
     *     contain a parseable s-expression
     * @exception SchemeException Raised if the evaluation of  
     *      an expression results in an error
     */
    public Value evalInput(InputPort port) throws IOException, SchemeException {
        Value rv=VOID;
        do {
            try {
                rv=eval(dynenv.parser.nextExpression(port));
            } catch (EOFException e) {
                return rv;
            }
        } while (true);
    }

    /**
     * Parses and evaluates s-expression(s)
     * 
     * @param expr s-expressions(s)
     * @return The value of the last evaluated s-expression
     * @exception IOException Raised if the given string does not  
     *     contain a parseable s-expression
     * @exception SchemeException Raised if the evaluation of  
     *      an expression results in an error
     */
    public Value eval(String expr) throws IOException, SchemeException {
        return evalInput(new ReaderInputPort(new BufferedReader(new StringReader(expr))));
    }

    /**
     * Parses and evaluates s-expression(s) from a stream
     * 
     * @param stream s-expression stream
     * @param sourceId string identifying the stream source
     * @return The value of the last evaluated s-expression
     * @exception IOException Raised if the stream does not  
     *     contain a parseable s-expression
     * @exception SchemeException Raised if the evaluation of  
     *      an expression results in an error
     */
    public Value eval(InputStream stream, String sourceId) throws IOException, SchemeException {
        return evalInput(new SourceInputPort(new BufferedInputStream(stream), sourceId));
    }

    /**
     * Evaluates a Scheme value as code.  This is equivalent to
     * <tt>(eval <i>v</i>)</tt> in Scheme.
     * 
     * @param v A Scheme Value
     * @return The resulting value
     * @exception SchemeException Raised if the evaluation of the  
     *     expression  results in an error
     */
    public Value eval(Value v) throws SchemeException {
        return eval(ctx.evaluator, new Value[] {v});
    }

    /**
     * Applies the given procedure to the given values
     * 
     * @param p A procedure
     * @param args Arguments to call the procedure with
     * @return The result returned by the procedure
     * @exception SchemeException Raised if applying the
     *     procedure results in an error
     */
    public Value eval(Procedure p, Value[] args) throws SchemeException {
        acc = p;
        vlr = args;
        return interpret(APPEVAL);
    }

    public SymbolicEnvironment lookupContextEnv(Symbol s) {
        return ctx.lookupContextEnv(s);
    }

    public void defineContextEnv(Symbol s, SymbolicEnvironment env) {
        ctx.defineContextEnv(s, env);
    }

    public SymbolicEnvironment getContextEnv(Symbol s) {
        SymbolicEnvironment contenv=null;
        try {
            contenv = lookupContextEnv(s);
        } catch (ArrayIndexOutOfBoundsException e) {
            contenv=new MemorySymEnv();
            defineContextEnv(s, contenv);
        }
        return contenv;
    }

    /**
     * Defines a new binding in a named environment.
     * 
     * @param s The name of the new binding
     * @param v The value of the new binding
     * @param context The name of the environment in which to  
     *      create the binding
     */
    public void define(Symbol s, Value v, Symbol context) {
        getContextEnv(context).define(s, v);
    }


    /**
     * Retrieves the value of a binding in a named environment
     * 
     * @param s The name of the binding
     * @param context The name of the environment from which   
     *      the  binding will be retrieved
     * @return A value or expression
     */
    public Expression lookup(Symbol s, Symbol context) {
        try {
            return lookupContextEnv(context).lookup(s);
        } catch (ArrayIndexOutOfBoundsException e) {
            return null;
        }
    }

    /**
     * Removes a binding in a named environment
     * 
     * @param s The name of the binding
     * @param context The name of the environment from which   
     *      the  binding will be retrieved
     */
    public void undefine(Symbol s, Symbol context) {
        try {
            lookupContextEnv(context).undefine(s);
        } catch (ArrayIndexOutOfBoundsException e) {}
    }

    //POOLING
    //STATIC --------------------

    protected static final int FRAMEPOOLSIZE=24, FPMAX=FRAMEPOOLSIZE-1;
    protected CallFrame deadFrames[]=new CallFrame[FRAMEPOOLSIZE];
    protected int deadFramePointer=-1;
    CallFrame rv;

    public CallFrame createFrame(Expression n, Value[] v,
                                 boolean vlk, 
                                 LexicalEnvironment e,
                                 CallFrame f,
                                 CallFrame p, 
                                 boolean[] cap) {
        if (deadFramePointer < 0)
            return new CallFrame(n,v,vlk,e,f,p,cap);
        else {
	    rv=deadFrames[deadFramePointer];
            deadFrames[deadFramePointer--]=null;
            rv.nxp=n;
            rv.vlr=v;
            rv.vlk=vlk;
            rv.env=e;
            rv.fk=f;
            rv.parent=p;
            rv.cap=cap;
            return rv;
        }
    }
    
    public final void returnFrame(CallFrame f) {
        if (!f.vlk && (deadFramePointer < FPMAX)) {
            deadFrames[++deadFramePointer]=f;
        }
    }

    protected static final int LENVPOOLSIZE=128, LEMAX=LENVPOOLSIZE-1;
    protected LexicalEnvironment deadLenvs[]=new LexicalEnvironment[LENVPOOLSIZE];
    protected int deadLenvPointer=-1;
    /*
    protected static int m, o, h;
    static {
        System.runFinalizersOnExit(true);
    }
    protected void finalize() throws Throwable {
        if (m>0) {
            System.err.println("M:"+m+" H:"+h+" O:"+o);
            m=o=h=0;
        }
    }
   */
    public final void returnEnv() {
        if (env != null && !env.locked) {
            returnValues(env.vals);
            if (deadLenvPointer < LEMAX)
                deadLenvs[++deadLenvPointer]=env;
            //else 
            //    o++;
        }
    }
    
    public final void newLenv(Value[] vals, 
                              LexicalEnvironment p) {
        if (deadLenvPointer < 0) {
	    //m++;
            env=new LexicalEnvironment(vals, p);
        } else {
            //h++;
            env=deadLenvs[deadLenvPointer--];
            //            deadLenvs[deadLenvPointer--]=null;
            env.vals=vals;
            env.parent=p;
        }
    }

    protected static final int VALUESPOOLSIZE=8;
    protected Value deadValues[][] = new Value[VALUESPOOLSIZE][];

    //static int sizemiss, miss, hit, zerohit;
    public final Value[] createValues(int size) {
        if (size == 0) { 
            //zerohit++; 
            return ZV; 
        }
        if (size >= VALUESPOOLSIZE) { 
            //sizemiss++; 
            return new Value[size]; 
        }
        
        Value[] res = deadValues[size];
        if (res == null) { 
            return new Value[size]; 
        }
        deadValues[size] = null;
        return res;
    }

    public final void returnVLR() {
        if (!vlk) {
            returnValues(vlr);
        }
        vlr=null;
    }

    public final void replaceVLR(int size) {
        if (!vlk) {
            returnValues(vlr);
        }
        newVLR(size);
    }

    public final void returnValues(Value[] v) {
        if (v == null) return;
        int size = v.length;
        if (size == 0 || size >= VALUESPOOLSIZE) return;
        deadValues[size] = v;
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
