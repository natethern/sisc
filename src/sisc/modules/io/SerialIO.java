package sisc.modules.io;

import sisc.interpreter.*;
import sisc.nativefun.*;
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
            return new SerializerPort(sop.getOutputStream(), aflush);
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
                                             e.getMessage()), e);
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

