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
package sisc.modules;

import sisc.*;
import sisc.data.*;
import java.lang.reflect.*;
import java.util.*;
import sisc.Serializer;
import java.io.*;

public class J2S extends ModuleAdapter {
    public static final int 
	JFIELDREF=1, JCLASSFORNAME=2,
	JFIELDSET=3, JGETMETHODS=4, JGETCONSTRUCTORS=5,
	JINSTANTIATE=6, JCALL=7, JCLASSQ=8, JOBJECTQ=9,
	JINSTANCEOFQ=10, JGETCLASS=11, JGETCLASSNAME=12,
	JGETFIELDS=13, UGLYSYNC=14;

    public String getModuleName() {
	return "J2S";
    }

    public static class JavaClass extends Value {
        public Class clazz;

        public JavaClass(Class c) {
            clazz=c;
        }

        public String display() {
            StringBuffer b=new StringBuffer();
            b.append("#<java class ").append(clazz.getName()).append('>');
            return b.toString();
        }

        public boolean valueEqual(Value ov) {
            return ((JavaClass)ov).clazz.equals(clazz);
        }

        public void serialize(Serializer s, DataOutput dos) throws IOException {
            if (SERIALIZATION) {
                s.putClass(clazz, dos);
            }
        }

        public JavaClass() {}

        public void deserialize(Serializer s, DataInput dis)
        throws IOException {
            if (SERIALIZATION) {
                try {
                    clazz=s.getClass(dis);
                } catch (ClassNotFoundException cnf) {
                    cnf.printStackTrace();
                }
            }
        }

    }

    public static class JavaObject extends Value {
        public Object o;

        public JavaObject(Object c) {
            o=c;
        }

        public String display() {
            StringBuffer b=new StringBuffer();
            b.append("#<java object ").append(o).append('>');
            return b.toString();
        }

        public boolean valueEqual(Value ov) {
            return ((JavaObject)ov).o.equals(o);
        }

        public JavaObject() {}

        public Object javaValue()
        {
            return o;
        }
    }

    public J2S() {
        define("java/field-ref", JFIELDREF);
        define("java/field-set!", JFIELDSET);
        define("java/get-methods", JGETMETHODS);
        define("java/get-fields", JGETFIELDS);
        define("java/get-constructors", JGETCONSTRUCTORS);
        define("java/instantiate", JINSTANTIATE);
        define("java/call", JCALL);
        define("java/class-for-name", JCLASSFORNAME);
        define("java/class-of-object", JGETCLASS);
        define("java/object?", JOBJECTQ);
        define("java/class?", JCLASSQ);
        define("java/instance-of?", JINSTANCEOFQ);
        define("java/get-class-name", JGETCLASSNAME);
	define("java/_synchronized", UGLYSYNC);
    }

    public Value schemeValue(Object v) {
        return (v instanceof Value ? (Value)v :
                v instanceof Class ? (Value)new JavaClass((Class)v) :
                (Value)new JavaObject(v));
    }

