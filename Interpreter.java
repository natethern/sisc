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
package sisc;

import java.lang.ref.*;
import sisc.data.*;
import sisc.compiler.*;
import sisc.compiler.Compiler;
import sisc.exprs.*;
import java.io.*;
import java.util.*;

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
                                             //This really shouldn't ever happen, but it seems possible at the very top of stacks for some reason
                                             r.fk);
        }

        public Value express() {
            return list(Symbol.get("TSException"));
        }
    }

    //the compiler is stateless; if that ever changes it would need to
    //be moved to the dynenv
    public static Compiler compiler = new Compiler();

    public AppContext ctx;
    public DynamicEnv dynenv;

    //REGISTERS
    public Value                 acc;
    public Expression            nxp, lxp; //lxp used only for debugging
    public Value[]               vlr;
    public boolean               vlk;      //vlk, when true, indicates the
    public LexicalEnvironment    env;      //vlr register is locked
    public CallFrame             stk, 
                                  fk;

    //Scheme->Java exception conversion FK
    static CallFrame top_fk = new CallFrame(new ThrowSchemeException(),
                                            null, false, null, null, null);
    static {
        top_fk.fk = top_fk;
        top_fk.vlk = true;
    }

    public Interpreter(AppContext ctx, DynamicEnv dynenv) {
        fk=top_fk;
        this.ctx = ctx;
        this.dynenv = dynenv;
    }

    public Expression compile(Value v) throws ContinuationException {
        return compiler.compile(this, v, ctx.toplevel_env);
    }

    public Expression compile(Value v, SymbolicEnvironment env)
        throws ContinuationException {
        return compiler.compile(this, v, env);
    }

    protected Value interpret(Expression e) throws SchemeException {
        stk=createFrame(null, null, false, null, fk, null);
        nxp=e;
        interpret();
        return acc;
    }

    protected void interpret() throws SchemeException {
	abortEvaluation = false; // (turadg)
	
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

    public final Value[] newVLR(int size) {
        vlk=false;
        return (vlr=createValues(size));
    }

    public final void pop(CallFrame c) {
        nxp=c.nxp;
        vlr=c.vlr;
        env=c.env;
        fk=c.fk;
        stk=c.parent;
        vlk=c.vlk;
        returnFrame(c);
    }

    public final void push(Expression nxp) {
        stk=createFrame(nxp, vlr, vlk, env, fk, stk);
    }

    public final void save() {
        stk=createFrame(nxp, vlr, vlk, env, fk, stk);
    }

    /**
     * Parses and evaluates an s-expression
     * 
     * @param expr An s-expression
     * @return The value of the evaluated s-expression
     * @exception IOException Raised if the given string does not  
     *     contain a  parseable s-expression
     * @exception SchemeException Raised if the evaluation of  
     *      the  expression results in an error
     */
    public Value eval(String expr) throws IOException, SchemeException {
        InputPort ip=new InputPort(new BufferedReader(new StringReader(expr)));
        Value rv=VOID;

        do {
            try {
                rv=eval(dynenv.parser.nextExpression(ip));
            } catch (EOFException e) {
                return rv;
            }
        } while (true);
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

    protected SymbolicEnvironment getContextEnv(Symbol s) {
        SymbolicEnvironment contenv=null;
        try {
            contenv = lookupContextEnv(s);
        } catch (ArrayIndexOutOfBoundsException e) {
            contenv=new AssociativeEnvironment();
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
     * @exception ArrayIndexOutOfBoundsException if the binding does
     * not exist
     */
    public Expression lookup(Symbol s, Symbol context)
        throws ArrayIndexOutOfBoundsException {
        return lookupContextEnv(context).lookup(s);
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
    CallFrame returnRegister;

    public CallFrame createFrame(Expression n, Value[] v,
                                 boolean vlk, 
                                 LexicalEnvironment e,
                                 CallFrame f,
                                 CallFrame p) {
        if (deadFramePointer < 0)
            return new CallFrame(n,v,vlk,e,f,p);
        else {
	    returnRegister=deadFrames[deadFramePointer--];
            returnRegister.nxp=n;
            returnRegister.vlr=v;
            returnRegister.vlk=vlk;
            returnRegister.env=e;
            returnRegister.fk=f;
            returnRegister.parent=p;
            return returnRegister;
        }
    }

    public final void returnFrame(CallFrame f) {
        if (!f.vlk && (deadFramePointer < FPMAX)) {
            deadFrames[++deadFramePointer]=f;
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
        if (!vlk) returnValues(vlr);
        vlr=null;
    }

    public final Value[] replaceVLR(int size) {
        if (!vlk) returnValues(vlr);
        return newVLR(size);
    }

    public final void returnValues(Value[] v) {
        if (v == null) return;
        int size = v.length;
        if (size == 0 || size >= VALUESPOOLSIZE) return;
        deadValues[size] = v;
    }

    public boolean abortEvaluation = false; // (turadg)
    /** Break the current evaluation (turadg)
	Causes AppEval.eval() to throw "Aborted evaluation" error
     */
    public void abortEvaluation () {
	abortEvaluation = true;
    }
}

