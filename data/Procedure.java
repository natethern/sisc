package sisc.data;

import sisc.*;

public interface Procedure {

    public void apply(Interpreter r) throws ContinuationException;

}
