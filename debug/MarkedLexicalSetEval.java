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
package sisc.debug;

import sisc.*;
import sisc.data.*;
import sisc.exprs.*;

import java.io.*;

public class MarkedLexicalSetEval extends LexicalSetEval implements MarkedExpression {
    public int lineNo, colNo;
    public String filename;
    
    public MarkedLexicalSetEval(int depth, int pos, 
				int lineNo, int colNo, String filename) {
	super(depth, pos);
	this.lineNo=lineNo;
	this.colNo=colNo;
	this.filename=filename;
    }

    public int getLineNumber() { return lineNo; }
    public int getColumnNumber() { return colNo; }
    public String getFilename() { return filename; }

    public MarkedLexicalSetEval() {}

    public void serialize(Serializer s, DataOutput dos) throws IOException {
        if (SERIALIZATION) {
	    super.serialize(s, dos);
	    s.writeBer(lineNo, dos);
	    s.writeBer(colNo, dos);
	    dos.writeUTF(filename);
        }
    }


    public void deserialize(Serializer s, DataInput dis)
    throws IOException {
        if (SERIALIZATION) {
	    super.deserialize(s, dis);
	    lineNo=s.readBer(dis);
	    colNo=s.readBer(dis);
	    filename=dis.readUTF();
        }
    }
}

