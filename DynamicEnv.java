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
package sisc;

import sisc.data.*;
import sisc.compiler.*;
import java.io.*;

public class DynamicEnv extends Util implements Cloneable {

    public InputPort in;
    public OutputPort out;

    public Value wind = FALSE; //top of wind stack

    //the lexer is stateful
    public Parser parser = new Parser(new Lexer());

    //user-defined thread variables; this map is weak so that we don't
    //hang on to vars that are no longer in use.
    public java.util.Map parameters = new java.util.WeakHashMap(0);

    public DynamicEnv() {
        this(System.in, System.out);
    }

    public DynamicEnv(InputPort in, OutputPort out) {
        this.in = in;
        this.out = out;
    }

    public DynamicEnv(InputStream in, OutputStream out) {
        this(new SourceInputPort(new BufferedReader(new InputStreamReader(in)), "console"),
             new OutputPort(new PrintWriter(out), true));
    }

    public DynamicEnv copy() {
        try {
            return (DynamicEnv)super.clone();
        }
        catch (CloneNotSupportedException e) {
            return this;
        }
    }
}
