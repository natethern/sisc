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

package sisc.compiler;

import sisc.Util;
import sisc.data.*;
import sisc.exprs.AnnotatedExpr;
import java.io.*;
import java.util.*;


/**
 * Receives tokens from the Lexer and parses them into valid
 * s-expressions.
 */
public class Parser extends Util implements Tokens {
    
    /**
     * When set, annotations will be emitted.  Requires that
     * the given InputPort be a SourceInputPort
     */
    public boolean annotate=getSystemProperty("sisc.emitannotations", "false").equalsIgnoreCase("true");
    Lexer lexer;

    static final Object DOT=new Object();
    static final Object ENDPAIR=new Object();
    static final Symbol SYNTAX=Symbol.get("syntax"),
	ANNOTATION=Symbol.get("make-annotation"),
	LINE=Symbol.get("line-number"),
	COLUMN=Symbol.get("column-number"),
	FILE=Symbol.get("source-file");

    static final HashMap chars=new HashMap (8);
    static {
        chars.put("space", new SchemeCharacter(' '));
        chars.put("backspace", new SchemeCharacter('\u0008'));
        chars.put("rubout", new SchemeCharacter('\u007f'));
        chars.put("page", new SchemeCharacter('\u000c'));
        chars.put("tab", new SchemeCharacter('\t'));
        chars.put("return", new SchemeCharacter('\r'));
        chars.put("newline", new SchemeCharacter('\n'));
        chars.put("nul", new SchemeCharacter((char)0));
    }

    public Parser(Lexer l) {
        this.lexer=l;
    }

    public final Value nextExpression(InputPort is, boolean read) throws IOException {
        return nextExpression(is, 10, read);
    }

    public final Value nextExpression(InputPort is) throws IOException {
        return nextExpression(is, 10, false);
    }

    protected final Value nextExpression(InputPort is, HashMap state, 
                                         boolean read) 
	throws IOException {
	return (Value)_nextExpression(is, state, null, read);
    }

    /**
     * Reads an s-expression from the given input port.
     *
     * @param radix Specifies the radix of any numbers that are read
     * @param read If true, this is a Scheme read call, no annotations
     *             will be emitted even if annotations are enabled
     * @return the read expression
     * @exception IOException if an error occurs
     */
    public Value nextExpression(InputPort is, int radix,
                                boolean read) throws IOException {
        Object n=VOID;

        try {
            n=_nextExpression(is, new HashMap (), null, radix, read);
            return (Value)n;
        } catch (ClassCastException ce) {
            if (n==ENDPAIR) {
                System.err.println(warn("orphanedparen"));
                return nextExpression(is, radix, read);
            } else if (n==DOT)
                throw new IOException(liMessage(SISCB, "unexpecteddot"));
        }
	return (Value)n;
    }

    protected Object _nextExpression(InputPort is, HashMap state, 
                                     Integer def, boolean read) throws IOException {
        return _nextExpression(is, state, def, 10, read);
    }

    protected Quantity numberCheck(Object o) throws IOException {
        try {
            return (Quantity)o;
        } catch (ClassCastException cce) {
            throw new IOException("unexpected token where number was mandatory");
        }
    }

    protected Object listSpecial(Symbol car, InputPort is,
				 HashMap state, Integer def, 
                                 boolean read) throws IOException {
	Pair t=new Pair();
        Pair p;
        if (read)
            p=new Pair(car, t);
        else
            p=new ImmutablePair(car, t);
	if (def!=null)
	    state.put(def, p);
	t.setCar(nextExpression(is, state, read));
	return p;
    }

