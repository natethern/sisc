package sisc.ser;

import java.io.IOException;
import java.util.*;
import sisc.AssociativeEnvironment;
import sisc.SymbolicEnvironment;
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

    private void loadParent() {
        if (parent != null || parentIdx == -1) return;
        try {
            parent=(SymbolicEnvironment)base.getExpression(parentIdx);
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
    
    /**
     * Catch all occurences of sets and note them for when we serialize
     *
     * @param s the key being set
     * @param v the value associated with the key
     * @return index of binding
     */
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
            if (name!=null)
                lb.add(name, this);

            s.writeInt(bindWatch.size());
            for (Iterator i=bindWatch.iterator(); i.hasNext();) {
                Symbol key=(Symbol)i.next();
                s.writeExpression(key);
                //add binding as new entry point to library
                int pos=lb.add(super.lookup(key));
                s.writeInt(pos);
            }
            s.writeInt(lb.add(parent == null ? null : parent.asValue()));
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
