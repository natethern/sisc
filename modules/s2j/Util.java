package sisc.modules.s2j;

import java.lang.reflect.*;

import sisc.nativefun.*;
import sisc.interpreter.*;
import sisc.data.*;

public class Util extends ModuleAdapter {

    protected static final Symbol S2JB = Symbol.intern("S2J");

    public Util() {}

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        return VOID;
    }

    public static Throwable javaException(SchemeException e) {
        Throwable ex = e;
        Value m = e.m;
        if (m instanceof Pair) {
            //we should always get here since error messages are meant
            //to be alists
            //locate the error message
            Pair l = (Pair)m;
            for (;l != EMPTYLIST; l = (Pair)l.cdr) {
                if (l.car instanceof Pair) {
                    Pair el = (Pair)l.car;
                    if (el.car == MESSAGE) {
                        m = el.cdr;
                        break;
                    }
                }
            }
        }
        if (m instanceof JavaObject) {
            Object eo = ((JavaObject)m).get();
            if (eo instanceof Throwable)
                ex = (Throwable)eo;
        }
        return ex;
    }

    public static final int jtype(Value o) {
        try {
            return ((JavaObject)o).getObjType();
        } catch (ClassCastException e) { typeError(S2JB, "jobject", o); }
        return JavaObject.JUNKN;
    }

    public static final JavaObject sjobj(Value o) {
        try {
            return (JavaObject)o;
        } catch (ClassCastException e) { typeError(S2JB, "jobject", o); }
        return null;
    }

    public static final Object jobj(Value o) {
        try {
            return ((JavaObject)o).get();
        } catch (ClassCastException e) { typeError(S2JB, "jobject", o); }
        return null;
    }

    public static final Class jclass(Value o) {
        try {
            return (Class)((JavaObject)o).get();
        } catch (ClassCastException e) { typeError(S2JB, "jclass", o); }
        return null;
    }

    public static final Constructor jconstr(Value o) {
        try {
            return (Constructor)((JavaObject)o).get();
        } catch (ClassCastException e) { typeError(S2JB, "jmethod", o); }
        return null;
    }

    public static final Method jmethod(Value o) {
        try {
            return (Method)((JavaObject)o).get();
        } catch (ClassCastException e) { typeError(S2JB, "jconstructor", o); }
        return null;
    }

    public static final Field jfield(Value o) {
        try {
            return (Field)((JavaObject)o).get();
        } catch (ClassCastException e) { typeError(S2JB, "jfield", o); }
        return null;
    }

    public static final JavaObject makeJObj(Object o) {
        if (o == null) throw new RuntimeException(liMessage(S2JB, "unexpectednull"));
        return new JavaObject(o);
    }

    public static final JavaObject makeJObj(Object o, Class c) {
        return (o == null) ? new JavaNull(c) : new JavaObject(o);
    }

    public static final Value objArrayToVec(Object[] objs) {
        Class c = objs.getClass().getComponentType();
        JavaObject[] res = new JavaObject[objs.length];
        for (int i=0; i < objs.length; i++) {
            res[i] = makeJObj(objs[i], c);
        }
        return new SchemeVector(res);
    }

    
    /**
     * Construct a class representing an array type for an array with
     * a certain component type and dimensions.
     *
     * The Java reflection API offers no easy way of doing this, so
     * instead we have to create an array instance of the specific
     * type with zero-length dimensions and then get its class.
     *
     * @param c component type of the array type
     * @param dims number of dimensions of the array type 
     * @return array type
     */
    public static Class makeArrayClass(Class c, int dims) {
        return Array.newInstance(c, new int[dims]).getClass();
    }
    
    /**
     * Map names of primitive types to their respective classes in
     * the reflection API.
     *
     * @param name primitive type name
     * @return class corresponding to the primitive type, or
     * <code>null</code> of the name was not recognized as that of a
     * primitive type
     */
    public static Class resolvePrimitiveType(String name) {
        //a hashtable might be faster here, but probably won't be.
        return
            name.equals("void")     ? Void.TYPE :
            name.equals("boolean")  ? Boolean.TYPE:
            name.equals("char")     ? Character.TYPE:
            name.equals("byte")     ? Byte.TYPE :
            name.equals("char")     ? Character.TYPE :
            name.equals("short")    ? Short.TYPE :
            name.equals("int")      ? Integer.TYPE :
            name.equals("long")     ? Long.TYPE :
            name.equals("float")    ? Float.TYPE :
            name.equals("double")   ? Double.TYPE :
            null;
    }

    /**
     * Map a type name to its corresponding class.
     *
     * At the center of this is the Class.forName method. However,
     * that method cannot handle primitive types and array types
     * (actually it can, but one needs to use the VM-internal type
     * coding scheme), so we handle these case separately.
     *
     * @param name type name
     * @return a <code>Class</code> value
     */
    public static Class resolveType(String name) {
        int idx = name.indexOf('[');
        if (idx != -1) {
            Class c = resolveType(name.substring(0, idx));
            return (c == null) ?
                null : makeArrayClass(c, (name.length()-idx)/2);
        }
        try {
            return Class.forName(name);
        } catch (ClassNotFoundException e) {
            return resolvePrimitiveType(name);
        }
    }

    /**
     * Map classes representing primitive types to their corresponding
     * <code>java.lang</code> classes.
     *
     * This is a hack so that we can pretend that primitive types are
     * assignable to their respective <code>java.lang</code> classes
     * and visa versa.
     *
     * @param c class
     * @return if <code>c</code> is a class representing a primitive
     * type then the corresponding <code>java.lang</code> class is
     * returned, otherwise the original class.
     */
    public static Class fixClass(Class c) {
        return
            c == Void.TYPE      ? Void.class :
            c == Boolean.TYPE   ? Boolean.class :
            c == Character.TYPE ? Character.class :
            c == Byte.TYPE      ? Byte.class :
            c == Short.TYPE     ? Short.class :
            c == Integer.TYPE   ? Integer.class :
            c == Long.TYPE      ? Long.class :
            c == Float.TYPE     ? Float.class :
            c == Double.TYPE    ? Double.class :
            c;
    }

    public static String mangleFieldName(String s) {
        int l = s.length();
        StringBuffer res = new StringBuffer(l);
        int prev = 0;
        int p;
        while ((p = s.indexOf('-', prev)) != -1) {
            res.append(s.substring(prev, p));
            prev = p+1;
            if (prev < l) {
                res.append(Character.toUpperCase(s.charAt(prev)));
                prev++;
            }
        }
        return res.append(s.substring(prev, l)).toString();
    }

    public static String mangleMethodName(String s) {
        int l = s.length();
        if (s.endsWith("!")) {
            s = s.substring(0, l-1);
            l--;
        }
        if (s.endsWith("?")) {
            s = "is-" + s.substring(0, l-1);
            l+=2;
        }

        return mangleFieldName(s);
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
