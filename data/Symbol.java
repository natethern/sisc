package sisc.data; 

import java.util.WeakHashMap; 
import java.io.*;

public class Symbol extends Value {
    
    public static WeakHashMap memo=new WeakHashMap(100);

    public static boolean caseSensitive;

    public static Symbol getUnique(String str) {
	return new Symbol(str);
    }

    public static Symbol intern(String str) {
 	Symbol s=(Symbol)memo.get(str);
	if (s==null) {
	    s=new Symbol(str);
	    memo.put(str, s);
	}
	return s;
    }

    public static Symbol get(String str) {
	return intern(caseSensitive ? str : str.toLowerCase());
    }

    public String symval;

    public Symbol(String symval) {
	this.symval=symval;
    }

    public Symbol normalize() {
	return Symbol.get(symval.toLowerCase());
    }

    public String display() {
	return symval;
    }
    
    public int hashCode() {
	return symval.hashCode();
    }

    private void writeObject(java.io.ObjectOutputStream out)
	throws IOException {
	out.writeObject(symval);
	out.writeBoolean(memo.get(symval)!=null);
    }

    public Object readResolve() throws ObjectStreamException {
	Object replacement=memo.get(symval);
	if (replacement==null) return this;
	return replacement;
    }

    private void readObject(java.io.ObjectInputStream in)
	throws IOException, ClassNotFoundException {
	String s=(String)in.readObject();
	symval=(caseSensitive ? s : s.toLowerCase());
	boolean interned=in.readBoolean();
	if (interned) {
	    if (memo.get(symval)==null) 
		memo.put(symval, this);
	}
    }
}





