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
package sisc.data;

import java.util.Set;
import java.util.*;
import sisc.*;
import java.io.*;

/**
 * The base class for any and all expressions.  An expression is anything in Scheme that can evaluate to a value.
 * 
 * In SISC, an expression can be <i>annotated</i>.  An annotation is any key/value pair attached
 * to an expression for the duration of its lifetime.  Annotations are used to implement procedure
 * properties and source-tracked debugging.
 */
public abstract class Expression extends Util implements Serializable {
    protected static Set EMPTYSET=new TreeSet();

    public Map annotations;
    
    /**
     * Returns the value of the annotation named by <tt>key</tt>.  If there is no such annotation, <tt>def</tt>
     * is returned instead.
     * 
     * @param key 
     * @param def 
     */
    public synchronized Value getAnnotation(Symbol key, Value def) {
        if (annotations==null)
            return def;
        Value res = (Value)annotations.get(key);
        return (res == null) ? def : res;
    }

    /**
     * Returns the value of the annotation named by <tt>key</tt>.  False is returned if there is no such
     * annotation.
     * 
     * @param key 
     */
    public Value getAnnotation(Symbol key) {
        return getAnnotation(key, FALSE);
    }

    /**
     * Sets the value of the annotation named by <tt>key</tt> to the value <tt>val</tt>.  The previous value
     * is returned.  If there was no previous value, <tt>def</tt> is returned.
     * 
     * @param key 
     * @param val 
     * @param def 
     */
    public synchronized Value setAnnotation(Symbol key, Value val, Value def) {
        if (annotations==null)
            annotations=new HashMap(0);
        Value res = (Value)annotations.put(key, val);
        return (res == null) ? def : res;
    }

    /**
     * Sets the value of the annotation named by <tt>key</tt> to the value <tt>val</tt>.  The previous value
     * is returned.  If there was no previous value, false is returned.
     * 
     * @param key 
     * @param val 
     */
    public Value setAnnotation(Symbol key, Value val) {
        return setAnnotation(key, val, FALSE);
    }

    /**
     * Returns the set of all annotation keys on this object.
     */
    public synchronized Set getAnnotationKeys() {
        if (annotations==null) return EMPTYSET;
        return annotations.keySet();
    }

    /**
     * All expressions can be evaluated to some Scheme value.  This function implements the exact manner
     * in which an expression is evaluated.  An expression, when evaluated, performs some action that
     * results in its value being placed in the <tt>acc</tt> register of the given Interpreter.
     * 
     * An expression that immediately evaluates to a value (i.e. does not require that an additional expression be evaluated to obtain its value) <i>must</i> clear the <tt>nxp</tt> register by setting it to null.
     * Otherwise, <tt>nxp</tt> should be set to the expression that is to be evaluated next before this method returns.
     * 
     * @exception ContinuationException 
     * @param r 
     */
    public abstract void eval(Interpreter r) throws ContinuationException;
    /**
     * If an expression implements the Immediate interface, it must implement getValue, which
     * returns as a Value, the immediate value of this expression.  Immediates never require any
     * additional expressions to be evaluated to obtain their result.
     * 
     * 
     * @exception ContinuationException 
     * @param r 
     * @return the immediate value of this expression, or null if the value  
     *     cannot be obtained immediately.
     */
    public Value getValue(Interpreter r) throws ContinuationException {
        return null;
    }

    /**
     * A debugging function, express returns a Scheme value that describes this expression.  See
     * examples in sisc.exprs.*
     */
    public abstract Value express();

    /**
     * All Expressions must implement a default (no-argument) constructor.  Those that wish to be
     * serialized to a heap must implement both this and the deserialize method.
     * The Expression may use any method of the DataOutput stream and the Serializer serialization context
     * to write its state, to be deserialized later.
     * 
     * @exception IOException 
     * @param s 
     * @param dos 
     */
    public void serialize(Serializer s,
                          DataOutput dos) throws IOException {
    }

    /**
     * All Expressions must implement a default (no-argument) constructor.  Those that wish to be
     * serialized to a heap must implement both this and the serialize method.
     * The Expression may use any method of the DataInput stream and the Serializer serialization context
     * to read its state.
     * 
     * @exception IOException 
     * @param s 
     * @param dis 
     */
    public void deserialize(Serializer s,
                            DataInput dis) throws IOException
        {}
}








