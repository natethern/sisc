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
package sisc.exprs;

import sisc.*;
import sisc.data.*;
import java.io.*;

public class AnnotatedExpr extends Value {
    public Expression expr;
    public Value annotation;

    public AnnotatedExpr(Expression expr, Value annotation) {
	this.expr=expr;
	this.annotation=annotation;
    }

    public final void eval(Interpreter r) throws ContinuationException {
	expr.eval(r);
    }
    
    public final Value getValue(Interpreter r) throws ContinuationException {
	return expr.getValue(r);
    }

    public Value express() {
        return list(sym("Annotated-expr"), annotation, expr.express());
    }

    public AnnotatedExpr() {}

    public void serialize(Serializer s, DataOutput dos) throws IOException {
        if (SERIALIZATION) {
	    s.serialize(expr, dos);
	    s.serialize(annotation, dos);
        }
    }

    public String display() {
	StringBuffer b=new StringBuffer("#@");
	b.append(annotation.display()).append(',');
	if (expr instanceof Value) 
	    b.append(((Value)expr).display());
	else 
	    b.append(expr.express());
	return b.toString();
    }

    public String write() {
	StringBuffer b=new StringBuffer("#@");
	b.append(annotation.write()).append(',');
	if (expr instanceof Value) 
	    b.append(((Value)expr).write());
	else 
	    b.append(expr.express());
	return b.toString();
    }

    public void deserialize(Serializer s, DataInput dis)
    throws IOException {
        if (SERIALIZATION) {
	    expr=s.deserialize(dis);
	    annotation=(Value)s.deserialize(dis);
        }
    }
}
