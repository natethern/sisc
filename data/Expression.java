package sisc.data;

import sisc.*;
import java.io.*;

public abstract class Expression extends Util implements Serializable {

    public abstract void eval(Interpreter r) throws ContinuationException;
    public Value getValue(Interpreter r) throws ContinuationException {
	return null;
    }
}
