package sisc.ser;

import java.io.IOException;
import java.util.*;
import sisc.AssociativeEnvironment;
import sisc.data.*;

public class LibraryAE extends AssociativeEnvironment {

    protected LibraryBuilder lb;
    protected Library base;
    protected Map addressMap;
    protected Set bindWatch;
    protected int parentIdx=-1;

    public static LibraryAE build(AssociativeEnvironment bindingsFrom, 
                                  LibraryBuilder b) {
        HashMap addressMap=new HashMap();
        for (Iterator i=bindingsFrom.bindingKeys().iterator(); i.hasNext();) {
            Object o=i.next();
            Symbol key=(Symbol)o;
            try {
                Value v=bindingsFrom.lookup(key);
                int epidx=b.add(v);
                addressMap.put(key, new Integer(epidx));
            } catch (ArrayIndexOutOfBoundsException aio) {}
                
        }

        int parentIdx=b.add(bindingsFrom.parent);
            
        LibraryAE lib=new LibraryAE(addressMap, parentIdx);
        return lib;
    }

    public LibraryAE(Symbol name, LibraryBuilder lb) {
        super(name);
        this.lb=lb;
        bindWatch=new HashSet();
    }

    public LibraryAE(Library base) {
        this.base=base;
        addressMap=new HashMap();
    }

    LibraryAE(Map addressMap, int parentIdx) {
        this.addressMap=addressMap;
        this.parentIdx=parentIdx;
    }


    public java.util.Set bindingKeys() {
        if (base==null)
            return super.bindingKeys();
        else {
            java.util.Set res;
            synchronized(symbolMap) {
                res = addressMap.keySet();
            }
            return res;
        }
    }

    public Value lookup(int i) {
        try {
            if (base==null)
                return super.lookup(i);
            else
                return (Value)base.getExpression(i);
        } catch (IOException e) {
            e.printStackTrace();
        }
        throw new ArrayIndexOutOfBoundsException();
    }

    public int getLoc(Symbol s) {
        int rv=super.getLoc(s);
        if (base==null) return rv;
        if (rv!=-1) return rv;
        try {
            return store(s, lookup(s));
        } catch (ArrayIndexOutOfBoundsException aib) {
            return -1;
        }
    }
            
    public Value lookup(Symbol s) {
        if (base==null)
            return super.lookup(s);
        else {
            Integer i=(Integer)addressMap.get(s);
            if (i==null) {
                if (parentIdx==-1)
                    throw new ArrayIndexOutOfBoundsException();
                if (parent==null)
                    try {
                        parent=(AssociativeEnvironment)base.getExpression(parentIdx);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                return parent.lookup(s);
            }
            return lookup(i.intValue());
        }
    }


    public void remove(Set s) {
        if (base==null) {
            super.remove(s);
            bindWatch.remove(s);
        } else
            addressMap.remove(s);
    }

    //Catch all occurences of sets and note them for when we serialize
    public int store(Symbol s, Value v) {
        int rv=super.store(s, v);
        if (bindWatch!=null)
            bindWatch.add(s);
        return rv;
    }

    public LibraryAE() {}

    public void deserialize(Deserializer d) throws IOException {
        int size=d.readInt();
        addressMap=new HashMap(size);
        for (int i=0; i<size; i++) {
            Symbol name=(Symbol)d.readExpression();

            Integer ep=new Integer(d.readInt());
            addressMap.put(name, ep);
        }
        parentIdx=d.readInt();
        base=d.getLibrary();
    }

    public void serialize(Serializer s) throws IOException {
        if (base == null) {
            s.writeInt(bindWatch.size());
            for (Iterator i=bindWatch.iterator(); i.hasNext();) {
                Symbol key=(Symbol)i.next();
                s.writeExpression(key);
                int pos=lb.add(super.lookup(key));
                s.writeInt(pos);
            }
            s.writeInt(lb.add(parent));
        } else {
            s.writeInt(addressMap.size());
            for (Iterator i=addressMap.keySet().iterator(); i.hasNext();) {
                Symbol key=(Symbol)i.next();
                Integer pos=(Integer)addressMap.get(key);
                s.writeExpression(key);
                s.writeInt(pos.intValue());
            }
            s.writeInt(parentIdx);
        }
    }
}
