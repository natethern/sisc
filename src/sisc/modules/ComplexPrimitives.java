package sisc.modules;

import sisc.data.*;
import sisc.io.*;
import sisc.exprs.*;
import sisc.interpreter.*;
import sisc.nativefun.*;
import java.io.IOException;
import java.io.StringReader;
import sisc.env.SymbolicEnvironment;
import sisc.env.MemorySymEnv;
import sisc.util.*;

public class ComplexPrimitives extends IndexedProcedure implements Primitives {

    public static class Index extends IndexedLibraryAdapter {
        
        public Value construct(int id) {
            return new ComplexPrimitives(id);
        }
        
        public Index() {
            define("apply", APPLY);
            define("call-with-current-continuation", CALLCC);
            define("call-with-escape-continuation", CALLEC);
            define("call-with-failure-continuation", CALLFC);
            define("call-with-values", CALLWITHVALUES);
            define("current-wind", CURRENTWIND);
            define("eval", EVALUATE);
            define("gensym", GENSYM);
            define("getenv", GETENV);
            define("getprop", GETPROP);
            define("get-sidecar-environment", GETSIDECAR);
            define("get-symbolic-environment", GETENVIRONMENT);
            define("set-symbolic-environment!", SETENVIRONMENT);
            define("interaction-environment", INTERACTIONENVIRONMENT);
            define("load-native-library", LOADNL);
            define("native-library-binding", NLBINDING);
            define("native-library-binding-names", NLBINDINGNAMES);
            define("number->string", NUMBER2STRING);
            define("putprop", PUTPROP);
            define("remprop", REMPROP);
            define("scheme-report-environment", REPORTENVIRONMENT);
            define("sisc-initial-environment", SISCINITIAL);
            define("string->number", STRING2NUMBER);
            define("with-failure-continuation", WITHFC);
        }
    }
    
    public ComplexPrimitives() {}
    
    public ComplexPrimitives(int id) {
        super(id);
    }


    static final char[] b64cs=
        ("0123456789abcdefghijklmnopqrstuvwxyz"+
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ-_").toCharArray();

    protected String base64encode(long v) {
        StringBuffer b=new StringBuffer();
        while (v!=0) {
            b.append(b64cs[(int)v & 0x3f]);
            v>>>=6;
        }
        return b.toString();
    }
    
    public final Value doApply(Interpreter r) throws ContinuationException {
        return doApply(r, r.vlr);
    }

    public final Value doApply(Interpreter r, Value[] vlr) 
        throws ContinuationException {
        final int vls = vlr.length;
        SIZESWITCH: switch (vls) {
        case 0:
            switch (id) {
            case COMPACTSTRINGREP: return truth(SchemeString.compactRepresentation);
            case CURRENTWIND: return r.dynenv.wind;
            case GENSYM: 
                long unv=r.tctx.nextUnique();
                return Symbol.intern(base64encode(unv));
            case INTERACTIONENVIRONMENT:
                return r.getCtx().toplevel_env.asValue();
            case SISCINITIAL: 
                try {
                    return new MemorySymEnv(r.lookupContextEnv(Util.SISC_SPECIFIC));
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "nosiscspecificenv"));
                }
            default:
                break SIZESWITCH;
            }
        case 1:
            switch (id) {
            case NUMBER2STRING: return new SchemeString(num(vlr[0]).toString());
            case GETENVIRONMENT:
                try {
                    return r.getCtx().lookupContextEnv(symbol(vlr[0])).asValue();
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "noenv", vlr[0].synopsis()));
                    return VOID;
                }
            case GETSIDECAR:
                return r.getCtx().toplevel_env
                                 .getSidecarEnvironment(symbol(vlr[0])).asValue();
            case GETENV:
                String str = r.getCtx().getProperty(string(vlr[0]));
                if (str == null) {
                    return FALSE;
                } else {
                    return new SchemeString(str);
                }
            case GENSYM: 
                long unv=r.tctx.nextUnique();
                return Symbol.intern(base64encode(unv));
            case EVALUATE:
                r.nxp=r.compile(vlr[0]);
                r.env=null;
                return VOID;
            case CALLEC:
                Value kproc=vlr[0];
                r.replaceVLR(1);
                r.vlr[0]=r.stk;
                
