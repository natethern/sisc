package sisc.exprs;

/**
 * Volatile expressions are those that will behave poorly if captured
 * by a continuation.  They must first be locked when captured.
 */
public interface Volatile {
    
    public void lock();

}
