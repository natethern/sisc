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

public class AppExp extends Expression {
    protected static final Value[] ZV=new Value[0];
    public Expression rator, rands[];
    public boolean nonTail;

    public AppExp(Expression rator, Expression rands[], boolean nontail) {
	if (rator instanceof Value && !(rator instanceof Procedure)) 
	    System.err.println("{warning: compiler detected application of non-procedure '"+
			       ((Value)rator).write()+"'}");

	this.rator=rator;
	this.rands=rands;
	this.nonTail=nontail;
    }

    public void eval(Interpreter r) throws ContinuationException { 
	Value tmp;
	int i;

	if (nonTail) {
	    r.nxp=null;
	    r.save();
	}

	r.vlr=rands.length == 0 ? ZV : new Value[rands.length];

	// Fill the rib right to left with immediates until non-imm.
	// encountered
	for (i=rands.length-1; 
	     i>=0 && ((tmp=rands[i].getValue(r)) != null); 
	     i--)
	    r.vlr[i]=tmp;
	
	// If not all were immediate, push a fillrib, otherwise
	// go straight to eval
	if (i>-1) {
	    r.push(r.createFillRib(i, rands, rator, APPEVAL));
	    r.nxp=rands[i];
	} else {
	    tmp=rator.getValue(r);
	    if (tmp==null) { 
		r.push(APPEVAL);
		r.nxp=rator;
	    } else {
		r.acc=tmp;
		r.nxp=APPEVAL;
	    }
	}
    }

    public Value express() {
	Pair args=EMPTYLIST;
	for (int i=rands.length-1; i>=0; i--) {
	    args=new Pair(rands[i].express(), args);
	}
	args=new Pair(rator.express(), args);
	return new Pair(nonTail ? sym("App-exp") : sym("TailApp-exp"), args);
    }

    public void serialize(Serializer s, DataOutputStream dos) throws IOException {
	s.writeBer(rands.length, dos);
	for (int i=0; i<rands.length; i++) 
	    s.serialize(rands[i], dos);
	s.serialize(rator, dos);
	dos.writeBoolean(nonTail);
    }

    public AppExp() {}

    public void deserialize(Serializer s, DataInputStream dis) 
	throws IOException {
	int size=s.readBer(dis);

	rands=new Expression[size];
	for (int i=0; i<size; i++) { 
	    rands[i]=s.deserialize(dis);
	} 

	rator=s.deserialize(dis);
	nonTail=dis.readBoolean();
    }
}
