package sisc.modules.io;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;
import java.io.IOException;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.net.URL;
import sisc.io.StreamOutputPort;
import sisc.io.StreamInputPort;

public class BlockIO extends IndexedProcedure {

    protected static Symbol BLOCKB =
        Symbol.intern("sisc.modules.io.Messages");

    protected static final int
        BLOCKREAD=1, BLOCKWRITE=2, MAKEBUFFER=3, BUFFERQ=4,
        BUFFERLENGTH=5, BUFFERREF=6, BUFFERSET=7, BUFFERCOPY=8,
        OPENBINARYINPUTFILE = 9, OPENBINARYOUTPUTFILE= 10;


    public static class Index extends IndexedLibraryAdapter {
        
        public Value construct(int id) {
            return new BlockIO(id);
        }
        
      	public Index() {
           	define("block-read",    BLOCKREAD);
            define("block-write",   BLOCKWRITE);
            define("make-buffer",   MAKEBUFFER);
            define("buffer?",       BUFFERQ);
            define("buffer-length", BUFFERLENGTH);
            define("buffer-ref",    BUFFERREF);
            define("buffer-set!",   BUFFERSET);
            define("buffer-copy!",  BUFFERCOPY);
            define("open-binary-output-file", OPENBINARYOUTPUTFILE);
            define("open-binary-input-file",  OPENBINARYINPUTFILE);        
        }   
    }
    
    public static final StreamOutputPort soutport(Value o) {
        try {
            return (StreamOutputPort)o;
        } catch (ClassCastException e) { typeError(BLOCKB, "soutput-port", o); }
        return null;
    }

    public static final StreamInputPort sinport(Value o) {
        try {
            return (StreamInputPort)o;
        } catch (ClassCastException e) { typeError(BLOCKB, "sinput-port", o); }
        return null;
    }

    private static SchemeOutputPort openBinOutFile(Interpreter f, 
                                                   URL url, boolean aflush) 
        throws ContinuationException {
        try {          
            return new StreamOutputPort(new BufferedOutputStream(IO.getURLOutputStream(url)),
                                        aflush);
        } catch (IOException e) {
            IO.throwIOException(f, liMessage(IO.IOB, "erroropening",
                                             url.toString()), e);
        }
        return null;
    }

    public BlockIO(int id) {
        super(id);
    }
    
    public BlockIO() {}

    final Buffer buffer(Value v) throws ContinuationException {
        try {
            return (Buffer)v;
        } catch (ClassCastException e) { typeError(BLOCKB, "buffer", v); }
        return null;
    }

    public Value doApply(Interpreter f) throws ContinuationException {
        switch (f.vlr.length) {
        case 1:
            switch (id) {
            case MAKEBUFFER:
                return new Buffer(num(f.vlr[0]).indexValue());
            case BUFFERLENGTH:
                return Quantity.valueOf(buffer(f.vlr[0]).buf.length);
            case BUFFERQ:
                return truth(f.vlr[0] instanceof Buffer);
            case OPENBINARYINPUTFILE:
                URL url = url(f.vlr[0]);
                try {
                  return new StreamInputPort(
                          new BufferedInputStream(IO.getURLInputStream(url))); 
                } catch (IOException e) {
                  IO.throwIOException(f, liMessage(IO.IOB, "erroropening", 
                                                   url.toString()), e);
                }
            case OPENBINARYOUTPUTFILE:
                url = url(f.vlr[0]);
                return openBinOutFile(f, url, false);
            default:
                throwArgSizeException();
            }
        case 2:
            switch (id) {
            case MAKEBUFFER:
                return new Buffer(num(f.vlr[0]).indexValue(),
                                  (byte)num(f.vlr[1]).indexValue());
            case BUFFERREF:
                int index=num(f.vlr[1]).indexValue();
                try {
                    return Quantity.valueOf(buffer(f.vlr[0]).ref(index)&0xff);
                } catch (ArrayIndexOutOfBoundsException aib) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     f.vlr[0].synopsis()}));
                }
            case OPENBINARYOUTPUTFILE:
                URL url = url(f.vlr[0]);
                return openBinOutFile(f, url, truth(f.vlr[1]));
            default:
                throwArgSizeException();
            }
        case 3:
            switch (id) {
            case BUFFERSET:
                int index=num(f.vlr[1]).indexValue();
                try {
                    buffer(f.vlr[0]).set(index,
                                         (byte)num(f.vlr[2]).indexValue());
                } catch (ArrayIndexOutOfBoundsException aib) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     f.vlr[0].synopsis()}));
                }
                return VOID;
            case BLOCKREAD:
                int count=num(f.vlr[2]).indexValue();
                StreamInputPort inport=sinport(f.vlr[1]);
                byte[] buf=buffer(f.vlr[0]).buf;
                try {
                    int rv=inport.read(buf, 0, Math.min(buf.length, count));
                    if (rv==-1) return EOF;
                    else return Quantity.valueOf(rv);
                } catch (IOException e) {
                    error(f, liMessage(BLOCKB, "errorreading", 
                                       inport.toString(),
                                       e.getMessage()));
                }
                break;
            case BLOCKWRITE:
                count=num(f.vlr[2]).indexValue();
                StreamOutputPort outport=soutport(f.vlr[1]);
                buf=buffer(f.vlr[0]).buf;
                try {
                    outport.write(buf, 0, count);
                } catch (IOException e) {
                    error(f, liMessage(BLOCKB, "errorwriting",
                                       outport.toString(),
                                       e.getMessage()));
                }
                return VOID;
            default:
                throwArgSizeException();
            }
        case 4:
            switch (id) {            
            case BUFFERCOPY:
                byte[] sbuf=buffer(f.vlr[0]).buf;
                byte[] dbuf=buffer(f.vlr[2]).buf;

                int soff=num(f.vlr[1]).indexValue();
                int doff=num(f.vlr[3]).indexValue();
                int count=sbuf.length;

                try {
                    System.arraycopy(sbuf, soff, dbuf, doff, count);
                } catch (ArrayIndexOutOfBoundsException aib) {
                    throwPrimException(liMessage(BLOCKB, "bufferoverrun", 
                                                 f.vlr[0].synopsis(), 
                                                 f.vlr[2].synopsis()));
                }
                return VOID;
            default:
                throwArgSizeException();
            }
        case 5:
            switch (id) {            
            case BUFFERCOPY:
                byte[] sbuf=buffer(f.vlr[0]).buf;
                byte[] dbuf=buffer(f.vlr[2]).buf;

                int soff=num(f.vlr[1]).indexValue();
                int doff=num(f.vlr[3]).indexValue();
                int count=num(f.vlr[4]).indexValue();

                try {
                    System.arraycopy(sbuf, soff, dbuf, doff, count);
                } catch (ArrayIndexOutOfBoundsException aib) {
                    throwPrimException(liMessage(BLOCKB, "bufferoverrun", 
                                                 f.vlr[0].synopsis(), 
                                                 f.vlr[2].synopsis()));
                }
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

