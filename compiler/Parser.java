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
	} 
	return (Value)n;
    }
    
    protected Object _nextExpression(InputPort is, HashMap  state, Integer def) 
	throws IOException {

	int token=lexer.nextToken(is);

	Object o;
	switch (token) {
	case TT_EOF:
	    return EOF;
	case TT_DOT:
	    o=DOT;
	    break;
	case TT_UNQUOTE:
	    o=list(UNQUOTE, nextExpression(is));
	    break;
	case TT_UNQUOTE_SPLICING:
	    o=list(UNQUOTE_SPLICING, nextExpression(is));
	    break;
	case TT_QUOTE:
	    o=list(QUOTE, nextExpression(is));
	    break;
	case TT_BACKQUOTE:
	    o=list(BACKQUOTE, nextExpression(is));
	    break;
	case TT_NUMBER:
	    o=lexer.nval;
	    break;
	case TT_STRING:
	    o=new SchemeString(lexer.sval);
	    break;
	case TT_PAIR:
	    return readList(is, state, def);
	case TT_ENDPAIR: 
	    o=ENDPAIR;
	    break;
	case TT_SYMBOL:
	    o=Symbol.get(lexer.sval);
	    break;
	case TT_SHARP:
	    int c=is.read();
	    switch (c) {
	    case 't': case 'T':
		o=TRUE;
		break;
	    case 'f': case 'F':
		o=FALSE;
		break;
	    case ';':
		nextExpression(is);
		o=_nextExpression(is, state, def);
		break;
	    case '\\':
		c=is.read();
		if (lexer.in((char)c, lexer.special)) {
		    o=new SchemeCharacter((char)c);
		    break;
		}
		is.pushback(c);
		String cn=lexer.readToBreak(is, Lexer.special);
		String cnl=cn.toLowerCase();
		Object cs=chars.get(cnl);
		if (cs!=null) {
		    o=cs;
		} else if (cn.length()==1) {
		    o=new SchemeCharacter(cn.charAt(0));
		} else {
		    o=new SchemeCharacter((char)Integer.parseInt(cn, 8));
		}
		break;
	    case 'b': case 'B':
		o=new Quantity(lexer.readToBreak(is, Lexer.special), 2);
		break;
	    case 'o': case 'O':
		o=new Quantity(lexer.readToBreak(is, Lexer.special), 8);
		break;
	    case 'x': case 'X':
		o=new Quantity(lexer.readToBreak(is, Lexer.special), 16);
		break;
	    case 'd': case 'D':
		o=new Quantity(lexer.readToBreak(is, Lexer.special));
		break;
	    case '&':
		o=new Box((Value)_nextExpression(is, state, null));
		break;
	    case 'i': case 'I':
		o=((Quantity)_nextExpression(is, state, null)).decimalVal();
		break;
	    case 'e': case 'E':
		o=((Quantity)_nextExpression(is, state, null)).exactVal();
		break;
	    case '!': 
		if (lexer.readToBreak(is, Lexer.special).equals("eof"))
		    return EOF;
		else throw new IOException("invalid sharp sequence");
	    case '\'':
		o=list(SYNTAX, nextExpression(is));
		break;
	    default:
		Value[] v=null;
		is.pushback(c);
		if (Character.isDigit((char)c)) {
		    Integer ref=new Integer(Integer.parseInt(lexer.readToBreak(is, 
							       Lexer.sharp_special)));
		    c=is.read();
		    if (c=='=') {
			o=_nextExpression(is, state, ref);
			break;
		    } else if (c=='#') {
			o=state.get(ref);
			break;
		    } else {
			is.pushback(c);
			v=new Value[ref.intValue()];
		    } 
		}

		Object expr=_nextExpression(is, state, def);
		if (expr==null && v==null) {
		    o=new SchemeVector(new Value[0]);
		    break;
		} else if (expr instanceof Pair) {
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
		o=new SchemeVector(v);
		break;
	    }
	    break;
	default:
	    throw new IOException("Outrageous Error: unknown token "+token);
	}
	if (def==null) return o;
	else {
	    state.put(def, o);
	    return o;
	}
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
