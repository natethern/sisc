package sisc.ser;

import sisc.data.*;
import sisc.Module;
import java.util.*;
import java.io.*;
import java.lang.ref.*;
import sisc.*;
import java.lang.reflect.*;

public class BinaryDeserializer extends Deserializer {

    static final boolean DEBUG = false;

    Map modules;
    Class[] classPool;
    Expression[] alreadyReadObjects;
    int[] offsets;
    SeekableDataInput raf;
    Object[] thisArray=new Object[] { this };
    long base;
    Library baseLib;

    public void clear() {
        for (int i=0; i<alreadyReadObjects.length; i++)
            alreadyReadObjects[i]=null;
    }

    public BinaryDeserializer(SeekableDataInput input, 
                              Class[] c, int[] o) throws IOException {
        this.raf=input;
        base=raf.getFilePointer();
        classPool=c;
        offsets=o;
        alreadyReadObjects=new Expression[offsets.length];
        modules=new HashMap();
    }

    int indent=0;
    static final String indentionBase="                                                                                                       ";

    public Expression readExpression() throws IOException {
        indent++;
        long pos=raf.getFilePointer();
        int oid=readInt();
        if (DEBUG && (oid == 0 || oid == 2))
            System.err.print(indentionBase.substring(0,indent)+indent+"|"+pos+"]");

        int definingOid = -1;
        try {
            //System.err.print(justify("",indent,' ')+Long.toHexString(pos)+" "+oid+"]");

            //Read the stream object type, values above 15 of which represent
            //shared objects
            switch(oid) {
            case 2:
                definingOid=readInt();
            case 0:
                Expression e;
                Class clazz=readClass();
                if (DEBUG) {
                    if (definingOid!=-1) System.err.println(clazz+" -> "+definingOid);
                    else System.err.println(clazz);
                }

                if (Singleton.class.isAssignableFrom(clazz)) {
                    //System.err.println(" (S) ");
                    try {
                        Method GVM=clazz.getMethod("getValue", DESER_PROTO);
                        e=(Expression)GVM.invoke(null, thisArray);
                        if (definingOid!=-1)
                            alreadyReadObjects[definingOid]=e;//new SoftReference(e);
                    } catch (NoSuchMethodException nsm) {
                        e=(Expression)clazz.newInstance();
                    }
                } else {
                    //System.err.println(" (NS) ");
                    e=(Expression)clazz.newInstance();
                    if (definingOid!=-1)
                        alreadyReadObjects[definingOid]=e;//new SoftReference(e);
                    DESM.invoke(e, thisArray);
                    int ac=readInt();
                    //if (ac>0) System.err.println("!!!"+ac);
                    for (; ac>0; ac--) {
                        //System.err.println(pos);
                        Expression key=readExpression();
                        Expression value=readExpression();
                        e.setAnnotation((Symbol)key, (Value)value);
                    }
                }
                return e;
            case 1:
                //System.err.println("null");
                return null;
            default:
                //System.err.println("Fo:"+(oid-2));
                return fetchShared(oid-16);
            }
        } catch (InvocationTargetException ite) {
            ite.printStackTrace();
            throw new IOException(ite.getMessage());
        } catch (InstantiationException ie) {
            throw new IOException(ie.getMessage());
        } catch (IllegalAccessException iae) {
            iae.printStackTrace();
            throw new IOException(iae.getMessage());
        } finally {
            indent--;
        }
    }

    protected Expression fetchShared(int oid) throws IOException {
        Expression e=null;
        if (alreadyReadObjects[oid]!=null) 
            e = (Expression) alreadyReadObjects[oid];//.get();

        if (e==null) {
            long currentPos=raf.getFilePointer();
            //System.err.println("Seeking to "+ base +":"+ offsets[oid]+" ["+Long.toHexString(base+offsets[oid])+"]");
            raf.seek(base + offsets[oid]);
            e=readExpression();
            raf.seek(currentPos);
        }

        return e;
    }            

    public Library getLibrary() {
        return baseLib;
    }

    public Module readModule() throws IOException {
        Class c=readClass();
        Module m=(Module)modules.get(c);
        if (m!=null)
            return m;
        else {
            try {
                m=(Module)c.newInstance();
            } catch (Exception ie) {
                ie.printStackTrace();
                throw new IOException(ie.getMessage());
            }
            modules.put(c, m);
            return m;
        }
    }

    public Class readClass() throws IOException {
        return classPool[readInt()];
    }
        
    public int read(byte[] b) throws IOException {
        return raf.read(b);
    }

    public int read(byte[] b, int off, int len) throws IOException {
        return raf.read(b, off, len);
    }

    public int read() throws IOException {
        return raf.read();
    }

    public boolean readBoolean() throws IOException {
        return raf.readBoolean();
    }

    public byte readByte() throws IOException {
        return (byte)readBer(raf);
    }


    public char readChar() throws IOException {
        return raf.readChar();
    }

    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readLong());
    }

    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readInt());
    }

    public int readInt() throws IOException {
        return readBer(raf);
    }

    public long readLong() throws IOException {
        return readBerLong(raf);
    }

    public short readShort() throws IOException {
        return readBerShort(raf);
    }

    public String readUTF() throws IOException {
        return raf.readUTF();
    }

    public void readFully(byte[] b) throws IOException {
        readFully(b, 0, b.length);
    }

    public void readFully(byte[] b, int offset, int len) throws IOException {
        int rc=0;
        while (len>0 && rc>-1) {
            rc=read(b, offset, len);
            if (rc>0) {
                offset+=rc;
                len-=rc;
                
            }
        }
        if (rc==-1) throw new EOFException();
    }

    public int readUnsignedByte() throws IOException {
        return readByte() & 0xff;
    }

    public int readUnsignedShort() throws IOException {
        return readShort() & 0xffff;
    }

    public int skipBytes(int bc) throws IOException {
        return raf.skipBytes(bc);
    }

    public String readLine() throws IOException {
        return null; //not supported;
    }

    /*---helper functions---*/
    public static short readBerShort(DataInput dis) throws IOException {
        return (short)readBer(dis);
    }

    public static int readBer(DataInput dis) throws IOException {
        return (int)readBerLong(dis);
    }

    public static long readBerLong(DataInput dis) throws IOException {
        int b=dis.readUnsignedByte();
        long val=b & BER_MASK;
        while ((b & BER_CONT) != 0) {
            b=dis.readUnsignedByte();
            val=(val<<7) + (b & BER_MASK);
        }
        return val;
    }


    static final int BER_MASK=0x7f, BER_CONT=0x80;
    static Class[]
	DESER_PROTO=new Class[] { Deserializer.class };

    static Method DESM;

    static {
        try {
            DESM=Expression.class.getMethod("deserialize", DESER_PROTO);
        } catch (NoSuchMethodException nsm) {
        }
    }
    
    public static void main(String[] args) throws IOException {
        ByteArrayOutputStream bos=new ByteArrayOutputStream();
        DataOutputStream dos=new DataOutputStream(bos);
        StreamSerializer.writeBer(-1, dos);
        byte[] b=bos.toByteArray();
        for (int i=0; i<b.length; i++) {
            System.err.println(Integer.toHexString(b[i]&0xff));
        }
        ByteArrayInputStream bis=new ByteArrayInputStream(b);
        DataInputStream dis=new DataInputStream(bis);
        System.err.println(readBerLong(dis));
    }
}
