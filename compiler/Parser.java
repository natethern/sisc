package sisc.compiler;

import sisc.Util;
import sisc.data.*;
import java.io.*;
import java.util.*;

public class Parser extends Util implements Tokens {
    Lexer lexer;
    static final Object DOT=new Object();
    static final Object ENDPAIR=new Object();

    static final HashMap  chars=new HashMap (8);
    static {
	chars.put("space", new SchemeCharacter(' '));
	chars.put("backspace", new SchemeCharacter('\u0008'));
	chars.put("rubout", new SchemeCharacter('\u007f'));
	chars.put("page", new SchemeCharacter('\u000c'));
	chars.put("tab", new SchemeCharacter('\t'));
	chars.put("newline", new SchemeCharacter('\n'));
	chars.put("nul", new SchemeCharacter((char)0));
    }

    public Parser(Lexer l) {
	this.lexer=l;
    }

    public Value nextExpression(InputPort is) throws IOException {
	Object n=VOID;
	try {
	    n=_nextExpression(is, new HashMap (), null);
	    return (Value)n;
	} catch (ClassCastException ce) {
	    if (n==ENDPAIR) {
		System.err.println("{warning: ignored orphaned close-parenthesis ')'}");
		return nextExpression(is);
	    } else if (n==DOT)
		throw new IOException("unexpected dot (.).");
	} catch (EOFException e) {
	    return EOF;
	}
	return (Value)n;
    }
    