    protected Object _nextExpression(InputPort is, HashMap state, Integer def, int radix, boolean read)
    throws IOException {
	int line=-1, col=-1;
	String file=null;
	
        int token=lexer.nextToken(is, radix);
        Object o;
        switch (token) {
        case TT_EOF:
            return EOF;
        case TT_DOT:
            o=DOT;
            break;
        case TT_UNQUOTE:
            o=listSpecial(UNQUOTE, is, state, def, read);
            break;
        case TT_UNQUOTE_SPLICING:
            o=listSpecial(UNQUOTE_SPLICING, is, state, def, read);
            break;
        case TT_QUOTE:
            o=listSpecial(QUOTE, is, state, def, read);
            break;
        case TT_BACKQUOTE:
            o=listSpecial(BACKQUOTE, is, state, def, read);
            break;
        case TT_NUMBER:
            o=lexer.nval;
            break;
        case TT_STRING:
            o=new ImmutableString(lexer.sval);
            break;
        case TT_PAIR:
	    //Annotation support
	    if (is instanceof SourceInputPort) {
		SourceInputPort sip=(SourceInputPort)is;
		line=sip.line;
		col=sip.column-1;
		file=sip.sourceFile;
	    }

            o=readList(is, state, def, read);
	    if (annotate && o instanceof Pair && line>=0) {
		o=new AnnotatedExpr((Expression)o, 
				    list(new Pair(LINE, Quantity.valueOf(line)),
					 new Pair(COLUMN, Quantity.valueOf(col)),
					 new Pair(FILE, new SchemeString(file))));
            } 
	    return o;
        case TT_ENDPAIR:
            o=ENDPAIR;
            break;
        case TT_SYMBOL:
            o=Symbol.get(lexer.sval);
            break;
        case TT_SHARP:
            int c=is.read();
            char dc=Character.toLowerCase((char)c);
            //Which type of sharp do we have?
            switch (dc) {
            case 't':
                o=TRUE;
                break;
            case 'f':
                o=FALSE;
                break;
                //SISC supports s-expression commenting
            case ';':
                nextExpression(is);
                o=_nextExpression(is, state, def, read);
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
            case 'b':
                o=numberCheck(_nextExpression(is, state, null, 2, read));
                break;
            case 'o':
                o=numberCheck(_nextExpression(is, state, null, 8, read));
                break;
            case 'x':
                o=numberCheck(_nextExpression(is, state, null, 16, read));
                break;
            case 'd':
                o=numberCheck(_nextExpression(is, state, null, read));
                break;
            case '&':
                o=new Box((Value)_nextExpression(is, state, null, read));
                break;
            case 'i':
                o=numberCheck(_nextExpression(is, state, null, radix, read)).toInexact();
                break;
            case 'e':
                o=numberCheck(_nextExpression(is, state, null, radix, read)).toExact();
                break;
            case '!':
                if (lexer.readToBreak(is, Lexer.special).equals("eof"))
                    return EOF;
                else throw new IOException(liMessage(SISCB, "invalidsharp"));
            case '\'':
                o=listSpecial(SYNTAX, is, state, def, read);
                break;
	    case '@': 
		//Annotation
		Pair p=new Pair(ANNOTATION, EMPTYLIST);
		if (def!=null)
		    state.put(def, p);
		p.setCdr(nextExpression(is, state, read));
		o=p;
		break;
            default:
                Value[] v=null;
                is.pushback(c);
                if (Character.isDigit((char)c)) {
                    Integer ref=
                        new Integer(Integer
                                    .parseInt(lexer
                                              .readToBreak(is,
                                                           Lexer
                                                           .sharp_special)));

                    c=is.read();
                    if (c=='=') {
                        o=_nextExpression(is, state, ref, read);
                        break;
                    } else if (c=='#') {
                        o=state.get(ref);
                        break;
                    } else {
                        is.pushback(c);
                        v=new Value[ref.intValue()];
                    }
                }
		
                SchemeVector iv;
                if (read)
                    iv=new SchemeVector();
                else
                    iv=new ImmutableVector();

		o=iv;
		if (def!=null) state.put(def, iv);
		def=null;

                Object expr=_nextExpression(is, state, def, read);
		if (expr instanceof AnnotatedExpr)
		    expr=((AnnotatedExpr)expr).expr;
                if (expr==null && v==null) {
		    iv.vals=new Value[0];
                    break;
                } else if (expr instanceof Pair) {
                    if (v==null)
                        v=new Value[length((Pair)expr)];
                } else if (expr!=null)
                    throw new IOException("Invalid sharp construct '"+expr+"'");
                p=(Pair)expr;
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
		iv.vals=v;
                break;
            }
            break;
        default:
            throw new IOException(liMessage(SISCB, "unknowntoken"));
        }
	if (def!=null) 
            state.put(def, o);
	return o;
    }

    public Value readList(InputPort is, HashMap state, Integer def,
                          boolean read)
	throws IOException, EOFException {
	
	int line=0, column=0;
	if (is instanceof SourceInputPort) {
	    line=((SourceInputPort)is).line;
	    column=((SourceInputPort)is).column-1;
	}

        Pair h=null;
        Pair p=null;
        Object l=_nextExpression(is, state, null, read);
        try {
            while (l!=ENDPAIR) {
                if (p==null) {
                    h=p=(read ? new Pair() : new ImmutablePair());
                    if (def!=null) state.put(def, p);
                } else
                    if (l == DOT) {
                        l=_nextExpression(is, state, null, read);
                        if (l==ENDPAIR)
                            throw new IOException(liMessage(SISCB, "expectedexprincdr"));
                        p.cdr=(Value)(l instanceof Integer ? state.get(l) : l);
                        if (_nextExpression(is, state, null, read)
                            !=ENDPAIR)
                            throw new IOException(liMessage(SISCB, "toomanyafterdot"));
                        return h;
                    } else
                        p.cdr=p=(read ? new Pair () : new ImmutablePair());
                p.car=(Value)(l instanceof Integer ? state.get(l) : l);
                l=_nextExpression(is, state, null, read);
            }
        } catch (EOFException e) {
            System.err.println(warn("unexpectedeof"));
            return VOID;
        }

        return (h==null ? (Value)EMPTYLIST : (Value)h);
    }
}
