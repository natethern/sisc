package sisc.interpreter;

import java.io.*;
import sisc.io.*;
import sisc.compiler.Compiler;
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
    private boolean saveVLR; //prevent recycling of VLR after procedure
                             //invocation 

    //Interpreter specific temporaries
    public Value[][]               IAI=new Value[][] {new Value[1],
                                                      new Value[2],
                                                      new Value[3]};

    //ACCOUNTING REGISTERS
    private boolean              vlk;      //vlk, when true, indicates the
                                           //frame was captured.
    public Expression            lxp;      //Used for debugging

    //ACTIVITY REGISTERS
    public Value                 acc;    //Accumulator
    public Expression            nxp;    //Next Expression
    public Value[]               vlr,    //Value Rib
                                 lcl,    //Local Variables
                                 env;    //Lexical Variables
    public CallFrame             stk,    //Continuation (Stack)
                                  fk;    //Failure Continuation

    //Scheme->Java exception conversion FK
    static CallFrame top_fk = new CallFrame(new ThrowSchemeException(),
                                            null, false, null, null, null, null);
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
    }

    public AppContext getCtx() {
        return dynenv.ctx;
    }

    public Symbol getSymbol(String v) {
    return Symbol.get(v, dynenv.caseSensitive);
    }

    public Expression compile(Value v) throws ContinuationException {
        return compile(v, getCtx().toplevel_env);
    }

    public Expression compile(Value v, SymbolicEnvironment env)
        throws ContinuationException {
        return compiler.compile(this, v, env);
    }

    public Value interpret(Expression e) throws SchemeException {
        stk=createFrame(null, null, false, null, null, top_fk, null);
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
        newVLR(createValues(size));
    }
    
    public final void newVLR(Value[] vlr) {
        vlk=false;
        this.vlr=vlr;
    }
    
    public final void pop(CallFrame c) {
        nxp=lxp=c.nxp;
        vlr=c.vlr;
        lcl=c.lcl;
        env=c.env;
        fk=c.fk;
        stk=c.parent;
        vlk=c.vlk;
        returnFrame(c);
    }

    public final void setVLR(int pos, Value v) {
        if (vlk) {
            /**
               The frame which contains the current vlr has been
               captured by a continuation. As a result, several,
               possibly concurrent, evaluations may reach it. In order
               to prevent these evaluations from stepping on
               eachother's toes (i.e. modify the same vlr), we copy
               the vlr before writing to it. The copy does not need to
               be marked as captured since it is private to the
               current computation.
            **/
            Value[] newvlr = createValues(vlr.length);
            System.arraycopy(vlr, 0, newvlr, 0, vlr.length);
            vlr = newvlr;
            vlk = false;
        }
        vlr[pos]=v;
    }

    public void error(Pair error)  throws ContinuationException {
        Expression last = (nxp != null ? nxp : lxp);
        acc = new Values(new Value[] {
                             error,
                             new ApplyParentFrame(new CallFrame(last, 
                                                                vlr, vlk,
                                                                lcl, env,
                                                                fk, stk).capture(this))});
        throw new ContinuationException(fk);
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
                                       Value[] l,
                                       Value[] e,
                                       CallFrame f,
                                       CallFrame p) {
        CallFrame rv;
        if (frameFreeList == null) {
            rv=new CallFrame();
        } else {
            rv=frameFreeList;
            frameFreeList=frameFreeList.parent;
            frameFreeListSize--;
        }
        rv.parent=p;
        rv.fk=f;
        rv.nxp=n;
        rv.vlr=v;
        rv.vlk=vlk;
        rv.env=e;
        rv.lcl=l;
        return rv;
    }

    public final void push(Expression n) {
        CallFrame rv;
        if (frameFreeList == null) {
            rv=new CallFrame();
        } else {
            rv=frameFreeList;
            frameFreeList=frameFreeList.parent;
            frameFreeListSize--;
        }

        rv.parent=stk;
        stk=rv;
        stk.fk=fk;
        stk.nxp=n;
        stk.vlr=vlr;
        stk.vlk=vlk;
        stk.env=env;
        stk.lcl=lcl;
    }
    
    public final void returnFrame(CallFrame f) {
        if (f.vlk || frameFreeListSize >= FRAMEPOOLMAX) return;

        //Clear these fields to avoid hanging onto otherwise
        //garbage collectable data for too long
        
        f.lcl=f.vlr=f.env=null;
        

        f.parent=frameFreeList;
        frameFreeList = f;
        frameFreeListSize++;
    }


    protected Value dv1[], dv2[], dv3[], dv4[];
    
    public final Value[] createValues(int size) {
        Value[] rv;
        switch(size) {
        case 0: return ZV;
        case 1: 
            if (dv1 != null) {
                rv=dv1;
                dv1=null;
                return rv;
            } 
            break;
        case 2: 
            if (dv2 != null) {
                rv=dv2;
                dv2=null;
                return rv;
            } 
            break;
        case 3: 
            if (dv3 != null) {
                rv=dv3;
                dv3=null;
                return rv;
            } 
            break;
        case 4: 
            if (dv4 != null) {
                rv=dv4;
                dv4=null;
                return rv;
            } 
            break;
        }
        return new Value[size];

     }

    public final void returnVLR() {
        if (saveVLR) {
            saveVLR = false;
        } else {
            if (!vlk) 
                returnValues(vlr);
            vlr=null;
        }
    }

    public final void setupTailCall(Value vlr0) {
        saveVLR = true;
        nxp = APPEVAL;
        if (vlk) {
            newVLR(1);
        } else {
            if (vlr.length != 1) {
                returnValues(vlr);
                newVLR(1);
            }
        }
        vlr[0] = vlr0;
    }

    public final void setupTailCall(Value[] newvlr) {
        saveVLR = true;
        nxp = APPEVAL;
        if (!vlk) {
            returnValues(vlr);
        }
        vlr = newvlr;
    }

    public final void returnValues(Value[] v) {
        switch(v.length) {
        case 4: 
            v[3]=v[2]=v[1]=v[0]=null; 
            dv4=v;
            break;
        case 3: 
            v[2]=v[1]=v[0]=null; 
            dv3=v;
            break;
        case 2: 
            v[1]=v[0]=null; 
            dv2=v;
            break;
        case 1: 
            v[0]=null; 
            dv1=v;
            break;
        }
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
