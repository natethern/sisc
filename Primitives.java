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

import sisc.*;
import sisc.compiler.*;
import sisc.data.*;
import sisc.exprs.*;
import java.util.*;
import java.io.*;

public class Primitives extends Module {
    public Primitives() {}
    public static final Symbol 	
	FILE=Symbol.get("file"),
	NOFILE=Symbol.get("no-file"),
	DIRECTORY=Symbol.get("directory");
    
    public static final int 
	ADD=1,    EQ=11,           CHARACTERQ=21, SYMBOLQ=31,
	MUL=2,    EQUAL=12,        VECTORQ=22,    PROCEDUREQ=32,
	SUB=3,    LOAD=13,         NUMBERQ=23,    ENVIRONMENTQ=33,
	DIV=4,    NULLQ=14,        INTEGERQ=24,   EXACTQ=34,
	NEQ=5,    SETCAR=15,       NUMERATOR=25,  INEXACTQ=35,
	LT=6,     SETCDR=16,       RATIOQ=26,     APPLY=36,
	GRT=7,    MAKEVECTOR=17,   COMPLEXQ=27,   CHAR2INTEGER=37,
	CONS=8,   VECTORREF=18,    BOOLEANQ=28,   INTEGER2CHAR=38,
	CAR=9,    VECTORSET=19,    PAIRQ=29,      STRINGLENGTH=39,
	CDR=10,   VECTORLENGTH=20, STRINGQ=30,    STRINGREF=40,
	WRITE=45, LENGTH=41,       MAKESTRING=42, STRINGSET=43, 
	READ=51,  DISPLAY=44,      READCHAR=52,   SYMBOL2STRING=59,
        GCD=57,   DENOMINATOR=55,  REMAINDER=56,  LIST2VECTOR=62,      
        LCM=58,   VECTOR2LIST=61,  LOOKUP=70,     STRING2SYMBOL=60, 
        EVAL=63,  STRINGAPPEND=68, ERROR=69,      CURRENTWRITE=65, 
	SIN=98,   CURRENTEVAL=64, 
        COS=99,   FILETYPE=73,     SYSTIME=78,    STRING2NUMBER=74, 
        TAN=100,  CALLCC=76,       ROUND=85,      NUMBER2STRING=75, 
        ASIN=101, SETBOX=117,      CEILING=84,    INEXACT2EXACT=82, 
        ACOS=102, QUOTIENT=86,     WRITECHAR=87,  INPORTQ=88, 
        ATAN=103, OUTPORTQ=89,	   PEEKCHAR=90,   CALLWITHVALUES=91, 
        REALPART=95,     IMAGPART=96,   MAKERECTANGULAR=94, 
        VOIDQ=93, STRINGFILL=107,  CHARREADY=108, BLOCKREAD=110, 
        ASHL=97,  LOADMODULE=109,  CALLFC=92,     BLOCKWRITE=111, 
	LOG=104,  OPENOUTPUTFILE=54, 	       CLOSEINPUTPORT=79, 
	EXP=105,  REPORTENVIRONMENT=112,       NULLENVIRONMENT=113, 
	SQRT=106, INTERACTIONENVIRONMENT=114,  MIN_PRECISION=120,
        BOXQ=118, MAX_PRECISION=119,           OPENINPUTFILE=53, 
	BOX=115,  CLOSEOUTPUTPORT=80,          EXACT2INEXACT=81,
	UNBOX=116,CURRENTINPUTPORT=46,         CURRENTOUTPUTPORT=47,      
        FLOOR=83, OPENOUTPUTSTRING=48,         GETOUTPUTSTRING=49, 
	PUTPROP=121, STRING2UNINTERNEDSYMBOL=66,  OPENINPUTSTRING=50,
	LIST=122, _VOID=123, VECTORFINDLASTUNIQUE=124, MAKEPATH=125,
	ABSPATHQ=126, PARENT_CONT=127, CONTINUATIONQ=128;

    public static SchemeBoolean numQuery(Value v, int mask) 
	throws ContinuationException {
	return truth(v instanceof Quantity &&
		     (((Quantity)v).type & mask)!=0);
    }

