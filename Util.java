package sisc;

import java.util.*;
import java.util.jar.*;
import java.io.*;
import java.text.*;
import java.lang.reflect.Field;
import sisc.data.*;
import sisc.exprs.*;
import sisc.interpreter.*;
import sisc.compiler.*;

public abstract class Util extends Defaults implements Version {

    protected static final boolean PERMITINTERRUPTS=
        getSystemProperty("sisc.permitinterrupts", "false").equals("true");

    protected static final Value[] ZV=new Value[0];
    protected static final Quantity FIVE=Quantity.valueOf(5);
    protected static final Expression APPEVAL=new AppEval();
    
    public static EOFObject EOF=EOFObject.EOF;
    public static EmptyList EMPTYLIST=EmptyList.EMPTYLIST;
    public static SchemeVoid VOID=SchemeVoid.VOID;
    public static SchemeBoolean
        TRUE=SchemeBoolean.TRUE,
        FALSE=SchemeBoolean.FALSE;

    public static Symbol
        SETBANG=Symbol.get("set!"),
        UNQUOTE=Symbol.get("unquote"),
        QUOTE=Symbol.get("quote"),
        UNQUOTE_SPLICING=Symbol.get("unquote-splicing"),
        BACKQUOTE=Symbol.get("quasiquote"),
        BEGIN=Symbol.get("begin"),
        THIS=Symbol.get("this"),
        LAMBDA=Symbol.get("lambda"),
        TOPLEVEL=Symbol.get("*toplevel*"),
        SYMENV=Symbol.get("*symenv*"),
        REPORT=Symbol.get("*report*"),
        ENVVARS=Symbol.get("*environment-variables*"),
        SISCCONF=Symbol.get("*config-parameters*"),
        SISC=Symbol.get("*sisc*"),
        SISC_SPECIFIC=Symbol.get("*sisc-specific*"),
        OTHER=Symbol.get("other"),
        MESSAGE=Symbol.get("message"),
        LOCATION=Symbol.get("location"),
        ERRORK=Symbol.get("error-continuation"),
        FCONT=Symbol.get("failure-continuation"),
        PARENT=Symbol.get("parent");
    
    public static String getSystemProperty(String name, String def) {
        try {
            String rv=System.getProperty(name);
            if (rv==null) throw new RuntimeException();
            return rv;
        } catch (RuntimeException e) {
            try {
                String propname=name.substring(name.indexOf('.')+1);
                Field f=Defaults.class.getField(propname);
                return (String)f.get(null);
            } catch (Exception e2) {}
        }
        return def;
    }

    public static String warn(String messageClass) {
	StringBuffer b=new StringBuffer("{");
	b.append(liMessage(SISCB, "warning"));
	b.append(": ");
	b.append(liMessage(SISCB, messageClass));
	b.append(')');
	return b.toString();
    }

    public static String warn(String messageClass, String arg) {
	StringBuffer b=new StringBuffer("{");
	b.append(liMessage(SISCB, "warning"));
	b.append(": ");
	b.append(liMessage(SISCB, messageClass, arg));
	b.append(')');
	return b.toString();
    }

    public static void error(Interpreter r, Value where, String errormessage)
    throws ContinuationException {
	error(r, list(new Pair(MESSAGE, new SchemeString(errormessage)),
                      new Pair(LOCATION, where)));
    }

    public static void error(Interpreter r, String errormessage) 
    throws ContinuationException {
	error(r, list(new Pair(MESSAGE, new SchemeString(errormessage))));
    }

    public static void error(Interpreter r, Value error)
    throws ContinuationException {
        r.acc=new Values(new Value[] {
	    error,
	    new ApplyParentFrame(new CallFrame((r.nxp==null?r.lxp:r.nxp), 
                                               r.vlr, r.vlk,
					       r.env, r.fk, r.stk).capture(r))});
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
            throw new RuntimeException(liMessage(SISCB, "notenoughargs", 
                                                 new Object[] {new Integer(arity), new Integer(x)}));
    }

    public static void updateName(Value v, Symbol s) {
        if (v instanceof NamedValue) {
            NamedValue nv = (NamedValue)v;
            if (nv.getName() == null)
                nv.setName(s);
        }
    }

    public static int length(Pair p) {
        Pair s=p;
        try {
            int i=0;
            for (; p!=EMPTYLIST; i++)
                p=(Pair)p.cdr;
            return i;
        } catch (ClassCastException ce) {
            throw new RuntimeException(liMessage(SISCB, "notaproperlist", s.synopsis(DEFAULT_SYNOPSIS_LENGTH)));
        }
    }

    public static Vector pairToExpVect(Pair p) {
        Vector v=new Vector();
        for (; p!=EMPTYLIST; p=(Pair)p.cdr) {
            v.addElement(p.car);
        }

        return v;
    }

    public static Expression[] pairToExpressions(Pair p) {
        Vector v=pairToExpVect(p);
        Expression[] vs=new Expression[v.size()];
        v.copyInto(vs);
        return vs;
    }

    public static Value[] pairToValues(Pair p) {
        Vector v=pairToExpVect(p);
        Value[] vs=new Value[v.size()];
        v.copyInto(vs);
        return vs;
    }

