package sisc.compiler;

import java.util.*;
import sisc.data.*;
import sisc.util.Util;

class ARecord extends Util {
    static final Symbol program=Symbol.get("program");

    Map references=new HashMap();
    Map sets=new HashMap();
    Set frees=new HashSet();
    Value body;

    public ARecord(Value v) {
        body=v;
    }

    public String toString() {
        return "{refs: " + references + ", sets: "+ sets + ", frees:"+frees+"}";
    }

    protected static final Pair mapToAssoc(Map m) {
        Pair rv=EMPTYLIST;
        for (Iterator i=m.keySet().iterator(); i.hasNext();) {
            Value key=(Value)i.next();
            rv=new Pair(new Pair(key, Quantity.valueOf(((Integer)m.get(key)).intValue())),
                        rv);
        }
        return rv;
    }

    protected static final Pair setToList(Set s) {
        Pair rv=EMPTYLIST;
        for (Iterator i=s.iterator(); i.hasNext();) {
            rv=new Pair((Value)i.next(), rv);
        }
        return rv;
    }

    public Expression asExpression() {
        return new Pair(program, new Pair(mapToAssoc(references),
                                          list(mapToAssoc(sets),
                                               setToList(frees),
                                               body)));
    }
}

