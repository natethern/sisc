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
import sisc.exprs.*;
import sisc.compiler.*;
import java.util.*;
import java.io.*;

public abstract class Util {
    public static final String VERSION = "r1.1.1";

    protected static final Quantity FIVE=new Quantity(5);
    protected static final Expression APPEVAL=new AppEval();

    public static EOFObject EOF=EOFObject.EOF;
    public static Serializable UNBOUND=new Serializable() {};
    public static EmptyList EMPTYLIST=EmptyList.EMPTYLIST;
    public static SchemeVoid VOID=SchemeVoid.VOID;
    public static SchemeBoolean TRUE=SchemeBoolean.TRUE,
	FALSE=SchemeBoolean.FALSE;

    public static Symbol 
	UNQUOTE=Symbol.get("unquote"),
	QUOTE=Symbol.get("quote"),
	UNQUOTE_SPLICING=Symbol.get("unquote-splicing"),
	BACKQUOTE=Symbol.get("quasiquote"),
	BEGIN=Symbol.get("begin"),
	THIS=Symbol.get("this"),
	LAMBDA=Symbol.get("lambda"),
	FILE=Symbol.get("file"),
	NOFILE=Symbol.get("no-file"),
	DIRECTORY=Symbol.get("directory"),
	TOPLEVEL=Symbol.get("*toplevel*"),
	REPORT=Symbol.get("*report*"),
	ENVVARS=Symbol.get("*environment-variables*"),
    	SYNTAX=Symbol.get("syntax");

    public static void error(Interpreter r, Value where, String errormessage) 
	throws ContinuationException {
	r.acc=new Values(new Value[] {
	    new SchemeString("Error in "+where
			     +": "+ errormessage),
	    new CallFrame(r.nxp, r.vlr, r.env, r.fk, r.stk).capture(),
	    r.fk.fk});

	throw new ContinuationException(r.fk);
    }

    public static Symbol sym(String s) {
	return Symbol.get(s);
    }

    public static void error(Interpreter r, String errormessage) 
	throws ContinuationException {
	error(r, errormessage, true);
    }

    public static void error(Interpreter r, String errormessage, 
			     boolean prependError) 
	throws ContinuationException {
	r.acc=new Values(new Value[] {
	    new SchemeString((prependError ? "Error: "+errormessage : 
			      errormessage)),
	    new CallFrame(r.nxp, r.vlr, r.env, r.fk, r.stk).capture(),
	    r.fk.fk});

	throw new ContinuationException(r.fk);
    }

    public static String justify(String v, int p, char c) {
	StringBuffer b=new StringBuffer();
	while (b.length()<(p-v.length()))
	    b.append(c);
	return b.append(v).toString();
    }

    public static final void argCheck(Pair argl, int arity) 
	throws Exception {
	int x=length(argl);
	if (x!=arity && arity!=-1) 
	    throw new RuntimeException("expected "+arity+" args, got "+x);
    }

    public static int length(Pair p) {
	Pair s=p;
	try {
	    int i=0;
	    for (; p!=EMPTYLIST; i++)
		p=(Pair)p.cdr;
	    return i;
	} catch (ClassCastException ce) {
	    throw new RuntimeException(s+" is not a proper list");
	}
    }

    public static Expression[] pairToExpressions(Pair p) {
	Vector v=new Vector();
	int i=0;

	for (; p!=EMPTYLIST; p=(Pair)p.cdr, i++) {
	    v.addElement(p.car);
	}
	Expression[] vs=new Expression[i];
	v.copyInto(vs);
	return vs;
    }

    public static Value[] pairToValues(Pair p) {
	Vector v=new Vector();
	int i=0;

	for (; p!=EMPTYLIST; p=(Pair)p.cdr, i++) {
	    v.addElement(p.car);
	}
	Value[] vs=new Value[i];
	v.copyInto(vs);
	return vs;
    }

    public static Symbol[] pairToSymbols(Pair p) {
	Pair o=p;
	if (p==EMPTYLIST) return new Symbol[0];

	Vector v=new Vector();
	int i=0;

	for (; p!=EMPTYLIST; p=(Pair)p.cdr, i++) {
	    v.addElement(p.car);
	}
	Symbol[] vs=new Symbol[i];
	v.copyInto(vs);
	return vs;
    }

