package sisc.env;

import java.io.*;
import sisc.data.*;
import sisc.compiler.*;
import sisc.io.*;
import java.util.WeakHashMap;
import java.net.URLClassLoader;
import java.net.URL;
import java.security.AccessControlException;
import sisc.interpreter.AppContext;
import sisc.util.Util;

public class DynamicEnvironment extends Util implements Cloneable {

    public AppContext ctx;

    public SchemeInputPort in;
    public SchemeOutputPort out;

    public boolean printShared;
    public boolean vectorLengthPrefixing;
    public boolean emitDebuggingSymbols;

    public Value wind = FALSE; //top of wind stack

    //the lexer is stateful
    public Parser parser = new Parser(new Lexer());

    private ClassLoader classLoader;
    private URLClassLoader urlClassLoader;

    //user-defined thread variables; this map is weak so that we don't
    //hang on to vars that are no longer in use.
    public java.util.Map parameters = new WeakHashMap(0);

    public DynamicEnvironment(AppContext ctx) {
        this(ctx, System.in, System.out);
    }

    public DynamicEnvironment(AppContext ctx, InputStream in, OutputStream out) {
        this(ctx,
             new SourceInputPort(new BufferedInputStream(in), liMessage(SISCB, "console")),
             new StreamOutputPort(out, true));
    }

    public DynamicEnvironment(AppContext ctx, SchemeInputPort in, SchemeOutputPort out) {
        this.ctx = ctx;
        this.in = in;
        this.out = out;
        printShared = false;
        vectorLengthPrefixing = false;
        classLoader = currentClassLoader();
        try {
            urlClassLoader = new URLClassLoader(new URL[]{}, classLoader);
        } catch (AccessControlException e) {}
    }

    public Object clone() throws CloneNotSupportedException {
        DynamicEnvironment res = (DynamicEnvironment)super.clone();
        res.parser = new Parser(new Lexer());
        res.setClassPath(getClassPath());
        res.parameters = new WeakHashMap(res.parameters);
        return res;
    }

    public DynamicEnvironment copy() {
        try {
            return (DynamicEnvironment)clone();
        } catch (CloneNotSupportedException e) {
            return this;
        }
    }

    public ClassLoader getClassLoader() {
        return (urlClassLoader == null) ? classLoader : urlClassLoader;
    }

    public Value getClassPath() {
        URL[] urls = (urlClassLoader == null) ? new URL[] {} : urlClassLoader.getURLs();
        Pair p = EMPTYLIST;
        for (int i=urls.length-1; i>=0; i--) {
            p = new Pair(new SchemeString(urls[i].toString()), p);
        }
        return p;
    }

    public void setClassPath(Value v) {
        Pair pa = pair(v);
        URL[] urls = new URL[length(pa)];
        for (int i=0; pa != EMPTYLIST; i++, pa = (Pair)pa.cdr) {
            urls[i] = url(pa.car);
        }
        try {
            urlClassLoader =  new URLClassLoader(urls, classLoader);
        } catch (AccessControlException e) {}
    }

    public Value getInputPort() {
        return in;
    }

    public void setInputPort(Value v) {
        in = inport(v);
    }

    public Value getOutputPort() {
        return out;
    }

    public void setOutputPort(Value v) {
        out = outport(v);
    }

    public Value getPrintShared() {
        return truth(printShared);
    }

    public void setPrintShared(Value v) {
        printShared = truth(v);
    }

    public Value getVectorLengthPrefixing() {
        return truth(vectorLengthPrefixing);
    }

    public void setVectorLengthPrefixing(Value v) {
        vectorLengthPrefixing = truth(v);
    }

    public Value getEmitDebuggingSymbols() {
        return truth(emitDebuggingSymbols);
    }

    public void setEmitDebuggingSymbols(Value v) {
        emitDebuggingSymbols = truth(v);
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
