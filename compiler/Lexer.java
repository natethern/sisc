package sisc.compiler;

import java.io.*;
import java.math.*;
import java.util.Vector;
import sisc.data.*;

public class Lexer implements Tokens {
    static final char 
	STRING_CONST='"',
	COMMENT     =';',
	LIST_OPEN_ALT ='[',
	LIST_CLOSE_ALT =']',
	LIST_OPEN  ='(',
	LIST_CLOSE =')',
	SHARP      ='#',
	QUOTE      ='\'',
	BACKQUOTE  ='`', 
	UNQUOTE    =',',
	UNQUOTE_SPLICING 
	           ='@',
	DOT        ='.';

    static final char[] 
	special = new char[] 
        {'\t', '\n', '\r', ' ', '"', '(', ')', '[', ']'},
	sharp_special = new char[] 
	{'\t', '\n', ' ', '"', '#', '(', ')', '=', '[', ']'},
	number_prefixes = new char[] 
	{'+','-','.'};
    
    public String sval;
    public Quantity nval;
    public Pair prval;
    public boolean escaped;
    protected boolean ec;

    public int readIgnoringWhitespace(InputPort is) 
	throws IOException, EOFException {
	char c=0;
	do {
	    c=(char)readChar(is);
	} while (Character.isWhitespace(c));
	return c;
    }

    public int nextToken(InputPort is) 
	throws IOException, EOFException {
	synchronized(is) {
	    int c=readIgnoringWhitespace(is);
	    switch (c) {
	    case LIST_OPEN: 
	    case LIST_OPEN_ALT:
		return TT_PAIR;
	    case LIST_CLOSE: 
	    case LIST_CLOSE_ALT:
		return TT_ENDPAIR;
	    case QUOTE:
		return TT_QUOTE;
	    case SHARP:
		return TT_SHARP;
	    case STRING_CONST:
		sval=readToEndOfString(is);
		return TT_STRING;
	    case COMMENT:
		while (is.read()!='\n') {}
		return nextToken(is);
	    case BACKQUOTE:
		return TT_BACKQUOTE;
	    case UNQUOTE:
		int sc=is.read();
		if (sc==UNQUOTE_SPLICING)
		    return TT_UNQUOTE_SPLICING;
		else
		    is.pushback(sc);
		return TT_UNQUOTE;
	    default:
		is.pushback(c);
		String v=readToBreak(is, special);
		Object result=v;
		if (numberStart(v.charAt(0)))
		    result=readNum(v);
		if (result instanceof String) {
		    sval=(String)result;
		    if (sval.length()==1 && 
			sval.charAt(0)==DOT)
			return TT_DOT;
		    return TT_SYMBOL;
		} else {
		    nval=(Quantity)result;
		    return TT_NUMBER;
		}
	    }
	}
    }
    
    static Object readNum(String v) {
	try {
	    Quantity q=new Quantity(v);
	    return q;
	} catch (NumberFormatException n) {
	    return v;
	}
    }

    public String readTo(InputPort is, int stop) 
	throws IOException, EOFException {
	StringBuffer b=new StringBuffer();
	int x;
	while (stop!=(x=is.read()) && x>0) 
	    b.append((char)x);
	return b.toString();
    }


    public int readChar(InputPort is) throws IOException, EOFException {
        int c=is.read();
	if (c=='\\') {
	    escaped=true;
	    return is.read() | 0x80000000;
	}
	return c;
    }

    public String readToEndOfString(InputPort is) 
	throws IOException, EOFException {
	StringBuffer b=new StringBuffer();
	int x;
	while ('"'!=(x=readChar(is)) && x!=0) 
	    b.append((char)x);
	return b.toString();
    }

    public static String readToBreak(InputPort is, char[] stops) 
	throws IOException {
	StringBuffer b=new StringBuffer();
	char c;
	while (!in((c=(char)is.read()), stops))
	    b.append(c);
	is.pushback(c);
	return b.toString();
    }
    
    public static boolean numberStart(char c) {
	return Character.isDigit(c)||in(c, number_prefixes);
    }

    public static boolean in(char c, char[] set) {
	for (int i=set.length-1; i>-1; i--) 
	    if (c>set[i]) return false;
	    else if (c==set[i]) return true;
	return false;
    }
}
