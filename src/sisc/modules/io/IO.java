package sisc.modules.io;

import java.io.*;
import java.net.*;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;
import sisc.io.*;

public class IO extends IndexedProcedure {

    static Symbol IOB =
        Symbol.intern("sisc.modules.io.Messages");

    protected static final int
        //NEXT = 27,

        ABSPATHQ            = 0,
        CHARREADY           = 3,
        CLOSEINPUTPORT      = 4,
        CLOSEOUTPUTPORT     = 5,
        DISPLAY             = 8,
        FILEEXISTSQ         = 9,
        FINDRESOURCE        = 6,
        FINDRESOURCES       = 2,
        FLUSHOUTPUTPORT     = 10,
        GETOUTPUTSTRING     = 11,
        INPORTQ             = 12,
        INPORTLOCATION      = 13,
        LOAD                = 14,
        MAKEPATH            = 15,
        NORMALIZEURL        = 16,
        OPENINPUTFILE       = 17,
        OPENINPUTSTRING     = 18,
        OPENOUTPUTFILE      = 19,
        OPENSOURCEINPUTFILE = 20,
        OPENOUTPUTSTRING    = 21,
        OUTPORTQ            = 22,
        PEEKCHAR            = 23,
        READ                = 24,
        READCHAR            = 25,
        READCODE            = 26,
        WRITE               = 1,
        WRITECHAR           = 7;

    public static class Index extends IndexedLibraryAdapter { 

		public Value construct(int id) {
			return new IO(id);
		}
		    	
    	public Index() {
        define("absolute-path?"     , ABSPATHQ);
        define("char-ready?"        , CHARREADY);
        define("close-input-port"   , CLOSEINPUTPORT);
        define("close-output-port"  , CLOSEOUTPUTPORT);
        define("display"            , DISPLAY);
        define("file-exists?"       , FILEEXISTSQ);
        define("find-resource"      , FINDRESOURCE);
        define("find-resources"     , FINDRESOURCES);
        define("flush-output-port"  , FLUSHOUTPUTPORT);
        define("get-output-string"  , GETOUTPUTSTRING);
        define("input-port?"        , INPORTQ);
        define("input-port-location", INPORTLOCATION);
        define("load"               , LOAD);
        define("normalize-url"      , NORMALIZEURL);
        define("open-input-file"    , OPENINPUTFILE);
        define("open-input-string"  , OPENINPUTSTRING);
        define("open-output-file"   , OPENOUTPUTFILE);
        define("open-output-string" , OPENOUTPUTSTRING);
        define("open-source-input-file", OPENSOURCEINPUTFILE);
        define("output-port?"       , OUTPORTQ);
        define("peek-char"          , PEEKCHAR);
        define("read"               , READ);
        define("read-char"          , READCHAR);
        define("read-code"          , READCODE);
        define("write"              , WRITE);
        define("write-char"         , WRITECHAR);
        }
    }
    
    public IO(int id) {
    	super(id);
    }
    
    public IO() {}
    
    static void throwIOException(Interpreter f, String message, IOException e) 
        throws ContinuationException {
        if (f.acc == null) {
            error(f, message, list(new Pair(JEXCEPTION, 
                                            Symbol.intern(e.getClass()
                                                          .getName()))));
        } else {
            error(f, f.acc.getName(), message, 
                  list(new Pair(JEXCEPTION, Symbol.intern(e.getClass()
                                                          .getName()))));
        }
    }

    private static Value readChar(Interpreter f, SchemeInputPort i) 
        throws ContinuationException {
        try {
            int c=i.read();
            return new SchemeCharacter((char)c);
        } catch (EOFException e) {
            return EOF;
        } catch (IOException e2) {
            throwIOException(f, liMessage(IOB, "errorreading", i.toString(),
                                       e2.getMessage()), e2);
        }
        return null; //Should never happen
    }

    private static Value read(Interpreter r, SchemeInputPort i, int flags) 
        throws ContinuationException {
        try {
            return r.dynenv.parser.nextExpression(i, flags);
        } catch (EOFException e) {
            return EOF;
        } catch (IOException e2) {
            throwIOException(r, liMessage(IOB, "errorreading", i.toString(),
                                       e2.getMessage()), e2);
        }
        return null; //Should never happen

    }
    
