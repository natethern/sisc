package sisc.ser;

import java.io.*;
import java.util.*;
import sisc.data.Expression;
import sisc.data.Singleton;
import sisc.env.SymbolicEnvironment;
import sisc.interpreter.AppContext;

public abstract class SLL2Serializer extends SerializerImpl {

    private Map offsets;
    protected DataOutputStream datout;
    protected CountingOutputStream cos;
    protected LinkedList serQueue;
    protected AppContext ctx;       
    
    protected SLL2Serializer(AppContext ctx, OutputStream out) throws IOException {
        this.ctx=ctx;
        cos=new CountingOutputStream(out);
        datout=new DataOutputStream(cos);
        
        serQueue=new LinkedList();
        offsets=new HashMap();
    }
   
    /**
     * Required call which actually writes out the bytes of an expression
     * 
     * @param e
     * @param flush
     * @throws IOException
     */     
    protected abstract void writeExpression(Expression e, boolean flush) throws IOException;
   
    /**
     * Callback that indicates the end of serializing an entry point
     * 
     * @param e The end-of-job token
     * @throws IOExceptioon
     */
    protected abstract void serializeEnd(SerJobEnd e) throws IOException;

    public void writeExpression(Expression e) throws IOException {
        writeExpression(e, false);
    }

    /* (non-Javadoc)
     * @see sisc.ser.Serializer#writeInitializedExpression(sisc.data.Expression)
     */
    public void writeInitializedExpression(Expression e) throws IOException {
        writeExpression(e, true);
    }

    public void writeSymbolicEnvironment(SymbolicEnvironment e) throws IOException {
        if (e==null) {
            writeExpression((Expression)null);
        } else if (e.getName()==null) { 
            writeExpression(e.asValue());
        } else 
            writeExpression(e.getName());
    }

    public void write(byte[] b) throws IOException {
        datout.write(b);
    }

    public void write(byte[] b, int off, int len) throws IOException {
        datout.write(b, off, len);
    }

    public void write(int b) throws IOException {
        datout.write(b);
    }

    public void writeBoolean(boolean v) throws IOException {
        datout.writeBoolean(v);
    }

    public void writeByte(int v) throws IOException {
        datout.writeByte(v);
    }

    public void writeBytes(String s) throws IOException {
        datout.writeBytes(s);
    }

    public void writeChar(int v) throws IOException {
        datout.writeChar(v);
    }

    public void writeChars(String v) throws IOException {
        datout.writeChars(v);
    }

    public void writeDouble(double v) throws IOException {
        writeLong(Double.doubleToLongBits(v));
    }

    public void writeLong(long v) throws IOException {
        writeBer(v, datout);
    }

    public void writeShort(int v) throws IOException {
        writeBer(v, datout);
    }

    public void writeUTF(String v) throws IOException {
        try {
            byte[] b=v.getBytes("UTF8");
            writeInt(b.length);
            datout.write(b);
        } catch (UnsupportedEncodingException use) {
            //Not possible
            throw new IOException("UTF8 Unsupported");
        }
    }

    public void writeFloat(float v) throws IOException {
        writeInt(Float.floatToIntBits(v));
    }

    public void writeInt(int v) throws IOException {
        writeBer(v, datout);
    }

    protected void serializeDetails(Expression e) throws IOException {
        e.serialize(this);
        e.serializeAnnotations(this);
    }

    public void serialize(Expression e) throws IOException {
        int start=serQueue.size();
        writeExpression(e);
        serLoop(start);
    }

    protected void serLoop(int start) throws IOException {
        while (serQueue.size()>start) {
            Object o=serQueue.removeFirst();
            if (o instanceof Expression) {
                serializeDetails((Expression)o);
            } else if (o instanceof SerJobEnd) {
                serializeEnd((SerJobEnd)o);
            } 
        }
    }

    
    public void close() throws IOException {
        flush();
        cos.close();
    }

    public void flush() throws IOException {
        if (serQueue.size() > 0) {
            serLoop(0);
        }
    }

    protected void writeSeenEntryPoint(int posi) throws IOException {
        writeInt(posi+16);
    }

    protected void setOffset(int posi, int bpos) {
        offsets.put(new Integer(posi), new Integer(bpos));
    }
    
    protected int writeNewEntryPointMarker(int posi, Expression e) throws IOException {
        setOffset(posi, cos.position);
        
        writeInt(2);
        writeInt(posi);
        return cos.position;
    }
    
    protected void writeOrdinaryExpressionMarker() throws IOException {
        writeInt(0);
    }

    protected boolean writeExpressionSerialization(Expression e, SerJobEnd end, boolean flush) throws IOException {
        writeInt(0);
        writeClass(e.getClass());
        if (e instanceof Singleton) {
            e.serialize(this);
            return true;
        } else {
            int start=serQueue.size();
            serQueue.addFirst(end);
            serQueue.addFirst(e);
            if (flush)
                serLoop(start);
            return false;
        }
    }

    protected boolean writeLibraryReference(LibraryBinding lb, SerJobEnd end, boolean flush) throws IOException {
        writeInt(4);
        writeUTF(lb.name);
        writeInt(lb.epid);
        return true;
    }

    protected int[] getOffsets() {
        int[] i=new int[offsets.size()];
        for (Iterator x=offsets.keySet().iterator(); x.hasNext();) {
            Integer key=(Integer)x.next();
            i[key.intValue()]=((Integer)offsets.get(key)).intValue();
        }
        return i;
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
