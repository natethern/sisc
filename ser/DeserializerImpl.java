package sisc.ser;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

import sisc.Module;
import sisc.data.Expression;
import sisc.Util;

public abstract class DeserializerImpl extends Util implements Deserializer {

    
    protected long readBerLong() throws IOException {
        int b=readUnsignedByte();
        long val=b & BER_MASK;
        while ((b & BER_CONT) != 0) {
            b=readUnsignedByte();
            val=(val<<7) + (b & BER_MASK);
        }
        return val;
    }

    public BigInteger readBigInteger() throws IOException {
        byte[] buffer=new byte[readInt()];
        readFully(buffer);
        return new BigInteger(buffer);
    }

    public BigDecimal readBigDecimal() throws IOException {
        byte[] buffer=new byte[readInt()];
        int scale=readInt();
        readFully(buffer);
        return new BigDecimal(new BigInteger(buffer), scale);
    }

    public Object readObject() throws IOException, ClassNotFoundException {
        throw new IOException("cannot deserialize");
    }

    public long skip(long n) throws IOException {
        return 0;
    }

    public int available() throws IOException {
        return 1;
    }

    public void close() throws IOException {
    }
}
