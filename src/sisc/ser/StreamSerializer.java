package sisc.ser;

import java.util.*;
import java.io.*;
import sisc.data.Expression;
import sisc.data.Singleton;
import sisc.env.SymbolicEnvironment;

public class StreamSerializer extends SerializerImpl {

    private static class SerJobEnd {
        public int posi;
        public int sizeStartOffset;

        public SerJobEnd(int posi, int sizeStartOffset) {
            this.posi=posi;
            this.sizeStartOffset=sizeStartOffset;
        }
    }

    private Vector classes;
    private Set seen;
    private int[] offsets, sizes;
    private Expression[] entryPoints;
    private DataOutput datout;
    private CountingOutputStream cos;
    private HashMap epi, ci;
    private LinkedList serQueue;

    private static final int WATCH=512;

    public StreamSerializer(OutputStream out, Vector classes, 
                            Expression[] entryPoints) {
        this.classes=classes;
        cos=new CountingOutputStream(out);
        this.datout=new DataOutputStream(cos);
        seen=new HashSet();
        this.entryPoints=entryPoints;
        offsets=new int[entryPoints.length];
        sizes=new int[entryPoints.length];
        serQueue=new LinkedList();
        
        ci=new HashMap();
        for (int i=0; i<classes.size(); i++) {
            ci.put(classes.elementAt(i), new Integer(i));
        }

        epi=new HashMap();
        for (int i=0; i<entryPoints.length; i++) {
            epi.put(entryPoints[i], new Integer(i));
        }
    }

    int[] getOffsets() {
        return offsets;
    }

    int[] getSizes() {
        return sizes;
    }

    public boolean SHOWEP;

    public final void writeExpression(Expression e) throws IOException {
        writeExpression(e, false);
    }

    public final void writeInitializedExpression(Expression e) throws IOException {
        writeExpression(e, true);
    }

    /**
     * Serializes expressions. We distinguish betweeen four types of
     * expressions:
     * Type 0: normal expression
     * Type 1: null
     * Type 2: first encounter of entry point / shared expression
     * Type 16+n: reference to entry point / shared expression n
     *
     * @param e the expression to serialize
     * @exception IOException if an error occurs
     */
    public void writeExpression(Expression e, boolean flush) throws IOException {
        if (e==null) {
            //null
            writeInt(1);
            return;
        } 

        Integer epIndex=(Integer)epi.get(e);

        int sizeStartOffset = -1;
        int posi=-1;

        if (epIndex!=null) {
            posi=epIndex.intValue();
            //entry point / shared expression
            if (seen(e)) {
                writeInt(posi+16);
                return;
            }  else {
                seen.add(e);
                offsets[posi]=cos.position;
                writeInt(2);
                writeInt(posi);
                sizeStartOffset = cos.position;
                flush=true;
            }
        } else writeInt(0);

        writeClass(e.getClass());
        if (e instanceof Singleton) {
            e.serialize(this);
            if (sizeStartOffset != -1)
                sizes[posi] = cos.position - sizeStartOffset;
        } else {
            int start=serQueue.size();
            serQueue.addFirst(new SerJobEnd(posi, sizeStartOffset));
            serQueue.addFirst(e);
            if (flush)
                serLoop(start);
        }
    }
    
    private void serializeEnd(SerJobEnd j) {
        if (j.sizeStartOffset != -1)
            sizes[j.posi] = cos.position - j.sizeStartOffset;
    }
        
    private void serializeDetails(Expression e) throws IOException {
        e.serialize(this);
        e.serializeAnnotations(this);
    }
    
    private boolean seen(Expression e) { 
        return seen.contains(e);
    }

    public void serialize(Expression e) throws IOException {
        int start=serQueue.size();
        writeExpression(e);
        serLoop(start);
    }
    
    private void serLoop(int start) throws IOException {
        while (serQueue.size()>start) {
            Object o=serQueue.removeFirst();
            if (o instanceof Expression) {
                serializeDetails((Expression)o);
            } else if (o instanceof SerJobEnd) {
                serializeEnd((SerJobEnd)o);
            } 
        }
    }

    public void writeSymbolicEnvironment(SymbolicEnvironment e)
        throws IOException {
        if (e==null) {
            writeExpression((Expression)null);
        } else if (e.getName()==null) { 
            writeExpression(e.asValue());
        } else 
            writeExpression(e.getName());
    }

    public void writeClass(Class c) throws IOException {
        writeInt(((Integer)ci.get(c)).intValue());
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

    public void writeFloat(float v) throws IOException {
        writeInt(Float.floatToIntBits(v));
    }

    public void writeInt(int v) throws IOException {
        writeBer(v, datout);
    }

    public void writeLong(long v) throws IOException {
        writeBer(v, datout);
    }

    public void writeShort(int v) throws IOException {
        writeBer(v, datout);
    }

    public void writeUTF(String v) throws IOException {
        datout.writeUTF(v);
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
