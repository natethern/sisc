package sisc.modules.s2j;

import java.lang.reflect.*;

import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.IndexedLibraryAdapter;

public class Reflection extends Util {

    protected static final int
        JAVA_WRAP = 1,
        JAVA_UNWRAP = 2,
        JAVA_CLASS = 3,
        JAVA_SYNC = 4,

        JAVA_CONSTRUCTORS = 5,
        JAVA_METHODS = 6,
        JAVA_FIELDS = 7,
        JAVA_CLASSES = 8,

        JAVA_INTERFACES = 9,
        JAVA_SUPERCLASS = 10,
        JAVA_COMPONENT_TYPE = 11,
        JAVA_INSTANCEQ = 12,
        JAVA_ASSIGNABLEQ = 13,

        JAVA_NAME = 14,
        JAVA_MODIFIERS = 15,
        JAVA_DECLARING_CLASS = 16,
        JAVA_EXCEPTION_TYPES = 17,
        JAVA_PARAMETER_TYPES = 18,
        JAVA_RETURN_TYPE = 19,
        JAVA_FIELD_TYPE = 20,

        JAVA_OBJECTQ = 21,
        JAVA_CLASSQ = 22,
        JAVA_FIELDQ = 23,
        JAVA_METHODQ = 24,
        JAVA_CONSTRUCTORQ = 25,
        JAVA_INTERFACEQ = 26,
        JAVA_ARRAYQ = 27,
        JAVA_ARRAY_CLASSQ = 28,
        JAVA_NULLQ = 29,

        JAVA_CLASS_OF = 30,
        JAVA_ARRAY_CLASS = 31,
        JAVA_ARRAY_NEW = 32,
        JAVA_INV_HANDLER = 33,
        JAVA_PROXY_CLASS = 34,
        JAVA_NULL = 35,
        JAVA_MANGLE_FIELD_NAME = 36,
        JAVA_MANGLE_METHOD_NAME = 37,

        JAVA_INVOKE_CONSTRUCTOR = 38,
        JAVA_INVOKE_METHOD = 39,
        JAVA_GET_FIELD = 40,
        JAVA_SET_FIELD = 41;

    public static class Index extends IndexedLibraryAdapter {

        public Value construct(int id) {
            return new Reflection(id);
        }

        public Index() {
            define("java/wrap", JAVA_WRAP);
            define("java/unwrap", JAVA_UNWRAP);
            define("java/class", JAVA_CLASS);
            define("java/synchronized", JAVA_SYNC);

            define("java/constructors", JAVA_CONSTRUCTORS);
            define("java/methods", JAVA_METHODS);
            define("java/fields", JAVA_FIELDS);
            define("java/classes", JAVA_CLASSES);

            define("java/interfaces", JAVA_INTERFACES);
            define("java/superclass", JAVA_SUPERCLASS);
            define("java/component-type", JAVA_COMPONENT_TYPE);
            define("java/instance?", JAVA_INSTANCEQ);
            define("java/assignable?", JAVA_ASSIGNABLEQ);

            define("java/name", JAVA_NAME);
            define("java/modifiers", JAVA_MODIFIERS);
            define("java/declaring-class", JAVA_DECLARING_CLASS);
            define("java/exception-types", JAVA_EXCEPTION_TYPES);
            define("java/parameter-types", JAVA_PARAMETER_TYPES);
            define("java/return-type", JAVA_RETURN_TYPE);
            define("java/field-type", JAVA_FIELD_TYPE);

            define("java/object?", JAVA_OBJECTQ);
            define("java/class?", JAVA_CLASSQ);
            define("java/field?", JAVA_FIELDQ);
            define("java/method?", JAVA_METHODQ);
            define("java/constructor?", JAVA_CONSTRUCTORQ);
            define("java/interface?", JAVA_INTERFACEQ);
            define("java/array?", JAVA_ARRAYQ);
            define("java/array-class?", JAVA_ARRAY_CLASSQ);
            define("java/null?", JAVA_NULLQ);

            define("java/class-of", JAVA_CLASS_OF);
            define("java/array-class", JAVA_ARRAY_CLASS);
            define("java/array-new", JAVA_ARRAY_NEW);
            define("java/invocation-handler", JAVA_INV_HANDLER);
            define("java/proxy-class", JAVA_PROXY_CLASS);
            define("java/null", JAVA_NULL);
            define("java/mangle-field-name", JAVA_MANGLE_FIELD_NAME);
            define("java/mangle-method-name", JAVA_MANGLE_METHOD_NAME);

            define("java/invoke-constructor", JAVA_INVOKE_CONSTRUCTOR);
            define("java/invoke-method", JAVA_INVOKE_METHOD);
            define("java/get-field", JAVA_GET_FIELD);
            define("java/set-field", JAVA_SET_FIELD);
        }
    }
    