    private static int readChars(Interpreter f,
                                 SchemeInputPort is, char[] buff, int off,
                                 int len) 
        throws ContinuationException {
        byte[] buff2=new byte[len];
        try {
            int rc=is.read(buff2, 0, len);
            for (int i=0; i<rc; i++) {
                buff[i+off]=(char)buff2[i];
            }
            return rc;
        } catch (IOException e) {
            throwIOException(f, liMessage(IOB, "errorreading", is.toString(),
                                       e.getMessage()), e);
        }
        return -1; //should never happen
    }

    public static Value read(Interpreter r, SchemeInputPort i) 
        throws ContinuationException {
        return read(r, i, 0);
    }

    public static Value readCode(Interpreter r, SchemeInputPort i) 
        throws ContinuationException {
        return read(r, i, sisc.reader.Parser.PRODUCE_ANNOTATIONS |
                    sisc.reader.Parser.PRODUCE_IMMUTABLES);
    }

    public Value displayOrWrite(Interpreter r,
                                OutputPort port,
                                Value v,
                                boolean display) 
        throws ContinuationException {
        try {
            ValueWriter w = r.dynenv.printShared ?
                new SharedValueWriter(port, r.dynenv.vectorLengthPrefixing):
                new PortValueWriter(port, r.dynenv.vectorLengthPrefixing);
            if (display) w.display(v);
            else w.write(v);
        } catch (IOException e) {
            throwIOException(r, liMessage(IOB, "errorwriting", 
                                       port.toString(),
                                       e.getMessage()), e);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return VOID;
    }

    URL urlClean(URL u) {
        if (u.getProtocol().equals("file") &&
            (u.getRef()!=null || u.getQuery()!=null)) {
            StringBuffer b=new StringBuffer(u.getProtocol());
            b.append(':');
            b.append(u.getPath());
            if (u.getRef()!=null) {
                b.append("%23");
                b.append(URLEncoder.encode(u.getRef()));
            }
            if (u.getQuery()!=null) {
                b.append("%3F");
                b.append(URLEncoder.encode(u.getQuery()));
            }
            try {
                u=new URL(b.toString());
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        } 
        return u;
    }

	public SchemeOutputPort openOutPort(OutputStream out, String encoding, boolean autoflush) throws IOException {
		return new WriterOutputPort(new BufferedWriter(new OutputStreamWriter(out, encoding)), autoflush);
	}
	
	public SchemeInputPort openInPort(InputStream in, String encoding) throws IOException {
			return new ReaderInputPort(new BufferedReader(new InputStreamReader(in, encoding)));
	}
		
    public Value doApply(Interpreter f)
        throws ContinuationException {
        switch (f.vlr.length) {
        case 0:
            switch (id) {
            case OPENOUTPUTSTRING: return new WriterOutputPort(new StringWriter(), false);
            case PEEKCHAR:
                Value v=readChar(f, f.dynenv.in);
                if (v instanceof SchemeCharacter)
                    f.dynenv.in.pushback(((SchemeCharacter)v).c);
                return v;
            case READ:
                return read(f, f.dynenv.in);
            case READCHAR:
                return readChar(f, f.dynenv.in);
            case READCODE:
                return readCode(f, f.dynenv.in);
            default:
                throwArgSizeException();
            }
        case 1:
            switch (id) {
            case INPORTQ: return truth(f.vlr[0] instanceof SchemeInputPort);
            case OUTPORTQ: return truth(f.vlr[0] instanceof SchemeOutputPort);
            case CHARREADY:
                SchemeInputPort inport=inport(f.vlr[0]);
                try {
                    return truth(inport.ready());
                } catch (IOException e) {
                    return FALSE;
                }
            case DISPLAY:
                return displayOrWrite(f, f.dynenv.out, f.vlr[0], true);
            case WRITE:
                return displayOrWrite(f, f.dynenv.out, f.vlr[0], false);
            case OPENINPUTSTRING:
                return new ReaderInputPort(new StringReader(string(f.vlr[0])));
            case PEEKCHAR:
                inport=inport(f.vlr[0]);
                Value v=readChar(f, inport);
                if (v instanceof SchemeCharacter)
                    inport.pushback(((SchemeCharacter)v).c);
                return v;
            case READ:
                inport=inport(f.vlr[0]);
                return read(f, inport);
            case READCHAR:
                inport=inport(f.vlr[0]);
                return readChar(f, inport);
            case READCODE:
                inport=inport(f.vlr[0]);
                return readCode(f, inport);
            case GETOUTPUTSTRING:
                SchemeOutputPort port=outport(f.vlr[0]);
                if (!(port instanceof WriterOutputPort) ||
                    !(((WriterOutputPort)port).getWriter() 
                      instanceof StringWriter))
                    throwPrimException( liMessage(IOB, "outputnotastringport"));
                try {
                    port.flush();
                } catch (IOException e) {}

                StringWriter sw=(StringWriter)((WriterOutputPort)port).getWriter();
                SchemeString s=new SchemeString(sw.getBuffer().toString());
                sw.getBuffer().setLength(0);
                return s;
            case OPENSOURCEINPUTFILE:
                URL url = url(f.vlr[0]);
                try {
                    URLConnection conn = url.openConnection();
                    conn.setDoInput(true);
                    conn.setDoOutput(false);
                    return new SourceInputPort(new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF8")), url.toString());
                } catch (IOException e) {
                    throwIOException(f, liMessage(IOB, "erroropening", 
                                               url.toString()), e);
                }
            case OPENINPUTFILE:
                url = url(f.vlr[0]);
                try {
                    URLConnection conn = url.openConnection();
                    conn.setDoInput(true);
                    conn.setDoOutput(false);
                    return openInPort(conn.getInputStream(), "UTF8");
                } catch (IOException e) {
                    throwIOException(f, liMessage(IOB, "erroropening", 
                                               url.toString()), e);
                }
            case OPENOUTPUTFILE:
                url = url(f.vlr[0]);
                try {
                    if (url.getProtocol().equals("file")) {
                        //the JDK does not permit write access to file URLs
                        return openOutPort(new FileOutputStream(url.getPath()), "UTF8", false);
                    }
                    URLConnection conn = url.openConnection();
                    conn.setDoInput(false);
                    conn.setDoOutput(true);
                    return openOutPort(conn.getOutputStream(), "UTF8", false);
                } catch (IOException e) {
                    throwIOException(f, liMessage(IOB, "erroropening", 
                                               url.toString()), e);
                }
            case FLUSHOUTPUTPORT:
                SchemeOutputPort op=outport(f.vlr[0]);
                try {
                    op.flush();
                } catch (IOException e) {
                    throwIOException(f, liMessage(IOB, "errorflushing", 
                                               op.toString()), e);
                }
                return VOID;
            case CLOSEINPUTPORT:
                SchemeInputPort inp=inport(f.vlr[0]);
                try {
                    if (inp!=f.dynenv.in) inp.close();
                } catch (IOException e) {
                    throwIOException(f, liMessage(IOB, "errorclosing",
                                                  inp.toString()),
                                     e);
                }
                return VOID;
            case CLOSEOUTPUTPORT:
                op=outport(f.vlr[0]);
                try {
                    if (op!=f.dynenv.out) op.close();
                } catch (IOException e) {
                    throwIOException(f, liMessage(IOB, "errorclosing",
                                                  op.toString()),
                                     e);
                }
                return VOID;
            case INPORTLOCATION:
                inp = inport(f.vlr[0]);
                if (inp instanceof SourceInputPort) {
                    SourceInputPort sinp = (SourceInputPort)inp;
                    return list(new Pair(sym("source-file"),
                                         new SchemeString(sinp.sourceFile)),
                                new Pair(sym("line-number"),
                                         Quantity.valueOf(sinp.line)),
                                new Pair(sym("column-number"),
                                         Quantity.valueOf(sinp.column)));
                } else
                    return FALSE;
            case LOAD:
                SchemeInputPort p=null;
                url = url(f.vlr[0]);
                try {
                    URLConnection conn = url.openConnection();
                    conn.setDoInput(true);
                    conn.setDoOutput(false);
                    p=new SourceInputPort(new BufferedInputStream(conn.getInputStream()), url.toString());
                } catch (IOException e) {
                    throwIOException(f, liMessage(IOB, "erroropening",
                                                  url.toString()),
                                     e);
                }
                Interpreter r = Context.enter(f);
                try {
                    v=null;
                    do {
                        v=readCode(r, p);

                        if (v!=EOF) {
                            try {
                                r.eval(v);
                            } catch (SchemeException se) {
                                throwNestedPrimException(se);
                            }
                        }
                    } while (v!=EOF);
                } finally {
                    Context.exit();
                }
                return VOID;
            case WRITECHAR:
                try {
                    f.dynenv.out.write(character(f.vlr[0]));
                } catch (IOException e) {
                    throwIOException(f, liMessage(IOB, "errorwriting",
                                                  f.dynenv.out.toString(),
                                                  e.getMessage()), e);
                }
                return VOID;
            case FILEEXISTSQ:
                try {
                    url(f.vlr[0]).openConnection().getInputStream().close();
                    return TRUE;
                } catch (IOException e) {
                    return FALSE;
                }
            case FINDRESOURCE:
                url = f.dynenv.getClassLoader().getResource(string(f.vlr[0]));
                if (url == null) 
                    return FALSE;
                else return new SchemeString(url.toString());
            case FINDRESOURCES:
                java.util.Enumeration e;
                try {
                    e = f.dynenv.getClassLoader().getResources(string(f.vlr[0]));
                } catch (IOException ex) {
                    return EMPTYLIST;
                }
                if (!e.hasMoreElements()) return EMPTYLIST;
                Pair pa = new Pair();
                while(true) {
                    pa.setCar(new SchemeString((String)e.nextElement()));
                    if (!e.hasMoreElements()) break;
                    pa.setCdr(new Pair());
                    pa = (Pair)pa.cdr;
                }
                return pa;
            case ABSPATHQ:
                String f1=string(f.vlr[0]);
                if (f1.startsWith("file:"))
                    f1=f1.substring(5);
                File fn=new File(f1);
                return truth(fn.isAbsolute());
            case NORMALIZEURL:
                URL u=urlClean(url(f.vlr[0]));
                return new SchemeString(u.toString());
            default:
                throwArgSizeException();
            }
        case 2:
            switch (id) {
            case WRITECHAR:
                SchemeOutputPort port=outport(f.vlr[1]);
                try {
                    port.write(character(f.vlr[0]));
                } catch (IOException e) {
                    throwIOException(f, liMessage(IOB, "errorwriting",
                                                  port.toString(),
                                                  e.getMessage()), e);
                }
                return VOID;
            case DISPLAY:
                return displayOrWrite(f, outport(f.vlr[1]), f.vlr[0], true);
            case WRITE:
                return displayOrWrite(f, outport(f.vlr[1]), f.vlr[0], false);
            case OPENOUTPUTFILE:
                URL url = url(f.vlr[0]);
                try {
                    if (url.getProtocol().equals("file")) {
                        //the JDK does not permit write access to file URLs
                        return openOutPort(new FileOutputStream(url.getPath()),
						                   "UTF8", truth(f.vlr[1]));
                    }
                    URLConnection conn = url.openConnection();
                    conn.setDoInput(false);
                    conn.setDoOutput(true);
                    return openOutPort(conn.getOutputStream(),
                                      "UTF8", truth(f.vlr[1]));
                } catch (IOException e) {
                    throwIOException(f, liMessage(IOB, "erroropening",
                                                  url.toString()), e);
                }
            case NORMALIZEURL:
                return new SchemeString(urlClean(url(f.vlr[0], f.vlr[1])).toString());
            default:
                throwArgSizeException();
            }
        default:
            throwArgSizeException();
        }
        return VOID;
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
