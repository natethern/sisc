package sisc.ser;

import java.io.*;

/**
 * Class for efficient integer representation.  A BER encoded integer
 * is represented as a variable length sequence of bytes, in network-byte
 * order, with 7 bits of data, and the topmost bit representing a "continue"
 * flag.  If set, another byte follows.  This allows numbers in the range
 * 0-127 to be represented with one byte, 128-16384 in two bytes, etc.
 */
public abstract class BerEncoding {

    static final int BER_MASK=0x7f, BER_CONT=0x80;

    public static void writeBer(long v, DataOutput dos) throws IOException {
        byte[] b=new byte[10];
        int p=9;
        
        while (v!=0) {
            b[p--]=(byte)((v & BER_MASK) | BER_CONT);
            v>>>=7;
        }
        b[9]&=BER_MASK;
        
        if (p==9) p=8;
        dos.write(b, p+1, b.length-(p+1));
    }

    protected long readBerLong(DataInput in) throws IOException {
        int b=in.readUnsignedByte();
        long val=b & BER_MASK;
        while ((b & BER_CONT) != 0) {
            b=in.readUnsignedByte();
            val=(val<<7) + (b & BER_MASK);
        }
        return val;
    }
}
