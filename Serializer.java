package sisc;

import java.io.*;
import java.math.*;
import sisc.data.*;
import java.util.*;
import java.lang.reflect.*;
import sisc.exprs.*;
import sisc.data.*;

public class Serializer implements Conf {

    static final int BER_MASK=0x7f, BER_CONT=0x80;

    static Class[]
	DESER_PROTO=new Class[] { Serializer.class, DataInput.class },
	SER_PROTO=new Class[] { Serializer.class, DataOutput.class },
	INIT_PROTO=new Class[] { Interpreter.class },
	GETVALUE_PROTO=new Class[] { DataInput.class };

    static Method DESM;

    static {
        try {
            DESM=Expression.class.getMethod("deserialize", DESER_PROTO);
        } catch (NoSuchMethodException nsm) {
        }
    }

    Hashtable serState, deserState;
    Hashtable modules;
    Class[] classCache=new Class[16];
    Interpreter f;
    int nextid=1;

    public Serializer(Interpreter r) {
        if (SERIALIZATION) {
            deserState=new Hashtable();
            serState=new Hashtable();
            modules=new Hashtable();
            f=r;
        }
    }

    public void putClass(Class c, DataOutput dos) throws IOException {
        if (SERIALIZATION) {
            int mp=classCache.length-1;
            int i;
            for (i=0; i<classCache.length; i++) {
                if (classCache[i]!=null && classCache[i].equals(c)) {
                    mp=i;
                    break;
                }
            }
            dos.write(i);
            if (i>=classCache.length) {
                dos.writeBoolean(c.isPrimitive());
                dos.writeUTF(c.getName());
            }
            System.arraycopy(classCache, 0, classCache, 1, mp);
            classCache[0]=c;
        }
    }

    public boolean seen(Expression e) {
        if (SERIALIZATION) {
            return serState.get(e)!=null;
        } else {
            return false;
        }
    }

    public Class getClass(DataInput dis) throws IOException, ClassNotFoundException {
        if (SERIALIZATION) {
            int cp=dis.readUnsignedByte();
            int mp=classCache.length-1;
            Class c;
            if (cp >= classCache.length) {
                if (dis.readBoolean()) {
                    String cname=dis.readUTF();
                    c=Void.class;
                    try {
                        c=(Class)Class.forName("java.lang."+
                                               Character.toUpperCase(cname.charAt(0))+
                                               cname.substring(1)).getField("TYPE").get(null);
                    } catch (IllegalAccessException iae) {
                    } catch (NoSuchFieldException nsf) {}
                } else {
                    c=Class.forName(dis.readUTF());
                }
            } else {
                c=classCache[cp];
                mp=cp;
            }
            System.arraycopy(classCache, 0, classCache, 1, mp);
            classCache[0]=c;
            return c;
        } else return null;
    }

    public void writeFloat(double d, DataOutput dos) throws IOException {
	writeFloat(new BigDecimal(d), dos); // could be optimized
    }

    public void writeFloat(BigDecimal d, DataOutput dos) throws IOException {
	int scale=d.scale();
	byte[] buffer=d.unscaledValue().toByteArray();
	writeBer(buffer.length, dos);
	writeBer(scale, dos);
	dos.write(buffer);
    }

    public BigDecimal readFloat(DataInput dis) throws IOException {
	byte[] buffer=new byte[readBer(dis)];
	int scale=readBer(dis);
	dis.readFully(buffer);

	return new BigDecimal(new BigInteger(buffer), scale);
    }

    public static void writeBer(long v, DataOutput dos) throws IOException {
        if (SERIALIZATION) {
            byte[] b=new byte[9];
            int p=8;

            while (v>0) {
                b[p--]=(byte)((v & BER_MASK) | BER_CONT);
                v>>>=7;
            }
            b[8]&=BER_MASK;

            if (p==8) p=7;
            dos.write(b, p+1, b.length-(p+1));
        }
    }

    public static short readBerShort(DataInput dis) throws IOException {
        return (short)readBer(dis);
    }

    public static int readBer(DataInput dis) throws IOException {
        return (int)readBerLong(dis);
    }

    public static long readBerLong(DataInput dis) throws IOException {
        if (SERIALIZATION) {
	    int b=dis.readUnsignedByte();
            long val=b & BER_MASK;
            while ((b & BER_CONT) != 0) {
                b=dis.readUnsignedByte();
                val=(val<<7) + (b & BER_MASK);
            }
            return val;
        } else return -1;
    }

    public final Expression deserialize(DataInput dis) throws IOException {
	return deserialize(dis, true);
    }

    public Expression deserialize(DataInput dis, boolean callDeser) 
	throws IOException {
        if (SERIALIZATION) {
            Integer serialId=new Integer(readBer(dis));
            if (serialId.intValue()==0) return null;
            Expression e=(Expression)deserState.get(serialId);
            if (e==null) {
                try {
                    Class clazz=getClass(dis);
                    if (Singleton.class.isAssignableFrom(clazz)) {
                        Method GVM=clazz.getMethod("getValue",
                                                   GETVALUE_PROTO);
                        e=(Expression)GVM.invoke(null, new Object[] { dis });
                        deserState.put(serialId, e);
                    } else {
                        e=(Expression)clazz.newInstance();
                        deserState.put(serialId, e);
                        if (callDeser) {
			    DESM.invoke(e, new Object[] { this, dis });
                            for (int i=readBer(dis); i>0; i--) {
                                Symbol key=(Symbol)deserialize(dis);
                                e.setAnnotation(key, (Value)deserialize(dis));
                            }
			}
                    }
                } catch (Exception e1) {
                    if (e1 instanceof IOException)
                        throw (IOException)e1;
                    else {
                        e1.printStackTrace();
                        throw new IOException(e1.getMessage());
                    }
                }
                deserState.put(serialId, e);
            }
            return e;
        } else return null;
    }

    public void serialize(Expression e,
                          DataOutput dos) throws IOException {
        if (SERIALIZATION) {
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
		if (!(e instanceof Singleton)) {
                    Set s=e.getAnnotationKeys();
                    writeBer(s.size(), dos);
                    if (!s.isEmpty()) {
                        for (Iterator i=s.iterator(); i.hasNext();) {
                            Symbol key=(Symbol)i.next();
                            serialize(key, dos);
                            serialize(e.getAnnotation(key), dos);
                        }
                    }
		}
            } else
                writeBer(serialId.intValue(), dos);
        }
    }


    public void serializeModule(Module m,
                                DataOutput dos) throws IOException {
        if (SERIALIZATION) {
            String className=m.getClass().getName();

            if (modules.get(className)==null) {
                modules.put(className, m);
            }
            dos.writeUTF(className);
        }
    }

    public Module retrieveModule(DataInput dis) throws IOException {
        if (SERIALIZATION) {
            String className=dis.readUTF();
            Module m=(Module)modules.get(className);
            if (m==null) {
                try {
                    Class mod=Class.forName(className);
                    m=(Module)mod.newInstance();
                } catch (Exception e) {
		    e.printStackTrace();
                    throw new IOException(e.getMessage());
                }
                modules.put(className, m);
            }
            return m;
        } else return null;
    }
}
