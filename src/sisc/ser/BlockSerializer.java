package sisc.ser;

import java.util.*;
import java.io.*;
import sisc.data.Expression;

public class BlockSerializer extends SLL2Serializer {

    private Vector classes;
    private int[] sizes;
    private Expression[] entryPoints;
    private HashMap epi, ci;

    public BlockSerializer(OutputStream out, Vector classes, 
                           Expression[] entryPoints) throws IOException {
        super(out);
        this.classes=classes;
        this.entryPoints=entryPoints;
        sizes=new int[entryPoints.length];
        
        ci=new HashMap();
        for (int i=0; i<classes.size(); i++) {
            ci.put(classes.elementAt(i), new Integer(i));
        }

        epi=new HashMap();
        for (int i=0; i<entryPoints.length; i++) {
            epi.put(entryPoints[i], new Integer(i));
        }
    }

    int[] getSizes() {
        return sizes;
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

        Integer epIndex=(Integer)epi.get(e);

        int sizeStartOffset = -1;
        int posi=-1;

        if (epIndex!=null) {
            posi=epIndex.intValue();
            //entry point / shared expression
            if (seen(e)) {
                writeSeenEntryPoint(posi);
                return;
            }  else {
                sizeStartOffset=writeNewEntryPointMarker(posi, e);
                flush=true;
            }
        } else writeOrdinaryExpressionMarker();
        
        if (writeExpressionSerialization(e, new SerJobEnd(posi, sizeStartOffset), 
                                         flush)) {
            //If true, the item was serialized contiguously, so we can
            //record its size now
            if (sizeStartOffset != -1)
                sizes[posi] = cos.position - sizeStartOffset;
        } // else we'll get it in a callback with a SerJobEnd
    }
    
    public void writeClass(Class c) throws IOException {
        writeInt(((Integer)ci.get(c)).intValue());
    }

    protected void serializeEnd(SerJobEnd j) {
        if (j.sizeStartOffset != -1)
            sizes[j.posi] = cos.position - j.sizeStartOffset;
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
