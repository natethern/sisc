package sisc.modules.io;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;
import java.io.IOException;
import java.io.EOFException;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.net.URL;
import sisc.io.SerialOutputPort;
import sisc.io.SerialInputPort;
import sisc.io.SerializerPort;
import sisc.io.DeserializerPort;

public class SerialIO extends IndexedProcedure {

    protected static Symbol BINARYB =
        Symbol.intern("sisc.modules.io.Messages");

    protected static final int
        DESERIALIZE=1, SERIALIZE=2,
        OPENSERIALINPUTFILE = 3, OPENSERIALOUTPUTFILE= 4,
        SERIALINPUTPORTQ = 5, SERIALOUTPUTPORTQ = 6;


    public static class Index extends IndexedLibraryAdapter {
        
        public Value construct(int id) {
            return new SerialIO(id);
        }
        
      	public Index() {
           	define("serialize",               SERIALIZE);
            define("deserialize",             DESERIALIZE);
            define("open-serial-input-file",  OPENSERIALINPUTFILE);
            define("open-serial-output-file", OPENSERIALOUTPUTFILE);
            define("serial-input-port?",      SERIALINPUTPORTQ);
            define("serial-output-port?",     SERIALOUTPUTPORTQ);
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

    private static DeserializerPort openSerInFile(Interpreter f, URL url)
        throws ContinuationException {
        try {
            return new DeserializerPort(f.getCtx(),
                                        new BufferedInputStream(IO.getURLInputStream(url))); 
        } catch (IOException e) {
            IO.throwIOException(f, liMessage(IO.IOB, "erroropening", 
                                             url.toString()), e);
        }
        return null;
    }

    private static SerializerPort openSerOutFile(Interpreter f,  URL url,
                                                 boolean aflush) 
        throws ContinuationException {
        try {          
            return new SerializerPort(new BufferedOutputStream(IO.getURLOutputStream(url)),
                                      aflush);
        } catch (IOException e) {
            IO.throwIOException(f, liMessage(IO.IOB, "erroropening",
                                             url.toString()), e);
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
        case 0:
            switch (id) {
            case DESERIALIZE:
                return readSer(f, sinport(f.dynenv.in));
            default:
                throwArgSizeException();
            }
        case 1:
            switch (id) {
            case OPENSERIALINPUTFILE:
                return openSerInFile(f, url(f.vlr[0]));
            case OPENSERIALOUTPUTFILE:
                return openSerOutFile(f, url(f.vlr[0]), false);
            case SERIALINPUTPORTQ:
                return truth(f.vlr[0] instanceof SerialInputPort);
            case SERIALOUTPUTPORTQ:
                return truth(f.vlr[0] instanceof SerialOutputPort);
            case DESERIALIZE:
                return readSer(f, sinport(f.vlr[0]));
            case SERIALIZE:
                return writeSer(f, soutport(f.dynenv.out), f.vlr[0]);
            default:
                throwArgSizeException();
            }
        case 2:
            switch (id) {
            case OPENSERIALOUTPUTFILE:
                return openSerOutFile(f, url(f.vlr[0]), truth(f.vlr[1]));
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

