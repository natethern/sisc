package sisc;

import java.io.*;
import sisc.data.*;
import java.util.*;
import java.lang.reflect.*;
import sisc.exprs.*;
import sisc.data.*;

public class Serializer {

    static final int BER_MASK=0x7f, BER_CONT=0x80;

    static Class[]
	DESER_PROTO=new Class[] { Serializer.class, DataInputStream.class },
	SER_PROTO=new Class[] { Serializer.class, DataOutputStream.class },
	INIT_PROTO=new Class[] { Interpreter.class },
	GETVALUE_PROTO=new Class[] { DataInputStream.class };

    static final String
	DESERIALIZE="deserialize",
	INITIALIZE="initialize",
	GETVALUE="getValue";

    static Method DESM;

    static {
	try {
	    DESM=Expression.class.getMethod(DESERIALIZE, DESER_PROTO);
	} catch (NoSuchMethodException nsm) {
	}
    }

    HashMap serState, deserState;
    HashMap modules;
    Class[] classCache=new Class[16];
    Interpreter f;
    int nextid=1;

    public Serializer(Interpreter r) {
	deserState=new HashMap();
	serState=new HashMap();
	modules=new HashMap();
	f=r;
    }

    public void putClass(Class c, DataOutputStream dos) throws IOException {
	int mp=classCache.length-1;
	int i;
	for (i=0; i<classCache.length; i++) {
	    if (classCache[i]!=null && classCache[i].equals(c)) {
		mp=i;
		break;
	    }
	}
	dos.write(i);
	if (i>=classCache.length) dos.writeUTF(c.getName());

	System.arraycopy(classCache, 0, classCache, 1, mp);
	classCache[0]=c;
    }
    
    public boolean seen(Expression e) {
	return serState.get(e)!=null;
    }

    Class getClass(DataInputStream dis) throws IOException, ClassNotFoundException {
	int cp=dis.readUnsignedByte();
	int mp=classCache.length-1;
	Class c;
	if (cp >= classCache.length)
	    c=Class.forName(dis.readUTF());
	else {
	    c=classCache[cp];
	    mp=cp;
	}
	System.arraycopy(classCache, 0, classCache, 1, mp);
	classCache[0]=c;
	return c;
    }

    public static void writeBer(int v, DataOutputStream dos) throws IOException {
	byte[] b=new byte[5];
	int p=4;

	while (v>0) {
	    b[p--]=(byte)((v & BER_MASK) | BER_CONT);
	    v>>>=7;
	 }
	b[4]&=BER_MASK;

	if (p==4) p=3;
	dos.write(b, p+1, b.length-(p+1));
    }

    public static short readBerShort(DataInputStream dis) throws IOException {
	return (short)readBer(dis);
    }

    public static int readBer(DataInputStream dis) throws IOException {
	int b=dis.readUnsignedByte();
	int val=b & BER_MASK;
	while ((b & BER_CONT) != 0) {
	    b=dis.readUnsignedByte();
	    val=(val<<7) + (b & BER_MASK);
	}
	return val;
    }
	
    public Expression deserialize(DataInputStream dis) throws IOException {
	Integer serialId=new Integer(readBer(dis));
	if (serialId.intValue()==0) return null;
	Expression e=(Expression)deserState.get(serialId);
	if (e==null) {
	    try {
		Class clazz=getClass(dis);
		if (Singleton.class.isAssignableFrom(clazz)) {
		    Method GVM=clazz.getMethod(GETVALUE,
					       GETVALUE_PROTO);
		    e=(Expression)GVM.invoke(null, new Object[] { dis });
		    deserState.put(serialId, e);
		} else {
		    e=(Expression)clazz.newInstance();
		    deserState.put(serialId, e);
		    DESM.invoke(e, new Object[] { this, dis });
		}
	    } catch (Exception e1) {
		if (e1 instanceof IOException)
		    throw (IOException)e1;
		else 
		    throw new IOException(e1.getMessage());
	    }
	    deserState.put(serialId, e);
	}
	return e;
    }
		
    public void serialize(Expression e, 
			  DataOutputStream dos) throws IOException {
	if (e==null) {
	    writeBer(0,dos);
	    return;
	} 

	Integer serialId=(Integer)serState.get(e);
	if (serialId==null) {
	    synchronized(this) {
		serialId=new Integer(nextid++);
	    }
	    serState.put(e, serialId);
	    writeBer(serialId.intValue(), dos);
	    putClass(e.getClass(), dos);
	    e.serialize(this, dos);
	} else 
	    writeBer(serialId.intValue(), dos);
    }
    
    
    public void serializeModule(Module m, 
				DataOutputStream dos) throws IOException {
	String className=m.getClass().getName();

	if (modules.get(className)==null) {
	    modules.put(className, m);
	}
	dos.writeUTF(className);
    }
    
    public Module retrieveModule(DataInputStream dis) throws IOException {
	String className=dis.readUTF();
	Module m=(Module)modules.get(className);
	if (m==null) {
	    try {
		Class mod=Class.forName(className);
		m=(Module)mod.newInstance();
		Method init=mod.getMethod(INITIALIZE, INIT_PROTO);
		init.invoke(m, new Object[] {f});
	    } catch (Exception e) {
		throw new IOException(e.getMessage());
	    }
	    modules.put(className, m);
	}
	return m;
    }
}
