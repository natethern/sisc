/*
 * $Id$
 */
package sisc.exprs.fp;

import sisc.data.Expression;

/**
 * An Optimistic uExp Host Expression provides a callback for
 * child uExps to call if they need to revert to safer
 * expressions.
 * 
 * @author scgmille
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public interface OptimisticHost {

	/**
	 * Instructs the host to replace the uExp referenced at the
	 * given (Expression dependent) position, with the given
	 * Expression.
	 * 
	 * @param uexpPosition Expression dependent uExp index
	 * @param replaceWith Expression to revert to
	 */
	public void alter(int uexpPosition, Expression replaceWith);

    /**
     * 
     */
    public void setHosts();
}
