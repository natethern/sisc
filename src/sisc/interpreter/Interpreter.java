package sisc.interpreter;

import java.io.*;
import sisc.io.*;
import sisc.data.*;
import sisc.env.*;
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
            throw new SchemeRuntimeException(pair(v.values[0]), 
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

    public ThreadContext tctx;
    public DynamicEnvironment dynenv;
    
    //FLAGS
    public boolean saveVLR;
        
    //ACCOUNTING REGISTERS
    public CallFrame             lcf, llcf;//used for continuation capture
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

    public Interpreter(ThreadContext tctx, DynamicEnvironment dynenv) {
        fk=top_fk;
        this.tctx = tctx;
        this.dynenv = dynenv;
        // Set l*cf to a dummy frame, so we dont have to null check 
        // in returnFrame
        llcf=lcf=new CallFrame(null, null, true, null, null, null, null);
    }

    public AppContext getCtx() {
        return dynenv.ctx;
    }

    public Symbol getSymbol(String v) {
    return Symbol.get(v, dynenv.caseSensitive);
    }

    public Expression compile(Value v) throws ContinuationException {
        return compiler.compile(this, v, getCtx().toplevel_env);
    }

    public Expression compile(Value v, SymbolicEnvironment env)
        throws ContinuationException {
        return compiler.compile(this, v, env);
    }

    protected Value interpret(Expression e) throws SchemeException {
        stk=createFrame(null, null, false, null, top_fk, null);
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

    public final void next(Expression nextExpr) throws ContinuationException {
        nxp=nextExpr;
        nextExpr.eval(this);
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

    public final void setVLR(int pos, Value v) {
        if (cap!=null) {
            for (int i=pos; i>=0; i--) {
                if (cap[i]) {
                    llcf.parent=lcf=lcf.makeSafe(this);
                    vlr=lcf.vlr;
                    cap = null;
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
        return eval((Procedure)lookup(EVAL, REPORT), new Value[] {v, (Value)getCtx().toplevel_env});
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
        return getCtx().lookupContextEnv(s);
    }

    public void defineContextEnv(Symbol s, SymbolicEnvironment env) {
        getCtx().defineContextEnv(s, env);
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

    protected static final int FRAMEPOOLMAX=128;
    protected CallFrame frameFreeList;
    protected int frameFreeListSize;

    public final CallFrame createFrame(Expression n,
                                       Value[] v,
                                       boolean vlk, 
                                       LexicalEnvironment e,
                                       CallFrame f,
                                       CallFrame p) {
        if (frameFreeList == null)
            return new CallFrame(n,v,vlk,e,f,p, null);
        else {
            frameFreeList.fk=f;
            f=frameFreeList;
            frameFreeList=frameFreeList.parent;
            frameFreeListSize--;
            f.nxp=n;
            f.vlr=v;
            f.vlk=vlk;
            f.env=e;
            f.parent=p;
            f.cap=null;
            return f;
        }
    }

    public final void push(Expression n) {
        if (frameFreeList == null)
            stk=new CallFrame(n,vlr,vlk,env,fk,stk,cap);
        else {
            CallFrame rv=frameFreeList;
            frameFreeList=frameFreeList.parent;
            frameFreeListSize--;
            rv.fk=fk;
            rv.nxp=n;
            rv.vlr=vlr;
            rv.vlk=vlk;
            rv.env=env;
            rv.parent=stk;
            rv.cap=cap;
            stk=rv;
        }
    }
    
    public final void returnFrame(CallFrame f) {
        if (f.vlk || frameFreeListSize >= FRAMEPOOLMAX) return;

        //Clear these fields to avoid hanging onto otherwise
        //garbage collectable data for too long
        f.env=null;
        f.vlr=null;

        f.parent=frameFreeList;
        frameFreeList = f;
        frameFreeListSize++;
    }

    protected static final int ENVPOOLMAX=128;
    protected LexicalEnvironment envFreeList;
    protected int envFreeListSize;

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
        for (int i=0; i<5; i++) {
            System.err.println(i+": "+sisc.exprs.AppExp.i[i]+
                                " "+sisc.exprs.AppExp.n[i]);   
        }
    }
   
*/
    public final void returnEnv() {
        if (env != null && !env.locked) {
            returnValues(env.vals);
            if (envFreeListSize < ENVPOOLMAX) {
                env.parent = envFreeList;
                envFreeList = env;
                envFreeListSize++;
            }
            //else 
            //    o++;
        }
    }
    
    public final void newEnv(Value[] vals, 
                             LexicalEnvironment p) {
        if (envFreeList == null) {
            //m++;
            env=new LexicalEnvironment(vals, p);
        } else {
            //h++;
            env=envFreeList;
            envFreeList = envFreeList.parent;
            envFreeListSize--;
            env.vals=vals;
            env.parent=p;
        }
    }

    protected static final int VALUESPOOLWIDTH=8;
    protected Value deadValues[][]=
    	new Value[VALUESPOOLWIDTH][];

    //static int sizemiss, miss, hit, zerohit;
    public final Value[] createValues(int size) {
        if (size == 0) { 
            //zerohit++; 
            return ZV; 
        }
        if (size >= VALUESPOOLWIDTH) { 
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
        if (vlr != null) {
            if (!vlk) 
                returnValues(vlr);
            vlr=null;
        }
    }
	
	public final void forceReturnVLR() {
        if (vlr != null) {
            returnValues(vlr);
        }
    }

    public final void replaceVLR(int size) {
        if (!vlk) {
            if (vlr.length == size) return;
            returnValues(vlr);
        }
        newVLR(size);
    }

    public final void returnValues(Value[] v) {
        int size = v.length;
        if (size == 0 || size >= VALUESPOOLWIDTH) return;
            deadValues[size]=v;
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
