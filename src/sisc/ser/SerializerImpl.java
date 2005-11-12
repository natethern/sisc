package sisc.ser;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

import sisc.data.Expression;
import sisc.data.Value;
import sisc.env.SymbolicEnvironment;

public abstract class SerializerImpl extends BerEncoding implements Serializer {

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

    public void writeExpressionArray(Expression[] v) throws IOException {
        if (v==null) writeInt(0);
        else {
            writeInt(v.length);
            for (int i=0; i<v.length; i++) {
                writeExpression(v[i]);
            }
        }
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
