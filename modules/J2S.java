package sisc.modules;

import sisc.*;
import sisc.data.*;
import java.lang.reflect.*;

public class J2S extends Module {
    public static final int JFIELDREF=1, JCLASSFORNAME=2,
	JFIELDSET=3, JGETMETHODS=4, JGETCONSTRUCTORS=5,
	JINSTANTIATE=6, JCALL=7;

    static class JavaClass extends Value {
	public Class clazz;

	public JavaClass(Class c) {
	    clazz=c;
	}

	public String display() {
	    StringBuffer b=new StringBuffer();
	    b.append("#<java class ").append(clazz).append('>');
	    return b.toString();
	}
    }

    static class JavaObject extends Value {
	public Object o;

	public JavaObject(Object c) {
	    o=c;
	}

	public String display() {
	    StringBuffer b=new StringBuffer();
	    b.append("#<java object ").append(o).append('>');
	    return b.toString();
	}
    }


    public void initialize(Interpreter r) {
	define(r, "java/field-ref", JFIELDREF);
	define(r, "java/field-set!", JFIELDSET);
	define(r, "java/get-methods", JGETMETHODS);
	define(r, "java/get-constructors", JGETCONSTRUCTORS);
	define(r, "java/instantiate", JINSTANTIATE);
	define(r, "java/call", JCALL);
	define(r, "java/class-for-name", JCLASSFORNAME);
    }


    public Value schemeValue(Object v) {
	return (v instanceof Value ? (Value)v : 
		v instanceof Class ? (Value)new JavaClass((Class)v) :
		(Value)new JavaObject(v));
    }

    public Value eval(int primid, Interpreter r)
        throws ContinuationException {
	switch (r.vlr.length) {
	case 0:
	    break;
	case 1:
	    switch(primid) {
	    case JCLASSFORNAME:
		try {
		    return new JavaClass(Class.forName(string(r,r.vlr[0])));
		} catch (ClassNotFoundException e) {
		    throw new RuntimeException("class not found");
		}
	    }
	    break;
	case 2:
	    switch(primid) {
	    case JFIELDREF:
		Field f=null;
		Object on=null;
		try {
		    if (r.vlr[0] instanceof JavaClass) {
			JavaClass c=(JavaClass)r.vlr[0];
			f=c.clazz.getField(string(r,r.vlr[1]));
		    } else if (r.vlr[0] instanceof JavaObject) {
			JavaObject o=(JavaObject)r.vlr[0];
			f=o.o.getClass().getField(string(r,r.vlr[1]));
			on=o.o;
		    } else {
			typeError(r, "java entity", r.vlr[1]);
		    }
		    Object v=f.get(on);
		    return schemeValue(v);
		} catch (NoSuchFieldException e) {
		    throw new RuntimeException("no such field");
		} catch (IllegalAccessException e2) {
		    throw new RuntimeException("illegal access");
		}
	    }
	    break;
	case 3:

	    switch(primid) {
	    case JINSTANTIATE:
		Class clz=((JavaClass)r.vlr[0]).clazz;
		SchemeVector v1=vec(r,r.vlr[1]);
		SchemeVector v2=vec(r,r.vlr[2]);
		Class[] classSpec=new Class[v1.vals.length];
		Object[] objects=new Object[v2.vals.length];

		for (int i=0; i<classSpec.length; i++) {
		    classSpec[i]=((JavaClass)v1.vals[i]).clazz;
		    objects[i]=((JavaObject)v2.vals[i]).o;
		}
		try {
		    Constructor cns=clz.getConstructor(classSpec);
		    
		    JavaObject jo=new JavaObject(cns.newInstance(objects));
		    return jo;
		} catch (Exception e) {
		    throw new RuntimeException("Error instantiating object: "+e);
		}
	    }
	case 4:
	    switch(primid) {
	    case JCALL:
		Class clz=null;
		Object callOn=null;
		if (r.vlr[0] instanceof JavaClass) {
		    clz=((JavaClass)r.vlr[0]).clazz;
		} else if (r.vlr[0] instanceof JavaObject) {
		    callOn=((JavaObject)r.vlr[0]).o;
		    clz=callOn.getClass();
		} else {
		    callOn=r.vlr[0];
		    clz=callOn.getClass();
		}

		String methodName=string(r,r.vlr[1]);
		SchemeVector v1=vec(r,r.vlr[2]);
		SchemeVector v2=vec(r,r.vlr[3]);
		Class[] classSpec=new Class[v1.vals.length];
		Object[] objects=new Object[v2.vals.length];

		for (int i=0; i<classSpec.length; i++) {
		    classSpec[i]=((JavaClass)v1.vals[i]).clazz;
		    objects[i]=((JavaObject)v2.vals[i]).o;
		}

		try {
		    Method m=clz.getMethod(methodName, classSpec);
		    
		    JavaObject jo=new JavaObject(m.invoke(callOn, objects));
		    return jo;
		} catch (Exception e) {
		    e.printStackTrace();
		    throw new RuntimeException("Error instantiating object: "+e);
		}
	    }

	}
	throw new RuntimeException( "incorrect number of arguments to procedure");
    }

}
