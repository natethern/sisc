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

public class Interpreter extends Util {

    static class ThrowSchemeException extends Expression {
	
	public void eval(Interpreter r) 
	    throws ContinuationException, SchemeRuntimeException {
	    r.nxp=null;
	    Values v=(Values)r.acc;
	    throw new SchemeRuntimeException(v.values[0], 
					     proc(v.values[1]), 
					     proc(v.values[2]));
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
    public boolean               lck;
    public Value                 acc;
    public Expression            nxp;
    public Value[]               vlr;
    public LexicalEnvironment    env;
    public CallFrame             stk, fk;

    //Scheme->Java exception conversion FK
    static CallFrame top_fk = new CallFrame(new ThrowSchemeException(),
                                            null, null, null, null);
    static {
        top_fk.fk = top_fk;
        top_fk.lock = true;
    }

    public Interpreter(AppContext ctx, DynamicEnv dynenv) {
	fk=top_fk;
	this.ctx = ctx;
	this.dynenv = dynenv;
    }

    public Expression compile(Value v) throws ContinuationException {
        return compiler.compile(this, v, ctx.toplevel_env);
    }

    public Expression compile(Value v, AssociativeEnvironment env)
    throws ContinuationException {
        return compiler.compile(this, v, env);
    }

    protected Value interpret(Expression e) throws SchemeException {
        stk=createFrame(null, null, null, fk, null);
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

    public final void pop(CallFrame c) {
        nxp=c.nxp;
        vlr=c.vlr;
        env=c.env;
        fk=c.fk;
        stk=c.parent;
	lck=c.lock;
        returnFrame(c);
    }

    public final void push(Expression nxp) {
	stk=createFrame(nxp, vlr, env, fk, stk);
    }

    public final void save() {
        stk=createFrame(nxp,vlr,env,fk,stk);
    }

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

    public Value eval(Value v) throws SchemeException {
        return eval(ctx.evaluator, new Value[] {v});
    }

    public Value eval(Procedure p, Value[] args) throws SchemeException {
	acc = p;
	vlr = args;
        return interpret(APPEVAL);
    }

    // Symbolic environment handling
    public AssociativeEnvironment lookupContextEnv(Symbol s) {
	return ctx.lookupContextEnv(s);
    }

    public void defineContextEnv(Symbol s, AssociativeEnvironment env) {
	ctx.symenv.define(s, env);
    }

    protected AssociativeEnvironment getContextEnv(Symbol s) {
        AssociativeEnvironment contenv=null;
        try {
            contenv = lookupContextEnv(s);
        } catch (ArrayIndexOutOfBoundsException e) {
            contenv=new AssociativeEnvironment();
            defineContextEnv(s, contenv);
        }
        return contenv;
    }

    public void define(Symbol s, Value v, Symbol context) {
        AssociativeEnvironment contenv=getContextEnv(context);
        contenv.define(s, v);
    }


    public Expression lookup(Symbol s, Symbol context) {
        try {
            AssociativeEnvironment contenv = lookupContextEnv(context);
            return (Expression)contenv.lookup(s);
        } catch (ClassCastException c) {
            return null;
        }
    }

    //POOLING
    //STATIC --------------------

    protected static final int FRAMEPOOLSIZE=24, FPMAX=FRAMEPOOLSIZE-1;
    protected CallFrame deadFrames[]=new CallFrame[FRAMEPOOLSIZE];
    protected int deadFramePointer=-1;
    CallFrame returnRegister;

    public CallFrame createFrame(Expression n, Value[] v,
                                       LexicalEnvironment e,
                                       CallFrame f,
                                       CallFrame p) {
        if (deadFramePointer < 0)
            return new CallFrame(n,v,e,f,p);
        else {
	    returnRegister=deadFrames[deadFramePointer--];
            returnRegister.nxp=n;
            returnRegister.vlr=v;
            returnRegister.env=e;
            returnRegister.fk=f;
            returnRegister.parent=p;
            return returnRegister;
        }
    }

    public final void returnFrame(CallFrame f) {
	if (!f.lock && (deadFramePointer < FPMAX)) {
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
            //miss++; 
            return new Value[size]; 
        }
        //hit++;
        deadValues[size] = null;
        return res;
    }

    /*
    protected void finalize() {
        System.err.println(hit);
        System.err.println(zerohit);
        System.err.println(sizemiss);
        System.err.println(miss);
    }

    static {
        System.runFinalizersOnExit(true);
    }
    */
    public final void returnValues(Value[] v) {
        if (v == null) return;
        int size = v.length;
        if (size == 0 || size >= VALUESPOOLSIZE) return;
        deadValues[size] = v;
    }
}

