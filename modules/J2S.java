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

public class J2S extends Module {
    public static final int JFIELDREF=1, JCLASSFORNAME=2,
	JFIELDSET=3, JGETMETHODS=4, JGETCONSTRUCTORS=5,
	JINSTANTIATE=6, JCALL=7, JCLASSQ=8, JOBJECTQ=9,
	JINSTANCEOFQ=10, JGETCLASS=11, JGETCLASSNAME=12;

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
	define(r, "java/class-of-object", JGETCLASS);
	define(r, "java/object?", JOBJECTQ);
	define(r, "java/class?", JCLASSQ);
	define(r, "java/instance-of?", JINSTANCEOFQ);
	define(r, "java/get-class-name", JGETCLASSNAME);
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
	    case JGETCLASS: 
		if (r.vlr[0] instanceof JavaObject) 
		    return new JavaClass(((JavaObject)r.vlr[0]).o.getClass());
		else
		    return new JavaClass(r.vlr[0].getClass());
	    case JCLASSQ: return truth(r.vlr[0] instanceof JavaClass);
	    case JOBJECTQ: return truth(r.vlr[0] instanceof JavaObject);
	    case JGETMETHODS: 
		Class c=((JavaClass)r.vlr[0]).clazz;
		Method[] m=c.getMethods();
		Pair p=EMPTYLIST;
		HashSet s=new HashSet();
		for (int i=0; i<m.length; i++) {
		    if (!s.contains(m[i].getName())) {
			s.add(m[i].getName());
			p=new Pair(new SchemeString(m[i].getName()), p);
		    }
		}
		return p;
	    case JCLASSFORNAME:
		try {
		    return new JavaClass(Class.forName(string(r,r.vlr[0])));
		} catch (ClassNotFoundException e) {
		    throw new RuntimeException("class not found");
		}
	    case JGETCLASSNAME:
		return new SchemeString(((JavaClass)r.vlr[0]).clazz.getName());
	    }
	    break;
	case 2:
	    switch(primid) {
	    case JINSTANCEOFQ:
		return truth(((JavaClass)r.vlr[1]).clazz.isAssignableFrom(r.vlr[0].getClass()));
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
		    return schemeValue(cns.newInstance(objects));
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
		} else if (r.vlr[0] != EMPTYLIST) {
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
		    return schemeValue(m.invoke(callOn, objects));
		} catch (Exception e) {
		    e.printStackTrace();
		    throw new RuntimeException("Error instantiating object: "+e);
		}
	    }

	}
	throw new RuntimeException( "incorrect number of arguments to procedure");
    }

}
