package sisc.ser;

import java.io.IOException;
import java.util.*;
import sisc.AssociativeEnvironment;
import sisc.data.*;


/**
 * An AE backed by a random-access library. It can operate in two
 * modes:
 * 1) "observe" - keep track of bindings from which to later create a
 * library
 * 2) "retrieve" - access bindings in a library
 */
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

        int parentIdx = (bindingsFrom.parent == null) ? -1 : b.add(bindingsFrom.parent);

        LibraryAE lib=new LibraryAE(addressMap, parentIdx);
        return lib;
    }

    /**
     * Operate in "observe" mode.
     *
     * @param name the name of the AE
     * @param lb the library serializer
     */
    public LibraryAE(Symbol name, LibraryBuilder lb) {
        super(name);
        this.lb=lb;
        bindWatch=new HashSet();
    }

    
    /**
     * Operate in "retrieve" mode.
     *
     * @param base the library from which to retrieve bindings
     */
    public LibraryAE(Library base) {
        this.base=base;
        addressMap=new HashMap();
    }

    LibraryAE(Map addressMap, int parentIdx) {
        this.addressMap=addressMap;
        this.parentIdx=parentIdx;
    }


    private void loadParent() {
        if (parent != null || parentIdx == -1) return;
        try {
            parent=(AssociativeEnvironment)base.getExpression(parentIdx);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public java.util.Set bindingKeys() {
        if (base==null)
            return super.bindingKeys();
        else {
            java.util.Set res;
            synchronized(symbolMap) {
                res = addressMap.keySet();
            }
            loadParent();
            if (parent != null) {
                res.addAll(parent.bindingKeys());
            }
            return res;
        }
    }

    public int getLoc(Symbol s) {
        synchronized(symbolMap) {
            //already loaded?
            Integer i = (Integer)symbolMap.get(s);
            if (i!=null) return i.intValue();
            //present in this AE?
            if (base != null) {
                i = (Integer)addressMap.get(s);
                if (i!=null) {
                    try {
                        return store(s, (Value)base.getExpression(i.intValue()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                loadParent();
            }
            //try parent
            if (parent == null) return -1;
            int pi=parent.getLoc(s);
            if (pi==-1) return -1;
            return store(s, parent.lookup(pi));
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
            //serialize in "observe" mode
            s.writeInt(bindWatch.size());
            for (Iterator i=bindWatch.iterator(); i.hasNext();) {
                Symbol key=(Symbol)i.next();
                s.writeExpression(key);
                //add binding as new entry point to library
                int pos=lb.add(super.lookup(key));
                s.writeInt(pos);
            }
            s.writeInt(lb.add(parent));
        } else {
            //serialize in "retrieve" mode
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