                r.saveVLR=true;
                r.nxp = APPEVAL;
                return kproc;
            case CALLCC:
                kproc=vlr[0];
                r.replaceVLR(1);
                r.vlr[0]=r.stk.capture(r);
                
                r.saveVLR=true;
                r.nxp = APPEVAL;
                return kproc;
            case CALLFC:
                Procedure proc=proc(vlr[0]);
                r.replaceVLR(1);
                r.setVLR(0,r.fk.capture(r));

                r.saveVLR=true;
                r.nxp = APPEVAL;
                return proc;
            case CURRENTWIND:
                r.dynenv.wind = vlr[0];
                return VOID;
            case LOADNL:
                try {
                    Class clazz=Class.forName(string(vlr[0]), true, r.dynenv.getClassLoader());
                    return (NativeLibrary)clazz.newInstance();
                } catch (Exception e) {
                    throwPrimException(e.getMessage());
                }
            case GETPROP:
            	SymbolicEnvironment tlev=r.getCtx().toplevel_env;
                int loc=tlev.getLoc(symbol(vlr[0]));
                if (loc==-1) return FALSE;
                else return tlev.lookup(loc); 
            case INTERACTIONENVIRONMENT:
                Value env=r.getCtx().toplevel_env.asValue();
                r.getCtx().toplevel_env=Util.env(vlr[0]);
                return env;
            case STRING2NUMBER:
                String st=string(vlr[0]);
                try {
                    return (Quantity)r.dynenv.parser.nextExpression(new ReaderInputPort(new StringReader(st)));
                } catch (ClassCastException cce) {
                    return FALSE;
                } catch (NumberFormatException nf) {
                    return FALSE;
                } catch (IOException e) {
                    return FALSE;
                }
            case NLBINDINGNAMES:
                Value[] va=nlib(vlr[0]).getLibraryBindingNames(r);
                return valArrayToList(va,0,va.length);        
            case REPORTENVIRONMENT:
                if (FIVE.equals(num(vlr[0])))
                    try {
                        return new MemorySymEnv(r.lookupContextEnv(Util.REPORT));
                    } catch (ArrayIndexOutOfBoundsException e) {
                        throwPrimException(liMessage(SISCB, "noreportenv"));
                    }
                else throwPrimException(liMessage(SISCB, "unsupportedstandardver"));
            case NULLENVIRONMENT:
                switch (num(vlr[0]).indexValue()) {
                case 5:
                    MemorySymEnv ae = new MemorySymEnv();
                    sisc.compiler.Compiler.addSpecialForms(ae);
                    return ae;
                case 0:
                    return new MemorySymEnv();
                default:
                    throwPrimException(liMessage(SISCB, "unsupportedstandardver"));
                    return VOID;
                }
            default:
                break SIZESWITCH;
            }
        case 2:
            switch (id) {
            case NLBINDING:
                return nlib(vlr[0]).getBindingValue(r, symbol(vlr[1]));
            case EVALUATE:
                r.nxp=r.compile(vlr[0], (SymbolicEnvironment)vlr[1]);
                r.env=null;
                return VOID;
            case WITHFC:
                Procedure proc=proc(vlr[1]);
                Procedure ehandler=proc(vlr[0]);
                r.fk=r.createFrame(new ApplyValuesContEval(ehandler),
                                   null, false, r.lcl, r.env, r.fk, r.stk);
                r.replaceVLR(0);
                r.saveVLR=true;
                r.nxp = APPEVAL;
                return proc;
            case CALLWITHVALUES:
                Procedure producer=proc(vlr[0]);
                Procedure consumer=proc(vlr[1]);
                r.push(new ApplyValuesContEval(consumer));
                r.replaceVLR(0);
                r.saveVLR=true;
                r.nxp = APPEVAL;
                return producer;
            case GETPROP:
                Value ret = null;
                if (vlr[1] instanceof SymbolicEnvironment) {
                    ret = env(vlr[1]).lookup(symbol(vlr[0]));
                } else {
                    ret = r.getCtx().toplevel_env.getSidecarEnvironment(
                             symbol(vlr[1])).lookup(symbol(vlr[0]));
                }
                return (ret == null) ? FALSE : ret;
            case REMPROP:
                if (vlr[1] instanceof SymbolicEnvironment) {
                    env(vlr[1]).undefine(symbol(vlr[0]));
                } else {
                    r.undefine(symbol(vlr[0]), symbol(vlr[1]));
                }
                return VOID;
            case PUTPROP:
                r.getCtx().toplevel_env.define(symbol(vlr[0]), vlr[1]);
                return VOID;
            case SETENVIRONMENT:
                r.getCtx().defineContextEnv(symbol(vlr[0]), env(vlr[1]));
                return VOID;
            case GETSIDECAR:
                return env(vlr[1]).getSidecarEnvironment(symbol(vlr[0])).asValue();
            case STRING2NUMBER:
                try {
                    int radix=num(vlr[1]).indexValue();
                    if (r.dynenv.parser.lexer.strictR5RS &&
                        !(radix==10 || radix == 16 || radix == 2 ||
                          radix==8))
                        throwPrimException(liMessage(SISCB, "invalidradix"));
                    return (Quantity)r.dynenv.parser.nextExpression(new ReaderInputPort(new StringReader(string(vlr[0]))), radix, 0);
                } catch (NumberFormatException nf) {
                    return FALSE;
                } catch (IOException e) {
                    return FALSE;
                }
            case NUMBER2STRING:
                int radix=num(vlr[1]).indexValue();
                if (r.dynenv.parser.lexer.strictR5RS &&
                    !(radix==10 || radix == 16 || radix == 2 ||
                      radix==8))
                    throwPrimException(liMessage(SISCB, "invalidradix"));
                return new SchemeString(num(vlr[0]).toString(radix));
            default:
                break SIZESWITCH;
            }
        case 3:
            switch(id) {
            case GETPROP:
                Value ret = null;
                if (vlr[1] instanceof SymbolicEnvironment) {
                    ret = env(vlr[1]).lookup(symbol(vlr[0]));
                } else {
                    ret = r.getCtx().toplevel_env.getSidecarEnvironment(
                          symbol(vlr[1])).lookup(symbol(vlr[0]));
                }
                return (ret == null) ? vlr[2] : ret;
            case PUTPROP:
                Symbol lhs=symbol(vlr[0]);
                Value rhs=vlr[2];
                SymbolicEnvironment env;
                if (vlr[1] instanceof SymbolicEnvironment) {
                    env=(SymbolicEnvironment)vlr[1];
                } else {
                    env=r.getCtx().toplevel_env.getSidecarEnvironment((Symbol)vlr[1]);
                }
                updateName(rhs, lhs);
                env.define(lhs, rhs);               
                return VOID;
            }
        }
        
        switch (id) {
        case APPLY:
            Procedure proc=proc(vlr[0]);
            int l = vls-2;

            Pair args=pair(vlr[l+1]);
            Value newvlr[] = r.createValues(l+length(args));
            
            int j;
            for (j=0; j < l; j++) {
                newvlr[j] = vlr[j+1];
            }
            for (; args != EMPTYLIST; args = (Pair)args.cdr) {
                newvlr[j++] = args.car;
            }
            r.saveVLR=true;
            r.nxp = APPEVAL;
            r.vlk=false;
            r.vlr=newvlr;
            return proc;
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