    public void initialize(Interpreter r) {
	define(r, "list", LIST);
	define(r, "*", MUL); 
	define(r, "+", ADD); 
	define(r, "-", SUB); 
	define(r, "/", DIV); 
	define(r, "<", LT);  
	define(r, "=", NEQ); 
	define(r, ">", GRT); 
	define(r, "_gcd", GCD);
	define(r, "_lcm", LCM);
	define(r, "_string-append", STRINGAPPEND);
	define(r, "absolute-path?", ABSPATHQ);
	define(r, "acos", ACOS);
	define(r, "apply", APPLY);
	define(r, "ashl", ASHL);
	define(r, "asin", ASIN);
	define(r, "atan", ATAN);
	define(r, "block-read", BLOCKREAD);	
	define(r, "block-write", BLOCKWRITE);
	define(r, "boolean?", BOOLEANQ);
	define(r, "box", BOX);
	define(r, "box?", BOXQ);
	define(r, "call-with-current-continuation", CALLCC);
	define(r, "call-with-failure-continuation", CALLFC);
	define(r, "call-with-values", CALLWITHVALUES);
	define(r, "car", CAR);      
	define(r, "cdr", CDR);      
	define(r, "ceiling", CEILING);
	define(r, "char->integer", CHAR2INTEGER);
	define(r, "char-ready?", CHARREADY);
	define(r, "char?", CHARACTERQ);
	define(r, "close-input-port", CLOSEINPUTPORT);
	define(r, "close-output-port", CLOSEOUTPUTPORT);
	define(r, "complex?", COMPLEXQ); 
	define(r, "cons", CONS);    
	define(r, "continuation?", CONTINUATIONQ);
	define(r, "cos", COS);
	define(r, "current-evaluator", CURRENTEVAL);
	define(r, "current-input-port", CURRENTINPUTPORT);
	define(r, "current-output-port", CURRENTOUTPUTPORT);
	define(r, "current-writer", CURRENTWRITE);
	define(r, "denominator", DENOMINATOR);
	define(r, "display", DISPLAY);
	define(r, "environment?", ENVIRONMENTQ); 
	define(r, "eq?", EQ);       
	define(r, "equal?", EQUAL); 
	define(r, "error", ERROR);
	define(r, "eval", EVAL);
	define(r, "eval", EVAL);
	define(r, "exact->inexact", EXACT2INEXACT);
	define(r, "exact?", EXACTQ);
	define(r, "exp", EXP);
	define(r, "file-type", FILETYPE);
	define(r, "find-last-unique-vector-element", VECTORFINDLASTUNIQUE);
	define(r, "floor", FLOOR);
	define(r, "get-output-string", GETOUTPUTSTRING);
	define(r, "getprop", LOOKUP);
	define(r, "imag-part", IMAGPART);
	define(r, "inexact->exact", INEXACT2EXACT);
	define(r, "inexact?", INEXACTQ);
	define(r, "input-port?", INPORTQ);
	define(r, "integer->char", INTEGER2CHAR);
	define(r, "integer?", INTEGERQ);
	define(r, "interaction-environment", INTERACTIONENVIRONMENT );
	define(r, "length", LENGTH);
	define(r, "list->vector", LIST2VECTOR);
	define(r, "load", LOAD);    
	define(r, "load-module", LOADMODULE);
	define(r, "log", LOG);
	define(r, "make-path", MAKEPATH);
	define(r, "make-rectangular", MAKERECTANGULAR);
	define(r, "make-string", MAKESTRING);
	define(r, "make-vector", MAKEVECTOR);
	define(r, "max-precision", MAX_PRECISION);
	define(r, "min-precision", MIN_PRECISION);
	define(r, "null-environment", NULLENVIRONMENT);
	define(r, "null?", NULLQ);  
	define(r, "number->string", NUMBER2STRING);
	define(r, "number?", NUMBERQ);
	define(r, "numerator", NUMERATOR);
	define(r, "open-input-file", OPENINPUTFILE);
	define(r, "open-input-string", OPENINPUTSTRING);
	define(r, "open-output-file", OPENOUTPUTFILE);
	define(r, "open-output-string", OPENOUTPUTSTRING);
	define(r, "output-port?", OUTPORTQ);
	define(r, "pair?", PAIRQ);
	define(r, "parent-continuation", PARENT_CONT);
	define(r, "peek-char", PEEKCHAR);
	define(r, "procedure?", PROCEDUREQ);
	define(r, "putprop", PUTPROP);
	define(r, "quotient", QUOTIENT);
	define(r, "rational?", RATIOQ);
	define(r, "read", READ);
	define(r, "read-char", READCHAR);
	define(r, "real-part", REALPART);
	define(r, "remainder", REMAINDER);
	define(r, "round", ROUND);
	define(r, "scheme-report-environment", REPORTENVIRONMENT);
	define(r, "set-box!", SETBOX);
	define(r, "set-car!", SETCAR);
	define(r, "set-cdr!", SETCDR);
	define(r, "sin", SIN);
	define(r, "sqrt", SQRT);
	define(r, "string->number", STRING2NUMBER);
	define(r, "string->symbol", STRING2SYMBOL);
	define(r, "string->uninterned-symbol", STRING2UNINTERNEDSYMBOL);
	define(r, "string-fill!", STRINGFILL);
	define(r, "string-length", STRINGLENGTH);
	define(r, "string-ref", STRINGREF);
	define(r, "string-set!", STRINGSET);
	define(r, "string?", STRINGQ);
	define(r, "symbol->string", SYMBOL2STRING);
	define(r, "symbol?", SYMBOLQ); 
	define(r, "system-time", SYSTIME);
	define(r, "system-time",SYSTIME);
	define(r, "tan", TAN);
	define(r, "unbox", UNBOX);
	define(r, "vector->list", VECTOR2LIST);
	define(r, "vector-length", VECTORLENGTH);
	define(r, "vector-ref", VECTORREF);
	define(r, "vector-set!", VECTORSET);
	define(r, "vector?", VECTORQ);
	define(r, "void", _VOID);
	define(r, "void?", VOIDQ);
	define(r, "write", WRITE);
	define(r, "write-char", WRITECHAR);
    }

