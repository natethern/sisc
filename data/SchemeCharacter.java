package sisc.data;

import sisc.Util;
import java.util.Hashtable;

public class SchemeCharacter extends Value {
    static final Hashtable humanReadables=new Hashtable(8);

    static {
	humanReadables.put(new SchemeCharacter(' '), "#\\space");
	humanReadables.put(new SchemeCharacter('\u0008'), "#\\backspace");
	humanReadables.put(new SchemeCharacter('\u007f'), "#\\rubout");
	humanReadables.put(new SchemeCharacter('\u000c'), "#\\page");
	humanReadables.put(new SchemeCharacter('\t'), "#\\tab");
	humanReadables.put(new SchemeCharacter('\n'), "#\\newline");
	humanReadables.put(new SchemeCharacter('\r'), "#\\return");
	humanReadables.put(new SchemeCharacter((char)0), "#\\nul");

    }

    public char c;

    public SchemeCharacter(char c) {
	this.c=c;
    }

    public String display() {
	return ""+c;
    }

    public String write() {
	String hr=(String)humanReadables.get(this);
	if (hr!=null) return hr;
	StringBuffer b=new StringBuffer();
	b.append("#\\");
	if (c<128 && c>31) 
	    b.append(c);
	else b.append(justify(Integer.toOctalString(c),3,'0'));
	return b.toString();
    }

    public boolean eq(Object v) {
	return (v instanceof SchemeCharacter &&
		((SchemeCharacter)v).c==c);
    }

    public boolean valueEqual(Value v) {
	return (v instanceof sisc.data.SchemeCharacter && 
		((sisc.data.SchemeCharacter)v).c==c);
    }

   
    public int hashCode(){
	return (int)c;
    }
}
