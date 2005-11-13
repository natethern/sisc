package sisc.ser;

import sisc.util.Util;
import java.util.*;
import java.io.*;
import sisc.data.*;
import sisc.env.SymbolicEnvironment;
import sisc.interpreter.AppContext;

public class StreamDeserializer extends DeserializerImpl {

    private AppContext ctx;
    private Map classPool, alreadyReadObjects;
    private ObjectInputStream objin;
    private LinkedList deserQueue;

    public StreamDeserializer(AppContext ctx, InputStream input) throws IOException {
        this.ctx=ctx;
        this.objin=new NestedObjectInputStream(input,this);
        classPool=new HashMap();
        alreadyReadObjects=new HashMap();
        deserQueue=new LinkedList();
    }

    public final Expression readExpression() throws IOException {
        return readExpression(false, -1);
    }

    public final Expression readInitializedExpression() throws IOException {
        return readExpression(true, -1);
    }

    private void recordReadObject(int definingOid, Expression e) {
        if (definingOid!=-1) {
            Integer epIdx=new Integer(definingOid);
            if (alreadyReadObjects.get(epIdx)==null)
                alreadyReadObjects.put(epIdx, e);
        }
    }

    public Expression readExpression(boolean flush, int definingOid) throws IOException {
        int type=readInt();

        try {
            //Read the stream object type, values above 15 of which represent
            //shared objects
            switch(type) {
            case 2: //shared expressions
                return readExpression(flush, readInt());
            case 0: //ordinary expressions
                Expression e;
                Class clazz=readClass();
                e=(Expression)clazz.newInstance();
                if (e instanceof Singleton) {
                    e.deserialize(this);
                    e = ((Singleton)e).singletonValue();
                    recordReadObject(definingOid, e);
                } else {
                    recordReadObject(definingOid, e);
                    int start=deserQueue.size();
                    deserQueue.addFirst(e);
                    if (flush) deserLoop(start);
                }
                return e;
            case 1: //null
                return null;
            case 4:
                String libName=readUTF();
                int epid=readInt();
                e=ctx.getExpression(libName, epid);
                recordReadObject(definingOid, e);
                return e;
            default: //expression references
                return fetchShared(type-16);
            }
        } catch (InstantiationException ie) {
            ie.printStackTrace();
            throw new IOException(ie.getMessage());
        } catch (IllegalAccessException iae) {
            iae.printStackTrace();
            throw new IOException(iae.getMessage());
        } 
    }

    public Expression deser() throws IOException {
        int start=deserQueue.size();
        Expression e=readExpression();
        deserLoop(start);
        return e;
    }
    
    void deserLoop(int start) throws IOException {
        while (deserQueue.size()>start) {
            Object o=deserQueue.removeFirst();
            initializeExpression((Expression)o);
        }
    }

    void initializeExpression(Expression e) throws IOException {
        e.deserialize(this);
        e.deserializeAnnotations(this);
    }
    
    protected Expression fetchShared(int oid) throws IOException {
        try {
            Expression e=(Expression)alreadyReadObjects.get(new Integer(oid));
            if (e==null) {
                throw new IOException(Util.liMessage(Util.SISCB, "undefedepinstream"));
            }
            return e;
        } catch (ArrayIndexOutOfBoundsException aib) {
            throw new FileNotFoundException(Util.liMessage(Util.SISCB, "invalidentrypoint", new Object[] {new Integer(oid)}));
        }
    }            
    
    public SymbolicEnvironment readSymbolicEnvironment() throws IOException {
        Expression e=readExpression();
        if (e instanceof Symbol) 
            e=ctx.getExpression((Symbol)e);
        return (SymbolicEnvironment)e;
    }

    public Class readClass() throws IOException {
        int cid=readInt();
        Integer i=new Integer(cid);
        Class c=(Class)classPool.get(i);
        if (c==null) {
            try {
                c=Class.forName(readUTF());
                classPool.put(i, c);
            } catch (ClassNotFoundException cnf) {
                throw new IOException("cnf:"+cnf.getMessage());
            }
        }
        return c;
    }
        
    public int read(byte[] b) throws IOException {
        return objin.read(b);
    }

    public int read(byte[] b, int off, int len) throws IOException {
        return objin.read(b, off, len);
    }

    public int read() throws IOException {
        return objin.read();
    }

    public boolean readBoolean() throws IOException {
        return objin.readBoolean();
    }

    public byte readByte() throws IOException {
        return (byte)readBer(objin);
    }


    public char readChar() throws IOException {
        return objin.readChar();
    }

    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readLong());
    }

    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readInt());
    }

    public int readInt() throws IOException {
        return readBer(objin);
    }

    public long readLong() throws IOException {
        return readBerLong(objin);
    }

    public short readShort() throws IOException {
        return readBerShort(objin);
    }

    public String readUTF() throws IOException {
        return objin.readUTF();
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

    public int skipBytes(int bc) throws IOException {
        return objin.skipBytes(bc);
    }

    public Object readObject() throws IOException, ClassNotFoundException {
        return objin.readObject();
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
