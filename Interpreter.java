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

import sisc.data.*;
import sisc.compiler.*;
import sisc.exprs.*;
import java.io.*;
import java.util.*;

public class Interpreter extends Util {
    
    public static Parser parser=new Parser(new Lexer());

    protected Procedure evaluator, writer;
    public OutputPort console_out;
    public InputPort console_in;
    public AssociativeEnvironment symenv, toplevel_env;
    public sisc.compiler.Compiler compiler;

    static class DisplaylnExp extends Expression {

	public void eval(Interpreter r) throws ContinuationException {
	    r.nxp=null;
	    try {
		Values v=(Values)r.acc;
	    } catch (ClassCastException c) {
		System.err.println("System error: invalid failure record in base failure continuation.");
	    }
	    r.acc=VOID;

	}
	public Value express() {
	    return list(sym("DisplayLn-exp"));
	}
    }

    //REGISTERS
    public Value                 acc;
    public Expression            nxp;
    public Value[]               vlr;
    public LexicalEnvironment    env;
    public CallFrame             stk, fk;

    public static Interpreter newContext(Interpreter parent) {
        Interpreter rnew=new Interpreter(parent.console_in, parent.console_out,
					 parent.symenv);
	rnew.writer=parent.writer;
	rnew.evaluator=parent.evaluator;
	if (rnew.toplevel_env!=null) 
	    rnew.symenv.define(TOPLEVEL, rnew.toplevel_env);
	else 
	    try {
		rnew.toplevel_env=
		    (AssociativeEnvironment)rnew.symenv.lookup(TOPLEVEL);
	    } catch (ArrayIndexOutOfBoundsException ue) {
		rnew.toplevel_env=rnew.symenv;
	    }

	return rnew;
    }

    public Interpreter(InputPort cin, OutputPort cout,
		       AssociativeEnvironment symenv) {
	fk=new CallFrame(new DisplaylnExp(), null, null, null, stk);
	fk.capture();
	fk.fk=fk;
	this.symenv=symenv;
	try {
	    toplevel_env=(AssociativeEnvironment)symenv.lookup(TOPLEVEL);
	} catch (ArrayIndexOutOfBoundsException ue) {
	    toplevel_env=symenv;
	}
	env=new LexicalEnvironment();
	console_in=cin;
	console_out=cout;
	console_in.name=Symbol.get("console");
	console_out.name=Symbol.get("console");
	compiler=new sisc.compiler.Compiler(this.toplevel_env);
    }

    public Interpreter(InputStream in, OutputStream out) {
	this(new InputPort(new BufferedReader(new InputStreamReader(in))),
	     new OutputPort(new PrintWriter(out)),
	     new AssociativeEnvironment());
	if (toplevel_env!=null) 
	    symenv.define(TOPLEVEL, toplevel_env);
	else 
	    try {
		toplevel_env=(AssociativeEnvironment)symenv.lookup(TOPLEVEL);
	    } catch (ArrayIndexOutOfBoundsException ue) {
		toplevel_env=symenv;
	    }
    
	new Primitives().initialize(this);
    }

    public Expression compile(Value v) throws ContinuationException {
	return compiler.compile(this, v, toplevel_env);
    }

    public Expression compile(Value v, AssociativeEnvironment env) 
	throws ContinuationException {
	return compiler.compile(this, v, env);
    }

    public Value interpret(Expression e) {
	stk=new CallFrame(null, null, null, fk, null);
	nxp=e;
	interpret();
	return acc;
    }

