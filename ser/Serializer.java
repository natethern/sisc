package sisc.ser;

import java.io.DataOutput;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

import sisc.Module;
import sisc.data.Expression;

public abstract class Serializer implements DataOutput {

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

    public abstract void writeExpression(Expression e) throws IOException;
    public abstract void writeClass(Class c) throws IOException;
    public abstract void writeModule(Module m) throws IOException;

    public abstract boolean seen(Expression e);
    public abstract void forceSeen(Expression e);

    static final int BER_MASK=0x7f, BER_CONT=0x80;
}
