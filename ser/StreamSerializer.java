package sisc.ser;

import sisc.data.Expression;
import sisc.data.Singleton;
import sisc.data.Symbol;
import sisc.Module;
import java.util.*;
import java.io.*;
import sisc.*;
import java.lang.reflect.*;

public class StreamSerializer extends Serializer {

    Vector classes;
    Set seen;
    int[] offsets, sizes;
    Expression[] entryPoints;
    DataOutput datout;
    CountingOutputStream cos;
    HashMap epi, ci;
    
    static final int WATCH=512;

    public StreamSerializer(OutputStream out, Vector classes, 
                            Expression[] entryPoints) {
        this.classes=classes;
        cos=new CountingOutputStream(out);
        this.datout=new DataOutputStream(cos);
        seen=new HashSet();
        this.entryPoints=entryPoints;
        offsets=new int[entryPoints.length];
        sizes=new int[entryPoints.length];

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
    public void writeExpression(Expression e) throws IOException {
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
            }
        } else writeInt(0);


        writeClass(e.getClass());
        e.serialize(this);
        if (!(e instanceof Singleton)) {
            Set s=e.getAnnotationKeys();
            writeInt(s.size());
            for (Iterator i=s.iterator(); i.hasNext();) {
                Symbol key=(Symbol)i.next();
                writeExpression(key);
                writeExpression(e.getAnnotation(key));
            }
        }
        if (sizeStartOffset != -1)
            sizes[posi] = cos.position - sizeStartOffset;
    }

    public void writeAssociativeEnvironment(AssociativeEnvironment e)
        throws IOException {
        if (e==null || e.name==null) { 
            writeExpression(e);
        } else 
            writeExpression(e.name);
    }

    public void writeModule(Module e) throws IOException {
        writeClass(e.getClass());
    }

    public void writeClass(Class c) throws IOException {
        writeInt(((Integer)ci.get(c)).intValue());
    }
        
    public boolean seen(Expression e) { 
        return seen.contains(e);
    }

    public void forceSeen(Expression e) {
        seen.add(e);
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

    /*---helper functions---*/
    public static void writeBer(long v, DataOutput dos) throws IOException {
        byte[] b=new byte[10];
        int p=9;
        
        while (v!=0) {
            b[p--]=(byte)((v & BER_MASK) | BER_CONT);
            v>>>=7;
        }
        b[9]&=BER_MASK;
        
        if (p==9) p=8;
        dos.write(b, p+1, b.length-(p+1));
    }

    static final int BER_MASK=0x7f, BER_CONT=0x80;
    static Class[]
	DESER_PROTO=new Class[] { Serializer.class, DataInput.class },
	SER_PROTO=new Class[] { Serializer.class, DataOutput.class },
	INIT_PROTO=new Class[] { Interpreter.class },
	GETVALUE_PROTO=new Class[] { DataInput.class };

    static Method DESM;
}
