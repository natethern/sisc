package sisc.ser;

import java.io.DataInput;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

import sisc.Module;
import sisc.data.Expression;
import sisc.Util;
import sisc.AssociativeEnvironment;

public abstract class DeserializerImpl extends Util implements Deserializer, DataInput {

    
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
}
