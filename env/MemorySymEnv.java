package sisc.env;

import java.util.Map;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import sisc.data.*;
import java.io.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class MemorySymEnv extends NamedValue implements SymbolicEnvironment {

    protected static final float EXPFACT=1.5F;
    public Map symbolMap;
    public Value[] env;
    public SymbolicEnvironment parent;
    protected int nextFree;

    public MemorySymEnv(SymbolicEnvironment parent) {
        this();
        this.parent=parent;
    }

    public MemorySymEnv(SymbolicEnvironment parent, Symbol name) {
        this(name);
        this.parent=parent;
    }

    private MemorySymEnv(Value[] env, Map symMap) {
        this.env=env;
        symbolMap=symMap;
        nextFree=env.length;
    }

    public MemorySymEnv(Symbol name) {
        this();
        this.name=name;
    }

    public MemorySymEnv() {
        env=new Value[1];
        nextFree=0;
        symbolMap=new HashMap(1);
    }

    public Value asValue() {
        return this;
    }

    public java.util.Set bindingKeys() {
        java.util.Set res=new HashSet();
        synchronized(symbolMap) {
            res.addAll(symbolMap.keySet());
        }
        if (parent != null) {
            res.addAll(parent.bindingKeys());
        }
        return res;
    }

    //The following two methods are for internal use only, despite
    //their public modifiers

    public Map getSymbolMap() {
        return symbolMap;
    }

    public void setParent(SymbolicEnvironment e) {
        parent=e;
    }

    public SymbolicEnvironment getParent() {
        return parent;
    }

    protected void expand() {
        synchronized(symbolMap) {
            Value[] newenv=new Value[(int)((env.length*EXPFACT) + 1)];
            System.arraycopy(env, 0, newenv, 0, env.length);
            nextFree=env.length;
            env=newenv;
        }
    }

    public void trim() {
        synchronized(symbolMap) {
            Value[] newenv=new Value[nextFree];
            System.arraycopy(env, 0, newenv, 0, nextFree);
            env=newenv;
        }
    }

    public void set(int envLoc, Value v) {
        env[envLoc]=v;
    }

    public int define(Symbol s, Value v) {
        synchronized(symbolMap) {
            int envLoc = getLoc(s);
            if (envLoc == -1) return store(s, v);
            else {
                set(envLoc, v);
                return envLoc;
            }
        }
    }

    protected int store(Symbol s, Value v) {
        synchronized(symbolMap) {
            if (nextFree >= env.length) 
                expand();
            
            //NB: the order of the following two statements is important;
            //otherwise a lookup taking place concurrently might get garbage
            env[nextFree]=v;
            symbolMap.put(s, new Integer(nextFree));
            return nextFree++;
        }
    }

    public int getLoc(Symbol s) {
        synchronized(symbolMap) {
            Integer i=(Integer)symbolMap.get(s);
            if (i!=null) return i.intValue();
            if (parent == null) return -1;
            int pi=parent.getLoc(s);
            if (pi==-1) return -1;
            return store(s, parent.lookup(pi));
        }
    }

    public Value lookup(Symbol s) {
        int pi = getLoc(s);
        if (pi==-1) return null;
        return env[pi];
    }

    public Value lookup(int pi) {
        return env[pi];
    }

    public void undefine(Symbol s) {
        synchronized(symbolMap) {
            Integer i=(Integer)symbolMap.remove(s);
            if (i==null) return;
            env[i.intValue()] = FALSE;
        }
    }

    public String display() {
        return displayNamedOpaque("environment");
    }

    public Iterator keys() {
        return symbolMap.keySet().iterator();
    }

    public void serialize(Serializer s) throws IOException {
        super.serialize(s);
        s.writeInt(symbolMap.size());
        for (Iterator i=symbolMap.keySet().iterator(); i.hasNext();) {
            Symbol key=(Symbol)i.next();
            s.writeExpression(key);
            int loc=((Integer)symbolMap.get(key)).intValue();
            s.writeExpression(env[loc]);
        }
        s.writeSymbolicEnvironment(parent);
    }

    public void deserialize(Deserializer s) throws IOException {
        super.deserialize(s);
        int size=s.readInt();
        env=new Value[size];
        symbolMap=new HashMap();
        for (int i=0; i<size; i++) {
            Symbol id=(Symbol)s.readExpression();
            env[i]=(Value)s.readExpression();
            symbolMap.put(id, new Integer(i));
        }
        nextFree=size;
        
        parent=s.readSymbolicEnvironment();
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
