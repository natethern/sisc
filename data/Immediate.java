package sisc.data;

import sisc.ContinuationException;
import sisc.Interpreter;

public interface Immediate {

    public Value getValue(Interpreter r) throws ContinuationException;

}
