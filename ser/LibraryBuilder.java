package sisc.ser;

import sisc.data.*;
import sisc.Module;
import java.util.*;
import java.io.*;
import sisc.*;
import java.lang.reflect.*;

/**
 * Keeps track of entry points - points where serialization begins.
 *
 */
public class LibraryBuilder extends Serializer {

    boolean addAllowed=true;
    Set classes, seen, duplicates;
    int dupid=0;
    LinkedList entryPoints, newEntryPoints;
    Map names; 
    boolean includeAEs;

    public LibraryBuilder() {
        this(true);
    }

    public LibraryBuilder(boolean iae) {
        includeAEs=iae;
        classes=new HashSet();
        seen=new HashSet();
        duplicates=new HashSet();
        entryPoints=new LinkedList();
        newEntryPoints=new LinkedList();
        names=new HashMap();
    }


    /**
     * Add an entry point.
     *
     * @param name the name of the entry point
     * @param val the value of the entry point
     * @return the index of the new (or existing) entry point
     */
    public int add(Symbol name, Expression val) {
        int epidx=add(val);
        names.put(new Integer(epidx), name);
        return epidx;
    }

    /**
     * Add a shared data structure
     *
     * @param val the shared data structure
     * @return the index of the new (or existing) shared data structure
     */
    public int add(Expression val) {
        if (val==null) return -1;
        int epidx=entryPoints.indexOf(val);
        if (epidx==-1) {
            int nepidx=newEntryPoints.indexOf(val);
            if (nepidx!=-1)
                epidx=entryPoints.size() + nepidx;
        }
        if (epidx==-1 && addAllowed) {
            epidx=entryPoints.size() + newEntryPoints.size();
            newEntryPoints.add(val);
        }
        return epidx;
    }

    public int get(Expression val) {
        return entryPoints.indexOf(val);
    }

    public Library buildLibrary(String name, 
                                OutputStream out) throws IOException {
        DataOutputStream datout=new DataOutputStream(out);

        //Pass 1
        System.err.println("Pass 1: Discovery...");

        //serialization may create new entry points, so we loop until
        //no new ones are added
        while (!newEntryPoints.isEmpty()) {
            entryPoints.addAll(newEntryPoints);
            LinkedList newEP=new LinkedList(newEntryPoints);
            newEntryPoints.clear();
            for (Iterator i=newEP.iterator(); i.hasNext();) {
                Expression exp=(Expression)i.next();
                writeExpression(exp);
            }
        }

        addAllowed=false;
        
        duplicates.removeAll(entryPoints);
        //Create the index table
        Expression[] epv=new Expression[entryPoints.size()+duplicates.size()];
        int x=0;
        for (Iterator i=entryPoints.iterator(); i.hasNext();) 
            epv[x++]=(Expression)i.next();

        for (Iterator i=duplicates.iterator(); i.hasNext();) {
            epv[x++]=(Expression)i.next();
        }

        //Pass 2
        System.err.println("Pass 2: Write data segment");
        File tempFile=File.createTempFile("heap","tmp");
        tempFile.deleteOnExit();
        OutputStream fos=new BufferedOutputStream(new FileOutputStream(tempFile));
        Vector classv=new Vector(classes);
        StreamSerializer ss=new StreamSerializer(fos, classv, epv);

        int j=0;
        for (Iterator i=entryPoints.iterator(); i.hasNext();) {
            Expression exp=(Expression)i.next();
            ss.writeExpression(exp);
        }
        fos.flush();
        fos.close();
        
        //Pass 3
        System.err.println("Pass 3: Write index");
        datout.writeUTF(name);
        writeBer(classes.size(), datout);
        for (int i=0; i<classv.size(); i++) {
            datout.writeUTF(((Class)classv.elementAt(i)).getName());
        }

        int[] offsets=ss.getOffsets();
        int[] sizes=ss.getSizes();

        writeBer(offsets.length, datout);
        for (int i=0; i<offsets.length; i++) {
            writeBer(offsets[i], datout);
            writeBer(sizes[i], datout);
            Symbol s=(Symbol)names.get(new Integer(i));
            datout.writeBoolean(s!=null);
            if (s!=null)
                datout.writeUTF(s.symval);
        }
        
        //Pass 4
        System.err.println("Pass 4: Append data segment");
        BufferedInputStream in=new BufferedInputStream(new FileInputStream(tempFile));
        int rc=0;
        byte[] buffer=new byte[65536];
        while (-1!=(rc=in.read(buffer))) {
            if (rc>0)
                datout.write(buffer, 0, rc);
        }
        datout.flush();

        System.err.println(classes.size()+" classes");
        System.err.println(offsets.length+" entry points");
        return null;
    }

    /*---Serialization functions---*/
    public void writeExpression(Expression e) throws IOException {
        if (e!=null) {
            if (seen(e)) {
                if (!entryPoints.contains(e) && !newEntryPoints.contains(e))
                    duplicates.add(e);
            } else {
                seen.add(e);
                writeClass(e.getClass());
                e.serialize(this);
                for (Iterator i=e.getAnnotationKeys().iterator();
                     i.hasNext();) {
                    Symbol key=(Symbol)i.next();
                    writeExpression(key);
                    writeExpression(e.getAnnotation(key));
                }
            }
        }
    }
    
    public void forceSeen(Expression e) {
        seen.add(e);
    }

    public void writeAssociativeEnvironment(AssociativeEnvironment e) 
        throws IOException {
        if (e!=null) {
            classes.add(e.getClass());
            if (includeAEs) {
                if (e.name!=null)
                    add(e.name,e);
                else 
                    add(e);
            }
        }
    }

    public void writeModule(Module e) throws IOException {
        classes.add(e.getClass());
    }

    public void writeClass(Class c) throws IOException {
        classes.add(c);
    }
        
    public boolean seen(Expression e) { 
        return seen.contains(e);
    }

    public void write(byte[] b) throws IOException {}
    public void write(byte[] b, int off, int len) throws IOException {}
    public void write(int b) throws IOException {}
    public void writeBoolean(boolean v) throws IOException {}
    public void writeByte(int v) throws IOException {}
    public void writeBytes(String s) throws IOException {}
    public void writeChar(int v) throws IOException {}
    public void writeChars(String v) throws IOException {}
    public void writeDouble(double v) throws IOException {}
    public void writeFloat(float v) throws IOException {}
    public void writeInt(int v) throws IOException {}
    public void writeLong(long v) throws IOException {}
    public void writeShort(int v) throws IOException {}
    public void writeUTF(String v) throws IOException {}

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

    public static void writeBer(long v, DataOutput dos) throws IOException {
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

    static final int BER_MASK=0x7f, BER_CONT=0x80;
    static Class[]
	DESER_PROTO=new Class[] { Serializer.class, DataInput.class },
	SER_PROTO=new Class[] { Serializer.class, DataOutput.class },
	INIT_PROTO=new Class[] { Interpreter.class },
	GETVALUE_PROTO=new Class[] { DataInput.class };

    static Method DESM;
}
