package sisc.data;

import sisc.*;

public class SchemeString extends Value {
    public boolean immutable;
    public char[] stringdata;

    public SchemeString(String s) {
	this(s.toCharArray());
    }

    public SchemeString(char[] data) {
	stringdata=data;
    }

    public boolean valueEqual(Value v) {
	if (!(v instanceof SchemeString)) return false;
	char[] o=((sisc.data.SchemeString)v).stringdata;
	if (stringdata.length!=o.length) return false;
	for (int i=0; i<o.length; i++) {
	    if (stringdata[i]!=o[i]) return false;
	}
	return true;
    }
    
    public SchemeString append(SchemeString other){
	char[] newstr=new char[stringdata.length + other.stringdata.length];
	System.arraycopy(stringdata, 0, newstr, 0, stringdata.length);
	System.arraycopy(other.stringdata, 0, 
			 newstr, stringdata.length, 
			 other.stringdata.length);
	return new SchemeString(newstr);
    }

    String display(boolean write) {
	StringBuffer b=new StringBuffer();
	if (write) {
	    b.append('"');
	    int lastGood=0;
	    for (int i=0; i<stringdata.length; i++) 
		if (stringdata[i]=='"' || stringdata[i]=='\\') {
		    b.append(stringdata, lastGood, i-lastGood);
		    b.append('\\').append(stringdata[i]);
		    lastGood=i+1;
		} 
	    b.append(stringdata, lastGood, stringdata.length-lastGood); 
	    b.append('"');
	} else 
	    b.append(stringdata);
	return b.toString();
    }
	
    public void set(Interpreter r, int k, 
		    char c) throws ContinuationException {
	if (immutable)
	    error(r, "string is immutable");
	stringdata[k]=c;
    }

    public String display() {
	return display(false);
    }

    public String write() {
	return display(true);
    }

    public String toString() {
	return write();
    }
}
		
   