    public static Symbol[] argsToSymbols(Pair p) {
	if (p==EMPTYLIST) return new Symbol[0];
	Vector v=new Vector();
	int i=0;

	for (; (p.cdr instanceof Pair) &&
		 (p.cdr!=EMPTYLIST); 
	     p=(Pair)p.cdr) {
	    v.addElement(p.car);
	}
	v.addElement(p.car);
	if (p.cdr!=EMPTYLIST)
	    v.addElement(p.cdr);
	Symbol[] vs=new Symbol[v.size()];
	v.copyInto(vs);
	return vs;
    }

/* Casting checks */
    public static void typeError(Interpreter r, String type, Value o) {
	if (o instanceof Values)
	    throw new RuntimeException(((Values)o).values.length+" values received in single-value context");
	throw new RuntimeException("expected type "+type+", got '"+o.write()+'\'');
    }

    public static Quantity num(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (Quantity)o;
	} catch (ClassCastException e) { typeError(r, "number", o); } return null;
    }

    public static Pair pair(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (Pair)o;
	} catch (ClassCastException e) { typeError(r, "pair", o); } return null;
    }

    public static Procedure proc(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (Procedure)o;
	} catch (ClassCastException e) { typeError(r, "procedure", o); } return null;
    }

    public static Pair truePair(Interpreter r, Value o) throws ContinuationException {
	Pair p=pair(r, o);
	if (p==EMPTYLIST) typeError(r, "pair", o);
	return p;
    }
	
    public static char character(Interpreter r, Value c) throws ContinuationException {
	return chr(r, c).c;
    }

    public static SchemeCharacter chr(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (SchemeCharacter)o;
	} catch (ClassCastException e) { typeError(r, "character", o); } return null;
    }

    public static String string(Interpreter r, Value o) throws ContinuationException {
	return new String(str(r, o).stringdata);
    }

    public static SchemeString str(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (SchemeString)o;
	} catch (ClassCastException e) { typeError(r, "string", o); } return null;
    }

    public static Symbol symbol(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (Symbol)o;
	} catch (ClassCastException e) { typeError(r, "symbol", o); } return null;
    }

    public static SchemeVector vec(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (SchemeVector)o;
	} catch (ClassCastException e) { typeError(r, "vector", o); } return null;
    }
    
    public static OutputPort outport(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (OutputPort)o;
	} catch (ClassCastException e) { typeError(r, "output-port", o); } return null;
    }

    public static InputPort inport(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (InputPort)o;
	} catch (ClassCastException e) { typeError(r, "input-port", o); } return null;
    }
    
    public static AssociativeEnvironment env(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (AssociativeEnvironment)o;
	} catch (ClassCastException e) { typeError(r, "environment", o); } return null;
    }

    public static Box box(Interpreter r, Value o) throws ContinuationException {
	try {	
	    return (Box)o;
	} catch (ClassCastException e) { typeError(r, "box", o); } return null;
    }
    
    public static final SchemeBoolean truth(boolean b) throws ContinuationException {
	return b ? TRUE : FALSE;
    }

    public static final boolean truth(Value v) {
	return (v!=FALSE);
    }

    /* List functions */

    public static Pair append(Pair p1, Pair p2) {
	if (p1==EMPTYLIST) return p2;
	return new Pair(p1.car, append((Pair)p1.cdr, p2));
    }
	    
    public static final Value cadr(Value p) {
	return ((Pair)((Pair)p).cdr).car;
    }

    public static final Value caddr(Value p) {
	return ((Pair)((Pair)((Pair)p).cdr).cdr).car;
    }

    public static final Value cddr(Value p) {
	return ((Pair)((Pair)p).cdr).cdr;
    }

    public static final Value first(Value p) {
	return (p instanceof Pair ? ((Pair)p).car : null);
    }

    public static final Value rest(Value p) {
	return (p instanceof Pair ? ((Pair)p).cdr : null);
    }

    public static final Pair list(Value o1) {
	return new Pair(o1);
    }

    public static final Pair list(Value o1, Value o2) {
	return new Pair(o1, list(o2));
    }

    public static final Pair list(Value o1, Value o2, Value o3) {
	return new Pair(o1, list(o2, o3));
    }

    public static Pair valArrayToList(Value[] r, int offset, int len) {
	Pair p=EMPTYLIST;
	for (int i=0; i<len; i++) {
	    p=new Pair(r[(offset+len)-i-1], p);
	}
	return p;
    }

    public static SchemeBoolean numQuery(Value v, int mask) 
	throws ContinuationException {
	return truth(v instanceof Quantity &&
		     (((Quantity)v).type & mask)!=0);
    }

    public static boolean jnumQuery(Value v, int mask) {
	return v instanceof Quantity &&
	    (((Quantity)v).type & mask)!=0;
    }
}