    public static Symbol[] pairToSymbols(Pair p) {
        Pair o=p;
        if (p==EMPTYLIST) return new Symbol[0];

        Vector v=pairToExpVect(p);
        Symbol[] vs=new Symbol[v.size()];
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
    public static void typeError(String type, Value o) {
	typeError(SISCB, type, o);
    }

    public static void typeError(Symbol bundleName, String type, Value o) {
        if (o instanceof Values)
            throw new RuntimeException(liMessage(SISCB, "multiplevalues"));
        throw new RuntimeException(liMessage(SISCB, "unexpectedarg",
                                             liMessage(bundleName, type), 
                                             o.write()));
    }

    public static final Symbol sym(String s) {
        return Symbol.get(s);
    }

    public static final String symval(Value o) {
        try {
            return ((Symbol)o).symval;
        } catch (ClassCastException e) { typeError("symbol", o); }
	return null;
    }

    public static final Quantity num(Value o) {
        try {
            return (Quantity)o;
        } catch (ClassCastException e) { typeError("number", o); }
	return null;
    }

    public static final Pair pair(Value o) {
        try {
            return (Pair)o;
        } catch (ClassCastException e) { typeError("pair", o); }
	return null;
    }

    public static final Procedure proc(Value o) {
        try {
            return (Procedure)o;
        } catch (ClassCastException e) { typeError("procedure", o); }
	return null;
    }

    public static final Pair truePair(Value o) {
        Pair p=pair(o);
        if (p==EMPTYLIST) typeError("pair", o);
        return p;
    }

    public static final char character(Value c) {
        return chr(c).c;
    }

    public static final SchemeCharacter chr(Value o) {
        try {
            return (SchemeCharacter)o;
        } catch (ClassCastException e) { typeError("character", o); }
	return null;
    }

    public static final String string(Value o) {
        return str(o).asString();
    }

    public static final SchemeString str(Value o) {
        try {
            return (SchemeString)o;
        } catch (ClassCastException e) { typeError("string", o); }
	return null;
    }

    public static final Symbol symbol(Value o) {
        try {
            return (Symbol)o;
        } catch (ClassCastException e) { typeError("symbol", o); }
	return null;
    }

    public static final SchemeVector vec(Value o) {
        try {
            return (SchemeVector)o;
        } catch (ClassCastException e) { typeError("vector", o); }
	return null;
    }

    public static final OutputPort outport(Value o) {
        try {
            return (OutputPort)o;
        } catch (ClassCastException e) { typeError("output-port", o); }
	return null;
    }

    public static final InputPort inport(Value o) {
        try {
            return (InputPort)o;
        } catch (ClassCastException e) { typeError("input-port", o); }
	return null;
    }

    public static final sisc.env.SymbolicEnvironment env(Value o) {
        try {
            return (sisc.env.SymbolicEnvironment)o;
        } catch (ClassCastException e) { typeError("environment", o); }
	return null;
    }

    public static final Box box(Value o) {
        try {
            return (Box)o;
        } catch (ClassCastException e) { typeError("box", o); }
	return null;
    }

    public static final CallFrame cont(Value o) {
        try {
            return (CallFrame)o;
        } catch (ClassCastException e) { typeError("continuation", o); }
	return null;
    }

    public static final AnnotatedExpr annotated(Value o) {
        try {
            return (AnnotatedExpr)o;
        } catch (ClassCastException e) { typeError("annotatedexpression", o); }
        return null;
    }

    public static final SchemeBoolean truth(boolean b) {
        return b ? TRUE : FALSE;
    }

    public static final boolean truth(Value v) {
        return v != FALSE;
    }

    /* List functions */

    public static Pair append(Pair p1, Pair p2) {
        if (p1==EMPTYLIST) return p2;
        return new Pair(p1.car, append((Pair)p1.cdr, p2));
    }

    public static final Pair list(Value o1) {
        return new Pair(o1, EMPTYLIST);
    }

    public static final Pair list(Value o1, Value o2) {
        return new Pair(o1, list(o2));
    }

    public static final Pair list(Value o1, Value o2, Value o3) {
        return new Pair(o1, list(o2, o3));
    }

    public static Pair valArrayToList(Value[] r, int offset, int len) {
        Pair p=EMPTYLIST;
        for (int i=(offset+len)-1; i>=offset; i--) {
            p=new Pair(r[i], p);
        }
        return p;
    }

    /* Localization and Internationalization */
    public static Symbol SISCB=Symbol.intern("SISC");
    static WeakHashMap bundles=new WeakHashMap();
    static Locale myLocale=Locale.getDefault();
    static MessageFormat formatter=new MessageFormat("");

    static {
	formatter.setLocale(myLocale);
    }

    public static void registerBundle(Symbol bundleName) 
	throws MissingResourceException {
	ResourceBundle b=ResourceBundle.getBundle(bundleName.symval);
	bundles.put(bundleName, b);
    }

    public static String liMessage(Symbol bundleName, String messageName) {
	ResourceBundle bundle=(ResourceBundle)bundles.get(bundleName);
	if (bundle==null) {
	    try {
		registerBundle(bundleName);
	    } catch (MissingResourceException mr) {
		return null;
	    }
	    bundle=(ResourceBundle)bundles.get(bundleName);
	}
	try {
	    return bundle.getString(messageName);
	} catch (MissingResourceException mr) {
	    if (!bundleName.equals(SISCB))
		return liMessage(SISCB, messageName);
	    else
		return "<localized message not found: "+messageName+">";
	}
    }

    public static String liMessage(Symbol bundle, 
				   String messageName, String arg1) {
	return formatter.format(liMessage(bundle, messageName),
				new Object[] { arg1 });
    }

    public static String liMessage(Symbol bundle, String messageName, 
				   String arg1, String arg2) {
	return formatter.format(liMessage(bundle, messageName),
				new Object[] { arg1, arg2 });
    }

    public static String liMessage(Symbol bundle, String messageName, 
                                   String arg1, int arg2, int arg3) {
        return formatter.format(liMessage(bundle, messageName),
				new Object[] { arg1, new Integer(arg2),
                                               new Integer(arg3)});
    }

    public static String liMessage(Symbol bundle, String messageName,
                                   Object[] args) {
        return formatter.format(liMessage(bundle, messageName), args);
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
