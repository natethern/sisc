package sisc.modules.s2j;

import java.lang.reflect.*;

import sisc.data.*;
import sisc.interpreter.*;

public class Reflection extends Util {

    protected static final int 
        JAVA_WRAP           =1,
        JAVA_UNWRAP         =2,
        JAVA_CLASS          =3,
        JAVA_SYNC           =4,

        JAVA_CONSTRUCTOR    =10,
        JAVA_METHOD         =11,
        JAVA_FIELD          =12,
        JAVA_CONSTRUCTORS   =13,
        JAVA_METHODS        =14,
        JAVA_FIELDS         =15,

        JAVA_DECL_CONSTRUCTOR   =20,
        JAVA_DECL_METHOD    =21,
        JAVA_DECL_FIELD     =22,
        JAVA_DECL_CONSTRUCTORS  =23,
        JAVA_DECL_METHODS   =24,
        JAVA_DECL_FIELDS    =25,

        JAVA_CLASSES        =30,
        JAVA_DECL_CLASSES   =31,
        JAVA_INTERFACES     =32,
        JAVA_SUPERCLASS     =33,
        JAVA_COMPONENT_TYPE =34,
        JAVA_INSTANCEQ      =35,
        JAVA_ASSIGNABLEQ    =36,

        JAVA_NAME           =40,
        JAVA_MODIFIERS      =41,
        JAVA_DECLARING_CLASS=42,
        JAVA_EXCEPTION_TYPES=43,
        JAVA_PARAMETER_TYPES=44,
        JAVA_RETURN_TYPE    =45,
        JAVA_FIELD_TYPE     =46,
        
        JAVA_OBJECTQ        =50,
        JAVA_CLASSQ         =51,
        JAVA_FIELDQ         =52,
        JAVA_METHODQ        =53,
        JAVA_CONSTRUCTORQ   =54,
        JAVA_INTERFACEQ     =55,
        JAVA_ARRAYQ         =56,
        JAVA_ARRAY_CLASSQ   =57,
        JAVA_NULLQ          =58,

        JAVA_CLASS_OF       =60,
        JAVA_ARRAY_CLASS    =61,
        JAVA_ARRAY_NEW      =62,
        JAVA_INV_HANDLER    =63,
        JAVA_PROXY          =64,
        JAVA_NULL           =66,
        JAVA_MANGLE_FIELD_NAME  =68,
        JAVA_MANGLE_METHOD_NAME =69;

