package sisc.ser;

import java.io.*;
import java.math.*;
import sisc.Module;
import sisc.AssociativeEnvironment;
import sisc.data.Expression;

public class JavaSerializer implements Serializer {
    
    protected ObjectOutput os;

    public JavaSerializer(ObjectOutput o) throws IOException {
        os=o;
    }

    public void flush() throws IOException {
        os.flush();
    }

    public void close() throws IOException {
        os.close();
    }

    public void writeObject(Object o) throws IOException {
        os.writeObject(o);
    }

    public void writeExpression(Expression e) throws IOException {
        os.writeObject(e);
    }

    public void writeAssociativeEnvironment(AssociativeEnvironment e) throws IOException {
        if (e==null || e.name==null) { 
            writeExpression(e);
        } else 
            writeExpression(e.name);
    }

    public void writeClass(Class c) throws IOException {
        os.writeObject(c);
    }

    public void writeModule(Module m) throws IOException {
        os.writeObject(m);
    }

    public boolean seen(Expression e) {
        //FIXME
        return false;
    }
        
    public void forceSeen(Expression e) {
        //FIXME
    }

    public void writeBigDecimal(BigDecimal d) throws IOException {
        os.writeObject(d);
    }

    public void writeBigInteger(BigInteger i) throws IOException {
        os.writeObject(i);
    }

    public void write(byte[] b) throws IOException {
        os.write(b);
    }

    public void write(byte[] b, int off, int len) throws IOException {
        os.write(b, off, len);
    }

    public void write(int b) throws IOException {
        os.write(b);
    }

    public void writeBoolean(boolean v) throws IOException {
        os.writeBoolean(v);
    }

    public void writeByte(int v) throws IOException {
        os.writeByte(v);
    }

    public void writeBytes(String s) throws IOException {
        os.writeBytes(s);
    }

    public void writeChar(int v) throws IOException {
        os.writeChar(v);
    }

    public void writeChars(String v) throws IOException {
        os.writeChars(v);
    }

    public void writeDouble(double v) throws IOException {
        writeLong(Double.doubleToLongBits(v));
    }

    public void writeFloat(float v) throws IOException {
        writeInt(Float.floatToIntBits(v));
    }

    public void writeInt(int v) throws IOException {
        os.writeInt(v);
    }

    public void writeLong(long v) throws IOException {
        os.writeLong(v);
    }

    public void writeShort(int v) throws IOException {
        os.writeShort(v);
    }

    public void writeUTF(String v) throws IOException {
        os.writeUTF(v);
    }
}