    public Value eval(int primid, Interpreter f) 
	throws ContinuationException {
	switch (f.vlr.length) {
	case 0:
	    switch (primid) {
	    case _VOID: return VOID;
	    case CURRENTOUTPUTPORT: return f.console_out;
	    case CURRENTINPUTPORT: return f.console_in;
	    case OPENOUTPUTSTRING: return new OutputPort(new StringWriter());
	    case PEEKCHAR:
		Value v=f.console_in.readchar(f);
		if (v instanceof SchemeCharacter) 
		    f.console_in.pushback(((SchemeCharacter)v).c);
		return v;
	    case READ: case READCHAR:
		return (primid==READ ? f.console_in.read(f) :
			f.console_in.readchar(f));
	    case CURRENTEVAL: return (Value)f.evaluator;
	    case CURRENTWRITE: return (Value)f.writer;
	    case INTERACTIONENVIRONMENT:
		return f.toplevel_env;
	    case SYSTIME: return new Quantity(System.currentTimeMillis());
	    case MAX_PRECISION: return new Quantity(Quantity.max_precision);
	    case MIN_PRECISION: return new Quantity(Quantity.min_precision);
	    }
	case 1:
	    switch (primid) {
	    case NULLQ: return truth(f.vlr[0]==EMPTYLIST);
	    case CAR: return truePair(f, f.vlr[0]).car;
	    case CDR: return truePair(f, f.vlr[0]).cdr;
	    case PAIRQ: 
		return truth(f.vlr[0] instanceof Pair &&
				     f.vlr[0]!=EMPTYLIST);
	    case LOOKUP:		
		try {
		    return f.toplevel_env.lookup(symbol(f,f.vlr[0]));
		} catch (ArrayIndexOutOfBoundsException e) {
		    return FALSE;
		}
	    case SIN: return num(f,f.vlr[0]).sin();
	    case COS: return num(f,f.vlr[0]).cos();
	    case TAN: return num(f,f.vlr[0]).tan();
	    case ASIN: return num(f,f.vlr[0]).asin();
	    case ACOS: return num(f,f.vlr[0]).acos();
	    case ATAN: return num(f,f.vlr[0]).atan();
	    case LOG: return num(f,f.vlr[0]).log();
	    case EXP: return num(f,f.vlr[0]).exp();
	    case SQRT: return num(f,f.vlr[0]).sqrt();
	    case NUMBERQ: return truth(f.vlr[0] instanceof Quantity);
	    case VECTORQ: return truth(f.vlr[0] instanceof SchemeVector);
	    case SYMBOLQ: return truth(f.vlr[0] instanceof Symbol);
	    case CHARACTERQ: return truth(f.vlr[0] instanceof SchemeCharacter);
	    case STRINGQ: return truth(f.vlr[0] instanceof SchemeString);
	    case BOOLEANQ: return truth(f.vlr[0] instanceof SchemeBoolean);
	    case VOIDQ: return truth(f.vlr[0]==VOID);
	    case ENVIRONMENTQ: return truth(f.vlr[0] instanceof 
					    AssociativeEnvironment);
	    case CONTINUATIONQ: return truth(f.vlr[0] instanceof CallFrame);
	    case PROCEDUREQ: return truth(f.vlr[0] instanceof Procedure);
	    case INTEGERQ: return numQuery(f.vlr[0],Quantity.INTEGER);

	    case RATIOQ: return numQuery(f.vlr[0],Quantity.RATIONAL);
	    case COMPLEXQ: return numQuery(f.vlr[0],Quantity.IMAGINARY);
	    case EXACTQ: return numQuery(f.vlr[0],Quantity.EXACT);
	    case INEXACTQ: return numQuery(f.vlr[0],Quantity.INEXACT);
	    case INPORTQ: return truth(f.vlr[0] instanceof InputPort);
	    case OUTPORTQ: return truth(f.vlr[0] instanceof OutputPort);
	    case SYMBOL2STRING: 
		SchemeString st=new SchemeString(symbol(f,f.vlr[0]).
						 symval);
		st.immutable=true;
		return st;
	    case STRING2NUMBER: 
		try {
		    return new Quantity(string(f,f.vlr[0]));
		} catch (NumberFormatException nf) {
		    return FALSE;
		}
	    case NUMBER2STRING: return new SchemeString(num(f,f.vlr[0])
							.toString());
	    case STRING2SYMBOL: return Symbol.intern(string(f,f.vlr[0]));
	    case CHAR2INTEGER: return new Quantity(chr(f,f.vlr[0]).c);
	    case LIST2VECTOR: return new SchemeVector(pairToValues(pair(f,f.vlr[0])));
	    case VECTOR2LIST: 
		Value[] vals=vec(f,f.vlr[0]).vals;
		return valArrayToList(vals, 0, vals.length);
	    case EXACT2INEXACT: return num(f,f.vlr[0]).decimalVal();
	    case INEXACT2EXACT: return num(f,f.vlr[0]).exactVal();
	    case FLOOR: return num(f,f.vlr[0]).floor();
	    case CEILING: return num(f,f.vlr[0]).ceiling();
	    case ROUND: return num(f,f.vlr[0]).round();
	    case INTEGER2CHAR: return new SchemeCharacter((char)num(f,f.vlr[0]).
							intValue());
	    case VECTORFINDLASTUNIQUE: return new Quantity(vec(f,f.vlr[0]).findEnd());
	    case PEEKCHAR:
		InputPort inport=inport(f,f.vlr[0]);
		Value v=inport.readchar(f);
		if (v instanceof SchemeCharacter) 
		    inport.pushback(((SchemeCharacter)v).c);
		return v;
	    case CHARREADY:
		inport=inport(f,f.vlr[0]);
		try {
		    return truth(inport.ready());
		} catch (IOException e) {
		    return FALSE;
		}
	    case READ: case READCHAR:
		inport=inport(f,f.vlr[0]);
		return (primid==READ ? inport.read(f) :
			inport.readchar(f));
	    case EVAL:
		f.nxp=f.compile(f.vlr[0]);
		return VOID;
	    case OPENINPUTSTRING:
		return new InputPort(new BufferedReader(
	 				new StringReader(string(f,f.vlr[0]))));
	    case CALLCC:
		Procedure kproc=(Procedure)f.vlr[0];
		f.vlr=new Value[] {f.stk.capture()};

		kproc.apply(f);
		return null;
	    case GETOUTPUTSTRING:
		OutputPort port=outport(f,f.vlr[0]);
		if (!(port.w instanceof StringWriter))
		    throw new RuntimeException( "output port is not a string output port");
		StringWriter sw=(StringWriter)port.w;
		SchemeString s=new SchemeString(sw.getBuffer().toString());
		sw.getBuffer().setLength(0);
		return s;
	    case OPENINPUTFILE:
		String fname=string(f,f.vlr[0]);
		try {
		    return new InputPort(new BufferedReader(new FileReader(fname)));
		} catch (IOException e) {
		    throw new RuntimeException( "error opening file "+fname);
		}
	    case OPENOUTPUTFILE:
		fname=string(f,f.vlr[0]);
		try {
		    return new OutputPort(new BufferedWriter(new FileWriter(fname)));
		} catch (IOException e) {
		    throw new RuntimeException( "error opening file "+fname);
		}
	    case CLOSEINPUTPORT: 
		InputPort inp=inport(f,f.vlr[0]);
		if (inp!=f.console_in) inp.close(f);
		return VOID;
	    case CLOSEOUTPUTPORT: 
		OutputPort op=outport(f,f.vlr[0]);
		if (op!=f.console_out) op.close(f);
		return VOID;
	    case BOX: return new Box(f.vlr[0]);
	    case UNBOX: return (Value)box(f,f.vlr[0]).val;
	    case BOXQ: return truth(f.vlr[0] instanceof Box);
	    case LOAD:
		CallFrame before=f.stk.capture();
		InputPort p=null;
		try {
		    p=new InputPort(new BufferedReader(new FileReader(string(f,f.vlr[0]))));
		} catch (IOException e) {
		    throw new RuntimeException( "error opening '"+string(f,f.vlr[0])+"'");
		}
		v=null;
		do {
		    try {
			v=f.parser.nextExpression(p);
		    } catch (EOFException eof) {
			v=EOF;
		    } catch (IOException e) {
			f.pop(before);
			throw new RuntimeException( "error reading from "+p.write());
		    }
		    if (v!=EOF)
			f.eval(v);
		} while (v!=EOF);
		f.pop(before);
		return VOID;
	    case LENGTH:
		return new Quantity(length(pair(f,f.vlr[0])));
	    case STRINGLENGTH:
		return new Quantity(str(f,f.vlr[0]).stringdata.length);
	    case VECTORLENGTH:
		return new Quantity(vec(f,f.vlr[0]).vals.length);
	    case MAKESTRING:
		return new SchemeString(new char[num(f,f.vlr[0]).intValue()]);
	    case MAKEVECTOR:
		return new SchemeVector(num(f,f.vlr[0]).intValue());
	    case WRITECHAR:
		try {
		    f.console_out.writeChar(character(f,f.vlr[0]));
		} catch (IOException e) {
		    throw new RuntimeException("Error writing to output port "+f.console_out);
		}
		return VOID;
	    case NUMERATOR: return num(f,f.vlr[0]).numerator();
	    case DENOMINATOR: return num(f,f.vlr[0]).denominator();
	    case REALPART: return num(f,f.vlr[0]).realpart();
	    case IMAGPART: return num(f,f.vlr[0]).imagpart();
	    case DISPLAY: case WRITE:
		try {
		    f.console_out.write((primid == WRITE ? f.vlr[0].write() :
					 f.vlr[0].display()));
		    f.console_out.flush();
		} catch (IOException e) {
		    throw new RuntimeException("Error writing to output port "+f.console_out);
		}
		return VOID;
	    case CURRENTOUTPUTPORT: 
		f.console_out=outport(f,f.vlr[0]); 
		return VOID;
	    case CURRENTINPUTPORT: 
		f.console_in=inport(f,f.vlr[0]); 
		return VOID;
	    case FILETYPE:
		File tmpf=new File(string(f,f.vlr[0]));
		return ( !tmpf.exists() ? NOFILE :
			 tmpf.isDirectory() ? DIRECTORY :
			 FILE );
	    case STRING2UNINTERNEDSYMBOL:
		return Symbol.getUnique(string(f,f.vlr[0]));
	    case REPORTENVIRONMENT:
		if (FIVE.equals(num(f,f.vlr[0]))) 
		    try {
			return f.symenv.lookup(REPORT);
		    } catch (ArrayIndexOutOfBoundsException e) {
			throw new RuntimeException("Standard environment not present");
		    }
		else throw new RuntimeException("Unsupported standard version");
	    case NULLENVIRONMENT:
		if (FIVE.equals(num(f,f.vlr[0]))) 
		    return new AssociativeEnvironment();
		else throw new RuntimeException("Unsupported standard version");
	    case CURRENTEVAL:
		f.evaluator=proc(f,f.vlr[0]);
		return VOID;
	    case CURRENTWRITE:
		f.writer=proc(f,f.vlr[0]);
		return VOID;
		/*	    case SYNTRANS:
		f.compiler.syntaxTransform=truth(f.vlr[0]);
		return VOID;*/
	    case LOADMODULE:
		try {
		    Class clazz=Class.forName(string(f,f.vlr[0]));
		    Module m=(Module)clazz.newInstance();
		    m.initialize(f);
		    return VOID;
		} catch (Exception e) {
		    throw new RuntimeException(e.getMessage());
		}
	    case MAX_PRECISION:
		Quantity.max_precision=num(f,f.vlr[0]).intValue();
		return VOID;
	    case MIN_PRECISION:
		Quantity.min_precision=num(f,f.vlr[0]).intValue();
		return VOID;
	    case ABSPATHQ:
		String f1=string(f,f.vlr[0]);
		File fn=new File(f1);
		return truth(fn.isAbsolute());
	    case PARENT_CONT:
		return ((CallFrame)f.vlr[0]).parent;
	    }	    
	case 2:
	    switch (primid) {
	    case EQ: return truth(f.vlr[0].eq(f.vlr[1]));
	    case CONS:
		return new Pair(f.vlr[0], f.vlr[1]);
	    case EQUAL:
		return truth(f.vlr[0].equals(f.vlr[1]));
	    case SETCAR:
		truePair(f,f.vlr[0]).car=f.vlr[1];
		return VOID;
	    case SETCDR:
		truePair(f,f.vlr[0]).cdr=f.vlr[1];
		return VOID;
	    case REMAINDER:
		return num(f,f.vlr[0]).remainder(num(f,f.vlr[1]));
	    case QUOTIENT:
		return num(f,f.vlr[0]).quotient(num(f,f.vlr[1]));
	    case LCM:
		return num(f,f.vlr[0]).lcm(num(f,f.vlr[1]));
	    case GCD:
		return num(f,f.vlr[0]).gcd(num(f,f.vlr[1]));
	    case ATAN:
		return num(f,f.vlr[0]).atan(num(f,f.vlr[1]));
	    case SETBOX:
		try {
		    box(f,f.vlr[0]).set(f.vlr[1]);
		} catch (ImmutableException e) {
		    error(f, "box "+f.vlr[0]+" is immutable");
		}
		return VOID;
	    case STRINGREF:
		return new SchemeCharacter(str(f,f.vlr[0]).stringdata[num(f,f.vlr[1]).intValue()]);
	    case VECTORREF:
		int index=num(f,f.vlr[1]).intValue();
		try {
		    return vec(f,f.vlr[0]).vals[index];
		} catch (ArrayIndexOutOfBoundsException e) {
		    error(f, Symbol.get("vector-ref"), "index "+index+" out of bounds for '"+f.vlr[0].display()+"'");
		}
	    case MAKEVECTOR:
		return new SchemeVector(num(f,f.vlr[0]).intValue(),
					f.vlr[1]);
	    case STRINGFILL:
		SchemeString st=str(f,f.vlr[0]);
		char c=character(f,f.vlr[1]);
		for (int i=0; i<st.stringdata.length; i++)
		    st.set(f, i, c);
		return VOID;
	    case MAKESTRING:
		char newStr[]=new char[num(f,f.vlr[0]).intValue()];
		char fillchar=character(f,f.vlr[1]);
		for (int i=0; i<newStr.length; i++) {
		    newStr[i]=fillchar;
		}
		return new SchemeString(newStr);
	    case STRING2NUMBER: 
		return new Quantity(string(f,f.vlr[0]),
				    num(f,f.vlr[1]).intValue());
	    case NUMBER2STRING: 
		return new SchemeString(num(f,f.vlr[0])
					.toString(num(f,f.vlr[1]).intValue()));
	    case STRINGAPPEND:
		return str(f,f.vlr[0]).append(str(f,f.vlr[1]));
	    case WRITECHAR:
		OutputPort port=outport(f,f.vlr[1]);
		try {
		    port.writeChar(character(f,f.vlr[0]));
		} catch (IOException e) {
		    throw new RuntimeException("Error writing to output port "+f.console_out);
		}
		return VOID;
	    case MAKERECTANGULAR: 
		return new Quantity(num(f,f.vlr[0]).decimalVal().d,
				    num(f,f.vlr[1]).decimalVal().d);
	    case ASHL: return new Quantity(num(f,f.vlr[0]).integerVal()
					   .shiftLeft(num(f,f.vlr[1])
						      .intValue()));
	    case DISPLAY: case WRITE:
	       port=outport(f,f.vlr[1]);
		try {
		    port.write((primid == WRITE ? f.vlr[0].write() :
					 f.vlr[0].display()));
		    port.flush();
		} catch (IOException e) {
		    throw new RuntimeException("Error writing to output port "+port);
		}
		return VOID;
	    case EVAL:
		f.nxp=f.compile(f.vlr[0], env(f,f.vlr[1]));
		return VOID;
	    case CALLFC:
		Procedure proc=proc(f,f.vlr[0]);
		Procedure ehandler=proc(f,f.vlr[1]);
		f.fk=f.createFrame(new ApplyValuesContEval(ehandler), 
				   null, f.env, f.fk, f.stk);
		f.vlr=new Value[0];
		proc.apply(f);
		return null;
	    case CALLWITHVALUES:
		Procedure producer=proc(f,f.vlr[0]);
		Procedure consumer=proc(f,f.vlr[1]);
		f.push(new ApplyValuesContEval(consumer));
		
		f.vlr=new Value[0];
		producer.apply(f);
		return null;
	    case ERROR:
		error(f, string(f,f.vlr[0]), false);
	    case MAKEPATH:
		String f1=string(f,f.vlr[0]);
		String f2=string(f,f.vlr[1]);
		File fn=new File(f1);
		fn=new File(f1, f2);
		try {
		    return new SchemeString(fn.getCanonicalPath());
		} catch (IOException e) {
		    error(f, "Invalid path specification");
		}
	    case LOOKUP: 
		try {
		    return (Value)f.lookup(symbol(f,f.vlr[0]), 
					   symbol(f,f.vlr[1]));
		} catch (ArrayIndexOutOfBoundsException e) {
		    return FALSE;
		}
	    }
	case 3:
	    switch(primid) {
	    case PUTPROP:
		Symbol lhs=symbol(f,f.vlr[0]);
		Symbol context=symbol(f,f.vlr[1]);
		Value rhs=f.vlr[2];
		if (rhs instanceof NamedValue) {
		    NamedValue nv=(NamedValue)rhs;
		    if (nv.name==null)
			nv.name=lhs;
		}
		
		f.define(lhs, rhs, context);
		return VOID;
	    case STRINGSET:
		
		str(f,f.vlr[0]).set(f, num(f,f.vlr[1]).intValue(),
				    character(f,f.vlr[2]));
		return VOID;
	    case VECTORSET:
		int index=num(f,f.vlr[1]).intValue();
		try {
		    vec(f,f.vlr[0]).set(index,f.vlr[2]);
		} catch (ArrayIndexOutOfBoundsException e) {
		    error(f, Symbol.get("vector-set!"), "index "+index+" out of bounds for '"+f.vlr[0].display()+"'");
		}
		return VOID;
	    case BLOCKREAD:
		int count=num(f,f.vlr[2]).intValue();
		InputPort inport=inport(f,f.vlr[1]);
		char[] buff=str(f,f.vlr[0]).stringdata;
		return inport.read(f, buff, count);
	    case BLOCKWRITE:
		count=num(f,f.vlr[2]).intValue();
		OutputPort outport=outport(f,f.vlr[1]);
		buff=str(f,f.vlr[0]).stringdata;
		outport.write(f, buff, count);
		return VOID;
	    }
	default:
	    Quantity quantity=null;
	    switch (primid) {
	    case APPLY:
		Procedure proc=proc(f,f.vlr[0]);
		Pair args=pair(f,f.vlr[f.vlr.length-1]);
		Pair arg1=EMPTYLIST;
		for (int i=f.vlr.length-2; i>=1; i--) 
		    arg1=new Pair(f.vlr[i],arg1);
  		Pair applyArgs=append(arg1, args);
		f.nxp=new AppExp((Expression)proc, 
				 pairToExpressions(applyArgs), true);
		return null;
	    case ADD: 
		quantity=Quantity.ZERO;
		for (int i=f.vlr.length-1; i>=0; i--) {
		    quantity=quantity.add(num(f,f.vlr[i]));
		}	       
		return quantity;
		
	    case MUL: 
		quantity=Quantity.ONE;
		for (int i=f.vlr.length-1; i>=0; i--) {
		    quantity=quantity.mul(num(f,f.vlr[i]));
		}	       
		return quantity;
		
	    }
	    switch (primid) {
	    case LIST: return valArrayToList(f.vlr,0,f.vlr.length);
	    case SUB: 
		quantity=num(f,f.vlr[0]);
		if (f.vlr.length==1) {
		    return Quantity.ZERO.sub(quantity);
		    
		}
		for (int i=1; i<f.vlr.length; i++) {
		    quantity=quantity.sub(num(f,f.vlr[i]));
		}
		return quantity;
		
	    case NEQ: 
		quantity=num(f,f.vlr[0]);
		for (int i=f.vlr.length-1; i>=0; i--) {
		    if (!quantity.comp(num(f,f.vlr[i]), 0)) {
			return FALSE;
			
		    }
		}
		return TRUE;
	    case LT: 
		quantity=num(f,f.vlr[0]);
		for (int i=1; i<f.vlr.length; i++) {
		    Quantity q=num(f,f.vlr[i]);
		    if (!quantity.comp(q, -1)){
			return FALSE;
			
		    }
		    quantity=q;
		}
		return TRUE;
		
	    case GRT: 
		quantity=num(f,f.vlr[0]);
		for (int i=1; i<f.vlr.length; i++) {
		    Quantity q=num(f,f.vlr[i]);
		    if (!quantity.comp(q, 1)) {
			return FALSE;
			
		    }
		    quantity=q;
		}
		return TRUE;
		
	    case DIV: 
		quantity=num(f,f.vlr[0]);
		if (f.vlr.length==1) {return Quantity.ONE.div(quantity); }
		for (int i=1; i<f.vlr.length; i++) {
		    quantity=quantity.div(num(f,f.vlr[i]));
		}
		return quantity;
		
	    default:
		throw new RuntimeException( "incorrect number of arguments to procedure");
	    }
	}
    }
}



