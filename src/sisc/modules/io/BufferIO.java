package sisc.modules.io;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;
import java.io.IOException;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.net.URL;
import sisc.io.StreamOutputPort;
import sisc.io.StreamInputPort;
import sisc.io.BinaryOutputPort;
import sisc.io.BinaryInputPort;

public class BufferIO extends IndexedProcedure {

    protected static Symbol BINARYB =
        Symbol.intern("sisc.modules.io.Messages");

    protected static final int        
        OPENINPUTBUFFER=0, OPENOUTPUTBUFFER=1, GETOUTPUTBUFFER=2;


    public static class Index extends IndexedLibraryAdapter {
        
        public Value construct(int id) {
            return new BufferIO(id);
        }
        
       public Index() {
           define("_get-output-buffer", GETOUTPUTBUFFER);
           define("_open-input-buffer", OPENINPUTBUFFER);
           define("_open-output-buffer", OPENOUTPUTBUFFER);
        }   
    }
    

    public BufferIO(int id) {
        super(id);
    }
    
    public BufferIO() {}

    public Value doApply(Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            switch (id) {
            case OPENOUTPUTBUFFER:
                return new StreamOutputPort(new ByteArrayOutputStream(), false);
            default:
                throwArgSizeException();
            }
        case 1:
            switch (id) {
            case GETOUTPUTBUFFER:
                StreamOutputPort sop=(StreamOutputPort)f.vlr[0];
                ByteArrayOutputStream bos=(ByteArrayOutputStream)sop.out;
                try {
                    sop.flush();
                } catch (IOException e) {
                    throwPrimException(liMessage(BINARYB, "errorflushing", 
                            sop.toString(),
                            e.getMessage()));
                }
                Buffer rv=new Buffer(bos.toByteArray());
                bos.reset();
                return rv;
            case OPENINPUTBUFFER:
                return new StreamInputPort(new ByteArrayInputStream(BinaryIO.buffer(f.vlr[0]).buf));
            case OPENOUTPUTBUFFER:
                return new StreamOutputPort(new ByteArrayOutputStream(num(f.vlr[0]).indexValue()), false);
            default:
                throwArgSizeException();
            }
        default:
            throwArgSizeException();
        }
        return VOID;        
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