    public Reflection(int id) {
        super(id);
    }
    
    public Reflection() {}
    
    public Value doApply(Interpreter f) throws ContinuationException {
        SIZESWITCH: switch(f.vlr.length) {
        case 0:
            switch(id) {
            case JAVA_NULL:
                return makeJObj(null, Object.class);
            default: break SIZESWITCH;
            }
        case 1:
            switch(id) {
            case JAVA_WRAP:
                return makeJObj(f.vlr[0], Value.class);
            case JAVA_UNWRAP:
                return (Value)jobj(f.vlr[0]);
            case JAVA_CLASS:
                String cname = symval(f.vlr[0]);
                Class c = resolveType(cname, f.dynenv.getClassLoader());
                if (c == null)
                    throw new RuntimeException(liMessage(S2JB, "classnotfound", cname));
                else return makeJObj(c, Class.class);
            case JAVA_CONSTRUCTORS:
                try {
                    return objectsToList(jclass(f.vlr[0]).getDeclaredConstructors());
                } catch (SecurityException e) {
                    throw new RuntimeException(liMessage(S2JB, "constructoraccess",
                                                         Util.nameType(jclass(f.vlr[0]))));
                }
            case JAVA_METHODS:
                try {
                    return objectsToList(jclass(f.vlr[0]).getDeclaredMethods());
                } catch (SecurityException e) {
                    throw new RuntimeException(liMessage(S2JB, "methodaccess",
                                                         Util.nameType(jclass(f.vlr[0]))));
                }
            case JAVA_FIELDS:
                try {
                    return objectsToList(jclass(f.vlr[0]).getDeclaredFields());
                } catch (SecurityException e) {
                    throw new RuntimeException(liMessage(S2JB, "fieldaccess",
                                                         Util.nameType(jclass(f.vlr[0]))));
                }
            case JAVA_CLASSES:
                try {
                    return objectsToList(jclass(f.vlr[0]).getDeclaredClasses());
                } catch (SecurityException e) {
                    throw new RuntimeException(liMessage(S2JB, "classaccess",
                                                         Util.nameType(jclass(f.vlr[0]))));
                }
            case JAVA_INTERFACES:
                return objectsToList(jclass(f.vlr[0]).getInterfaces());
            case JAVA_SUPERCLASS:
                return makeJObj(jclass(f.vlr[0]).getSuperclass(), Class.class);
            case JAVA_COMPONENT_TYPE:
                return makeJObj(jclass(f.vlr[0]).getComponentType(), Class.class);
            case JAVA_NAME:
                switch (jtype(f.vlr[0])) {
                case JavaObject.JCLASS:
                    return Symbol.intern(Util.nameType(jclass(f.vlr[0])));
                default:
                    return Symbol.intern(((Member)jobj(f.vlr[0])).getName());
                }
            case JAVA_MODIFIERS:
                int mods = 0;
                switch (jtype(f.vlr[0])) {
                case JavaObject.JCLASS:
                    mods = jclass(f.vlr[0]).getModifiers();
                    break;
                default:
                    mods = ((Member)jobj(f.vlr[0])).getModifiers();
                    break;
                }
                String smods = Modifier.toString(mods);
                Pair p = EMPTYLIST;
                if (smods.length() == 0) return p;
                for(int idx = smods.length(), nidx=0; nidx>=0; idx = nidx) {
                    nidx = smods.lastIndexOf(' ', idx-1);
                    p = new Pair(Symbol.intern(smods.substring(nidx+1, idx)), p);
                }
                return p;
            case JAVA_DECLARING_CLASS:
                switch (jtype(f.vlr[0])) {
                case JavaObject.JCLASS:
                    return makeJObj(jclass(f.vlr[0]).getDeclaringClass(), Class.class);
                default:
                    return makeJObj(((Member)jobj(f.vlr[0])).getDeclaringClass(), Class.class);
                }
            case JAVA_EXCEPTION_TYPES:
                switch (jtype(f.vlr[0])) {
                case JavaObject.JCONSTR:
                    return objectsToList(jconstr(f.vlr[0]).getExceptionTypes());
                case JavaObject.JMETHOD:
                default:
                    return objectsToList(jmethod(f.vlr[0]).getExceptionTypes());
                }
            case JAVA_PARAMETER_TYPES:
                switch (jtype(f.vlr[0])) {
                case JavaObject.JCONSTR:
                    return objectsToList(jconstr(f.vlr[0]).getParameterTypes());
                case JavaObject.JMETHOD:
                default:
                    return objectsToList(jmethod(f.vlr[0]).getParameterTypes());
                }
            case JAVA_RETURN_TYPE:
                switch (jtype(f.vlr[0])) {
                case JavaObject.JCONSTR:
                    return makeJObj(jclass(f.vlr[0]).getDeclaringClass(), Class.class);
                case JavaObject.JMETHOD:
                default:
                    return makeJObj(jmethod(f.vlr[0]).getReturnType(), Class.class);
                }
            case JAVA_FIELD_TYPE:
                return makeJObj(jfield(f.vlr[0]).getType(), Class.class);
            case JAVA_OBJECTQ:
                return truth(f.vlr[0] instanceof JavaObject);
            case JAVA_CLASSQ:
                return truth(f.vlr[0] instanceof JavaObject &&
                             jtype(f.vlr[0]) == JavaObject.JCLASS);
            case JAVA_FIELDQ:
                return truth(f.vlr[0] instanceof JavaObject &&
                             jtype(f.vlr[0]) == JavaObject.JFIELD);
            case JAVA_METHODQ:
                return truth(f.vlr[0] instanceof JavaObject &&
                             jtype(f.vlr[0]) == JavaObject.JMETHOD);
            case JAVA_CONSTRUCTORQ:
                return truth(f.vlr[0] instanceof JavaObject &&
                             jtype(f.vlr[0]) == JavaObject.JCONSTR);
            case JAVA_ARRAYQ:
                return truth(f.vlr[0] instanceof JavaObject &&
                             jtype(f.vlr[0]) == JavaObject.JARRAY);
            case JAVA_NULLQ:
                return truth(f.vlr[0] instanceof JavaObject &&
                             jtype(f.vlr[0]) == JavaObject.JNULL);
            case JAVA_INTERFACEQ:
                return truth(f.vlr[0] instanceof JavaObject &&
                             jtype(f.vlr[0]) == JavaObject.JCLASS &&
                             jclass(f.vlr[0]).isInterface());
            case JAVA_ARRAY_CLASSQ:
                return truth(f.vlr[0] instanceof JavaObject &&
                             jtype(f.vlr[0]) == JavaObject.JCLASS &&
                             jclass(f.vlr[0]).isArray());
            case JAVA_CLASS_OF:
                return makeJObj(sjobj(f.vlr[0]).classOf(), Class.class);
            case JAVA_INV_HANDLER:
                return makeJObj(new SchemeInvocation(f.dynenv.copy(), proc(f.vlr[0])), SchemeInvocation.class);
            case JAVA_NULL:
                return makeJObj(null, jclass(f.vlr[0]));
            case JAVA_MANGLE_FIELD_NAME:
                return Symbol.intern(mangleFieldName(symval(f.vlr[0])));
            case JAVA_MANGLE_METHOD_NAME:
                return Symbol.intern(mangleMethodName(symval(f.vlr[0])));
            default: break SIZESWITCH;
            }
        case 2:
            switch(id) {
            case JAVA_SYNC:
                synchronized(jobj(f.vlr[0])) {
                    Interpreter i=Context.enter(f);
                    try {
                        return i.eval(proc(f.vlr[1]), ZV);
                    } catch (SchemeException se) {
                        throwNestedPrimException(se);
                    } finally {
                        Context.exit();
                    }
                }
                return VOID;
            case JAVA_INSTANCEQ:
                return truth(((f.vlr[1] instanceof JavaPrimitive) ?
                              fixClass(jclass(f.vlr[0])) :
                              jclass(f.vlr[0])).isInstance(jobj(f.vlr[1])));
            case JAVA_ASSIGNABLEQ:
                Class c1 = jclass(f.vlr[1]);
                Class c1Fixed = fixClass(c1);
                return truth(((c1 != c1Fixed) ?
                              fixClass(jclass(f.vlr[0])) :
                              jclass(f.vlr[0])).isAssignableFrom(c1Fixed));
            case JAVA_ARRAY_CLASS:
                try {
                    return makeJObj(makeArrayClass(jclass(f.vlr[0]), num(f.vlr[1]).indexValue()), Class.class);
                } catch (NullPointerException e) {
                    throw new RuntimeException(liMessage(S2JB, "arraytypenull"));
                } catch (IllegalArgumentException e) {
                    throw new RuntimeException(liMessage(S2JB, "arraytypevoid"));
                } catch (NegativeArraySizeException e) {
                    throw new RuntimeException(liMessage(S2JB, "arraynegative",
                                                         f.vlr[1].toString()));
                }
            case JAVA_ARRAY_NEW:
                Value dims = f.vlr[1];
                Value[] dimensions;
                if (dims instanceof Pair) {
                    dimensions = pairToValues(pair(dims));
                } else if (dims instanceof SchemeVector) {
                    dimensions = vec(dims).vals;
                } else {
                    dimensions = new Value[]{dims};
                }
                int[] intDims = new int[dimensions.length];
                for (int i=0; i< dimensions.length; i++) {
                    intDims[i] = num(dimensions[i]).indexValue();
                }
                Class componentType = jclass(f.vlr[0]);
                try {
                    return makeJObj(Array.newInstance(componentType, intDims),
                                    makeArrayClass(componentType, intDims.length));
                } catch (NullPointerException e) {
                    throw new RuntimeException(liMessage(S2JB, "arraytypenull"));
                } catch (IllegalArgumentException e) {
                    throw new RuntimeException(liMessage(S2JB, "arraytypevoid"));
                } catch (NegativeArraySizeException e) {
                    throw new RuntimeException(liMessage(S2JB, "arraynegative",
                                                         dims.toString()));
                }
            case JAVA_INVOKE_CONSTRUCTOR:
                Constructor jc = jconstr(f.vlr[0]);
                try {
                    return Util.makeJObj(jc.newInstance(pairToObjects(pair(f.vlr[1]))),
                                         jc.getDeclaringClass());
                } catch (InstantiationException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "constructorabstract",
                                                         jc.toString(),
                                                         Util.nameType(jc.getDeclaringClass())));
                } catch (IllegalAccessException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalaccess", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jconstructor"), 
                                                             jc.toString(), 
                                                             Util.nameType(jc.getDeclaringClass())}));
                } catch (IllegalArgumentException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalargument", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jconstructor"), 
                                                             jc.toString(), 
                                                             Util.nameType(jc.getDeclaringClass()),
                                                             f.vlr[1].toString()}));
                } catch (InvocationTargetException e) {
                    error(f, Util.makeJObj(e.getTargetException(), Throwable.class));
                }
            case JAVA_GET_FIELD:
                Field jf = jfield(f.vlr[0]);
                try {
                    return Util.makeJObj(jf.get(jobj(f.vlr[1])),
                                         jf.getType());
                } catch (NullPointerException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalnull", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jfield"), 
                                                             jf.toString(),
                                                             Util.nameType(jf.getDeclaringClass())}));
                } catch (IllegalAccessException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalaccess", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jfield"), 
                                                             jf.toString(), 
                                                             Util.nameType(jf.getDeclaringClass())}));
                } catch (IllegalArgumentException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalargument", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jfield"), 
                                                             jf.toString(), 
                                                             Util.nameType(jf.getDeclaringClass()),
                                                             f.vlr[1].toString()}));
                }
            default: break SIZESWITCH;
            }
        case 3:
            switch(id) {
            case JAVA_INVOKE_METHOD:
                Method jm = jmethod(f.vlr[0]);
                try {
                    return Util.makeJObj(jm.invoke(jobj(f.vlr[1]), pairToObjects(pair(f.vlr[2]))),
                                         jm.getReturnType());
                } catch (NullPointerException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalnull", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jmethod"), 
                                                             jm.toString(),
                                                             Util.nameType(jm.getDeclaringClass())}));
                } catch (IllegalAccessException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalaccess", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jmethod"), 
                                                             jm.toString(), 
                                                             Util.nameType(jm.getDeclaringClass())}));
                } catch (IllegalArgumentException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalargument", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jmethod"), 
                                                             jm.toString(), 
                                                             Util.nameType(jm.getDeclaringClass()),
                                                             f.vlr[1].toString()}));
                } catch (InvocationTargetException e) {
                    error(f, Util.makeJObj(e.getTargetException(), Throwable.class));
                }
            case JAVA_SET_FIELD:
                Field jf = jfield(f.vlr[0]); 
                try {
                    jf.set(jobj(f.vlr[1]), jobj(f.vlr[2]));
                    return VOID;
                } catch (NullPointerException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalnull", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jfield"), 
                                                             jf.toString(),
                                                             Util.nameType(jf.getDeclaringClass())}));
                } catch (IllegalAccessException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalaccess", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jfield"), 
                                                             jf.toString(), 
                                                             Util.nameType(jf.getDeclaringClass())}));
                } catch (IllegalArgumentException e) {
                    throw new RuntimeException(liMessage(Util.S2JB, "illegalargument", 
                                                         new Object[] {
                                                             liMessage(Util.S2JB, "jfield"), 
                                                             jf.toString(), 
                                                             Util.nameType(jf.getDeclaringClass()),
                                                             f.vlr[1].toString()}));
                }
            default: break SIZESWITCH;
            }
        }
        switch(id) {
        case JAVA_PROXY_CLASS:
            Class[] interfaces = new Class[f.vlr.length];
            for (int i=0; i<f.vlr.length; i++) {
                interfaces[i] = jclass(f.vlr[i]);
            }
            try {
                return makeJObj(Proxy.getProxyClass(f.dynenv.getClassLoader(), interfaces), Class.class);
            } catch (IllegalArgumentException e) {
                throw new RuntimeException(liMessage(Util.S2JB, "proxyinterfaceillegal"));
            } catch (NullPointerException e) {
                throw new RuntimeException(liMessage(Util.S2JB, "proxyinterfacenull"));
            }
        default:
            throwArgSizeException();
        }
        return VOID;
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
