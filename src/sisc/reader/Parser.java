package sisc.reader;

import java.io.*;
import java.util.*;

import sisc.interpreter.Compiler;
import sisc.data.*;
import sisc.util.Util;
import sisc.io.InputPort;
import sisc.io.SourceInputPort;
import sisc.exprs.AnnotatedExpr;
import sisc.util.Defaults;

/**
 * Receives tokens from the Lexer and parses them into valid
 * s-expressions.
 */
public class Parser extends Util implements Tokens {
    
    /* Strict R5RS Syntax Helper Functions */
    public static boolean isPeculiarIdentifier(String s) {
        return (s.equals("+") || s.equals("-") || s.equals("..."));
    }

    public static final int 
        PRODUCE_IMMUTABLES =0x1,
        PRODUCE_ANNOTATIONS=0x2,
        STRICT_R5RS        =0x4,
	CASE_SENSITIVE     =0x8;

    public boolean annotate = Defaults.EMIT_ANNOTATIONS;

    public Lexer lexer;

    static final Object DOT=
	new Object() {
	    public String toString() { return "."; }
	};

    static final Object ENDPAIR=
	new Object() {
	    public String toString() { return ")"; }
	};
	    
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

    public final Value nextExpression(InputPort is, int flags) throws IOException {
        return nextExpression(is, 10, flags);
    }

    public final Value nextExpression(InputPort is) throws IOException {
        return nextExpression(is, 10, PRODUCE_IMMUTABLES);
    }

    protected final Value nextExpression(InputPort is, HashMap state, 
                                         int flags) 
        throws IOException {
        return (Value)_nextExpression(is, state, null, flags);
    }

    /**
     * Reads an s-expression from the given input port.
     *
     * @param is InputPort from which to read
     * @param radix Specifies the radix of any numbers that are read
     * @param flags Specifies attributes for the returned values (PRODUCE_IMMUTABLES, PRODUCE_ANNOTATIONS, STRICT_R5RS)
     * @return the read expression
     * @exception IOException if an error occurs
     */
    public Value nextExpression(InputPort is, int radix,
                                int flags) throws IOException {
        Object n=VOID;

        try {
            n=_nextExpression(is, new HashMap (), null, radix, flags);
            return (Value)n;
        } catch (ClassCastException ce) {
            if (n==ENDPAIR) {
                System.err.println(warn("orphanedparen"));
                return nextExpression(is, radix, flags);
            } else if (n==DOT)
                throw new IOException(liMessage(SISCB, "unexpecteddot"));
        }
        return (Value)n;
    }

    protected Object _nextExpression(InputPort is, HashMap state, 
                                     Integer def, int flags) throws IOException {
        return _nextExpression(is, state, def, 10, flags);
    }

    protected Quantity numberCheck(Object o) throws IOException {
        try {
            return (Quantity)o;
        } catch (ClassCastException cce) {
            throw new IOException(liMessage(SISCB, "badtokennotnumber"));
        }
    }

    protected Object listSpecial(Symbol car, InputPort is,
                                 HashMap state, Integer def, 
                                 int flags) throws IOException {
        Pair t=new Pair();
        Pair p;
        if (produceImmutables(flags))
            p=new Pair(car, t);
        else
            p=new ImmutablePair(car, t);
        if (def!=null)
            state.put(def, p);
        t.setCar(nextExpression(is, state, flags));
        return p;
    }

    protected Object _nextExpression(InputPort is, HashMap state, Integer def, int radix, int flags)
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
            o=listSpecial(UNQUOTE, is, state, def, flags);
            break;
        case TT_UNQUOTE_SPLICING:
            o=listSpecial(UNQUOTE_SPLICING, is, state, def, flags);
            break;
        case TT_QUOTE:
            o=listSpecial(QUOTESYM, is, state, def, flags);
            break;
        case TT_BACKQUOTE:
            o=listSpecial(BACKQUOTE, is, state, def, flags);
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

