package sisc.modules.s2j;

import java.lang.reflect.*;
import java.beans.*;

import sisc.data.*;
import sisc.interpreter.*;

import java.io.IOException;

import sisc.io.ValueWriter;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.data.Expression;
import sisc.util.ExpressionVisitor;

public class JavaObject extends Procedure {

    protected Object obj;

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

    public byte getObjType() {
        //we do not need to make this synchronized since we are only
        //accessing a byte
        if (objType == JUNKN)
            objType = 
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
        case JCLASS: {
            s.writeUTF(Util.nameType((Class)obj));
            break;
        }
        case JFIELD: {
            Field f = (Field)obj;
            s.writeUTF(Util.nameType(f.getDeclaringClass()));
            s.writeUTF(f.getName());
            break;
        }
        case JMETHOD: {
            Method m = (Method)obj;
            s.writeUTF(Util.nameType(m.getDeclaringClass()));
            s.writeUTF(m.getName());
            Class[] types = m.getParameterTypes();
            s.writeInt(types.length);
            for (int i=0; i < types.length; i++) {
                s.writeUTF(Util.nameType(types[i]));
            }
            break;
        }
        case JCONSTR: {
            Constructor c = (Constructor)obj;
            s.writeUTF(Util.nameType(c.getDeclaringClass()));
            Class[] types = c.getParameterTypes();
            s.writeInt(types.length);
            for (int i=0; i < types.length; i++) {
                s.writeUTF(Util.nameType(types[i]));
            }
            break;
        }
        default:
            s.writeObject(obj);
        }
    }

    public void deserialize(Deserializer s) throws IOException {
        byte ty = s.readByte();
        switch (ty) {
        case JCLASS: {
            obj = Util.resolveType(s.readUTF());
            break;
        }
        case JFIELD:
            try {
                Class c = Util.resolveType(s.readUTF());
                obj = c.getDeclaredField(s.readUTF());
            } catch (NoSuchFieldException e) {
                throw new RuntimeException(liMessage(Util.S2JB, "cannotdeserialize"));
            }
            break;
        case JMETHOD:
            try {
                Class c = Util.resolveType(s.readUTF());
                String n = s.readUTF();
                int l = s.readInt();
                Class types[] = new Class[l];
                for (int i=0; i < l; i++) {
                    types[i] = Util.resolveType(s.readUTF());
                }
                obj = c.getDeclaredMethod(n, types);
            } catch (NoSuchMethodException e) {
                throw new RuntimeException(liMessage(Util.S2JB, "cannotdeserialize"));
            }
            break;
        case JCONSTR:
            try {
                Class c = Util.resolveType(s.readUTF());
                int l = s.readInt();
                Class types[] = new Class[l];
                for (int i=0; i < l; i++) {
                    types[i] = Util.resolveType(s.readUTF());
                }
                obj = c.getDeclaredConstructor(types);
            } catch (NoSuchMethodException e) {
                throw new RuntimeException(liMessage(Util.S2JB, "cannotdeserialize"));
            }
            break;
        default:
            try {
                obj = s.readObject();
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(liMessage(Util.S2JB, "cannotdeserialize"));
            }
            break;
        }
    }

    public boolean visit(ExpressionVisitor v) {
        return (obj != null && obj instanceof Expression) ?
            v.visit((Expression)obj) : true;
    }

    public JavaObject(Object o) {
        this.obj = o;
    }

    public Object get() {
        return obj;
    }

    public Class classOf() {
        return obj.getClass();
    }

    public void display(ValueWriter w) throws IOException {
        w.append("#<java ")
            .append(Util.nameType(obj.getClass()))
            .append(' ')
            .append(obj.toString())
            .append('>');
    }

    public int hashCode() {
        return obj.hashCode();
    }

    public boolean eqv(Object v) {
        return this == v || (v != null && v.getClass() == JavaObject.class
                             && obj == ((JavaObject)v).obj);
    }

    public boolean valueEqual(Value v) {
        return eqv(v) || (v instanceof JavaObject
                         && obj.equals(((JavaObject)v).get()));
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
                error(r, liMessage(Util.S2JB, "cannotapplynull"));
            default:
                error(r, liMessage(Util.S2JB, "cannotapplyobject", obj.toString()));
            }
        } catch (InvocationTargetException e) {
            error(r, Util.makeJObj(e.getTargetException(), Throwable.class));
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
                return Util.makeJObj(obj.newInstance(), obj);
            case 1: //get value of static field
                Field f = obj.getField(Util.mangleFieldName(symval(arg[0])));
                return Util.makeJObj(f.get(null), f.getType());
            case 2: //set value of static field
                obj.getField(Util.mangleFieldName(symval(arg[0]))).set(null,Util.jobj(arg[1]));
                return VOID;
            default:
                throw new RuntimeException(liMessage(Util.S2JB, "zerotwoargs", liMessage(Util.S2JB, "jclass"), obj.toString()));
            }
        } catch (InstantiationException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "errorinstantiating", obj.toString()));
        } catch (IllegalAccessException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalaccess", 
                                                 new Object[] {
                liMessage(Util.S2JB, "jconstructor"), 
                    "default", 
                    obj.toString()}));
        } catch (NoSuchFieldException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "nosuchfield", arg[0].toString(), obj.toString()));
        }
    }

    protected static final Value apply(Field obj, Value[] args) {
        try {
            switch (args.length) {
            case 1: //get value
                return Util.makeJObj(obj.get(Util.jobj(args[0])), obj.getType());
            case 2: //set value
                obj.set(Util.jobj(args[0]), Util.jobj(args[1]));
                return VOID;
            default:
                throw new RuntimeException(liMessage(Util.S2JB, "onetwoargs", liMessage(Util.S2JB, "jfield"), obj.toString()));
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalaccess", 
                                                 new Object[] {
                liMessage(Util.S2JB, "jfield"), 
                    obj.toString(), 
                    args[0].toString()}));
        }
    }

    protected static final Value apply(Method obj, Value[] args)
        throws InvocationTargetException {
        Object o = Util.jobj(args[0]);
        Object params[] = new Object[args.length-1];
        for (int i=0; i < args.length-1; i++) {
            params[i] = Util.jobj(args[i+1]);
        }
        try {
            return Util.makeJObj(obj.invoke(o,params), obj.getReturnType());
        } catch (IllegalAccessException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalaccess", 
                                                 new Object[] {
                liMessage(Util.S2JB, "jmethod"), 
                    obj.toString(), 
                    o.toString()}));
        }
    }

    protected static final Value apply(Constructor obj, Value[] args)
        throws InvocationTargetException {
        Object params[] = new Object[args.length];
        for (int i=0; i < args.length; i++) {
            params[i] = Util.jobj(args[i]);
        }
        try {
            return Util.makeJObj(obj.newInstance(params), obj.getDeclaringClass());
        } catch (InstantiationException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "constructorerror", obj.toString(), Util.nameType(obj.getDeclaringClass())));
        } catch (IllegalAccessException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalaccess", 
                                                 new Object[] {
                liMessage(Util.S2JB, "jconstructor"), 
                obj.toString(), 
                Util.nameType(obj.getDeclaringClass())}));
        }
    }

    protected static final Value applyArray(Object obj, Value[] args) {
        switch (args.length) {
        case 1: //get element
            Object ar = null;
            if (args[0] instanceof Pair) {
                for (Pair p = pair(args[0]); p != EMPTYLIST; p = pair(p.cdr)) {
                    ar = obj;
                    obj = Array.get(obj, num(p.car).indexValue());
                }
            } else if (args[0] instanceof SchemeVector) {
                Value[] vals = ((SchemeVector)args[0]).vals;
                for (int i=0; i < vals.length; i++) {
                    ar = obj;
                    obj = Array.get(obj,num(vals[i]).indexValue());
                }
            } else {
                ar = obj;
                obj = Array.get(obj,num(args[0]).indexValue());
            }
            return Util.makeJObj(obj, ar.getClass().getComponentType());
        case 2: //set element
            Value idx = null;
            if (args[0] instanceof Pair) {
                Pair p = pair(args[0]);
                if (p == EMPTYLIST) return VOID;
                for (; p.cdr != EMPTYLIST; p = pair(p.cdr)) {
                    obj = Array.get(obj, num(p.car).indexValue());
                }
                idx = p.car;
            } else if (args[0] instanceof SchemeVector) {
                Value[] vals = ((SchemeVector)args[0]).vals;
                for (int i=0; i < vals.length-1; i++) {
                    obj = Array.get(obj,num(vals[i]).indexValue());
                }
                idx = vals[vals.length-1];
            } else {
                idx = args[0];
            }
            Array.set(obj, num(idx).indexValue(), Util.jobj(args[1]));
            return VOID;
        default:
            throw new RuntimeException(liMessage(Util.S2JB, "onetwoargs", liMessage(Util.S2JB, "jarray"), obj.toString()));
        }
    }

    public interface FieldAccessor {
        Object get(Object o)
            throws IllegalAccessException, IllegalArgumentException, InvocationTargetException;
        void set(Object o, Object v)
            throws IllegalAccessException, IllegalArgumentException, InvocationTargetException;
        Class getType();
    }

    public static class BeanFieldAccessor implements FieldAccessor {

        private PropertyDescriptor d;

        public BeanFieldAccessor(PropertyDescriptor d) {
            this.d = d;
        }

        public Object get(Object o)
            throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {

            return d.getReadMethod().invoke(o, new Object[] {});
        }

        public void set(Object o, Object v)
            throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {

            d.getWriteMethod().invoke(o, new Object[] {v});
        }

        public Class getType() {
            return d.getPropertyType();
        }
    }

    public static class NormalFieldAccessor implements FieldAccessor {

        private Field f;

        public NormalFieldAccessor(Field f) {
            this.f = f;
        }

        public Object get(Object o)
            throws IllegalAccessException {

            return f.get(o);
        }

        public void set(Object o, Object v)
            throws IllegalAccessException {
            f.set(o, v);
        }

        public Class getType() {
            return f.getType();
        }
    }

    protected static final FieldAccessor accessField(Class objClass,
                                                     String fieldName)
        throws NoSuchFieldException {
        try {
            PropertyDescriptor[] descriptors = Introspector.getBeanInfo(objClass).getPropertyDescriptors();
            for (int i=0; i<descriptors.length; i++) {
                PropertyDescriptor d = descriptors[i];
                if (d.getName().equals(fieldName))
                    return new BeanFieldAccessor(d);
            }
        } catch (IntrospectionException e) {}

        Field f = objClass.getField(fieldName);
        return new NormalFieldAccessor(f);
    }

    protected static final Value accessBeanField(Object obj, Value[] args)
        throws InvocationTargetException {

        String fieldName = null;
        try {
            FieldAccessor fa = null;
            Pair p = pair(args[0]);
            while (true) {
                fieldName = Util.mangleFieldName(symval(p.car));
                fa = accessField(obj.getClass(), fieldName);
                if (p.cdr == EMPTYLIST) break;
                obj = fa.get(obj);
                p = pair(p.cdr);
            }

            switch (args.length) {
            case 1: //get value of bean field
                return Util.makeJObj(fa.get(obj), fa.getType());
            case 2: //set value of bean field
                fa.set(obj, Util.jobj(args[1]));
                return VOID;
            default:
                throw new RuntimeException(liMessage(Util.S2JB, "onetwoargs", liMessage(Util.S2JB, "jobject"), obj.toString()));
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalaccess", 
                                                 new Object[] {
                liMessage(Util.S2JB, "jobject"), 
                    fieldName,
                    obj.toString()}));
        } catch (NoSuchFieldException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "nosuchfield", fieldName, obj.toString()));
        }
    }

    protected static final Value apply(Object obj, Value[] args) 
        throws InvocationTargetException {

        if (!(args[0] instanceof Symbol)) {
            return accessBeanField(obj, args);
        }
        String fieldName = Util.mangleFieldName(symval(args[0]));
        try {
            switch (args.length) {
            case 1: //get value of field
                Field f = obj.getClass().getField(fieldName);
                return Util.makeJObj(f.get(obj), f.getType());
            case 2: //set value of field
                obj.getClass().getField(fieldName).set(obj, Util.jobj(args[1]));
                return VOID;
            default:
                throw new RuntimeException(liMessage(Util.S2JB, "onetwoargs", liMessage(Util.S2JB, "jobject"), obj.toString()));
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalaccess", 
                                                 new Object[] {
                liMessage(Util.S2JB, "jobject"), 
                    fieldName,
                    obj.toString()}));
        } catch (NoSuchFieldException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "nosuchfield", fieldName, obj.toString()));
        }
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
