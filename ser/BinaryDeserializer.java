package sisc.ser;

import java.util.*;
import java.io.*;
import java.lang.ref.*;
import java.lang.reflect.*;
import sisc.data.*;
import sisc.nativefun.Module;
import sisc.env.SymbolicEnvironment;

public class BinaryDeserializer extends DeserializerImpl {

    static final boolean DEBUG = false;

    Map modules;
    Class[] classPool;
    Expression[] alreadyReadObjects;
    int[] offsets, sizes;
    SeekableDataInput raf;
    Object[] thisArray=new Object[] { this };
    long base;
    Library baseLib;
    LinkedList deserQueue;

    public BinaryDeserializer(SeekableDataInput input, 
                              Class[] c, int[] o, int[] l) throws IOException {
        this.raf=input;
        base=raf.getFilePointer();
        classPool=c;
        offsets=o;
        sizes=l;
        alreadyReadObjects=new Expression[offsets.length];
        modules=new HashMap();
        deserQueue=new LinkedList();
    }

    int indent=0;
    static final String indentionBase="                                                                                                       ";

    public Expression readExpression() throws IOException {
        indent++;
        long pos=raf.getFilePointer();
        int type=readInt();
        int definingOid = -1;
        boolean flush=false;

        try {
            if (DEBUG)
                System.err.print(justify("",indent,' ')+Long.toHexString(pos)+" "+type+"]");

            //Read the stream object type, values above 15 of which represent
            //shared objects
            switch(type) {
            case 2:
                definingOid=readInt();
                if (alreadyReadObjects[definingOid] != null) {
                    int sc=sizes[definingOid];
                    while (sc>0) {
                        sc-=raf.skipBytes(sc);
                    }
                    return alreadyReadObjects[definingOid];
                } else flush=true;
            case 0:
                Expression e;
                Class clazz=readClass();
                if (DEBUG) {
                    if (definingOid!=-1) System.err.println(clazz+" -> "+definingOid);
                    else System.err.println(clazz);
                }

                e=(Expression)clazz.newInstance();
                if (e instanceof Singleton) {
                    e.deserialize(this);
                    e = ((Singleton)e).singletonValue();
                    if (DEBUG) System.err.println(" (S) ");
                    if (definingOid!=-1 && alreadyReadObjects[definingOid]==null)
                        alreadyReadObjects[definingOid]=e;//new SoftReference(e);
                } else {
                    //System.err.println(" (NS) ");
                    if (definingOid!=-1 && alreadyReadObjects[definingOid]==null)             
                        alreadyReadObjects[definingOid]=e;//new SoftReference(e);
                    int start=deserQueue.size();
                    deserQueue.addFirst(e);
                    if (flush) deserLoop(start);
                }
                return e;
            case 1:
                if (DEBUG) System.err.println("null");
                return null;
            default:
                if (DEBUG) System.err.println("Fo:"+(type-2));
                return fetchShared(type-16);
            }
        } catch (InstantiationException ie) {
            ie.printStackTrace();
            throw new IOException(ie.getMessage());
        } catch (IllegalAccessException iae) {
            iae.printStackTrace();
            throw new IOException(iae.getMessage());
        } finally {
            indent--;
        }
    }

    Expression deser() throws IOException {
        int start=deserQueue.size();
        Expression e=readExpression();
        deserLoop(start);
        return e;
    }
    
    void deserLoop(int start) throws IOException {
        while (deserQueue.size()>start) {
            if (false && DEBUG) {
                System.err.print('[');
                for (Iterator i=deserQueue.iterator(); i.hasNext();) {
                    System.err.print(i.next().getClass().toString()+",");
                }
                System.err.println(']');
            }
            Object o=deserQueue.removeFirst();
            initializeExpression((Expression)o);
        }
    }

    void initializeExpression(Expression e) throws IOException {
        e.deserialize(this);
        int ac=readInt();
        //if (ac>0) System.err.println("!!!"+ac);
        for (; ac>0; ac--) {
            //System.err.println(pos);
            Expression key=readExpression();
            Expression value=readExpression();
            e.setAnnotation((Symbol)key, (Value)value);
        }
    }
    
    protected Expression fetchShared(int oid) throws IOException {
        try {
            Expression e=alreadyReadObjects[oid];
            if (e==null) {
                long currentPos=raf.getFilePointer();
                if (DEBUG) System.err.println("Seeking to "+ base +":"+ offsets[oid]+" ["+Long.toHexString(base+offsets[oid])+"]");
                raf.seek(base + offsets[oid]);
                e=deser();
                raf.seek(currentPos);
            }
            return e;
        } catch (ArrayIndexOutOfBoundsException aib) {
            throw new FileNotFoundException(liMessage(SISCB, "invalidentrypoint", new Object[] {new Integer(oid)}));
        }
    }            

    public Library getLibrary() {
        return baseLib;
    }

    public SymbolicEnvironment readSymbolicEnvironment() throws IOException {
        Expression e=readExpression();
        if (e instanceof Symbol) 
            e=baseLib.getExpression((Symbol)e);
        return (SymbolicEnvironment)e;

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
