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
package sisc.modules;

import java.io.*;
import sisc.*;
import sisc.data.*;
import java.util.HashMap;

public class SRFI12 extends ModuleAdapter {
    public String getModuleName() {
	return "SRFI-12";
    }

    protected static final int 
	CONDITIONQ=0, MAKEPROPERTYCONDITION=1, 
	MAKECOMPOSITECONDITION=2, HASCONDITIONKIND=3,
	CONDPROPERTYACCESSOR=4, GETCONDITIONPROPERTIES=5;
    
    public SRFI12() {
        define("condition?", CONDITIONQ);
	define("has-condition-kind", HASCONDITIONKIND);
	define("condition-property-accessor", CONDPROPERTYACCESSOR);
	define("make-composite-condition", MAKECOMPOSITECONDITION);
        define("sisc-make-property-condition", MAKEPROPERTYCONDITION);
        define("sisc-get-condition-properties", GETCONDITIONPROPERTIES);
    }

    class Condition extends Value {
	Value kindkey;
	Pair props;
	Condition next;

	public Condition(Condition o) {
	    kindkey=o.kindkey;
	    props=o.props;
	}

	public Condition(Value kindkey, Pair props) {
	    this.kindkey=kindkey;
	    this.props=props;
	}

	public String display() {
	    return "#<condition>";
	}
    }

    public static Condition cond(Value o) {
        try {
            return (Condition)o;
        } catch (ClassCastException e) { typeError("condition", o); }
	return null;
    }


    public Value eval(int primid, Interpreter f) throws ContinuationException {
	switch(f.vlr.length) {
	case 1:
	    switch(primid) {
	    case CONDITIONQ: return truth(f.vlr[0] instanceof Condition);
	    case MAKECOMPOSITECONDITION: return new Condition(cond(f.vlr[0]));
	    default:
		error(f, "Incorrect number of arguments to procedure "+f.acc);
	    }
	case 2:
	    switch(primid) {
	    case MAKEPROPERTYCONDITION:
		return new Condition(f.vlr[0], pair(f.vlr[1]));
	    case MAKECOMPOSITECONDITION: 
		Condition q=new Condition(cond(f.vlr[0]));
		q.next=new Condition(cond(f.vlr[1]));
		return q;
	    case GETCONDITIONPROPERTIES:
		q=cond(f.vlr[0]);
		while (!q.kindkey.valueEqual(f.vlr[1]) &&
		       q.next!=null)
		    q=q.next;
		if (q==null) return FALSE;
		else return q.props;
	    case HASCONDITIONKIND:
		q=cond(f.vlr[0]);
		do {
		    if (q.kindkey.valueEqual(f.vlr[1]))
			return TRUE;
		    q=q.next;
		} while (q!=null);
		return FALSE;
	    default:
		error(f, "Incorrect number of arguments to procedure "+f.acc);
	    }
	default:
	    switch(primid) {
	    case MAKECOMPOSITECONDITION:
		Condition q=new Condition(cond(f.vlr[0])), h=q;
		for (int i=0; i<f.vlr.length; i++) {
		    q.next=new Condition(cond(f.vlr[i]));
		    q=q.next;
		}
		return h;
	    default:
		error(f, "Incorrect number of arguments to procedure "+f.acc);
	    }
	}
	return VOID;
    }
}
		
		
		
	    
