package sisc;

import sisc.data.*;
import sisc.interpreter.*;

public abstract class Module extends NamedValue implements java.io.Serializable {

    public abstract Symbol[] getModuleBindingNames(Interpreter r);
    public abstract Value getBindingValue(Interpreter r, Symbol name) throws NoSuchMethodError;

    public abstract String getModuleName();
    public abstract float getModuleVersion();

    public String display() {
	return displayNamedOpaque(liMessage(SISCB, "nativelibrary"));
    }

    public abstract Value eval(int primid, Interpreter f)
    throws ContinuationException;

    public static void throwPrimException(String message) {
	throw new PrimRuntimeException(message);
    }

    public static void throwNestedPrimException(String message, SchemeException e) {
	throw new NestedPrimRuntimeException(message, e);
    }

    public static void throwNestedPrimException(SchemeException e) {
	throw new NestedPrimRuntimeException(e);
    }

    public static void throwArgSizeException() {
	throw new ArrayIndexOutOfBoundsException();
    }
}
/*
 * The contents of this file are subject to the Mozilla Public
 * License Version 1.1 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy of
 * the License at http://www.mozilla.org/MPL/
 * 
 * Software distributed under the License is distributed on an "AS
 * IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * rights and limitations under the License.
 * 
 * The Original Code is the Second Interpreter of Scheme Code (SISC).
 * 
 * The Initial Developer of the Original Code is Scott G. Miller.
 * Portions created by Scott G. Miller are Copyright (C) 2000-2001
 * Scott G. Miller.  All Rights Reserved.
 * 
 * Contributor(s):
 * Matthias Radestock 
 * 
 * Alternatively, the contents of this file may be used under the
 * terms of the GNU General Public License Version 2 or later (the
 * "GPL"), in which case the provisions of the GPL are applicable 
 * instead of those above.  If you wish to allow use of your 
 * version of this file only under the terms of the GPL and not to
 * allow others to use your version of this file under the MPL,
 * indicate your decision by deleting the provisions above and
 * replace them with the notice and other provisions required by
 * the GPL.  If you do not delete the provisions above, a recipient
 * may use your version of this file under either the MPL or the
 * GPL.
 */
