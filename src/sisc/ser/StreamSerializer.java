package sisc.ser;

import java.util.*;
import java.io.*;
import sisc.data.Expression;

public class StreamSerializer extends SLL2Serializer {

    private Map entryPoints, classes;
    private int nextEp, nextClassIdx;
    
    public StreamSerializer(OutputStream out) throws IOException {
        super(out);
        this.classes=new HashMap();
        this.entryPoints=new HashMap();
    }
    
    public final void writeExpression(Expression e) throws IOException {
        writeExpression(e, false);
    }

    public final void writeInitializedExpression(Expression e) throws IOException {
        writeExpression(e, true);
    }

    /**
     * Serializes expressions. We distinguish betweeen four types of
     * expressions:
     * Type 0: normal expression
     * Type 1: null
     * Type 2: first encounter of entry point / shared expression
     * Type 16+n: reference to entry point / shared expression n
     *
     * @param e the expression to serialize
     * @exception IOException if an error occurs
     */
    public void writeExpression(Expression e, boolean flush) throws IOException {
        if (e==null) {
            //null
            writeInt(1);
            return;
        } 

        int sizeStartOffset = -1;
        int posi=nextEp;
        
        Integer epIndex=(Integer)entryPoints.get(e);
        if (epIndex != null) {
            writeSeenEntryPoint(epIndex.intValue());
            return;
        }  else {
            entryPoints.put(e, new Integer(nextEp));
            sizeStartOffset=writeNewEntryPointMarker(nextEp++, e);
            flush=true;
        }
        
        writeExpressionSerialization(e, new SerJobEnd(posi, sizeStartOffset), 
                                     flush);
    }
    
    public void writeClass(Class c) throws IOException {
        Integer classIdx=(Integer)classes.get(c);
        if (classIdx == null) {
            writeInt(nextClassIdx);
            classes.put(c, new Integer(nextClassIdx++));
            writeUTF(c.getName());
        } else {
            writeInt(classIdx.intValue());
        }
    }

    protected void serializeEnd(SerJobEnd j) {
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
