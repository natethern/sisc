package sisc.compiler;

import java.io.*;
import java.math.*;
import sisc.data.*;
import sisc.io.InputPort;
import sisc.util.Util;

public class Lexer implements Tokens {

    /**
     * When set, the *strict* R5RS lexical syntax is followed. 
     * Any reserved character will be an error.
     *
     * This should really by in the DynamicEnvironment
     */
    public static boolean annotate=Util.getSystemProperty("sisc.strictr5rs", 
                                                          "false")
        .equalsIgnoreCase("true");

    /* Strict R5RS Syntax Helper Functions */
    public static final boolean isIdentifierStart(char c) {
        return Character.isLetter(c) ||
            in(c, special_initials);
    }

    public static final boolean isIdentifierSubsequent(char c) {
        return isIdentifierStart(c) ||
            Character.isDigit(c) ||
            in(c, special_subsequents);
    }

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
	DOT        ='.',
        PIPE       ='|';
    
    static final char[]
	special = new char[]
        {'\t', '\n', '\r', ' ', '"', '(', ')', ';', '[', ']'},
	sharp_special = new char[]
	{'\t', '\n', ' ', '"', '#', '(', ')', '=', '[', ']'},
	number_prefixes = new char[]
	{'+','-','.'},
	hex_number_prefixes = new char[]
        {'+','-','.','A','B','C','D','E','F','a','b','c','d','e','f'},
        reserved = new char[] 
        {'[', ']', '{', '|', '}'},
        special_initials = new char[] 
        {'!','$','%','&','*','/',':','<','=','>','?','^','_','~'},
        special_subsequents = new char[] 
        {'+','-','.','@'};

    public boolean strictR5RS;
    public String sval;
    public Quantity nval;
    public Pair prval;

    public int readIgnoringWhitespace(InputPort is)
    throws IOException {
        char c=0;

        do {
            c=(char)readChar(is);
        } while (Character.isWhitespace(c));

        return c;
    }

    public int nextToken(InputPort is, int radix) throws IOException {
        int nt=_nextToken(is, radix);
        return nt;
    }

    public int _nextToken(InputPort is, int radix)
    throws IOException {

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
                return nextToken(is, radix);
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
                String v=readToBreak(is, special, true);
                Object result=v;
                if (numberStart(v.charAt(0), radix))
                    result=readNum(v, radix);
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

    static Object readNum(String v, int radix) {
        try {
            Quantity q=Quantity.valueOf(v, radix);
            return q;
        } catch (NumberFormatException n) {
            return v;
        }
    }

    public int readChar(InputPort is) throws IOException {
        int c=is.read();

        if (strictR5RS && in((char)c, reserved)) 
            throw new IOException(Util.liMessage(Util.SISCB, "reservedchar", 
                                                 Character.toString((char)c)));

        if (c!='\\') return c;

        //escaping rules are those defined by Java, except we don't
        //handle octal escapes.
	switch (c = is.read()) {
	case '"': return c | 0x80000000;
	case 'b': return '\b';
	case 't': return '\t';
	case 'n': return '\n';
	case 'f': return '\f';
	case 'r': return '\r';
        case 'u': 
            char[] hexChars=new char[4];
            for (int i=0; i<hexChars.length; i++) {
                int rc=is.read();
                if (rc==-1) throw new EOFException("End of file on hex-literal");
                hexChars[i]=(char)rc;
            }
            try {
                return (char)Integer.parseInt(new String(hexChars), 16);
            } catch (NumberFormatException nfe) {
                throw new IOException(Util.liMessage(Util.SISCB,
                                                     "invalidcharconst"));
            }
        default: return c;
	}
    }

    public String readToEndOfString(InputPort is)
    throws IOException {
        StringBuffer b=new StringBuffer();
        int x;
        while ('"'!=(x=readChar(is)) && x!=0)
            b.append((char)x);
        return b.toString();
    }

    public String readToBreak(InputPort is, char[] stops, 
                              boolean handleEscapes)
    throws IOException {
        StringBuffer b=new StringBuffer();
        char c;
        boolean escaped=false, bar=false;
	try {
	    while (!in((c=(char)readChar(is)), stops) || escaped) {
                if (handleEscapes && !escaped && c=='\\') {
                    escaped=true;
                } else {
                    b.append(c);
                    escaped=false;
                }
            }
	    is.pushback(c);
	} catch (EOFException e) {
	}
        return b.toString();
    }

    public static boolean numberStart(char c, int radix) {
        return Character.isDigit(c) ||
               in(c, (radix == 16 ? hex_number_prefixes :
                      number_prefixes));
    }

    public static boolean in(char c, char[] set) {
        for (int i=set.length-1; i>-1; i--)
            if (c>set[i]) return false;
            else if (c==set[i]) return true;
        return false;
    }

    public void skipMultilineComment(InputPort in) 
        throws IOException {
        boolean seenSharp=false, seenPipe=false;
        int depth=0;
        try {
            do {
                switch (readChar(in)) {
                case PIPE:
                    if (seenSharp) {
                        seenSharp=false;
                        depth++;
                    } else {
                        seenPipe=true;
                    }
                    break;
                case SHARP:
                    if (seenPipe) {
                        seenPipe=false;
                        depth--;
                    } else {
                        seenSharp=true;
                    }
                    break;
                default:
                    seenPipe=seenSharp=false;
                }
            } while (depth >= 0);
        } catch (EOFException e) {
            System.err.println(Util.warn("eofbeforeeoc"));
            throw e;
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