    public Reflection() {

        define("java/wrap"          ,JAVA_WRAP);
        define("java/unwrap"        ,JAVA_UNWRAP);
        define("java/class"         ,JAVA_CLASS);
        define("java/synchronized"  ,JAVA_SYNC);

        define("java/constructor"   ,JAVA_CONSTRUCTOR);
        define("java/method"        ,JAVA_METHOD);
        define("java/field"         ,JAVA_FIELD);
        define("java/constructors"  ,JAVA_CONSTRUCTORS);
        define("java/methods"       ,JAVA_METHODS);
        define("java/fields"        ,JAVA_FIELDS);
        define("java/decl-constructor",JAVA_DECL_CONSTRUCTOR);
        define("java/decl-method"   ,JAVA_DECL_METHOD);
        define("java/decl-field"    ,JAVA_DECL_FIELD);
        define("java/decl-constructors",JAVA_DECL_CONSTRUCTORS);
        define("java/decl-methods"  ,JAVA_DECL_METHODS);
        define("java/decl-fields"   ,JAVA_DECL_FIELDS);

        define("java/classes"       ,JAVA_CLASSES);
        define("java/decl-classes"  ,JAVA_DECL_CLASSES);
        define("java/interfaces"    ,JAVA_INTERFACES);
        define("java/superclass"    ,JAVA_SUPERCLASS);
        define("java/component-type",JAVA_COMPONENT_TYPE);
        define("java/instance?"     ,JAVA_INSTANCEQ);
        define("java/assignable?"   ,JAVA_ASSIGNABLEQ);

        define("java/name"          ,JAVA_NAME);
        define("java/modifiers"     ,JAVA_MODIFIERS);
        define("java/declaring-class",JAVA_DECLARING_CLASS);
        define("java/exception-types",JAVA_EXCEPTION_TYPES);
        define("java/parameter-types",JAVA_PARAMETER_TYPES);
        define("java/return-type"   ,JAVA_RETURN_TYPE);
        define("java/field-type"    ,JAVA_FIELD_TYPE);

        define("java/object?"       ,JAVA_OBJECTQ);
        define("java/class?"        ,JAVA_CLASSQ);
        define("java/field?"        ,JAVA_FIELDQ);
        define("java/method?"       ,JAVA_METHODQ);
        define("java/constructor?"  ,JAVA_CONSTRUCTORQ);
        define("java/interface?"    ,JAVA_INTERFACEQ);
        define("java/array?"        ,JAVA_ARRAYQ);
        define("java/array-class?"  ,JAVA_ARRAY_CLASSQ);
        define("java/null?"         ,JAVA_NULLQ);

        define("java/class-of"      ,JAVA_CLASS_OF);
        define("java/array-class"   ,JAVA_ARRAY_CLASS);
        define("java/array-new"     ,JAVA_ARRAY_NEW);
        define("java/invocation-handler",JAVA_INV_HANDLER);
        define("java/proxy"         ,JAVA_PROXY);
        define("java/null"          ,JAVA_NULL);
        define("java/mangle-field-name"	,JAVA_MANGLE_FIELD_NAME);
        define("java/mangle-method-name",JAVA_MANGLE_METHOD_NAME);

    }

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            switch(primid) {
            case JAVA_NULL:
                return makeJObj(null, Object.class);
            }
        case 1:
            switch(primid) {
            case JAVA_WRAP:
                return makeJObj(f.vlr[0], Value.class);
            case JAVA_UNWRAP:
                return (Value)jobj(f.vlr[0]);
            case JAVA_CLASS:
                String cname = symval(f.vlr[0]);
                Class c = resolveType(cname);
                if (c == null)
                    throw new RuntimeException(liMessage(S2JB, "classnotfound", cname));
                else return makeJObj(c, Class.class);
            case JAVA_CONSTRUCTORS:
                return objArrayToVec(jclass(f.vlr[0]).getConstructors());
            case JAVA_METHODS:
                return objArrayToVec(jclass(f.vlr[0]).getMethods());
            case JAVA_FIELDS:
                return objArrayToVec(jclass(f.vlr[0]).getFields());
            case JAVA_DECL_CONSTRUCTORS:
                return objArrayToVec(jclass(f.vlr[0]).getDeclaredConstructors());
            case JAVA_DECL_METHODS:
                return objArrayToVec(jclass(f.vlr[0]).getDeclaredMethods());
            case JAVA_DECL_FIELDS:
                return objArrayToVec(jclass(f.vlr[0]).getDeclaredFields());
            case JAVA_CLASSES:
                return objArrayToVec(jclass(f.vlr[0]).getClasses());
            case JAVA_DECL_CLASSES:
                return objArrayToVec(jclass(f.vlr[0]).getDeclaredClasses());
            case JAVA_INTERFACES:
                return objArrayToVec(jclass(f.vlr[0]).getInterfaces());
            case JAVA_SUPERCLASS:
                return makeJObj(jclass(f.vlr[0]).getSuperclass(), Class.class);
            case JAVA_COMPONENT_TYPE:
                return makeJObj(jclass(f.vlr[0]).getComponentType(), Class.class);
            case JAVA_NAME:
                switch (jtype(f.vlr[0])) {
                case JavaObject.JCLASS:
                    return Symbol.intern(jclass(f.vlr[0]).getName());
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
                    return objArrayToVec(jconstr(f.vlr[0]).getExceptionTypes());
                case JavaObject.JMETHOD:
                default:
                    return objArrayToVec(jmethod(f.vlr[0]).getExceptionTypes());
                }
            case JAVA_PARAMETER_TYPES:
                switch (jtype(f.vlr[0])) {
                case JavaObject.JCONSTR:
                    return objArrayToVec(jconstr(f.vlr[0]).getParameterTypes());
                case JavaObject.JMETHOD:
                default:
                    return objArrayToVec(jmethod(f.vlr[0]).getParameterTypes());
                }
            case JAVA_RETURN_TYPE:
                return makeJObj(jmethod(f.vlr[0]).getReturnType(), Class.class);
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
                return makeJObj(new SchemeInvocation(f.ctx, proc(f.vlr[0])), SchemeInvocation.class);
            case JAVA_NULL:
                return makeJObj(null, jclass(f.vlr[0]));
            case JAVA_MANGLE_FIELD_NAME:
                return Symbol.intern(mangleFieldName(symval(f.vlr[0])));
            case JAVA_MANGLE_METHOD_NAME:
                return Symbol.intern(mangleMethodName(symval(f.vlr[0])));
            }
        case 2:
            switch(primid) {
            case JAVA_SYNC:
                synchronized(jobj(f.vlr[0])) {
                    Interpreter i=Context.enter();
                    try {
                        return i.eval(proc(f.vlr[1]), ZV);
                    } catch (SchemeException se) {
                        throwNestedPrimException(se);
                    } finally {
                        Context.exit();
                    }
                }
                return VOID;
            case JAVA_FIELD:
                try {
                    return makeJObj(jclass(f.vlr[0]).getField(symval(f.vlr[1])), Field.class);
                } catch (NoSuchFieldException e) {
                    return FALSE;
                }
            case JAVA_DECL_FIELD:
                try {
                    return makeJObj(jclass(f.vlr[0]).getDeclaredField(symval(f.vlr[1])), Field.class);
                } catch (NoSuchFieldException e) {
                    return FALSE;
                }
            case JAVA_INSTANCEQ:
                return truth(fixClass(jclass(f.vlr[0])).isInstance(jobj(f.vlr[1])));
            case JAVA_ASSIGNABLEQ:
                return truth(fixClass(jclass(f.vlr[0])).isAssignableFrom(fixClass(jclass(f.vlr[1]))));
            case JAVA_ARRAY_CLASS:
                return makeJObj(makeArrayClass(jclass(f.vlr[0]), num(f.vlr[1]).intValue()), Class.class);
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
                    intDims[i] = num(dimensions[i]).intValue();
                }
                Class componentType = jclass(f.vlr[0]);
                return makeJObj(Array.newInstance(componentType, intDims),
                                makeArrayClass(componentType, intDims.length));
            }
        default:
            switch(primid) {
            case JAVA_CONSTRUCTOR:
                try {
                    Class[] paramTypes = new Class[f.vlr.length-1];
                    for (int i=0; i<f.vlr.length-1; i++) {
                        paramTypes[i] = jclass(f.vlr[i+1]);
                    }
                    return makeJObj(jclass(f.vlr[0]).getConstructor(paramTypes), Constructor.class);
                } catch (NoSuchMethodException e) {
                    return FALSE;
                }
            case JAVA_METHOD:
                try {
                    Class[] paramTypes = new Class[f.vlr.length-2];
                    for (int i=0; i<f.vlr.length-2; i++) {
                        paramTypes[i] = jclass(f.vlr[i+2]);
                    }
                    return makeJObj(jclass(f.vlr[0]).getMethod(symval(f.vlr[1]),paramTypes), Method.class);
                } catch (NoSuchMethodException e) {
                    return FALSE;
                }
            case JAVA_DECL_CONSTRUCTOR:
                try {
                    Class[] paramTypes = new Class[f.vlr.length-1];
                    for (int i=0; i<f.vlr.length-1; i++) {
                        paramTypes[i] = jclass(f.vlr[i+1]);
                    }
                    return makeJObj(jclass(f.vlr[0]).getDeclaredConstructor(paramTypes), Constructor.class);
                } catch (NoSuchMethodException e) {
                    return FALSE;
                }
            case JAVA_DECL_METHOD:
                try {
                    Class[] paramTypes = new Class[f.vlr.length-2];
                    for (int i=0; i<f.vlr.length-2; i++) {
                        paramTypes[i] = jclass(f.vlr[i+2]);
                    }
                    return makeJObj(jclass(f.vlr[0]).getDeclaredMethod(symval(f.vlr[1]),paramTypes), Method.class);
                } catch (NoSuchMethodException e) {
                    return FALSE;
                }
            case JAVA_PROXY:
                Class[] interfaces = new Class[f.vlr.length];
                for (int i=0; i<f.vlr.length; i++) {
                    interfaces[i] = jclass(f.vlr[i]);
                }
                return makeJObj(Proxy.getProxyClass(getClassLoader(), interfaces), Class.class);
            default:
                throwArgSizeException();
            }
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
