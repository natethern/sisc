package sisc.ser;

import java.io.*;
import java.math.*;

import sisc.data.Expression;
import sisc.data.Symbol;
import sisc.data.Value;
import sisc.env.SymbolicEnvironment;
import sisc.env.DelegatingSymEnv;

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
        Expression e = (Expression)readObjectIOExceptionOnly();
        if (e != null) e.deserializeAnnotations(this);
        return e;
    }

    public Value[] readValueArray() throws IOException {
        int l=readInt();
        Value[] v=new Value[l];
        readExpressionArray(v);
        return v;
    }
    
    public Expression[] readExpressionArray() throws IOException {
        int l=readInt();
        Expression[] v=new Expression[l];
        readExpressionArray(v);
        return v;
    }
    
    void readExpressionArray(Expression[] target) throws IOException {        
        for (int i=0; i<target.length; i++) {
            target[i]=readExpression();
        }
    }

    public Expression readInitializedExpression() throws IOException {
        return readExpression();
    }
        
    public SymbolicEnvironment readSymbolicEnvironment() throws IOException {
        Expression e=readExpression();
        return (e instanceof Symbol) ?
            new DelegatingSymEnv((Symbol)e) : (SymbolicEnvironment)e;
    }

    public Class readClass() throws IOException {
        return (Class)readObjectIOExceptionOnly();
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

/*
 * The contents of this file are subject to the Mozilla Public
 * License Version 1.1 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy of
 * the License at http://www.mozilla.org/MPL/
 * 
 * Software distributed under the License is distributed on an "AS
 * IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * rights and limitations under the License.
 * 
 * The Original Code is the Second Interpreter of Scheme Code (SISC).
 * 
 * The Initial Developer of the Original Code is Scott G. Miller.
 * Portions created by Scott G. Miller are Copyright (C) 2000-2001
 * Scott G. Miller.  All Rights Reserved.
 * 
 * Contributor(s):
 * Matthias Radestock 
 * 
 * Alternatively, the contents of this file may be used under the
 * terms of the GNU General Public License Version 2 or later (the
 * "GPL"), in which case the provisions of the GPL are applicable 
 * instead of those above.  If you wish to allow use of your 
 * version of this file only under the terms of the GPL and not to
 * allow others to use your version of this file under the MPL,
 * indicate your decision by deleting the provisions above and
 * replace them with the notice and other provisions required by
 * the GPL.  If you do not delete the provisions above, a recipient
 * may use your version of this file under either the MPL or the
 * GPL.
 */
