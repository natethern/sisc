package sisc;

import sisc.data.*;

public class ContinuationException extends Exception {
    public CallFrame k;

    public ContinuationException(CallFrame k) {
	this.k=k;
    }
}
    