    protected Object _nextExpression(InputPort is, HashMap  state, Integer def) 
	throws IOException, EOFException {
	int token=lexer.nextToken(is);
	switch (token) {
	case TT_DOT:
	    if (def==null) return  DOT ; else { Object o= DOT ; state.put(def, o); return o; } 
	case TT_UNQUOTE:
	    Pair pr=new Pair(UNQUOTE, 
				     new Pair(nextExpression(is), 
						      EMPTYLIST));
	    if (def==null) return  pr ; else { Object o= pr ; state.put(def, o); return o; } 
	case TT_UNQUOTE_SPLICING:
	    pr=new Pair(UNQUOTE_SPLICING, new Pair(nextExpression(is), EMPTYLIST));
	    if (def==null) return  pr ; else { Object o= pr ; state.put(def, o); return o; } 
	case TT_QUOTE:
	    pr=new Pair(QUOTE, new Pair(nextExpression(is), EMPTYLIST));
	    if (def==null) return  pr ; else { Object o= pr ; state.put(def, o); return o; } 
	case TT_BACKQUOTE:
	    pr=new Pair(BACKQUOTE, new Pair(nextExpression(is), EMPTYLIST));
	    if (def==null) return  pr ; else { Object o= pr ; state.put(def, o); return o; } 
	case TT_NUMBER:
	    if (def==null) return  lexer.nval ; else { Object o= lexer.nval ; state.put(def, o); return o; } 
	case TT_STRING:
	    if (def==null) return  new SchemeString(lexer.sval) ; else { Object o= new SchemeString(lexer.sval) ; state.put(def, o); return o; } 
	case TT_PAIR:
	    return readList(is, state, def);
	case TT_ENDPAIR: 
	    if (def==null) return  ENDPAIR ; else { Object o= ENDPAIR ; state.put(def, o); return o; } 
	case TT_SYMBOL:
	    if (def==null) return  Symbol.get(lexer.sval); else { 
		Object o= Symbol.get(lexer.sval) ; state.put(def, o); return o; } 
	case TT_SHARP:
	    int c=is.read();
	    switch (c) {
	    case 't': case 'T':
		if (def==null) return  TRUE ; else { Object o= TRUE ; state.put(def, o); return o; } 
	    case 'f': case 'F':
		if (def==null) return  FALSE ; else { Object o= FALSE ; state.put(def, o); return o; } 
	    case '\\':
		c=is.read();
		if (lexer.in((char)c, lexer.special))
		    if (def==null) return  new SchemeCharacter((char)c) ; else { Object o= new SchemeCharacter((char)c) ; state.put(def, o); return o; } 
		is.pushback(c);
		String cn=lexer.readToBreak(is, Lexer.special);
		String cnl=cn.toLowerCase();
		Object cs=chars.get(cnl);
	        if (cs!=null) if (def==null) return  cs ; else { Object o= cs ; state.put(def, o); return o; }  
		else if (cn.length()==1) 
		    if (def==null) return  new SchemeCharacter(cn.charAt(0)) ; else { Object o= new SchemeCharacter(cn.charAt(0)) ; state.put(def, o); return o; } 
		else if (def==null) return  new SchemeCharacter((char)Integer.parseInt(cn, 8)) ; else { Object o= new SchemeCharacter((char)Integer.parseInt(cn, 8)) ; state.put(def, o); return o; } 
	    case 'b': case 'B':
		if (def==null) return  new Quantity(lexer.readToBreak(is, Lexer.special), 2) ; else { Object o= new Quantity(lexer.readToBreak(is, Lexer.special), 2) ; state.put(def, o); return o; } 
	    case 'o': case 'O':
		if (def==null) return  new Quantity(lexer.readToBreak(is, Lexer.special), 8) ; else { Object o= new Quantity(lexer.readToBreak(is, Lexer.special), 8) ; state.put(def, o); return o; } 
	    case 'x': case 'X':
		if (def==null) return  new Quantity(lexer.readToBreak(is, Lexer.special), 16) ; else { Object o= new Quantity(lexer.readToBreak(is, Lexer.special), 16) ; state.put(def, o); return o; } 
	    case 'd': case 'D':
		if (def==null) return  new Quantity(lexer.readToBreak(is, Lexer.special)) ; else { Object o= new Quantity(lexer.readToBreak(is, Lexer.special)) ; state.put(def, o); return o; } 
	    case '&':
		if (def==null) return  new Box((Value)_nextExpression(is, state, null)) ; else { Object o= new Box((Value)_nextExpression(is, state, null)) ; state.put(def, o); return o; } 
		
	    case 'i': case 'I':
		if (def==null) return  ((Quantity)_nextExpression(is, state, null)).decimalVal() ; else { Object o= ((Quantity)_nextExpression(is, state, null)).decimalVal() ; state.put(def, o); return o; } 
	    case 'e': case 'E':
		if (def==null) return  ((Quantity)_nextExpression(is, state, null)).exactVal() ; else { Object o= ((Quantity)_nextExpression(is, state, null)).exactVal() ; state.put(def, o); return o; } 
	    case '!': 
		if (lexer.readToBreak(is, Lexer.special).equals("eof"))
		    return EOF;
		else throw new IOException("invalid sharp sequence");
	    case '\'':
		return new Pair(SYNTAX, 
				new Pair(nextExpression(is), 
					 EMPTYLIST));
	    default:
		Value[] v=null;
		is.pushback(c);
		if (Character.isDigit((char)c)) {
		    Integer ref=new Integer(Integer.parseInt(lexer.readToBreak(is, 
							       Lexer.sharp_special)));
		    c=is.read();
		    if (c=='=') {
			Object r=_nextExpression(is, state, ref);
			if (def==null) return  r ; else { Object o= r ; state.put(def, o); return o; } 
		    } else if (c=='#')
			if (def==null) return  ref ; else { Object o= ref ; state.put(def, o); return o; }  
		    else {
			is.pushback(c);
			v=new Value[ref.intValue()];
		    } 
		}

		Object expr=_nextExpression(is, state, def);
		if (expr==null && v==null) 
		    if (def==null) 
			return new SchemeVector(new Value[0]); 
		    else { 
			Object o= new SchemeVector(new Value[0]); 
			state.put(def, o); 
			return o; 
		    } 
		else if (expr instanceof Pair) {
		    if (v==null) 
			v=new Value[length((Pair)expr)];
		} else if (expr!=null)
		    throw new IOException("Invalid sharp construct '"+expr+"'");
		Pair p=(Pair)expr;
		Object lastObject=Quantity.ZERO;

		for (int i=0; i<v.length; i++) {
		    if (p!=EMPTYLIST) {
			lastObject=p.car;
			v[i]=(Value)(lastObject instanceof Integer ? 
				     state.get(lastObject) : lastObject);
			p=(Pair)p.cdr;
		    } else
			v[i]=(Value)(lastObject instanceof Integer ? 
				     state.get(lastObject) : lastObject);
 		}
		if (def==null) {
		    return new SchemeVector(v); 
		}else { 
		    Object o= new SchemeVector(v); 
		    state.put(def, o); 
		    return o; 
		} 
	  }
       }
	if (def==null) return  nextExpression(is) ; else { Object o= nextExpression(is) ; state.put(def, o); return o; } 
    }	    

    public Value readList(InputPort is, HashMap  state, Integer def) 
	throws IOException, EOFException {
	Pair h=null;
	Pair p=null;
	Object l=_nextExpression(is, state, null);
	while (l!=ENDPAIR) {
	    if (p==null) {
		h=p=new Pair();
		if (def!=null) state.put(def, p);
	    } else 
		if (l == DOT) {
		    l=_nextExpression(is, state, null);
		    if (l==ENDPAIR)
			throw new IOException("Expected expression in cdr field");
		    p.cdr=(Value)(l instanceof Integer ? state.get(l) : 
				  l);
		    if (_nextExpression(is, state, null)!=ENDPAIR)
			throw new IOException("More than one object after dot ('.')");
		    return h;
		} else 
		    p.cdr=p=new Pair();
	    p.car=(Value)(l instanceof Integer ? state.get(l) : l);
	    l=_nextExpression(is, state, null);
	}
	return (h==null ? (Value)EMPTYLIST : (Value)h);
    }
}
