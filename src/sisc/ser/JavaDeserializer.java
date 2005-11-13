package sisc.ser;

import java.io.*;
import java.math.*;

import sisc.data.Expression;
import sisc.data.Symbol;
import sisc.data.Value;
import sisc.env.SymbolicEnvironment;
import sisc.env.DelegatingSymEnv;
import sisc.util.InternedValue;

public class JavaDeserializer extends DeserializerImpl {

    private JavaDeserializer(ObjectInput i) throws IOException {
        super(i);
    }

    public static Deserializer create(ObjectInput i) throws IOException {
        return (i instanceof NestedObjectInputStream) ?
            ((NestedObjectInputStream)i).getDeserializerInstance() :
            new JavaDeserializer(i);
    }


    protected Object readObjectIOExceptionOnly() throws IOException {
        try {
            return readObject();
        } catch (ClassNotFoundException cnf) {
            throw new IOException(cnf.getMessage());
        }
    }

    public int read(byte[] b) throws IOException {
        return ((ObjectInput)datin).read(b);
    }

    public int read(byte[] b, int off, int len) throws IOException {
        return ((ObjectInput)datin).read(b, off, len);
    }

    public int read() throws IOException {
        return ((ObjectInput)datin).read();
    }

    public String readLine() throws IOException {
        return ((ObjectInput)datin).readLine();
    }

    public Object readObject() throws IOException, ClassNotFoundException {
        return ((ObjectInput)datin).readObject();
    }

    public long skip(long n) throws IOException {
        return ((ObjectInput)datin).skip(n);
    }

    public int available() throws IOException {
        return ((ObjectInput)datin).available();
    }

    public void close() throws IOException {
        ((ObjectInput)datin).close();
    }

    public Expression readExpression() throws IOException {
        return (Expression)readObjectIOExceptionOnly();
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
