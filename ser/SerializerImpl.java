package sisc.ser;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

import sisc.Module;
import sisc.data.Expression;
import sisc.Util;
import sisc.AssociativeEnvironment;

public abstract class SerializerImpl extends Util implements Serializer {

    public void writeBigDecimal(BigDecimal d) throws IOException {
        int scale=d.scale();
	byte[] buffer=d.unscaledValue().toByteArray();
        writeInt(buffer.length);
        writeInt(scale);
        write(buffer);
    }

    public void writeBigInteger(BigInteger i) throws IOException {
        byte[] buffer=i.toByteArray();
        writeInt(buffer.length);
        write(buffer);
    }

    public void writeObject(Object o) throws IOException {
        throw new IOException("cannot serialize " + o);
    }

    public void flush() throws IOException {
    }

    public void close() throws IOException {
    }

    public abstract void writeExpression(Expression e) throws IOException;
    public abstract void writeAssociativeEnvironment(AssociativeEnvironment e) throws IOException;
    public abstract void writeClass(Class c) throws IOException;
    public abstract void writeModule(Module m) throws IOException;

    public abstract boolean seen(Expression e);
    public abstract void forceSeen(Expression e);

    static final int BER_MASK=0x7f, BER_CONT=0x80;
}
