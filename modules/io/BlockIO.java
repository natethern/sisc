package sisc.modules.io;

import java.net.*;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;
import sisc.io.*;
import java.io.IOException;

public class BlockIO extends ModuleAdapter {

    protected static Symbol BLOCKB =
        Symbol.intern("sisc.modules.io.Messages");

    protected static final int
        BLOCKREAD=1, BLOCKWRITE=2, MAKEBUFFER=3, BUFFERQ=4,
        BUFFERLENGTH=5, BUFFERREF=6, BUFFERSET=7, BUFFERCOPY=8;

    public BlockIO() {
        define("block-read",    BLOCKREAD);
        define("block-write",   BLOCKWRITE);
        define("make-buffer",   MAKEBUFFER);
        define("buffer?",       BUFFERQ);
        define("buffer-length", BUFFERLENGTH);
        define("buffer-ref",    BUFFERREF);
        define("buffer-set!",   BUFFERSET);
        define("buffer-copy!",  BUFFERCOPY);
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
                int index=num(f.vlr[1]).intValue();
                try {
                    return Quantity.valueOf(buffer(f.vlr[0]).ref(index)&0xff);
                } catch (ArrayIndexOutOfBoundsException aib) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     f.vlr[0].synopsis()}));
                }
            default:
                throwArgSizeException();
            }
        case 3:
            switch (primid) {
            case BUFFERSET:
                int index=num(f.vlr[1]).intValue();
                try {
                    buffer(f.vlr[0]).set(index,
                                         (byte)num(f.vlr[2]).intValue());
                } catch (ArrayIndexOutOfBoundsException aib) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     f.vlr[0].synopsis()}));
                }
                return VOID;
            case BLOCKREAD:
                int count=num(f.vlr[2]).intValue();
                SchemeInputPort inport=inport(f.vlr[1]);
                byte[] buf=buffer(f.vlr[0]).buf;
                try {
                    int rv=inport.read(buf, 0, Math.min(buf.length, count));
                    if (rv==-1) return EOF;
                    else return Quantity.valueOf(rv);
                } catch (IOException e) {
                    error(f, liMessage(SISCB, "errorreading", 
                                       e.getMessage(),
                                       inport.toString()));
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
                                       outport.toString()));
                }
                return VOID;
            default:
                throwArgSizeException();
            }
        case 4:
            switch (primid) {            
            case BUFFERCOPY:
                byte[] sbuf=buffer(f.vlr[0]).buf;
                byte[] dbuf=buffer(f.vlr[2]).buf;

                int soff=num(f.vlr[1]).intValue();
                int doff=num(f.vlr[3]).intValue();
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
            switch (primid) {            
            case BUFFERCOPY:
                byte[] sbuf=buffer(f.vlr[0]).buf;
                byte[] dbuf=buffer(f.vlr[2]).buf;

                int soff=num(f.vlr[1]).intValue();
                int doff=num(f.vlr[3]).intValue();
                int count=num(f.vlr[4]).intValue();

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

