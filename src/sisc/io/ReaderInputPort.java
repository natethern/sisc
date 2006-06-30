package sisc.io;

import java.io.*;

public class ReaderInputPort extends PushbackInputPort {
    protected Reader r;

    public ReaderInputPort(InputStream in, Charset encoding) {
        this(new BufferedReader(encoding.newInputStreamReader(in)));
    }
    
    public ReaderInputPort(Reader in) {
        this.r=in;
    }

    public Reader getReader() {
        return r;
    }

    public int readHelper() throws IOException {
        return r.read();
    }

    public boolean ready() throws IOException {
        return r.ready();
    }

    /*
    public int readHelper(byte[] buff, int offs, 
                          int count) throws IOException {
        throw new IOException(liMessage(SISCB, "binaryreadunsup"));
    }
    */

    public void close() throws IOException {
        r.close();
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
 * Portions created by Scott G. Miller are Copyright (C) 2000-2006
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