    public Value eval(int primid, Interpreter f)
    throws ContinuationException {
        switch (f.vlr.length) {
        case 0:
            break;
        case 1:
            switch(primid) {
            case JGETCLASS:
                if (f.vlr[0] instanceof JavaObject)
                    return new JavaClass(((JavaObject)f.vlr[0]).o.getClass());
                else
                    return new JavaClass(f.vlr[0].getClass());
            case JCLASSQ: return truth(f.vlr[0] instanceof JavaClass);
            case JOBJECTQ: return truth(f.vlr[0] instanceof JavaObject);
            case JGETCONSTRUCTORS:
                Class clazz;
                if (f.vlr[0] instanceof JavaClass) {
                    JavaClass c=(JavaClass)f.vlr[0];
                    clazz=c.clazz;
                } else if (f.vlr[0] instanceof JavaObject) {
                    JavaObject o=(JavaObject)f.vlr[0];
                    clazz=o.o.getClass();
                } else {
                    clazz=f.vlr[0].getClass();
                }

                Constructor[] cns=clazz.getConstructors();
                Pair p=EMPTYLIST;
                HashSet s=new HashSet();
                for (int i=0; i<cns.length; i++) {
                    Class[] proto=cns[i].getParameterTypes();
                    JavaClass[] protow=new JavaClass[proto.length];
                    for (int j=0; j<proto.length; j++)
                        protow[j]=new JavaClass(proto[j]);
                    p=new Pair(new SchemeVector((Value[])protow), p);
                }
                return p;
            case JGETMETHODS:
                if (f.vlr[0] instanceof JavaClass) {
                    JavaClass c=(JavaClass)f.vlr[0];
                    clazz=c.clazz;
                } else if (f.vlr[0] instanceof JavaObject) {
                    JavaObject o=(JavaObject)f.vlr[0];
                    clazz=o.o.getClass();
                } else {
                    clazz=f.vlr[0].getClass();
                }


                Method[] m=clazz.getMethods();
                p=EMPTYLIST;
                s=new HashSet();
                for (int i=0; i<m.length; i++) {
                    if (!s.contains(m[i].getName())) {
                        s.add(m[i].getName());
                        p=new Pair(new SchemeString(m[i].getName()), p);
                    }
                }
                return p;
            case JGETFIELDS:
                if (f.vlr[0] instanceof JavaClass) {
                    JavaClass c=(JavaClass)f.vlr[0];
                    clazz=c.clazz;
                } else if (f.vlr[0] instanceof JavaObject) {
                    JavaObject o=(JavaObject)f.vlr[0];
                    clazz=o.o.getClass();
                } else {
                    clazz=f.vlr[0].getClass();
                }


                Field[] fs=clazz.getFields();
                p=EMPTYLIST;
                for (int i=0; i<fs.length; i++) {
                    p=new Pair(new SchemeString(fs[i].getName()), p);
                }
                return p;
            case JCLASSFORNAME:
                try {
                    return new JavaClass(Class.forName(string(f.vlr[0])));
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(localizedMessage("classnotfound"));
                }
            case JGETCLASSNAME:
                return new SchemeString(((JavaClass)f.vlr[0]).clazz.getName());
            }
            break;
        case 2:
            switch(primid) {
	    case UGLYSYNC:
		Object syncOn;
		if (f.vlr[1] instanceof JavaObject) {
		    syncOn=((JavaObject)f.vlr[0]).o;
		} else {
		    syncOn=f.vlr[0];
		}

		Procedure thunk=proc(f.vlr[1]);
		Value rv=VOID;
		synchronized(syncOn) {
		    Interpreter i=Context.enter();
		    try {
			rv=i.eval(thunk, new Value[0]);
		    } catch (SchemeException se) {
			throwNestedPrimException(se);
		    } finally {
                        Context.exit();
                    }
		}
		return rv;
            case JINSTANCEOFQ:
                return truth(((JavaClass)f.vlr[1]).clazz.isAssignableFrom(f.vlr[0].getClass()));
            case JFIELDREF:
                Field field=null;
                Object on=null;
                try {
                    if (f.vlr[0] instanceof JavaClass) {
                        JavaClass c=(JavaClass)f.vlr[0];
                        field=c.clazz.getField(string(f.vlr[1]));
                    } else if (f.vlr[0] instanceof JavaObject) {
                        JavaObject o=(JavaObject)f.vlr[0];
                        field=o.o.getClass().getField(string(f.vlr[1]));
                        on=o.o;
                    } else {
                        field=f.vlr[0].getClass().getField(string(f.vlr[1]));
                    }
                    Object v=field.get(on);
                    return schemeValue(v);
                } catch (NoSuchFieldException e) {
                    throw new RuntimeException(localizedMessage("nosuchfield"));
                } catch (IllegalAccessException e2) {
                    throw new RuntimeException(localizedMessage("illegalaccess"));
                }
            }
            break;
        case 3:
            switch(primid) {
            case JFIELDSET:
                Field field;
                Object target=null;
                try {
                    if (f.vlr[0] instanceof JavaClass) {
                        JavaClass c=(JavaClass)f.vlr[0];
                        field=c.clazz.getField(string(f.vlr[1]));
                    } else if (f.vlr[0] instanceof JavaObject) {
                        JavaObject o=(JavaObject)f.vlr[0];
                        field=o.o.getClass().getField(string(f.vlr[1]));
                        target=o.o;
                    } else {
                        field=f.vlr[0].getClass().getField(string(f.vlr[1]));
                        target=f.vlr[0];
                    }
                    field.set(target, ((JavaObject)f.vlr[2]).o);
                } catch (NoSuchFieldException e) {
                    throw new RuntimeException(localizedMessage("nosuchfield"));
                } catch (IllegalAccessException e2) {
                    throw new RuntimeException(localizedMessage("illegalaccess"));
                }
                return VOID;
            case JINSTANTIATE:
                Class clz=((JavaClass)f.vlr[0]).clazz;
                SchemeVector v1=vec(f.vlr[1]);
                SchemeVector v2=vec(f.vlr[2]);
                Class[] classSpec=new Class[v1.vals.length];
                Object[] objects=new Object[v2.vals.length];

                for (int i=0; i<classSpec.length; i++) {
                    classSpec[i]=((JavaClass)v1.vals[i]).clazz;
                    objects[i]=((JavaObject)v2.vals[i]).o;
                }
                try {
                    Constructor cns=clz.getConstructor(classSpec);
                    return schemeValue(cns.newInstance(objects));
                } catch (Exception e) {
                    throw new RuntimeException(localizedMessage("errorinstantiating", 
							 e.toString()));
                }
            }
        case 4:
            switch(primid) {
            case JCALL:
                Class clz=null;
                Object callOn=null;

                if (f.vlr[0] instanceof JavaClass) {
                    clz=((JavaClass)f.vlr[0]).clazz;
                } else if (f.vlr[0] instanceof JavaObject) {
                    callOn=((JavaObject)f.vlr[0]).o;
                    clz=callOn.getClass();
                } else if (f.vlr[0] != EMPTYLIST) {
                    callOn=f.vlr[0];
                    clz=callOn.getClass();
                }

                String methodName=string(f.vlr[1]);
                SchemeVector v1=vec(f.vlr[2]);
                SchemeVector v2=vec(f.vlr[3]);
                Class[] classSpec=new Class[v1.vals.length];
                Object[] objects=new Object[v2.vals.length];

                for (int i=0; i<classSpec.length; i++) {
                    classSpec[i]=((JavaClass)v1.vals[i]).clazz;
                    objects[i]=((JavaObject)v2.vals[i]).o;
                }

                try {
                    Method m=clz.getMethod(methodName, classSpec);
                    return schemeValue(m.invoke(callOn, objects));
                } catch (Exception e) {
                    e.printStackTrace();
                    throw new RuntimeException(localizedMessage("errorinstantiating", 
							 e.toString()));
                }
            }
	default:
	    throwArgSizeException();
        }
	return VOID;
    }
}
