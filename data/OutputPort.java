package sisc.data;

import java.io.*;
import sisc.*;

public class OutputPort extends NamedValue {
    public transient Writer w;
    
    public OutputPort(Writer w) {
	this.w=w;
    }

    public void writeChar(char c) throws IOException {
	w.write(c);
    }

    public void write(Interpreter i, char[] buff, int count) 
	throws ContinuationException {
	try {
	    w.write(buff, 0, count);
	    flush();
	} catch (IOException e) {
	    error(i, "error writing to "+display());
	}
    }

    public void write(String s) throws IOException {
	w.write(s);
    }

    public String display() {
	StringBuffer b=new StringBuffer();
	b.append("#<output-port");
	if (name!=null) 
	    b.append(' ').append(name.display());
	b.append('>');
	return b.toString();
    }

    public void flush() throws IOException {
	w.flush();
    }

    public void close(Interpreter f) throws ContinuationException {
	try {
	    w.close();
	} catch (IOException e) {
	    error(f,"error closing "+this);
	}
    }
}
	







