package sisc.env;

import java.io.*;
import sisc.data.*;
import sisc.io.*;
import java.util.WeakHashMap;
import java.net.URLClassLoader;
import java.net.URL;
import java.security.AccessControlException;
import sisc.interpreter.AppContext;
import sisc.reader.*;
import sisc.util.Util;
import sisc.util.Defaults;

public class DynamicEnvironment extends Util implements Cloneable {
    public AppContext ctx;

    public Value in, out;
    
    public boolean caseSensitive = Defaults.CASE_SENSITIVE;
    public boolean printShared = Defaults.PRINT_SHARED;
    public boolean vectorLengthPrefixing = Defaults.VECTOR_LENGTH_PREFIXING;
    public boolean emitDebuggingSymbols = Defaults.EMIT_DEBUGGING_SYMBOLS;
    public Charset characterSet = Util.getDefaultCharacterSet();
    public boolean hedgedInlining = Defaults.HEDGED_INLINING;
    public boolean permissiveParsing = Defaults.PERMISSIVE_PARSING;
    public boolean internalDebugging = Defaults.INTERNAL_DEBUGGING;
    
    private static String defaultPrintShared =
        new Boolean(Defaults.PRINT_SHARED).toString();
    private static String defaultVectorLengthPrefixing =
        new Boolean(Defaults.VECTOR_LENGTH_PREFIXING).toString();
    private static String defaultEmitDebuggingSymbols =
        new Boolean(Defaults.EMIT_DEBUGGING_SYMBOLS).toString();
    private static String defaultStrictR5RS =
        new Boolean(Defaults.STRICT_R5RS).toString();
    private static String defaultEmitAnnotations =
        new Boolean(Defaults.EMIT_ANNOTATIONS).toString();
    private static String defaultCaseSensitive = 
        new Boolean(Defaults.CASE_SENSITIVE).toString();
    private static String defaultHedgedInlining = new Boolean(Defaults.HEDGED_INLINING).toString();
    private static String defaultPermissiveParsing = new Boolean(Defaults.PERMISSIVE_PARSING).toString();
    private static String defaultInternalDebugging = new Boolean(Defaults.INTERNAL_DEBUGGING).toString();
    
    public Value wind = FALSE; //top of wind stack

    //the lexer is stateful
    public Parser parser = new Parser(new Lexer());

    private ClassLoader classLoader;
    private URLClassLoader urlClassLoader;

    //user-defined thread variables; this map is weak so that we don't
    //hang on to vars that are no longer in use.
    public java.util.Map parameters = new WeakHashMap(1);

    static SchemeInputPort standardInputPort() {
        try {
            return new SourceInputPort(new InputStreamReader(System.in, Util.getDefaultCharacterSet().getName()), liMessage(SISCB, "console"));
        } catch (UnsupportedEncodingException use) {
            //shouldn't happen, should be taken care of in Util.getDefaultCharacterSet()
            return null;
        }
    }
    
    static SchemeOutputPort standardOutputPort() {
        try {
            return new WriterOutputPort(new OutputStreamWriter(System.out, Util.getDefaultCharacterSet().getName()),
                    true);
        } catch (UnsupportedEncodingException use) {
            //shouldn't happen, should be taken care of in Util.getDefaultCharacterSet()
            return null;
        }

    }
    public DynamicEnvironment(AppContext ctx) {
        this(ctx, standardInputPort(), standardOutputPort());
        // Following worked before NG patch; now requires change above
        // new WriterOutputPort(new PrintWriter(System.out), true));
    }

    public DynamicEnvironment(AppContext ctx, InputStream in, OutputStream out) {
        this(ctx,
             // Is this BufferedInputStream necessary?
             // SourceInputPort creates a BufferedReader anyway
             //new SourceInputPort(new BufferedInputStream(in), liMessage(SISCB, "console")),
             new SourceInputPort(in, Util.getDefaultCharacterSet(), liMessage(SISCB, "console")),
             new WriterOutputPort(out, Util.getDefaultCharacterSet(), true));
    }

