package sisc.ser;

import java.io.*;
import java.math.*;

import sisc.Module;
import sisc.data.Expression;
import sisc.data.Symbol;
import sisc.AssociativeEnvironment;

public class JavaDeserializer extends ObjectInputStream implements Deserializer {

    public JavaDeserializer(InputStream i) throws IOException {
        super(i);
    }

    protected Object readObjectIOExceptionOnly() throws IOException {
        try {
            Object o=readObject();
            return o;
        } catch (ClassNotFoundException cnf) {
            throw new IOException(cnf.getMessage());
        }
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

    public AssociativeEnvironment readAssociativeEnvironment() throws IOException {
        AssociativeEnvironment rv;
        Expression e=readExpression();
        if (e instanceof Symbol) 
            rv=(AssociativeEnvironment)LibraryManager.getInstance().getExpression((Symbol)e);
        else rv=(AssociativeEnvironment)e;
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
}
