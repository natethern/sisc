package sisc.modules;

import java.io.*;
import java.net.*;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;

public class IO extends ModuleAdapter {

    public String getModuleName() {
        return "IO";
    }

    protected static final int
        ABSPATHQ            = 0,
        BLOCKREAD           = 1,
        BLOCKWRITE          = 2,
        CHARREADY           = 3,
        CLOSEINPUTPORT      = 4,
        CLOSEOUTPUTPORT     = 5,
        CURRENTINPUTPORT    = 6,
        CURRENTOUTPUTPORT   = 7,
        DISPLAY             = 8,
        FILEEXISTSQ         = 9,
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
        WRITE               = 27,
        WRITECHAR           = 28;

    public IO() {
        define("absolute-path?"     , ABSPATHQ);
        define("block-read"         , BLOCKREAD);
        define("block-write"        , BLOCKWRITE);
        define("char-ready?"        , CHARREADY);
        define("close-input-port"   , CLOSEINPUTPORT);
        define("close-output-port"  , CLOSEOUTPUTPORT);
        define("current-input-port" , CURRENTINPUTPORT);
        define("current-output-port", CURRENTOUTPUTPORT);
        define("display"            , DISPLAY);
        define("file-exists?"       , FILEEXISTSQ);
        define("flush-output-port"  , FLUSHOUTPUTPORT);
        define("get-output-string"  , GETOUTPUTSTRING);
        define("input-port?"        , INPORTQ);
        define("input-port-location", INPORTLOCATION);
        define("load"               , LOAD);
        define("make-path"          , MAKEPATH);
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

    public Value eval(int primid, Interpreter f)
        throws ContinuationException {
        switch (f.vlr.length) {
        case 0:
            switch (primid) {
            case CURRENTOUTPUTPORT: return f.dynenv.out;
            case CURRENTINPUTPORT: return f.dynenv.in;
            case OPENOUTPUTSTRING: return new OutputPort(new StringWriter());
            case PEEKCHAR:
                Value v=f.dynenv.in.readChar();
                if (v instanceof SchemeCharacter)
                    f.dynenv.in.pushback(((SchemeCharacter)v).c);
                return v;
            case READ:
                return f.dynenv.in.read(f);
            case READCHAR:
                return f.dynenv.in.readChar();
            case READCODE:
                return f.dynenv.in.readCode(f);
            default:
                throwArgSizeException();
            }
        case 1:
            switch (primid) {
            case INPORTQ: return truth(f.vlr[0] instanceof InputPort);
            case OUTPORTQ: return truth(f.vlr[0] instanceof OutputPort);
            case CHARREADY:
                InputPort inport=inport(f.vlr[0]);
                try {
                    return truth(inport.ready());
                } catch (IOException e) {
                    return FALSE;
                }
            case DISPLAY: case WRITE:
                try {
                    f.dynenv.out.write((primid == WRITE ? f.vlr[0].write() :
                                        f.vlr[0].display()));
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "errorwriting",
                                                 f.dynenv.out.write()));
                }
                return VOID;
            case OPENINPUTSTRING:
                return new InputPort(string(f.vlr[0]));
            case PEEKCHAR:
                inport=inport(f.vlr[0]);
                Value v=inport.readChar();
                if (v instanceof SchemeCharacter)
                    inport.pushback(((SchemeCharacter)v).c);
                return v;
            case READ:
                inport=inport(f.vlr[0]);
                return inport.read(f);
            case READCHAR:
                inport=inport(f.vlr[0]);
                return inport.readChar();
            case READCODE:
                inport=inport(f.vlr[0]);
                return inport.readCode(f);
            case GETOUTPUTSTRING:
                OutputPort port=outport(f.vlr[0]);
                if (!(port.w instanceof StringWriter))
                    throwPrimException( liMessage(SISCB, "outputnotastringport"));
                try {
                    port.flush();
                } catch (IOException e) {}

                StringWriter sw=(StringWriter)port.w;
                SchemeString s=new SchemeString(sw.getBuffer().toString());
                sw.getBuffer().setLength(0);
                return s;
            case OPENSOURCEINPUTFILE:
                URL url = url(f.vlr[0]);
                try {
                    URLConnection conn = url.openConnection();
                    conn.setDoInput(true);
                    conn.setDoOutput(false);
                    return new SourceInputPort(new BufferedReader(new InputStreamReader(conn.getInputStream())), url.toString());
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "erroropening", url.toString()));
                }
            case OPENINPUTFILE:
                url = url(f.vlr[0]);
                try {
                    URLConnection conn = url.openConnection();
                    conn.setDoInput(true);
                    conn.setDoOutput(false);
                    return new InputPort(new BufferedReader(new InputStreamReader(conn.getInputStream())));
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "erroropening", url.toString()));
                }
            case OPENOUTPUTFILE:
                url = url(f.vlr[0]);
                try {
                    if (url.getProtocol().equals("file")) {
                        //the JDK does not permit write access to file URLs
                        return new OutputPort(new BufferedWriter(new FileWriter(url.getPath())));
                    }
                    URLConnection conn = url.openConnection();
                    conn.setDoInput(false);
                    conn.setDoOutput(true);
                    return new OutputPort(new BufferedWriter(new OutputStreamWriter(conn.getOutputStream())));
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "erroropening", url.toString()));
                }
            case FLUSHOUTPUTPORT:
                OutputPort op=outport(f.vlr[0]);
                try {
                    op.flush();
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "errorflushing", op.toString()));
                }
                return VOID;
            case CLOSEINPUTPORT:
                InputPort inp=inport(f.vlr[0]);
                if (inp!=f.dynenv.in) inp.close();
                return VOID;
            case CLOSEOUTPUTPORT:
                op=outport(f.vlr[0]);
                if (op!=f.dynenv.out) op.close();
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
                InputPort p=null;
                url = url(f.vlr[0]);
                try {
                    URLConnection conn = url.openConnection();
                    conn.setDoInput(true);
                    conn.setDoOutput(false);
                    p=new SourceInputPort(new BufferedReader(new InputStreamReader(conn.getInputStream())), url.toString());
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "erroropening", url.toString()));
                }
                Interpreter r = Context.enter();
                try {
                    v=null;
                    do {
                        v=p.readCode(r);

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
                    f.dynenv.out.writeChar(character(f.vlr[0]));
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "errorwriting",
                                                 f.dynenv.out.synopsis()));
                }
                return VOID;
            case CURRENTOUTPUTPORT:
                f.dynenv.out= outport(f.vlr[0]);
                return VOID;
            case CURRENTINPUTPORT:
                f.dynenv.in = inport(f.vlr[0]);
                return VOID;
            case FILEEXISTSQ:
                try {
                    url(f.vlr[0]).openConnection().getInputStream().close();
                    return TRUE;
                } catch (IOException e) {
                    return FALSE;
                }
            case ABSPATHQ:
                String f1=string(f.vlr[0]);
                File fn=new File(f1);
                return truth(fn.isAbsolute());
            case NORMALIZEURL:
                return new SchemeString(url(f.vlr[0]).toString());
            default:
                throwArgSizeException();
            }
        case 2:
            switch (primid) {
            case WRITECHAR:
                OutputPort port=outport(f.vlr[1]);
                try {
                    port.writeChar(character(f.vlr[0]));
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "errorwriting",
                                                 port.synopsis()));
                }
                return VOID;
            case DISPLAY: case WRITE:
                port=outport(f.vlr[1]);
                try {
                    port.write((primid == WRITE ? f.vlr[0].write() :
                                f.vlr[0].display()));
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "errorwriting",
                                                 port.synopsis()));   
                }
                return VOID;
            case MAKEPATH:
                String f1=string(f.vlr[0]);
                String f2=string(f.vlr[1]);
                File fn=new File(f1);
                fn=new File(f1, f2);
                try {
                    return new SchemeString(fn.getCanonicalPath());
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "invalidpathspec"));
                }
            case OPENOUTPUTFILE:
                URL url = url(f.vlr[0]);
                try {
                    if (url.getProtocol().equals("file")) {
                        //the JDK does not permit write access to file URLs
                        return new OutputPort(new BufferedWriter(new FileWriter(url.getPath())),
                                              truth(f.vlr[1]));
                    }
                    URLConnection conn = url.openConnection();
                    conn.setDoInput(false);
                    conn.setDoOutput(true);
                    return new OutputPort(new BufferedWriter(new OutputStreamWriter(conn.getOutputStream())),
                                          truth(f.vlr[1]));
                } catch (IOException e) {
                    throwPrimException(liMessage(SISCB, "erroropening", url.toString()));
                }
            case NORMALIZEURL:
                return new SchemeString(url(f.vlr[0], f.vlr[1]).toString());
            default:
                throwArgSizeException();
            }
        case 3:
            switch(primid) {
            case BLOCKREAD:
                int count=num(f.vlr[2]).intValue();
                InputPort inport=inport(f.vlr[1]);
                SchemeString st=str(f.vlr[0]);
                char[] buff=st.asCharArray();
                st.set(buff); //forces string to be represented by char[] only
                return inport.read(buff, count);
            case BLOCKWRITE:
                count=num(f.vlr[2]).intValue();
                OutputPort outport=outport(f.vlr[1]);
                buff=str(f.vlr[0]).asCharArray();
                outport.write(buff, count);
                return VOID;
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
