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
package sisc.debug;

import sisc.*;
import sisc.data.*;
import sisc.exprs.AnnotatedExpr;
import java.awt.*;
import java.util.Set;
import java.util.Iterator;

public class SDebug extends ModuleAdapter {
    public String getModuleName() {
	return "Debugging";
    }

    protected static final int 
	EXPRESSV=0, COMPILE=1,
	CONT_VLR=2, CONT_NXP=3, CONT_ENV=4, CONT_FK=5,
	CONT_LOCKQ=6, CONT_PARENT=7, 
	ANNOTATIONEXPR=10, ANNOTATIONQ=11, ANNOTATION=8, ANNOTATIONKEYS=9,
	EMITANNOTATIONS=12, ERROR_CONT_K=13, SETANNOTATION=14,
        ANNOTATIONSRC=15, ANNOTATIONSTRIPPED=16, SETANNOTATIONSTRIPPED=17;

    public SDebug() {
	define("emit-annotations", EMITANNOTATIONS);
        define("express", EXPRESSV);
        define("compile", COMPILE);
	define("error-continuation-k", ERROR_CONT_K);
        define("continuation-vlr", CONT_VLR);
        define("continuation-nxp", CONT_NXP);
        define("continuation-env", CONT_ENV);
        define("continuation-fk", CONT_FK);
	define("continuation-stk", CONT_PARENT);
        define("continuation-captured?", CONT_LOCKQ);
	define("annotation?", ANNOTATIONQ);
	define("annotation-keys", ANNOTATIONKEYS);
	define("annotation", ANNOTATION);
	define("set-annotation!", SETANNOTATION);
        define("annotation-source", ANNOTATIONSRC);
        define("annotation-expression", ANNOTATIONEXPR);
	define("set-annotation-stripped!", SETANNOTATIONSTRIPPED);
        define("annotation-stripped", ANNOTATIONSTRIPPED);
    }

    class SISCExpression extends Value {
        protected Expression e;

        SISCExpression(Expression e) {
            this.e=e;
        }

        public void setAnnotation(Symbol key, Value v) {
            e.setAnnotation(key, v);
        }
 
        public Set getAnnotationKeys() {
            return e.getAnnotationKeys();
        }

	public Value getAnnotation(Symbol key) {
	    return e.getAnnotation(key);
	}

        public String display() {
            return "#<expression "+e.express().write()+'>';
        }
    }

    public static final AnnotatedExpr annotated(Value o) {
        try {
            return (AnnotatedExpr)o;
        } catch (ClassCastException e) { typeError("annotatedexpression", o); }
	return null;
    }

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
	case 0:
	    switch(primid) {
	    case EMITANNOTATIONS:
		return truth(f.dynenv.parser.annotate);
	    default:
                throwArgSizeException();
	    }
        case 1:
            switch(primid) {
            case ANNOTATIONKEYS:
                Set s=f.vlr[0].getAnnotationKeys();
                Pair p=EMPTYLIST;
                for (Iterator i=s.iterator(); i.hasNext();) 
                    p=new Pair((Symbol)i.next(), p);
                return p;
            case ANNOTATIONSTRIPPED:
                return annotated(f.vlr[0]).stripped;
	    case EMITANNOTATIONS:
		f.dynenv.parser.annotate=truth(f.vlr[0]);
		return VOID;
            case EXPRESSV:
		if (f.vlr[0] instanceof SISCExpression) {
		    return ((SISCExpression)f.vlr[0]).e.express();
		} else {
		    Closure c=(Closure)f.vlr[0];
		    return list(c.arity ? sym("infinite") : sym("finite"),
				Quantity.valueOf(c.fcount), c.body.express());
		}
            case COMPILE:
                return new Closure(false, (short)0, f.compile(f.vlr[0]), f.env);
	    case ERROR_CONT_K:
		return ((ApplyParentFrame)f.vlr[0]).c;
            case CONT_LOCKQ:
                CallFrame cn=cont(f.vlr[0]);
                return truth(cn.lock);
            case CONT_NXP:
                cn=cont(f.vlr[0]);
                if (cn.nxp==null) return EMPTYLIST;
                return new SISCExpression(cn.nxp);
            case CONT_VLR:
                cn=cont(f.vlr[0]);
                return new SchemeVector(cn.vlr);
            case CONT_ENV:
                cn=cont(f.vlr[0]);
                return cn.env;
	    case CONT_PARENT: 
		cn=cont(f.vlr[0]);
		if (cn.parent==null) return EMPTYLIST;
                return cn.parent;
	    case ANNOTATIONQ:
		return truth(f.vlr[0] instanceof AnnotatedExpr);
	    case ANNOTATIONSRC:
		Value rv;
		if (f.vlr[0] instanceof AnnotatedExpr) 
		    rv=annotated(f.vlr[0]).annotation;
                else 
                    rv=FALSE;
		return rv;
	    case ANNOTATIONEXPR:
		if (f.vlr[0] instanceof AnnotatedExpr) 
		    return (Value)annotated(f.vlr[0]).expr;
		else return f.vlr[0];
            default:
                throwArgSizeException();
            }
        case 2:
            switch(primid) {
            case SETANNOTATIONSTRIPPED:
                annotated(f.vlr[0]).stripped=f.vlr[1];
                return VOID;
            case ANNOTATION:
		return f.vlr[0].getAnnotation(symbol(f.vlr[1]));
            default:
                throwArgSizeException();
            }
        case 3:
            switch(primid) {
	    case SETANNOTATION:
                f.vlr[0].setAnnotation(symbol(f.vlr[1]), f.vlr[2]);
            default:
                throwArgSizeException();
            }
        default:
	    throwArgSizeException();
        }
	return VOID;
    }
}
