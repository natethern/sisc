package sisc.modules;

import java.util.Iterator;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;
import sisc.exprs.AnnotatedExpr;

public class Annotations extends ModuleAdapter {

    public String getModuleName() {
        return "Annotations";
    }

    protected static final int
        ANNOTATION				= 0,
        ANNOTATIONQ				= 1,
        ANNOTATIONKEYS			= 2,
        ANNOTATIONSRC			= 3,
        ANNOTATIONEXPR			= 4,
        ANNOTATIONSTRIPPED		= 5,
        EMITANNOTATIONS			= 6,
        MAKEANNOTATION			= 7,
        SETANNOTATION			= 8,
        SETANNOTATIONSTRIPPED	= 9;

    public Annotations() {
        define("annotation?"            , ANNOTATIONQ);
        define("annotation-keys"        , ANNOTATIONKEYS);
        define("annotation"             , ANNOTATION);
        define("annotation-source"      , ANNOTATIONSRC);
        define("annotation-expression"  , ANNOTATIONEXPR);
        define("annotation-stripped"    , ANNOTATIONSTRIPPED);
        define("emit-annotations"       , EMITANNOTATIONS);
        define("make-annotation"        , MAKEANNOTATION);
        define("set-annotation!"        , SETANNOTATION);
        define("set-annotation-stripped!", SETANNOTATIONSTRIPPED);
    }

    public Value eval(int primid, Interpreter f)
        throws ContinuationException {
        switch (f.vlr.length) {
        case 0:
            switch (primid) {
            case EMITANNOTATIONS: return truth(f.dynenv.parser.annotate);
            default:
                throwArgSizeException();
            }
        case 1:
            switch (primid) {
            case EMITANNOTATIONS:
                f.dynenv.parser.annotate=truth(f.vlr[0]);
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
            switch (primid) {
            case SETANNOTATIONSTRIPPED:
                annotated(f.vlr[0]).stripped=f.vlr[1];
                return VOID;
            case ANNOTATION:
                return f.vlr[0].getAnnotation(symbol(f.vlr[1]));
            default:
                throwArgSizeException();
            }
        case 3:
            switch (primid) {
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
            switch(primid) {
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