    public DynamicEnvironment(AppContext ctx, SchemeInputPort in, SchemeOutputPort out) {
        this.ctx = ctx;
        this.in = in;
        this.out = out;
        this.caseSensitive =
            ctx.getProperty("sisc.caseSensitive", defaultCaseSensitive).equals("true");
        this.parser.annotate =
            ctx.getProperty("sisc.emitAnnotations", defaultEmitAnnotations).equals("true");
        this.parser.lexer.strictR5RS =
            ctx.getProperty("sisc.strictR5RS", defaultStrictR5RS).equals("true");
        this.printShared =
            ctx.getProperty("sisc.printShared", defaultPrintShared).equals("true");
        this.vectorLengthPrefixing = 
            ctx.getProperty("sisc.vectorLengthPrefixing", defaultVectorLengthPrefixing).equals("true");
        this.emitDebuggingSymbols =
            ctx.getProperty("sisc.emitDebuggingSymbols", defaultEmitDebuggingSymbols).equals("true");
        characterSet = Util.charsetFromString(ctx.getProperty("sisc.characterSet"));
        this.permissiveParsing = 
            ctx.getProperty("sisc.permissiveParsing", defaultPermissiveParsing).equals("true");

        classLoader = currentClassLoader();
        try {
            urlClassLoader = new URLClassLoader(new URL[]{}, classLoader);
        } catch (AccessControlException e) {}
    }

    public SchemeInputPort getCurrentInPort() {
        return inport(in);
    }

    public SchemeOutputPort getCurrentOutPort() {
        return outport(out);
    }

    public Object clone() throws CloneNotSupportedException {
        DynamicEnvironment res = (DynamicEnvironment)super.clone();
        res.parser = new Parser(new Lexer());
        res.parser.annotate = parser.annotate;
        res.parser.lexer.strictR5RS = parser.lexer.strictR5RS;
        res.setClassPath(getClassPath());
        WeakHashMap newParams=new WeakHashMap();
        newParams.putAll(res.parameters);
        res.parameters = newParams;
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
        for (int i=0; pa != EMPTYLIST; i++, pa = (Pair)pa.cdr()) {
            urls[i] = url(pa.car());
        }
        try {
            urlClassLoader =  new URLClassLoader(urls, classLoader);
        } catch (AccessControlException e) {}
    }

    public Value getInputPort() {
        return in;
    }

    public void setInputPort(Value v) {
        in = v;
    }

    public Value getOutputPort() {
        return out;
    }

    public void setOutputPort(Value v) {
        out = v;
    }

    public Value getPrintShared() {
        return truth(printShared);
    }

    public void setPrintShared(Value v) {
        printShared = truth(v);
    }

    public Value getCharacterSet() {
        return new SchemeString(characterSet.displayName());
    }

    public void setCharacterSet(Value v) {
        characterSet=Util.charsetFromString(string(v));
    }
    
    public Value getVectorLengthPrefixing() {
        return truth(vectorLengthPrefixing);
    }

    public void setVectorLengthPrefixing(Value v) {
        vectorLengthPrefixing = truth(v);
    }

    public Value getCaseSensitive() {
        return truth(caseSensitive);
    }

    public void setCaseSensitive(Value v) {
        caseSensitive = truth(v);
    }

    public Value getEmitDebuggingSymbols() {
        return truth(emitDebuggingSymbols);
    }

    public void setEmitDebuggingSymbols(Value v) {
        emitDebuggingSymbols = truth(v);
    }

    public Value getEmitAnnotations() {
        return truth(parser.annotate);
    }

    public void setEmitAnnotations(Value v) {
        parser.annotate = truth(v);
    }

    public Value getStrictR5RSCompliance() {
        return truth(parser.lexer.strictR5RS);
    }

    public void setStrictR5RSCompliance(Value v) {
        parser.lexer.strictR5RS = truth(v);
    }

    public Value getHedgedInlining() {
        return truth(hedgedInlining);
    }
    
    public void setHedgedInlining(Value v) {
        hedgedInlining=truth(v);
    }

    public Value getPermissiveParsing() {
        return truth(permissiveParsing);
    }

    public void setPermissiveParsing(Value v) {
        permissiveParsing=truth(v);
    }

    public Value getInternalDebugging() {
        return truth(internalDebugging);
    }

    public void setInternalDebugging(Value v) {
        internalDebugging=truth(v);
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
