package sisc.ser;

import java.io.*;
import java.math.*;
import sisc.Module;
import sisc.AssociativeEnvironment;
import sisc.data.Expression;

public class JavaSerializer extends ObjectOutputStream implements Serializer {

    public JavaSerializer(OutputStream o) throws IOException {
        super(o);
    }

    public void writeExpression(Expression e) throws IOException {
        writeObject(e);
    }

    public void writeAssociativeEnvironment(AssociativeEnvironment e) throws IOException {
        if (e==null || e.name==null) { 
            writeExpression(e);
        } else 
            writeExpression(e.name);
    }

    public void writeClass(Class c) throws IOException {
        writeObject(c);
    }

    public void writeModule(Module m) throws IOException {
        writeObject(m);
    }

    public boolean seen(Expression e) {
        //FIXME
        return false;
    }
        
    public void forceSeen(Expression e) {
        //FIXME
    }

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

}