            if (annotate && produceAnnotations(flags) && line>=0) {
                AnnotatedExpr aexp =
                    new AnnotatedExpr(null, 
                                      list(new Pair(LINE, Quantity.valueOf(line)),
                                           new Pair(COLUMN, Quantity.valueOf(col)),
                                           new Pair(FILE, new SchemeString(file))));
                if (def != null) {
                    state.put(def, aexp);
                    def = null;
                }
                aexp.expr=readList(is, state, def, flags);
                return aexp;
            } else {
                return readList(is, state, def, flags);
            }
        case TT_ENDPAIR:
            o=ENDPAIR;
            break;
        case TT_PIPE:
            Symbol sym=Symbol.intern(lexer.readToBreak(is, Lexer.protected_literal_barrier, true, true));
            // Discard the closing PIPE
            is.read();
            return sym;
        case TT_SYMBOL:
            if (lexer.strictR5RS &&
                lexer.sval.length() > 1 &&
                Lexer.in(lexer.sval.charAt(0), Lexer.number_prefixes)) 
                throw new IOException(liMessage(SISCB, "invalididentifier",
                                                lexer.sval));
            o=Symbol.get(lexer.sval, caseSensitive(flags));
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
                o=_nextExpression(is, state, def, flags);
                break;
            case '\\':
                c=is.read();
                if (Lexer.in((char)c, Lexer.special)) {
                    o=new SchemeCharacter((char)c);
                    break;
                }
                is.pushback(c);
                String cn=lexer.readToBreak(is, Lexer.special, false, false);
                String cnl=cn.toLowerCase();
                Object cs=CharUtil.namedConstToChar(cnl);
                try {
                    if (cs!=null) {
                        o=cs;
                    } else if (cn.length()==1) {
                        o=new SchemeCharacter(cn.charAt(0));
                    } else if (cn.charAt(0)=='u') {
                        o=new SchemeCharacter(CharUtil.hexToChar(cnl.substring(1)));
                    } else {
                        o=new SchemeCharacter(CharUtil.octToChar(cnl));
                    }
                } catch (NumberFormatException nfe) {
                    throw new IOException(Util.liMessage(Util.SISCB,
                                                         "invalidcharconst"));
                }
                break;
            case 'b':
                o=numberCheck(_nextExpression(is, state, null, 2, flags));
                break;
            case 'o':
                o=numberCheck(_nextExpression(is, state, null, 8, flags));
                break;
            case 'x':
                o=numberCheck(_nextExpression(is, state, null, 16, flags));
                break;
            case 'd':
                o=numberCheck(_nextExpression(is, state, null, flags));
                break;
            case '&':
                o=new Box();
                if (def!=null) state.put(def, o);
                ((Box)o).val=(Value)_nextExpression(is, state, null, flags);
                break;
            case 'i':
                o=numberCheck(_nextExpression(is, state, null, radix, flags)).toInexact();
                break;
            case 'e':
                o=numberCheck(_nextExpression(is, state, null, radix, flags)).toExact();
                break;
            case '!':
                String bv=lexer.readToBreak(is, Lexer.special, false, false);
                if (bv.equals("eof"))
                    return EOF;
                else if (bv.equals("void"))
                    return VOID;
                else throw new IOException(liMessage(SISCB, "invalidsharpc", bv));
			case '%': 
				// Syntactic tokens
				bv=lexer.readToBreak(is, Lexer.special, false, false).toLowerCase();
				Compiler.Syntax s=(Compiler.Syntax)Compiler.SYNTACTIC_TOKENS.get(bv);
				if (s==null)
					throw new IOException(liMessage(SISCB, "invalidsyntoken", bv));
				return s;				
            case '\'':
                o=listSpecial(SYNTAX, is, state, def, flags);
                break;
            case '@': 
                //Annotation
                Pair p=(Pair)nextExpression(is, state, flags);
                o=new AnnotatedExpr(p.cdr, p.car);
                break;
            case '|': 
                //Nested multiline comment
                lexer.skipMultilineComment(is);
                o=nextExpression(is, state, flags);
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
                                                           .sharp_special,
                                                           false, false)));

                    c=is.read();
                    if (c=='=') {
                        o=_nextExpression(is, state, ref, flags);
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
                if (produceImmutables(flags))
                    iv=new ImmutableVector();
                else
                    iv=new SchemeVector();


                o=iv;
                if (def!=null) state.put(def, iv);
                def=null;

                Object expr=_nextExpression(is, state, def, flags);
                if (expr instanceof AnnotatedExpr) {
                    o=new AnnotatedExpr(iv, ((AnnotatedExpr)expr).annotation);
                    expr=((AnnotatedExpr)expr).expr;
                }

                if (expr==null && v==null) {
                    iv.vals=new Value[0];
                    break;
                } else if (expr instanceof Pair) {
                    if (v==null)
                        v=new Value[length((Pair)expr)];
                    else if (v.length < length((Pair)expr)) {
                        warn("veclengthtooshort");
                        v=new Value[length((Pair)expr)];
                    }                        
                } else if (expr!=null)
                    throw new IOException(liMessage(SISCB,"invalidsharp",
                                                    expr.toString()));
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
                          int flags)
        throws IOException {
        
        int line=0, column=0;
        if (is instanceof SourceInputPort) {
            line=((SourceInputPort)is).line;
            column=((SourceInputPort)is).column-1;
        }

        Pair h=null;
        Pair p=null;
        Object l=_nextExpression(is, state, null, flags);
        try {
            while (l!=ENDPAIR) {
                if (p==null) {
                    h=p=(produceImmutables(flags) ? new ImmutablePair() :
                         new Pair());
                    if (def!=null) state.put(def, p);
                } else
                    if (l == DOT) {
                        l=_nextExpression(is, state, null, flags);
                        if (l==ENDPAIR)
                            throw new IOException(liMessage(SISCB, "expectedexprincdr"));
                        p.cdr=(Value)(l instanceof Integer ? state.get(l) : l);
                        if (_nextExpression(is, state, null, flags)
                            !=ENDPAIR)
                            throw new IOException(liMessage(SISCB, "toomanyafterdot"));
                        return h;
                    } else
                        p.cdr=p=(produceImmutables(flags) ? 
                                 new ImmutablePair() :
                                 new Pair ());
                p.car=(Value)(l instanceof Integer ? state.get(l) : l);
                l=_nextExpression(is, state, null, flags);
            }
        } catch (EOFException e) {
            System.err.println(warn("unexpectedeof"));
            return VOID;
        }

        return (h==null ? (Value)EMPTYLIST : (Value)h);
    }

    protected final boolean caseSensitive(int flags) {
        return (flags & CASE_SENSITIVE) != 0;
    }

    protected final boolean produceAnnotations(int flags) {
        return (flags & PRODUCE_ANNOTATIONS) != 0;
    }

    protected final boolean produceImmutables(int flags) {
        return (flags & PRODUCE_IMMUTABLES) != 0;
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