    public void interpret() {
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
	} catch (NullPointerException done) {}
    }
    
    public final void pop(CallFrame c) {
	nxp=c.nxp;
	vlr=c.vlr;
	env=c.env;
	fk=c.fk;
	stk=c.parent;
	returnFrame(c);
    }

    public void push(Expression nxp, Value[] vlr, LexicalEnvironment env,
			   CallFrame fk) {
	stk=createFrame(nxp, vlr, env, fk, stk);
    }
    
    public void push(Expression nxp) {
	stk=createFrame(nxp, vlr, env, fk, stk);
    }

    public void save() {
	stk=createFrame(nxp,vlr,env,fk,stk);
    }

    public Value eval(String expr) throws ContinuationException, IOException {
	InputPort ip=new InputPort(new BufferedReader(new StringReader(expr)));
	Value rv=VOID;

	do {
	    try { 
		rv=eval(parser.nextExpression(ip));
	    } catch (EOFException e) {
		return rv;
	    }
	} while (true);
    }

    public Value eval(Value v) throws ContinuationException {
	return interpret(new AppExp((Expression)evaluator, 
				    new Expression[] {v}, true));
    }

    public void write(Value v) throws ContinuationException {
	vlr=new Value[] {v};
	nxp=APPEVAL;
	acc=(Value)writer;
	interpret();
    }

    public boolean setWriter(String s) {
	try {
	    writer=(Procedure)toplevel_env.lookup(Symbol.get(s));
	    return true;
	} catch (ArrayIndexOutOfBoundsException e) {
	    return false;
	}
    }

    public boolean setEvaluator(String s) {
	try {
	    evaluator=(Procedure)toplevel_env.lookup(Symbol.get(s));
	    return true;
	} catch (ArrayIndexOutOfBoundsException e) {
	    return false;
	}
    }

    // Symbolic environment handling
    protected AssociativeEnvironment getContextEnv(Symbol s) {
	AssociativeEnvironment contenv=null;
        try {
            contenv=(AssociativeEnvironment)
                symenv.lookup(s);
        } catch (ArrayIndexOutOfBoundsException e) {
            contenv=new AssociativeEnvironment();
	    symenv.define(s, contenv);
        }
	return contenv;
    }

    public void define(Symbol s, Value v, Symbol context) {
        AssociativeEnvironment contenv=getContextEnv(context);	
	contenv.set(s, v);
    }


    public Expression lookup(Symbol s, Symbol context) {
	try {
	    AssociativeEnvironment contenv=(AssociativeEnvironment)
		symenv.lookup(context);
	    return (Expression)contenv.lookup(s);
	} catch (ClassCastException c) {
	    return null;
	}
    }


    // Heapfile loading/saving
    public void loadEnv(InputStream i) throws IOException {
	ObjectInputStream in=new ObjectInputStream(i);

	try {
	    CallFrame lstk=(CallFrame)in.readObject();
	    AssociativeEnvironment lsymenv=(AssociativeEnvironment)in.readObject();
	    Procedure levaluator=(Procedure)in.readObject();
	    Procedure lwriter=(Procedure)in.readObject();
	    SchemeBoolean lTRUE=(SchemeBoolean)in.readObject(),
		lFALSE=(SchemeBoolean)in.readObject();
	    SchemeVoid lVOID=(SchemeVoid)in.readObject();
	    EmptyList lEMPTYLIST=(EmptyList)in.readObject();
	    EOFObject lEOF=(EOFObject)in.readObject();
	    Serializable lUNBOUND=(Serializable)in.readObject();

	    stk=lstk;
	    symenv=lsymenv;
	    try {
		toplevel_env=(AssociativeEnvironment)symenv.lookup(TOPLEVEL);
	    } catch (ArrayIndexOutOfBoundsException e) {
		throw new IOException("Heap did not contain toplevel environment!");
	    }
	    writer=lwriter;
	    evaluator=levaluator;
	    TRUE=lTRUE;
	    FALSE=lFALSE;
	    VOID=lVOID;
	    EMPTYLIST=lEMPTYLIST;
	    EOF=lEOF;
	    UNBOUND=lUNBOUND;
	    pop(stk);
	} catch (ClassNotFoundException e) {
	    throw new IOException("Could not load class!");
	}
    }

    public void saveEnv(OutputStream o) throws IOException {
	ObjectOutputStream out=new ObjectOutputStream(o);
	save();
	out.writeObject(stk);
	out.writeObject(symenv);
	out.writeObject(evaluator);
	out.writeObject(writer);
	out.writeObject(TRUE);
	out.writeObject(FALSE);
	out.writeObject(VOID);
	out.writeObject(EMPTYLIST);
	out.writeObject(EOF);
	out.writeObject(UNBOUND);

	out.flush();
	pop(stk);
    }

    //POOLING
    //STATIC --------------------
    protected static final int FRAMEPOOLSIZE=20, FPMAX=FRAMEPOOLSIZE-1;
    protected CallFrame deadFrames[]=new CallFrame[FRAMEPOOLSIZE];
    protected int deadFramePointer=-1;

    public final CallFrame createFrame(Expression n, Value[] v, 
				 LexicalEnvironment e, 
				 CallFrame f,
				 CallFrame p) {
	if (deadFramePointer<0) 
	    return new CallFrame(n,v,e,f,p);
	else {
	    CallFrame toReturn=deadFrames[deadFramePointer--];
	    toReturn.nxp=n;
	    toReturn.vlr=v;
	    toReturn.env=e;
	    toReturn.fk=f;
	    toReturn.parent=p;
	    return toReturn;
	}
    }

    public final void returnFrame(CallFrame f) {
	if (!f.lock && (deadFramePointer < FPMAX))
	    deadFrames[++deadFramePointer]=f;
    }

    protected static final int RIBPOOLSIZE=8, RPMAX=RIBPOOLSIZE-1;
    protected FillRibExp deadFillRibs[]=new FillRibExp[RIBPOOLSIZE];
    protected int deadFillRibsPointer=-1;
    
    public final FillRibExp createFillRib(int pos,
					  Expression rands[],
					  Expression last,
					  Expression cleanup) {
	if (deadFillRibsPointer<0) 
	    return new FillRibExp(pos,rands,last,cleanup);
	else {
	    FillRibExp toReturn=deadFillRibs[deadFillRibsPointer--];
	    toReturn.pos=pos;
	    toReturn.rands=rands;
	    toReturn.last=last;
	    toReturn.cleanup=cleanup;
	    return toReturn;
	}
    }

    public final void returnFillRib(FillRibExp f) {
	if (!f.locked && (deadFillRibsPointer < RPMAX)) 
	    deadFillRibs[++deadFillRibsPointer]=f;
    }


}









