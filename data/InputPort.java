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

    public BufferedReader getReader() {
	return r;
    }

    public int read() throws IOException {
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

    public Object javaValue() {
	return r;
    }
}
	







