package sisc.modules;

import java.io.*;
import java.net.*;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;
import sisc.io.*;

public class BlockIO extends ModuleAdapter {

    protected static final int
        BLOCKREAD=1, BLOCKWRITE=2, MAKEBUFFER=3, BUFFERQ=4,
        BUFFERLENGTH=5, BUFFERREF=6, BUFFERSET=7;
    protected Symbol BLOCKB=Symbol.get("BlockIO");

    public BlockIO() {
        define("block-read",    BLOCKREAD);
        define("block-write",   BLOCKWRITE);
        define("make-buffer",   MAKEBUFFER);
        define("buffer?",       BUFFERQ);
        define("buffer-length", BUFFERLENGTH);
        define("buffer-ref",    BUFFERREF);
        define("buffer-set!",   BUFFERSET);
    }

    final Buffer buffer(Value v) throws ContinuationException {
        try {
            return (Buffer)v;
        } catch (ClassCastException e) { typeError(BLOCKB, "buffer", v); }
	return null;
    }

    public Value eval(int primid, Interpreter f)
        throws ContinuationException {
        switch (f.vlr.length) {
        case 1:
            switch (primid) {
            case MAKEBUFFER:
                return new Buffer(num(f.vlr[0]).intValue());
            case BUFFERLENGTH:
                return Quantity.valueOf(buffer(f.vlr[0]).buf.length);
            case BUFFERQ:
                return truth(f.vlr[0] instanceof Buffer);
            default:
                throwArgSizeException();
            }
        case 2:
            switch (primid) {
            case MAKEBUFFER:
                return new Buffer(num(f.vlr[0]).intValue(),
                                  (byte)num(f.vlr[1]).intValue());
            case BUFFERREF:
                return Quantity.valueOf(buffer(f.vlr[0]).ref(num(f.vlr[1]).intValue()) & 0xff);
            case BLOCKREAD:
                int count=num(f.vlr[2]).intValue();
                SchemeInputPort inport=inport(f.vlr[1]);
                byte[] buf=buffer(f.vlr[0]).buf;
                try {
                    int rv=inport.read(buf, 0, buf.length);
                    if (rv==-1) return EOF;
                    else return Quantity.valueOf(rv);
                } catch (IOException e) {
                    error(f, liMessage(SISCB, "errorreading", 
                                       e.getMessage(),
                                       inport.synopsis()));
                }
                break;
            case BLOCKWRITE:
                count=num(f.vlr[2]).intValue();
                SchemeOutputPort outport=outport(f.vlr[1]);
                buf=buffer(f.vlr[0]).buf;
                try {
                    outport.write(buf, 0, count);
                } catch (IOException e) {
                    error(f, liMessage(SISCB, "errorwriting", e.getMessage(),
                                       outport.synopsis()));
                }
                return VOID;
            default:
                throwArgSizeException();
            }
        case 3:
            switch (primid) {
            case BUFFERSET:
                buffer(f.vlr[0]).set(num(f.vlr[1]).intValue(),
                                     (byte)num(f.vlr[2]).intValue());
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

