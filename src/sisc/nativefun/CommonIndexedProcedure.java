/*
 * $Id$
 */
package sisc.nativefun;

import sisc.data.Value;
import sisc.interpreter.ContinuationException;
import sisc.interpreter.Interpreter;

/**
 * CommonIndexedProcedure is a helper class intended to unify the interfaces
 * of fixable and non-fixable procedures, so that development of native
 * libraries is more consistent and flexible.
 */
public abstract class CommonIndexedProcedure extends IndexedProcedure {
    
    public CommonIndexedProcedure() {}

    public CommonIndexedProcedure(int id) {
        super(id);
    }

    /**
     * A common indexed procedure must subclass one of the following methods
     */
    public Value applyZero(Interpreter r) throws ContinuationException {
        return apply();
    }

    public Value apply() throws ContinuationException {
        throwArgSizeException();
        return VOID;
    }
    
    public Value apply(Interpreter r, Value v1) throws ContinuationException {
        return apply(v1);
    }

    public Value apply(Value v1) throws ContinuationException {
        throwArgSizeException();
        return VOID;
    }

    public Value apply(Interpreter r, Value v1, Value v2) throws ContinuationException {
        return apply(v1, v2);
    }

    public Value apply(Value v1, Value v2) throws ContinuationException {
        throwArgSizeException();
        return VOID;
    }

    public Value apply(Interpreter r, Value v1, Value v2, Value v3) 
        throws ContinuationException {
        return apply(v1, v2, v3);
    }

    public Value apply(Value v1, Value v2, Value v3) throws ContinuationException {
        throwArgSizeException();
        return VOID;
    }

    public Value apply(Interpreter r, Value v[]) 
        throws ContinuationException {
        return apply(v);
    }

    public Value apply(Value vlr[]) throws ContinuationException {
        throwArgSizeException();
        return VOID;
    }

    public Value doApply(Interpreter r) throws ContinuationException {
        switch (r.vlr.length) {
        case 0:
            return applyZero(r);
        case 1:
            return apply(r, r.vlr[0]);
        case 2:
            return apply(r, r.vlr[0], r.vlr[1]);
        case 3:
            return apply(r, r.vlr[0], r.vlr[1], r.vlr[2]);
        default:
            return apply(r, r.vlr);
        }
    }
}
