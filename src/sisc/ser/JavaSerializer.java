package sisc.ser;

import java.io.*;
import java.math.*;
import sisc.env.SymbolicEnvironment;
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

    public void writeSymbolicEnvironment(SymbolicEnvironment e) throws IOException {
        if (e==null) {
            writeExpression((Expression)null);
        } else if (e.getName()==null) { 
            writeExpression(e.asValue());
        } else 
            writeExpression(e.getName());
    }

    public void writeClass(Class c) throws IOException {
        os.writeObject(c);
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
