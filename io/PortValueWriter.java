package sisc.io;

import java.io.IOException;
import java.util.Map;
import java.util.List;
import java.util.HashMap;
import java.util.LinkedList;
import sisc.data.Value;
import sisc.data.Pair;
import sisc.data.Expression;
import sisc.util.Util;
import sisc.util.ExpressionVisitor;

public class PortValueWriter extends Util
    implements ValueWriter, ExpressionVisitor {

    private OutputPort port;

    private boolean display;

    private boolean handleSharing;
    private boolean vectorLengthPrefixing;

    private Map shared;
    private List visited;
    private int count;

    public PortValueWriter(OutputPort port) {
        this(port, false, false);
    }

    public PortValueWriter(OutputPort port,
                           boolean handleSharing,
                           boolean vectorLengthPrefixing) {
        this.port = port;
        this.handleSharing = handleSharing;
        this.vectorLengthPrefixing = vectorLengthPrefixing;
        if (handleSharing) {
            shared = new HashMap(1);
            visited = new LinkedList();
            count = 0;
        }
    }

    private void displayOrWrite(Value v, boolean display)
        throws IOException {

        if (handleSharing) {
            visit(v);
            while(!visited.isEmpty()) {
                ((Expression)visited.remove(0)).visit(this);
            }
        }

        this.display = display;
        append(v);

        if (handleSharing) {
            shared.clear();
            visited.clear();
            count = 0;
        }
    }

    public void display(Value v) throws IOException {
        displayOrWrite(v, true);
    }

    public void write(Value v) throws IOException {
        displayOrWrite(v, false);
    }

    private static Integer seenMarker = new Integer(-1);
    private static Integer sharedMarker = new Integer(-2);

    public void visit(Expression e) {
        Object i = shared.get(e);
        if (i == null) {
            shared.put(e, seenMarker);
            visited.add(e);
        } else {
            shared.put(e, sharedMarker);
        }
    }

    public ValueWriter append(Value v) throws IOException {
        if (handleSharing) {
            Integer i = (Integer)shared.get(v);
            if (i == sharedMarker) {
                append('#');
                int shareIdx = count++;
                shared.put(v, new Integer(shareIdx));
                append(Integer.toString(shareIdx));
                append('=');
            } else if (i != null && i != seenMarker) {
                append('#');
                append(i.toString());
                append('#');
                return this;
            }
        }
        if (display)
            v.display(this);
        else
            v.write(this);
        return this;
    }

    public ValueWriter append(char c) throws IOException {
        port.write(c);
        return this;
    }

    public ValueWriter append(String s) throws IOException {
        port.write(s);
        return this;
    }

    public ValueWriter append(byte[] b, int offset, int length)
        throws IOException {
        port.write(b, offset, length);
        return this;
    }

    public boolean isInlinable(Value v) {
        if (!handleSharing) return true;
        Object i = shared.get(v);
        return (i == null || i == seenMarker);
    }

    public boolean vectorLengthPrefixing() {
        return vectorLengthPrefixing;
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
 * Portions created by Scott G. Miller are Copyright (C) 2000-2002
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
