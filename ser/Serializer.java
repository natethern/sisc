package sisc.ser;

import java.io.ObjectOutput;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

import sisc.Module;
import sisc.data.Expression;
import sisc.SymbolicEnvironment;

public interface Serializer extends ObjectOutput {

    public abstract void writeBigDecimal(BigDecimal d) throws IOException;

    public abstract void writeBigInteger(BigInteger i) throws IOException;

    public abstract void writeExpression(Expression e) throws IOException;
    public abstract void writeSymbolicEnvironment(SymbolicEnvironment e) throws IOException;
    public abstract void writeClass(Class c) throws IOException;
    public abstract void writeModule(Module m) throws IOException;

    public abstract boolean seen(Expression e);
    public abstract void forceSeen(Expression e);

    int BER_MASK=0x7f, BER_CONT=0x80;
}
