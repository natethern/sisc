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
package sisc;

import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import sisc.data.*;
import java.io.*;

public class AssociativeEnvironment extends NamedValue {

    protected static final float EXPFACT=1.5F;
    protected Map symbolMap;
    public Value[] env;
    protected int nextFree;

    public AssociativeEnvironment(AssociativeEnvironment cloneFrom) {
        symbolMap=(Map)((HashMap)cloneFrom.symbolMap).clone();
        nextFree=cloneFrom.nextFree;
        env=new Value[nextFree];
        System.arraycopy(cloneFrom.env, 0, env, 0, nextFree);
    }

    AssociativeEnvironment(Value[] env, Map symMap) {
        this.env=env;
        symbolMap=symMap;
        nextFree=env.length;
    }

    public AssociativeEnvironment() {
        env=new Value[50];
        nextFree=0;
        symbolMap=new HashMap(50);
    }

    protected void expand() {
        synchronized(symbolMap) {
            Value[] newenv=new Value[(int)(env.length*EXPFACT)];
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

    public int set(Symbol s, Value v) {
        Integer i=(Integer)symbolMap.get(s);
        try {
            int iv=i.intValue();
            env[iv]=v;
            return iv;
        } catch (NullPointerException np) {
            return define(s, v);
        }
    }

    public int set(int envLoc, Value v) {
        env[envLoc]=v;
        return envLoc;
    }

    public int define(Symbol s, Value v) {
        synchronized(symbolMap) {
            if (nextFree >= env.length) {
                expand();
            }
            symbolMap.put(s, new Integer(nextFree));
            env[nextFree]=v;
            return nextFree++;
        }
    }

    public int getLoc(Symbol s) {
        Integer i=(Integer)symbolMap.get(s);
        return (i==null ? -1 : i.intValue());
    }

    public Value lookup(Symbol s) {
        Integer i=(Integer)symbolMap.get(s);
        if (i==null)
            throw new ArrayIndexOutOfBoundsException();
        else return env[i.intValue()];
    }

    public Value lookup(int envLoc) {
        return env[envLoc];
    }

    public String display() {
        return displayNamedOpaque("environment");
    }

    public void serialize(Serializer s, DataOutputStream dos) throws IOException {
        if (SERIALIZATION) {
            s.writeBer(symbolMap.size(), dos);
            for (Iterator i=symbolMap.keySet().iterator(); i.hasNext();) {
                Symbol key=(Symbol)i.next();
                s.serialize(key, dos);
                int loc=((Integer)symbolMap.get(key)).intValue();
                s.serialize(env[loc], dos);
            }
        }
    }

    public void deserialize(Serializer s, DataInputStream dis)
    throws IOException {
        if (SERIALIZATION) {
            int size=s.readBer(dis);
            env=new Value[Math.max(10,size)];
            symbolMap=new HashMap();
            for (int i=0; i<size; i++) {
                Symbol id=(Symbol)s.deserialize(dis);
                env[i]=(Value)s.deserialize(dis);
                symbolMap.put(id, new Integer(i));
            }
            nextFree=size;
        }
    }
}


