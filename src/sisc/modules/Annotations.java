package sisc.modules;

import java.util.Iterator;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;
import sisc.exprs.AnnotatedExpr;

public class Annotations extends IndexedProcedure {
	protected static final int ANNOTATION = 0,
		ANNOTATIONQ = 1,
		ANNOTATIONKEYS = 2,
		ANNOTATIONSRC = 3,
		ANNOTATIONEXPR = 4,
		ANNOTATIONSTRIPPED = 5,
		EMITANNOTATIONS = 6,
		MAKEANNOTATION = 7,
		SETANNOTATION = 8,
		SETANNOTATIONSTRIPPED = 9,
		EMITDEBUGGINGSYMS = 10;

	public static class Index extends IndexedLibraryAdapter {

		public Value construct(int id) {
			return new Annotations(id);
		}

		public Index() {
			define("annotation?", ANNOTATIONQ);
			define("annotation-keys", ANNOTATIONKEYS);
			define("annotation", ANNOTATION);
			define("annotation-source", ANNOTATIONSRC);
			define("annotation-expression", ANNOTATIONEXPR);
			define("annotation-stripped", ANNOTATIONSTRIPPED);
			define("emit-annotations", EMITANNOTATIONS);
			define("emit-debugging-symbols", EMITDEBUGGINGSYMS);
			define("make-annotation", MAKEANNOTATION);
			define("set-annotation!", SETANNOTATION);
			define("set-annotation-stripped!", SETANNOTATIONSTRIPPED);
		}
	}

	public Annotations(int id) {
		super(id);
	}

	public Annotations() {
	}
	
    public Value doApply(Interpreter f) throws ContinuationException {
        switch (f.vlr.length) {
        case 0:
            switch (id) {
            case EMITANNOTATIONS: return truth(f.dynenv.parser.annotate);
            case EMITDEBUGGINGSYMS: return truth(f.dynenv.emitDebuggingSymbols);
            default:
                throwArgSizeException();
            }
        case 1:
            switch (id) {
            case EMITANNOTATIONS:
                f.dynenv.parser.annotate=truth(f.vlr[0]);
                return VOID;
            case EMITDEBUGGINGSYMS:
                f.dynenv.emitDebuggingSymbols=truth(f.vlr[0]);
                return VOID;
            case ANNOTATIONKEYS: {
                Pair akl=EMPTYLIST;
                for (Iterator i=f.vlr[0].getAnnotationKeys().iterator(); i.hasNext();) 
                    akl=new Pair((Symbol)i.next(), akl);
                return akl;
            }
            case ANNOTATIONSTRIPPED:
                return annotated(f.vlr[0]).stripped;
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
            switch (id) {
            case SETANNOTATIONSTRIPPED:
                annotated(f.vlr[0]).stripped=f.vlr[1];
                return VOID;
            case ANNOTATION:
                return f.vlr[0].getAnnotation(symbol(f.vlr[1]));
            default:
                throwArgSizeException();
            }
        case 3:
            switch (id) {
            case MAKEANNOTATION:
                AnnotatedExpr ae=new AnnotatedExpr(f.vlr[0], f.vlr[1]);
                ae.stripped=f.vlr[2];
                return ae;
            case ANNOTATION:
                return f.vlr[0].getAnnotation(symbol(f.vlr[1]), f.vlr[2]);
            case SETANNOTATION:
                return f.vlr[0].setAnnotation(symbol(f.vlr[1]), f.vlr[2]);
            default:
                throwArgSizeException();
            }
        case 4:
            switch(id) {
            case SETANNOTATION:
                return f.vlr[0].setAnnotation(symbol(f.vlr[1]),
                                              f.vlr[2],
                                              f.vlr[3]);
            default:
                throwArgSizeException();
            }
        default:
            throwArgSizeException();
        }

        return VOID;
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
