package sisc.modules;

import sisc.*;
import sisc.data.*;
import sisc.exprs.*;
import java.lang.reflect.*;
import java.io.*;
import java.util.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class S2J extends ModuleAdapter {

    private static final String moduleName = "S2J";

    private static final Symbol S2JB = Symbol.intern(moduleName);

    public String getModuleName() {
        return moduleName;
    }

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
        JAVA_DECL_CONSTRUCTOR=16,
        JAVA_DECL_METHOD    =17,
        JAVA_DECL_FIELD     =18,
        JAVA_DECL_CONSTRUCTORS=19,
        JAVA_DECL_METHODS   =20,
        JAVA_DECL_FIELDS    =21,

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
        JAVA_NEW            =65,
        JAVA_SET            =66,
        JAVA_MANGLE         =67,

        CONV_JBOOLEAN       =100,
        CONV_JCHAR          =101,
        CONV_JBYTE          =102,
        CONV_JSHORT         =103,
        CONV_JINT           =104,
        CONV_JLONG          =105,
        CONV_JFLOAT         =106,
        CONV_JDOUBLE        =107,
        CONV_JSTRING        =108,
        CONV_JARRAY         =109,

        CONV_BOOLEAN        =120,
        CONV_CHARACTER      =121,
        CONV_NUMBER         =122,
        CONV_STRING         =123,
        CONV_SYMBOL         =124,
        CONV_VECTOR         =125,
        CONV_LIST           =126;    

    public S2J() {

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
        define("java/new"           ,JAVA_NEW);
        define("java/set!"          ,JAVA_SET);
        define("java/mangle-name"	,JAVA_MANGLE);

        define("->jboolean"         ,CONV_JBOOLEAN);
        define("->jchar"            ,CONV_JCHAR);
        define("->jbyte"            ,CONV_JBYTE);
        define("->jshort"           ,CONV_JSHORT);
        define("->jint"             ,CONV_JINT);
        define("->jlong"            ,CONV_JLONG);
        define("->jfloat"           ,CONV_JFLOAT);
        define("->jdouble"          ,CONV_JDOUBLE);
        define("->jstring"          ,CONV_JSTRING);
        define("->jarray"           ,CONV_JARRAY);

        define("->boolean"          ,CONV_BOOLEAN);
        define("->character"        ,CONV_CHARACTER);
        define("->number"           ,CONV_NUMBER);
        define("->string"           ,CONV_STRING);
        define("->symbol"           ,CONV_SYMBOL);
        define("->vector"           ,CONV_VECTOR);
        define("->list"             ,CONV_LIST);

    }

    public static class JavaObject extends Procedure {

        public Object obj;

        public static final byte
            JUNKN   = 0,
            JNULL   = 1,
            JCLASS  = 2,
            JFIELD  = 3,
            JMETHOD = 4,
            JCONSTR = 5,
            JARRAY  = 6,
            JOBJ    = 7;

        protected byte objType = JUNKN;

        public final byte getObjType() {
            //we do not need to make this synchronized since we are only
            //accessing a byte
            if (objType == JUNKN)
                objType = obj == null ? JNULL:
                    (obj instanceof Class ? JCLASS :
                     (obj instanceof Field ? JFIELD :
                      (obj instanceof Method ? JMETHOD :
                       (obj instanceof Constructor ? JCONSTR :
                        (obj.getClass().isArray() ? JARRAY :
                         JOBJ)))));
            return objType;
        }

        public JavaObject() {}

        public void serialize(Serializer s) throws IOException {
            byte ty = getObjType();
            s.writeByte(ty);
            switch (ty) {
            case JNULL:
                break;
            case JCLASS: {
                s.writeUTF(((Class)obj).getName());
                break;
            }
            case JFIELD: {
                Field f = (Field)obj;
                s.writeUTF(f.getDeclaringClass().getName());
                s.writeUTF(f.getName());
                break;
            }
            case JMETHOD: {
                Method m = (Method)obj;
                s.writeUTF(m.getDeclaringClass().getName());
                s.writeUTF(m.getName());
                Class[] types = m.getParameterTypes();
                s.writeInt(types.length);
                for (int i=0; i < types.length; i++) {
                    s.writeUTF(types[i].getName());
                }
                break;
            }
            case JCONSTR: {
                Constructor c = (Constructor)obj;
                s.writeUTF(c.getDeclaringClass().getName());
                Class[] types = c.getParameterTypes();
                s.writeInt(types.length);
                for (int i=0; i < types.length; i++) {
                    s.writeUTF(types[i].getName());
                }
                break;
            }
            default:
                throw new RuntimeException(liMessage(S2JB, "cannotserialize"));
            }
        }

        public void deserialize(Deserializer s) throws IOException {
            byte ty = s.readByte();
            switch (ty) {
            case JNULL: {
                obj = null;
                break;
            }
            case JCLASS: {
                obj = resolveType(s.readUTF());
                break;
            }
            case JFIELD:
                try {
                    Class c = resolveType(s.readUTF());
                    obj = c.getDeclaredField(s.readUTF());
                } catch (NoSuchFieldException e) {
                    throw new RuntimeException(liMessage(S2JB, "cannotdeserialize"));
                }
                break;
            case JMETHOD:
                try {
                    Class c = resolveType(s.readUTF());
                    String n = s.readUTF();
                    int l = s.readInt();
                    Class types[] = new Class[l];
                    for (int i=0; i < l; i++) {
                        types[i] = resolveType(s.readUTF());
                    }
                    obj = c.getDeclaredMethod(n, types);
                } catch (NoSuchMethodException e) {
                    throw new RuntimeException(liMessage(S2JB, "cannotdeserialize"));
                }
                break;
            case JCONSTR:
                try {
                    Class c = resolveType(s.readUTF());
                    int l = s.readInt();
                    Class types[] = new Class[l];
                    for (int i=0; i < l; i++) {
                        types[i] = resolveType(s.readUTF());
                    }
                    obj = c.getDeclaredConstructor(types);
                } catch (NoSuchMethodException e) {
                    throw new RuntimeException(liMessage(S2JB, "cannotdeserialize"));
                }
                break;
            default:
                throw new RuntimeException(liMessage(S2JB, "cannotdeserialize"));
            }
        }

        public JavaObject(Object o) {
            this.obj = o;
        }

        public void set(Object o) {
            this.obj = o;
            this.objType = JUNKN;
        }

        public String display() {
            StringBuffer b=new StringBuffer();
            b.append("#<java ");
            if (obj==null)
                b.append("null");
            else {
                b.append(obj.getClass().getName());
                b.append(" ");
                b.append(obj);
            }
            b.append('>');
            return b.toString();
        }

        public int hashCode() {
            return (obj == null) ? 0 : obj.hashCode();
        }

        public boolean eq(Object v) {
            return super.eq(v) || (v instanceof JavaObject
                                   && ((JavaObject)v).obj == obj);
        }

        public boolean equals(Object v) {
            if (obj == null)
                return v == null;
            return (v instanceof JavaObject) &&
                obj.equals(((JavaObject)v).obj);
        }

        public void apply(Interpreter r)
            throws ContinuationException {
            r.nxp = null;
            try {
                switch(getObjType()) {
                case JCLASS:    r.acc = apply((Class)obj, r.vlr); break;
                case JFIELD:    r.acc = apply((Field)obj, r.vlr); break;
                case JMETHOD:   r.acc = apply((Method)obj, r.vlr); break;
                case JCONSTR:   r.acc = apply((Constructor)obj, r.vlr); break;
                case JARRAY:    r.acc = applyArray(obj, r.vlr); break;
                case JOBJ:      r.acc = apply(obj, r.vlr); break;
                case JNULL:
                    error(r, liMessage(S2JB, "cannotapplynull"));
                default:
                    error(r, liMessage(S2JB, "cannotapplyobject", obj.toString()));
                }
            } catch (InvocationTargetException e) {
                error(r, new JavaObject(e.getTargetException()));
            } catch (RuntimeException e) {
                e.printStackTrace(System.err);
                error(r, e.getMessage());
            } catch (Exception e) {
                e.printStackTrace(System.err);
                error(r, e.getMessage());
            }
        }

        protected static final Value apply(Class obj, Value[] arg) {
            try {
                switch (arg.length) {
                case 0: //instantiate class
                    return new JavaObject(obj.newInstance());
                case 1: //get value of static field
                    return new JavaObject(obj.getField(symval(arg[0])).get(null));
                case 2: //set value of static field
                    obj.getField(symval(arg[0])).set(null,jobj(arg[1]));
                    return VOID;
                default:
                    throw new RuntimeException(liMessage(S2JB, "zerotwoargs", liMessage(S2JB, "jclass"), obj.toString()));
                }
            } catch (InstantiationException e) {
                throw new RuntimeException(liMessage(S2JB, "errorinstantiating", obj.toString()));
            } catch (IllegalAccessException e) {
                throw new RuntimeException(liMessage(S2JB, "illegalaccess", liMessage(S2JB, "jconstructor"), "default", obj.toString()));
            } catch (NoSuchFieldException e) {
                throw new RuntimeException(liMessage(S2JB, "nosuchfield", arg[0].toString(), obj.toString()));
            }
        }

        protected static final Value apply(Field obj, Value[] args) {
            try {
                switch (args.length) {
                case 1: //get value
                    return new JavaObject(obj.get(jobj(args[0])));
                case 2: //set value
                    obj.set(jobj(args[0]), jobj(args[1]));
                    return VOID;
                default:
                    throw new RuntimeException(liMessage(S2JB, "onetwoargs", liMessage(S2JB, "jfield"), obj.toString()));
                }
            } catch (IllegalAccessException e) {
                throw new RuntimeException(liMessage(S2JB, "illegalaccess", liMessage(S2JB, "jfield"), obj.toString(), args[0].toString()));
            }
        }

        protected static final Value apply(Method obj, Value[] args)
            throws InvocationTargetException {
            Object o = jobj(args[0]);
            Object params[] = new Object[args.length-1];
            for (int i=0; i < args.length-1; i++) {
                params[i] = jobj(args[i+1]);
            }
            try {
                return new JavaObject(obj.invoke(o,params));
            } catch (IllegalAccessException e) {
                throw new RuntimeException(liMessage(S2JB, "illegalaccess", liMessage(S2JB, "jmethod"), obj.toString(), o.toString()));
            }
        }

        protected static final Value apply(Constructor obj, Value[] args)
            throws InvocationTargetException {
            Object params[] = new Object[args.length];
            for (int i=0; i < args.length; i++) {
                params[i] = jobj(args[i]);
            }
            try {
                return new JavaObject(obj.newInstance(params));
            } catch (InstantiationException e) {
                throw new RuntimeException(liMessage(S2JB, "constructorerror", obj.toString(), obj.getDeclaringClass().getName()));
            } catch (IllegalAccessException e) {
                throw new RuntimeException(liMessage(S2JB, "illegalaccess", liMessage(S2JB, "jconstructor"), obj.toString(), obj.getDeclaringClass().getName()));
            }
        }

        protected static final Value applyArray(Object obj, Value[] args) {
            switch (args.length) {
            case 1: //get element
                if (args[0] instanceof Pair) {
                    for (Pair p = pair(args[0]); p != EMPTYLIST; p = pair(p.cdr)) {
                        obj = Array.get(obj, num(p.car).intValue());
                    }
                } else if (args[0] instanceof SchemeVector) {
                    Value[] vals = ((SchemeVector)args[0]).vals;
                    for (int i=0; i < vals.length; i++) {
                        obj = Array.get(obj,num(vals[i]).intValue());
                    }
                } else {
                    obj = Array.get(obj,num(args[0]).intValue());
                }
                return new JavaObject(obj);
            case 2: //set element
                Value idx = null;
                if (args[0] instanceof Pair) {
                    Pair p = pair(args[0]);
                    if (p == EMPTYLIST) return VOID;
                    for (; p.cdr != EMPTYLIST; p = pair(p.cdr)) {
                        obj = Array.get(obj, num(p.car).intValue());
                    }
                    idx = p.car;
                } else if (args[0] instanceof SchemeVector) {
                    Value[] vals = ((SchemeVector)args[0]).vals;
                    for (int i=0; i < vals.length-1; i++) {
                        obj = Array.get(obj,num(vals[i]).intValue());
                    }
                    idx = vals[vals.length-1];
                } else {
                    idx = args[0];
                }
                Array.set(obj, num(idx).intValue(), jobj(args[1]));
                return VOID;
            default:
                throw new RuntimeException(liMessage(S2JB, "onetwoargs", liMessage(S2JB, "jarray"), obj.toString()));
            }
        }

        protected static final Value apply(Object obj, Value[] args) {
            try {
                switch (args.length) {
                case 1: //get value of field
                    return new JavaObject(obj.getClass().getField(symval(args[0])).get(obj));
                case 2: //set value of field
                    obj.getClass().getField(symval(args[0])).set(obj, jobj(args[1]));
                    return VOID;
                default:
                    throw new RuntimeException(liMessage(S2JB, "onetwoargs", liMessage(S2JB, "jobject"), obj.toString()));
                }
            } catch (IllegalAccessException e) {
                throw new RuntimeException(liMessage(S2JB, "illegalaccess", liMessage(S2JB, "jobject"), args[0].toString(), obj.toString()));
            } catch (NoSuchFieldException e) {
                throw new RuntimeException(liMessage(S2JB, "nosuchfield", args[0].toString(), obj.toString()));
            }
        }
    }

   
    static class SchemeInvocation implements InvocationHandler {
        protected AppContext ctx;
        protected Procedure proc;

        static Method hashCodeMeth;
        static Method equalsMeth;
        static Method toStringMeth;

        static {
            try {
                hashCodeMeth = Object.class.getMethod("hashCode", new Class[]{});
                equalsMeth = Object.class.getMethod("equals", new Class[]{java.lang.Object.class});
                toStringMeth = Object.class.getMethod("toString", new Class[]{});
            } catch (NoSuchMethodException e) {
                throw new RuntimeException(liMessage(S2JB, "reqmethodnotfound"));
            }
        }

        public SchemeInvocation(AppContext ctx, Procedure proc) {
            this.ctx = ctx;
            this.proc = proc;
        }

        public Object invoke(Object proxy, Method m, Object[] args)
            throws Throwable {
            //intercept hashCode, equals and toString
            //in order to avoid infinite recursion
            if (m.getDeclaringClass() == Object.class) {
                if (m.equals(hashCodeMeth)) {
                    //better than returning a constant;
                    //this works because a proxy can only have one
                    //invocation handler
                    return new Integer(hashCode());
                } else if (m.equals(equalsMeth)) {
                    return new Boolean(proxy == args[0]);
                } else if (m.equals(toStringMeth)) {
                    return "proxy";
                }
            }
            Interpreter r = Context.enter(ctx, new DynamicEnv());
            Pair p = EMPTYLIST;
            if (args != null) { //for some reason args can be null
                for (int i=args.length-1; i>=0; i--) {
                    p = new Pair(new JavaObject(args[i]), p);
                }
            }
            Value res = null;
            try {
                res = r.eval(proc, new Value[] {new JavaObject(proxy),
                                                new JavaObject(m),
                                                p});
            } catch (SchemeException e) {
                throw javaException(e);
            }
            Context.exit();
            return jobj(res);
        }
    }

    public static Throwable javaException(SchemeException e) {
        Throwable ex = e;
        if (e.m instanceof JavaObject) {
            Object eo = ((JavaObject)e.m).obj;
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
            return ((JavaObject)o).obj;
        } catch (ClassCastException e) { typeError(S2JB, "jobject", o); }
        return null;
    }

    public static final Class jclass(Value o) {
        try {
            return (Class)((JavaObject)o).obj;
        } catch (ClassCastException e) { typeError(S2JB, "jclass", o); }
        return null;
    }

    public static final Constructor jconstr(Value o) {
        try {
            return (Constructor)((JavaObject)o).obj;
        } catch (ClassCastException e) { typeError(S2JB, "jmethod", o); }
        return null;
    }

    public static final Method jmethod(Value o) {
        try {
            return (Method)((JavaObject)o).obj;
        } catch (ClassCastException e) { typeError(S2JB, "jconstructor", o); }
        return null;
    }

    public static final Field jfield(Value o) {
        try {
            return (Field)((JavaObject)o).obj;
        } catch (ClassCastException e) { typeError(S2JB, "jfield", o); }
        return null;
    }

    public static final JavaObject makeJObj(Object o) {
        return new JavaObject(o);
    }

    public static final Value objArrayToVec(Object[] objs) {
        JavaObject[] res = new JavaObject[objs.length];
        for (int i=0; i < objs.length; i++) {
            res[i] = makeJObj(objs[i]);
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

    public static String mangleName(String s) {
        int l = s.length();
        StringBuffer res = new StringBuffer(l);
        if (s.endsWith("!")) {
            s = s.substring(0, l-1);
            l--;
        }
        if (s.endsWith("?")) {
            s = "is-" + s.substring(0, l-1);
            l+=2;
        }
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

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            switch(primid) {
            case JAVA_NEW:
                return makeJObj(null);
            }
        case 1:
            switch(primid) {
            case JAVA_WRAP:
                return makeJObj(f.vlr[0]);
            case JAVA_UNWRAP:
                return (Value)jobj(f.vlr[0]);
            case JAVA_CLASS:
                String cname = symval(f.vlr[0]);
                Class c = resolveType(cname);
                if (c == null)
                    throw new RuntimeException(liMessage(S2JB, "classnotfound", cname));
                else return makeJObj(c);
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
                return makeJObj(jclass(f.vlr[0]).getSuperclass());
            case JAVA_COMPONENT_TYPE:
                return makeJObj(jclass(f.vlr[0]).getComponentType());
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
                    return makeJObj(jclass(f.vlr[0]).getDeclaringClass());
                default:
                    return makeJObj(((Member)jobj(f.vlr[0])).getDeclaringClass());
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
                return makeJObj(jmethod(f.vlr[0]).getReturnType());
            case JAVA_FIELD_TYPE:
                return makeJObj(jfield(f.vlr[0]).getType());
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
                return makeJObj(jobj(f.vlr[0]).getClass());
            case JAVA_INV_HANDLER:
                return makeJObj(new SchemeInvocation(f.ctx, proc(f.vlr[0])));
            case JAVA_MANGLE:
                return Symbol.intern(mangleName(symval(f.vlr[0])));
            case CONV_JBOOLEAN:
                return makeJObj(truth(f.vlr[0]) ? Boolean.TRUE : Boolean.FALSE);
            case CONV_JCHAR:
                return makeJObj(new Character(character(f.vlr[0])));
            case CONV_JBYTE:
                return makeJObj(new Byte((byte)num(f.vlr[0]).intValue()));
            case CONV_JSHORT:
                return makeJObj(new Short((short)num(f.vlr[0]).intValue()));
            case CONV_JINT:
                return makeJObj(new Integer(num(f.vlr[0]).intValue()));
            case CONV_JLONG:
                return makeJObj(new Long(num(f.vlr[0]).longValue()));
            case CONV_JFLOAT:
                return makeJObj(new Float((float)num(f.vlr[0]).doubleValue()));
            case CONV_JDOUBLE:
                return makeJObj(new Double(num(f.vlr[0]).doubleValue()));
            case CONV_JSTRING:
                byte b = 1;
                java.lang.Integer.toString(b);
                Value v = f.vlr[0];
                if (v instanceof Symbol)
                    return makeJObj(symval(v));
                else if (v instanceof SchemeString)
                    return makeJObj(string(v));
                else
                    typeError(S2JB, "stringorsymbol", v);
            case CONV_BOOLEAN:
                return truth(((Boolean)jobj(f.vlr[0])).booleanValue());
            case CONV_CHARACTER:
                return new SchemeCharacter(((Character)jobj(f.vlr[0])).charValue());
            case CONV_NUMBER:
                Object o = jobj(f.vlr[0]);
                if (o instanceof Byte ||
                    o instanceof Short ||
                    o instanceof Integer ||
                    o instanceof Long)
                    return Quantity.valueOf(((Number)o).longValue());
                else if (o instanceof Float ||
                         o instanceof Double)
                    return Quantity.valueOf(((Number)o).doubleValue());
                else if (o instanceof java.math.BigInteger)
                    return Quantity.valueOf((java.math.BigInteger)o);
                else if (o instanceof java.math.BigDecimal)
                    return Quantity.valueOf((java.math.BigDecimal)o);
                else
                    typeError(S2JB, "jnumber", f.vlr[0]);
            case CONV_STRING:
                o = jobj(f.vlr[0]);
                if (o instanceof String)
                    return new SchemeString((String)o);
                else
                    return new SchemeString(o.toString());
            case CONV_SYMBOL:
                o = jobj(f.vlr[0]);
                if (o instanceof String)
                    return Symbol.intern((String)o);
                else
                    return Symbol.intern(o.toString());
            case CONV_VECTOR:
                o = jobj(f.vlr[0]);
                if (o.getClass().isArray()) {
                    Value[] vals = new Value[Array.getLength(o)];
                    for (int i=0; i < vals.length; i++) {
                        vals[i] = makeJObj(Array.get(o, i));
                    }
                    return new SchemeVector(vals);
                } else
                    typeError(S2JB, "jarray", f.vlr[0]);
            case CONV_LIST:
                o = jobj(f.vlr[0]);
                if (o.getClass().isArray()) {
                    p = EMPTYLIST;
                    for (int i=Array.getLength(o)-1; i>=0; i--) {
                        p = new Pair(makeJObj(Array.get(o, i)), p);
                    }
                    return p;
                } else
                    typeError(S2JB, "jarray", f.vlr[0]);
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
                    return makeJObj(jclass(f.vlr[0]).getField(symval(f.vlr[1])));
                } catch (NoSuchFieldException e) {
                    return FALSE;
                }
            case JAVA_DECL_FIELD:
                try {
                    return makeJObj(jclass(f.vlr[0]).getDeclaredField(symval(f.vlr[1])));
                } catch (NoSuchFieldException e) {
                    return FALSE;
                }
            case JAVA_INSTANCEQ:
                return truth(fixClass(jclass(f.vlr[0])).isInstance(jobj(f.vlr[1])));
            case JAVA_ASSIGNABLEQ:
                return truth(fixClass(jclass(f.vlr[0])).isAssignableFrom(fixClass(jclass(f.vlr[1]))));
            case JAVA_SET:
                sjobj(f.vlr[0]).set(jobj(f.vlr[1]));
                return VOID;
            case JAVA_ARRAY_CLASS:
                return makeJObj(makeArrayClass(jclass(f.vlr[0]), num(f.vlr[1]).intValue()));
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
                return makeJObj(Array.newInstance(jclass(f.vlr[0]), intDims));
            case CONV_JARRAY:
                Value o = f.vlr[0];
                Value[] vals = null;
                if (o instanceof Pair)
                    vals = pairToValues(pair(o));
                else if (o instanceof SchemeVector)
                    vals = vec(o).vals;
                else {
                    typeError(S2JB, "listorvector", o);
                }
                Object res = Array.newInstance(jclass(f.vlr[1]), vals.length);
                for (int i=0; i< vals.length; i++) {
                    Array.set(res, i, jobj(vals[i]));
                }
                return makeJObj(res);
            }
        default:
            switch(primid) {
            case JAVA_CONSTRUCTOR:
                try {
                    Class[] paramTypes = new Class[f.vlr.length-1];
                    for (int i=0; i<f.vlr.length-1; i++) {
                        paramTypes[i] = jclass(f.vlr[i+1]);
                    }
                    return makeJObj(jclass(f.vlr[0]).getConstructor(paramTypes));
                } catch (NoSuchMethodException e) {
                    return FALSE;
                }
            case JAVA_METHOD:
                try {
                    Class[] paramTypes = new Class[f.vlr.length-2];
                    for (int i=0; i<f.vlr.length-2; i++) {
                        paramTypes[i] = jclass(f.vlr[i+2]);
                    }
                    return makeJObj(jclass(f.vlr[0]).getMethod(symval(f.vlr[1]),paramTypes));
                } catch (NoSuchMethodException e) {
                    return FALSE;
                }
            case JAVA_DECL_CONSTRUCTOR:
                try {
                    Class[] paramTypes = new Class[f.vlr.length-1];
                    for (int i=0; i<f.vlr.length-1; i++) {
                        paramTypes[i] = jclass(f.vlr[i+1]);
                    }
                    return makeJObj(jclass(f.vlr[0]).getDeclaredConstructor(paramTypes));
                } catch (NoSuchMethodException e) {
                    return FALSE;
                }
            case JAVA_DECL_METHOD:
                try {
                    Class[] paramTypes = new Class[f.vlr.length-2];
                    for (int i=0; i<f.vlr.length-2; i++) {
                        paramTypes[i] = jclass(f.vlr[i+2]);
                    }
                    return makeJObj(jclass(f.vlr[0]).getDeclaredMethod(symval(f.vlr[1]),paramTypes));
                } catch (NoSuchMethodException e) {
                    return FALSE;
                }
            case JAVA_PROXY:
                Class[] interfaces = new Class[f.vlr.length];
                for (int i=0; i<f.vlr.length; i++) {
                    interfaces[i] = jclass(f.vlr[i]);
                }
                return makeJObj(Proxy.getProxyClass(ClassLoader.getSystemClassLoader(), interfaces));
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
