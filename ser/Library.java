package sisc.ser;

import java.io.*;
import java.math.*;
import sisc.data.*;
import java.lang.reflect.*;
import sisc.*;
import java.util.*;

public class Library {

    protected String name;
    protected BinaryDeserializer lib;
    protected Map names;

    public static Library load(SeekableDataInput di) throws IOException, ClassNotFoundException {
        String libname=di.readUTF();
        Class[] classes=new Class[BinaryDeserializer.readBer(di)];
        for (int i=0; i<classes.length; i++) {
            classes[i]=Class.forName(di.readUTF());
        }
        int socount=BinaryDeserializer.readBer(di);
        int[] sharedObjectOffsets=new int[socount];
        HashMap names=new HashMap();

        for (int i=0; i<socount; i++) {
            sharedObjectOffsets[i]=BinaryDeserializer.readBer(di);
            if (di.readBoolean()) {
                Symbol name=Symbol.get(di.readUTF());
                names.put(name, new Integer(i));
            }
        }

        return new Library(libname, new BinaryDeserializer(di, classes, sharedObjectOffsets), names);
    }
        
        /* All this and more at your */ 
    public Library(String name, BinaryDeserializer lib, Map names) {
        this.name=name;
        this.lib=lib;
        this.names=names;
        lib.baseLib=this;
    }

    public Expression getLocalExpression(Symbol name) throws IOException {
        Integer i=(Integer)names.get(name);
        if (i==null) return null;
        return getExpression(i.intValue());
    }

    public Expression getExpression(Symbol name) throws IOException {
        Expression rv=getLocalExpression(name);
        if (rv==null) return LibraryManager.getInstance().getExpression(name);
        return rv;
    }

    public Expression getExpression(int oid) throws IOException {
        if (oid==-1) 
            return null;
        Expression rv=lib.fetchShared(oid);
        return rv;
    }

    public String getName() {
        return name;
    }

    public static void main(String[] args) throws Exception {
        Library l=Library.load(new SeekableDataInputStream(new BufferedRandomAccessInputStream(args[0], "r", 8, 2048)));
        Expression e=l.getExpression(Symbol.get(args[1]));//Integer.parseInt(args[1]));
        System.err.println(e);
    }

    public void clear() {
        lib.clear();
    }
        
}
