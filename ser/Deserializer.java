package sisc.ser;

import java.io.DataInput;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

import sisc.Module;
import sisc.data.Expression;
import sisc.Util;
import sisc.AssociativeEnvironment;

public interface Deserializer extends DataInput {

    
    public abstract BigInteger readBigInteger() throws IOException;
    public abstract BigDecimal readBigDecimal() throws IOException;

    public abstract Expression readExpression() throws IOException;
    public abstract AssociativeEnvironment readAssociativeEnvironment() throws IOException;
    public abstract Class readClass() throws IOException;
    public abstract Module readModule() throws IOException;
    public abstract Library getLibrary();

    int BER_MASK=0x7f, BER_CONT=0x80;
}
