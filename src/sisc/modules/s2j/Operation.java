/*
 * $Id$
 */
package sisc.modules.s2j;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.io.IOException;

import sisc.data.Value;
import sisc.interpreter.Context;
import sisc.interpreter.ContinuationException;
import sisc.interpreter.Interpreter;
import sisc.interpreter.SchemeException;
import sisc.nativefun.IndexedLibraryAdapter;
import sisc.nativefun.IndexedProcedure;

public class Operation extends IndexedProcedure {

    protected static final int
    //Next: 7
        JAVA_CLASS = 1,
        JAVA_INV_HANDLER = 2,
        JAVA_PROXY_CLASS = 3,
        JAVA_INVOKE_CONSTRUCTOR = 4,
        JAVA_SYNC = 5,
        JAVA_INVOKE_METHOD = 6;


    public static class Index extends IndexedLibraryAdapter {

        public Value construct(int id) {
            return new Operation(id);
        }

        public Index() {
            define("java/class", JAVA_CLASS);
            define("java/invocation-handler", JAVA_INV_HANDLER);
            define("java/synchronized", JAVA_SYNC);

            define("java/proxy-class", JAVA_PROXY_CLASS);
            define("java/invoke-constructor", JAVA_INVOKE_CONSTRUCTOR);
            define("java/invoke-method", JAVA_INVOKE_METHOD);
        }
    }

    public Operation(int id) {
        super(id);
    }
    
    public Operation() {}
    
    public Value doApply(Interpreter f) throws ContinuationException {
        SIZESWITCH:
        switch (f.vlr.length) {
        case 1:
            switch(id) {
            case JAVA_CLASS:
                String cname = symval(f.vlr[0]);
                try {
                    Class c = Util.resolveType(cname);
                    return Util.makeJObj(c, Class.class);
                } catch(IOException e) {
                    throwPrimException(liMessage(Util.S2JB, "classnotfound", cname));
                }
            case JAVA_INV_HANDLER:
                return Util.makeJObj(new SchemeInvocation(f.dynenv.copy(), proc(f.vlr[0])), SchemeInvocation.class);
            default: break SIZESWITCH;
            }
        case 2:
            switch(id) {
            case JAVA_SYNC:
                synchronized(Util.jobj(f.vlr[0])) {
                    Interpreter i=Context.enter(f.dynenv);
                    try {
                        return i.eval(proc(f.vlr[1]), ZV);
                    } catch (SchemeException se) {
                        throwNestedPrimException(se);
                    } finally {
                        Context.exit();
                    }
                }
                return VOID;
            case JAVA_INVOKE_CONSTRUCTOR:
                Constructor jc = Util.jconstr(f.vlr[0]);
                try {
                    return Util.makeJObj(invokeConstructor(jc, Util.pairToObjects(pair(f.vlr[1]))),
                                         jc.getDeclaringClass());
                } catch (InvocationTargetException e) {
                    error(f, Util.makeJObj(e.getTargetException(), Throwable.class));
                }
            default: break SIZESWITCH;
            }
        case 3:
            switch(id) {
            case JAVA_INVOKE_METHOD:
                Method jm = Util.jmethod(f.vlr[0]);
                try {
                    return Util.makeJObj(invokeMethod(jm, Util.jobj(f.vlr[1]), Util.pairToObjects(pair(f.vlr[2]))),
                                         jm.getReturnType());
                } catch (InvocationTargetException e) {
                    error(f, Util.makeJObj(e.getTargetException(), Throwable.class));
                }
            default: break SIZESWITCH;
            }
        default: break SIZESWITCH;
        }
    
        switch(id) {
        case JAVA_PROXY_CLASS:
            Class[] interfaces = new Class[f.vlr.length];
            for (int i=0; i<f.vlr.length; i++) {
                interfaces[i] = Util.jclass(f.vlr[i]);
            }
            try {
                return Util.makeJObj(Proxy.getProxyClass(Util.currentClassLoader(), interfaces), Class.class);
            } catch (IllegalArgumentException e) {
                throw new RuntimeException(liMessage(Util.S2JB, "proxyinterfaceillegal", Reflection.typesString(interfaces)));
            } catch (NullPointerException e) {
                throw new RuntimeException(liMessage(Util.S2JB, "proxyinterfacenull", Reflection.typesString(interfaces)));
            }
        default:
            throwArgSizeException();
        }
        return VOID;
    }

    private static String typesString(Object[] args) {
        StringBuffer res = new StringBuffer();
        for (int i=0; i<args.length; i++) {
            res.append(Reflection.typeString(args[i]));
            if (i<args.length-1) res.append(", ");
        }
        return res.toString();
    }

    private static Object invokeMethod(Method m, Object o, Object[] args)
        throws InvocationTargetException {
    
        try {
            return m.invoke(o, args);
        } catch (NullPointerException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalmethodnull", 
                                                 m.toString(),
                                                 Util.nameType(m.getDeclaringClass())));
        } catch (IllegalAccessException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalmethodaccess", 
                                                 m.toString(), 
                                                 Util.nameType(m.getDeclaringClass())));
        } catch (IllegalArgumentException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalmethodargument", 
                                                 m.toString(), 
                                                 Util.nameType(m.getDeclaringClass()),
                                                 Reflection.typeString(o),
                                                 typesString(args)));
        }
    }

    private static Object invokeConstructor(Constructor c, Object[] args)
        throws InvocationTargetException {
    
        try {
            return c.newInstance(args);
        } catch (InstantiationException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "constructorabstract",
                                                 c.toString(),
                                                 Util.nameType(c.getDeclaringClass())));
        } catch (IllegalAccessException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalconstructoraccess", 
                                                 c.toString(), 
                                                 Util.nameType(c.getDeclaringClass())));
        } catch (IllegalArgumentException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "illegalconstructorargument",
                                                 c.toString(), 
                                                 Util.nameType(c.getDeclaringClass()),
                                                 typesString(args)));
        }
    }

}
