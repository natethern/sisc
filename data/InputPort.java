package sisc.data;

import java.io.*;
import sisc.*;

public class InputPort extends NamedValue {
    protected static final Symbol READ=Symbol.get("read");
    protected BufferedReader r;
    protected int pushback;
    
    public InputPort(BufferedReader r) {
	this.r=r;
    }

    public Value readchar(Interpreter r) throws ContinuationException {
	try {
	    return new SchemeCharacter((char)read());
	} catch (EOFException e) {
	    return Util.EOF;
	} catch (IOException e) {
	    error(r, "I/O error reading from "+display());
	    return VOID;
	}
    }

    public int read() throws IOException, EOFException {
	int c=pushback;
	if (pushback!=0) 
	    pushback=0;
	else
	    c=r.read();
	if (c==-1) 
	    throw new EOFException();
	return c;
    }

    public void pushback(int c) {
	pushback=c;
    }

    public boolean ready() throws IOException {
	return r.ready();
    }

    public Value read(Interpreter i, 
		      char[] buff, int count) throws ContinuationException { 
	try {
	    int s=r.read(buff, 0, count);
	    return (s==-1 ? (Value)EOFObject.EOF : (Value)new Quantity(s));
	} catch (IOException e) {
	    error(i, "I/O error reading from "+display());
	    return VOID;
	}

    }

    public Value read(Interpreter r) throws ContinuationException {
	try {
	    return r.parser.nextExpression(this);
	} catch (EOFException e) {
	    return Util.EOF;
	} catch (IOException e) {
	    error(r, READ, e.getMessage());
	}
	return VOID;
    }

    public void mark(int ral) throws IOException {
	r.mark(ral);
    }

    public void reset() throws IOException {
	r.reset();
    }

    public String display(){
	StringBuffer b=new StringBuffer();
	b.append("#<input-port");
	if (name!=null) 
	    b.append(' ').append(name.display());
	b.append('>');
	return b.toString();
    }

    public void close(Interpreter f) throws ContinuationException {
	try {
	    r.close();
	} catch (IOException e) {
	    error(f,"error closing "+this);
	}
    }

}
	







