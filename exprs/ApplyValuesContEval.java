package sisc.exprs;

import java.io.*;
import sisc.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.io.ValueWriter;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class ApplyValuesContEval extends Expression {
    public Procedure consumer;

    public ApplyValuesContEval(Procedure c) {
        consumer=c;
    }

    public void eval(Interpreter r) throws ContinuationException {
        try {
            r.vlr=((Values)r.acc).values;
        } catch (ClassCastException c) {
            r.vlr=new Value[] {r.acc};
        }
	r.vlk=true;
        r.nxp=APPEVAL;
        r.acc=(Value)consumer;
    }

    public void display(ValueWriter w) throws IOException {
        w.append("#<").append(liMessage(SISCB, "systemcontinuation")).append('>');
    }

    public Value express() {
        return list(sym("ApplyValuesContEval"), consumer.express());
    }

    public void serialize(Serializer s) throws IOException {
        s.writeExpression(consumer);
    }

    public ApplyValuesContEval() {}

    public void deserialize(Deserializer s) throws IOException {
        consumer=(Procedure)s.readExpression();
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
