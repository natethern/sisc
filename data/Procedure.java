package sisc.data;

import sisc.*;

public abstract class Procedure extends NamedValue {

    public abstract void apply(Interpreter r) throws ContinuationException;
}
