package sisc.ser;

import java.io.*;
import java.math.*;

import sisc.Module;
import sisc.data.Expression;
import sisc.data.Symbol;
import sisc.SymbolicEnvironment;

public class JavaDeserializer implements Deserializer {

    protected ObjectInput is;

    public JavaDeserializer(ObjectInput i) throws IOException {
        is=i;
    }

    protected Object readObjectIOExceptionOnly() throws IOException {
        try {
            Object o=is.readObject();
            return o;
        } catch (ClassNotFoundException cnf) {
            throw new IOException(cnf.getMessage());
        }
    }

    public Object readObject() throws IOException, ClassNotFoundException {
        return is.readObject();
    }

    public long skip(long n) throws IOException {
        return is.skip(n);
    }

    public int available() throws IOException {
        return is.available();
    }

    public void close() throws IOException {
        is.close();
    }

    public BigInteger readBigInteger() throws IOException {
        return (BigInteger)readObjectIOExceptionOnly();
    }

    public BigDecimal readBigDecimal() throws IOException {
        return (BigDecimal)readObjectIOExceptionOnly();
    }

    public Expression readExpression() throws IOException {
        return (Expression)readObjectIOExceptionOnly();
    }

    public SymbolicEnvironment readSymbolicEnvironment() throws IOException {
        SymbolicEnvironment rv;
        Expression e=readExpression();
        if (e instanceof Symbol) 
            rv=(SymbolicEnvironment)LibraryManager.getInstance().getExpression((Symbol)e);
        else rv=(SymbolicEnvironment)e;
        return rv;
    }

    public Class readClass() throws IOException {
        return (Class)readObjectIOExceptionOnly();
    }

    public Module readModule() throws IOException {
        return (Module)readObjectIOExceptionOnly();
    }

    public Library getLibrary() {
        //FIXME?
        return null;
    }

    public int read(byte[] b) throws IOException {
        return is.read(b);
    }

    public int read(byte[] b, int off, int len) throws IOException {
        return is.read(b, off, len);
    }

    public int read() throws IOException {
        return is.read();
    }

    public boolean readBoolean() throws IOException {
        return is.readBoolean();
    }

    public byte readByte() throws IOException {
        return is.readByte();
    }


    public char readChar() throws IOException {
        return is.readChar();
    }

    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readLong());
    }

    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readInt());
    }

    public int readInt() throws IOException {
        return is.readInt();
    }

    public long readLong() throws IOException {
        return is.readLong();
    }

    public short readShort() throws IOException {
        return is.readShort();
    }

    public String readUTF() throws IOException {
        return is.readUTF();
    }

    public void readFully(byte[] b) throws IOException {
        is.readFully(b, 0, b.length);
    }

    public void readFully(byte[] b, int offset, int len) throws IOException {
        is.readFully(b, offset, len);
    }

    public int readUnsignedByte() throws IOException {
        return is.readUnsignedByte();
    }

    public int readUnsignedShort() throws IOException {
        return is.readUnsignedShort();
    }

    public int skipBytes(int bc) throws IOException {
        return is.skipBytes(bc);
    }

    public String readLine() {
        return null;
    }
}
