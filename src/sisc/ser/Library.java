package sisc.ser;

import java.util.*;
import java.io.*;
import java.net.URL;
import sisc.data.*;
import sisc.util.Util;

public class Library extends Util {
    static final String LIBRARY_VERSION="SLL2";
    
    protected String name;
    protected BinaryDeserializer lib;
    protected Map names;

    public static Library load(URL u) throws IOException, ClassNotFoundException {
        if (u.getProtocol().equalsIgnoreCase("file")) {
            String path=u.getPath();
            return load(new SeekableDataInputStream(new BufferedRandomAccessInputStream(path, "r")));
        } else {
            return load(new SeekableDataInputStream(new MemoryRandomAccessInputStream(u.openStream())));
        }
    }
       
    public static Library load(SeekableDataInput di) throws IOException, ClassNotFoundException {
        String libver=di.readUTF();
        if (!libver.equals(LIBRARY_VERSION))
            throw new IOException(liMessage(SISCB, "unsuplib"));

        String libname=di.readUTF();
        Class[] classes=new Class[BinaryDeserializer.readBer(di)];
        for (int i=0; i<classes.length; i++) {
            classes[i]=Class.forName(di.readUTF());
        }
        int socount=BinaryDeserializer.readBer(di);
        int[] sharedObjectOffsets=new int[socount];
        int[] sharedObjectSizes=new int[socount];

        HashMap names=new HashMap();

        for (int i=0; i<socount; i++) {
            sharedObjectOffsets[i]=BinaryDeserializer.readBer(di);
            sharedObjectSizes[i]=BinaryDeserializer.readBer(di);
        }
        
        int symtableLength=BinaryDeserializer.readBer(di);
        for (int i=0; i<symtableLength; i++) {
            String s=di.readUTF();
            int ep=BinaryDeserializer.readBer(di);
            names.put(Symbol.intern(s), new Integer(ep));
        }

        return new Library(libname, new BinaryDeserializer(di, classes, sharedObjectOffsets, sharedObjectSizes), names);
    }
        
        /* All this and more at your */ 
    public Library(String name, BinaryDeserializer lib, Map names) {
        this.name=name;
        this.lib=lib;
        this.names=names;
        lib.baseLib=this;
    }

    public int getEntryPoint(Symbol name) {
        Integer i=(Integer)names.get(name);
        if (i==null) return -1;
        else return i.intValue();
    }

    public Expression getLocalExpression(Symbol name) throws IOException {
        Integer i=(Integer)names.get(name);
        if (i==null) 
            throw new FileNotFoundException(liMessage(SISCB, 
                                                      "namedlibbindingnotfound", 
                                                      name.toString()));
        return getExpression(i.intValue());
    }

    public Expression getExpression(Symbol name) throws IOException {
        try {
            return getLocalExpression(name);
        } catch (FileNotFoundException fnf) {
            return sisc.interpreter.Context.currentInterpreter().getCtx().getExpression(name);
        }
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
        Expression e=l.getExpression(Integer.parseInt(args[1]));//Integer.parseInt(args[1]));
        System.err.println(e);
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
