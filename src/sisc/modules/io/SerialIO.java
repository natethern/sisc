package sisc.modules.io;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.util.Util;
import sisc.data.*;
import java.io.IOException;
import java.io.EOFException;
import sisc.io.*;

public class SerialIO extends IndexedProcedure {

    protected static Symbol BINARYB =
        Symbol.intern("sisc.modules.io.Messages");

    protected static final int
        DESERIALIZE=1, SERIALIZE=2,
        OPENSERIALINPUTFILE = 3, OPENSERIALOUTPUTFILE= 4;

    public static class Index extends IndexedLibraryAdapter {
        
        public Value construct(int id) {
            return new SerialIO(id);
        }
        
       public Index() {
            define("serialize",               SERIALIZE);
            define("deserialize",             DESERIALIZE);
            define("open-serial-input-port",  OPENSERIALINPUTFILE);
            define("open-serial-output-port", OPENSERIALOUTPUTFILE);
        }   
    }
    
    public static final SerialOutputPort soutport(Value o) {
        try {
            return (SerialOutputPort)o;
        } catch (ClassCastException e) { typeError(BINARYB, "soutput-port", o); }
        return null;
    }

    public static final SerialInputPort sinport(Value o) {
        try {
            return (SerialInputPort)o;
        } catch (ClassCastException e) { typeError(BINARYB, "sinput-port", o); }
        return null;
    }

    private static DeserializerPort openSerInPort(Interpreter f, 
                                                  StreamInputPort sip)
        throws ContinuationException {
        try {
            return new DeserializerPort(f.getCtx(), sip.getInputStream());
        } catch (IOException e) {
            IO.throwIOException(f, liMessage(BINARYB, "erroropening"), e);
        }
        return null;
    }

    private static SerializerPort openSerOutPort(Interpreter f, 
                                                 StreamOutputPort sop,
                                                 boolean aflush) 
        throws ContinuationException {
        try {
            SerializerPort sp=new SerializerPort(f.getCtx(), sop.getOutputStream(), aflush);
            sp.flush();
            return sp;
        } catch (IOException e) {
            IO.throwIOException(f, liMessage(BINARYB, "erroropening"), e);
        }
        return null;
    }

    public static Value readSer(Interpreter r, SerialInputPort p)
        throws ContinuationException {
        try {
            return p.readSer();
        } catch (EOFException e) {
            return EOF;
        } catch (IOException e) {
            IO.throwIOException(r, liMessage(IO.IOB, "errorreading",
                                             p.toString(),
                                             e.getMessage()), e);
        }
        return null; //Should never happen
    }

    public static Value writeSer(Interpreter r, SerialOutputPort p,
                                 Value v)
        throws ContinuationException {
        try {
            p.writeSer(v);
        } catch (EOFException e) {
            return EOF;
        } catch (IOException e) {
            IO.throwIOException(r, liMessage(IO.IOB, "errorwriting",
                                             p.toString(),
                                             Util.javaExceptionToString(e)), e);
        }
        return VOID;
    }

    public SerialIO(int id) {
        super(id);
    }
    
    public SerialIO() {}

    public Value doApply(Interpreter f) throws ContinuationException {
        switch (f.vlr.length) {
        case 1:
            switch (id) {
            case OPENSERIALINPUTFILE:
                return openSerInPort(f, (StreamInputPort)inport(f.vlr[0]));
            case OPENSERIALOUTPUTFILE:
                return openSerOutPort(f, (StreamOutputPort)outport(f.vlr[0]), 
                                      false);
            case DESERIALIZE:
                return readSer(f, sinport(f.vlr[0]));
            default:
                throwArgSizeException();
            }
        case 2:
            switch (id) {
            case OPENSERIALOUTPUTFILE:
                return openSerOutPort(f, (StreamOutputPort)outport(f.vlr[0]), 
                                      truth(f.vlr[1]));
            case SERIALIZE:
                return writeSer(f, soutport(f.vlr[1]), f.vlr[0]);
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
