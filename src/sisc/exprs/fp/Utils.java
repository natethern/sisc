/*
 * $Id$
 */
package sisc.exprs.fp;

import sisc.data.Expression;

/**
 * @author scgmille
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Utils {

    public static void linkOptimistic(OptimisticHost host, Expression exp, int uexpPos) {
        if (exp != null && exp instanceof OptimisticExpression) {
            ((OptimisticExpression)exp).setHost(host, uexpPos);
        }
    }

}
