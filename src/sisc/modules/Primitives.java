package sisc.modules;

import java.util.*;
import sisc.data.*;
import sisc.io.*;
import sisc.exprs.*;
import sisc.interpreter.*;
import sisc.nativefun.*;
import java.io.IOException;
import java.io.StringReader;
import java.util.Map;
import java.util.HashMap;
import java.util.LinkedList;
import sisc.env.SymbolicEnvironment;
import sisc.env.MemorySymEnv;
import sisc.env.Parameter;
import sisc.env.SchemeParameter;
import sisc.env.NativeParameter;
import sisc.env.ConfigParameter;
import sisc.util.*;

public class Primitives extends IndexedProcedure {

    public static class Index extends IndexedLibraryAdapter {
        
        public Value construct(int id) {
            return new Primitives(id);
        }
        
        public Index() {
            define("list", LIST);
            define("*", MUL);
            define("+", ADD);
            define("-", SUB);
            define("/", DIV);
            define("<", LT);
            define("=", NEQ);
            define(">", GRT);
            define("_gcd", GCD);
            define("_lcm", LCM);
            define("_string-append", STRINGAPPEND);
            define("acos", ACOS);
            define("apply", APPLY);
            define("ashl", ASHL);
            define("ashr", ASHR);
            define("asin", ASIN);
            define("atan", ATAN);
            define("boolean?", BOOLEANQ);
            define("box", BOX);
            define("box?", BOXQ);
            define("call-with-current-continuation", CALLCC);
            define("call-with-failure-continuation", CALLFC);
            define("call-with-values", CALLWITHVALUES);
            define("car", CAR);
            define("case-sensitive", CASESENSITIVE);
            define("cdr", CDR);
            define("ceiling", CEILING);
            define("char->integer", CHAR2INTEGER);
            define("char?", CHARACTERQ);
            define("circular?", CIRCULARQ);
            define("compact-string-rep", COMPACTSTRINGREP);
            define("complex?", COMPLEXQ);
            define("cons", CONS);
            define("cos", COS);
            define("current-wind", CURRENTWIND);
            define("denominator", DENOMINATOR);
            define("environment?", ENVIRONMENTQ);
            define("eq?", EQ);
            define("eqv?", EQV);
            define("equal?", EQUAL);
            define("eval", EVALUATE);
            define("exact->inexact", EXACT2INEXACT);
            define("exact?", EXACTQ);
            define("exp", EXP);
            define("find-last-unique-vector-element", VECTORFINDLASTUNIQUE);
            define("floor", FLOOR);
            define("getenv", GETENV);
            define("get-sidecar-environment", GETSIDECAR);
            define("get-symbolic-environment", GETENVIRONMENT);
            define("set-symbolic-environment!", SETENVIRONMENT);
            define("gensym", GENSYM);
            define("getprop", GETPROP);
            define("imag-part", IMAGPART);
            define("inexact->exact", INEXACT2EXACT);
            define("inexact?", INEXACTQ);
            define("integer->char", INTEGER2CHAR);
            define("integer?", INTEGERQ);
            define("interaction-environment", INTERACTIONENVIRONMENT);
            define("length", LENGTH);
            define("list->vector", LIST2VECTOR);
            define("load-native-library", LOADNL);
            define("log", LOG);
            define("_make-parameter", MAKEPARAM);
            define("_make-native-parameter", MAKENATIVEPARAM);
            define("_make-config-parameter", MAKECONFIGPARAM);
            define("make-rectangular", MAKERECTANGULAR);
            define("make-string", MAKESTRING);
            define("make-vector", MAKEVECTOR);
            define("native-library-binding", NLBINDING);
            define("native-library-binding-names", NLBINDINGNAMES);
            define("native-library-name", NLNAME);
            define("native-library-version", NLVERSION);
            define("max-float-precision", MAXFLOATPRECISION);
            define("min-float-precision", MINFLOATPRECISION);
            define("null-environment", NULLENVIRONMENT);
            define("null?", NULLQ);
            define("number->string", NUMBER2STRING);
            define("number?", NUMBERQ);
            define("numerator", NUMERATOR);
            define("pair?", PAIRQ);
            define("parameter?", PARAMETERQ);
            define("permit-interrupts", PERMITINTERRUPTS);
            define("procedure?", PROCEDUREQ);
            define("putprop", PUTPROP);
            define("quotient", QUOTIENT);
            define("real-part", REALPART);
            define("remainder", REMAINDER);
            define("remprop", REMPROP);
            define("round", ROUND);
            define("scheme-report-environment", REPORTENVIRONMENT);
            define("set-box!", SETBOX);
            define("set-car!", SETCAR);
            define("set-cdr!", SETCDR);
            define("sin", SIN);
            define("sisc-initial-environment", SISCINITIAL);
            define("sqrt", SQRT);
            define("sleep", SLEEP);
            define("string->number", STRING2NUMBER);
            define("string->symbol", STRING2SYMBOL);
            define("string->uninterned-symbol", STRING2UNINTERNEDSYMBOL);
            define("string-fill!", STRINGFILL);
            define("string-length", STRINGLENGTH);
            define("string-ref", STRINGREF);
            define("string-set!", STRINGSET);
            define("string?", STRINGQ);
            define("symbol->string", SYMBOL2STRING);
            define("symbol?", SYMBOLQ);
            define("system-time", SYSTIME);
            define("tan", TAN);
            define("time-zone-offset", TIMEZONEOFFSET);
            define("truncate", TRUNCATE);
            define("unbox", UNBOX);
            define("vector-fill!", VECTORFILL);
            define("vector->list", VECTOR2LIST);
            define("vector-length", VECTORLENGTH);
            define("vector-ref", VECTORREF);
            define("vector-set!", VECTORSET);
            define("vector?", VECTORQ);
            define("void", _VOID);
            define("void?", VOIDQ);
            define("with-failure-continuation", WITHFC);
        }
    }
    
    public Primitives() {}
    
    public Primitives(int id) {
        super(id);
    }
    
    public static SchemeBoolean numQuery(Value v, int mask)
        throws ContinuationException {
        return truth(v instanceof Quantity &&
                     (((Quantity)v).is(mask)));
    }

    public static class CircularityDetector implements ExpressionVisitor {

        private Map trailMap;
        private LinkedList trail;
        private ExpressionVisitee element;
        private LinkedList components;

        public CircularityDetector() {
            trailMap = new HashMap(1);
            trail = new LinkedList();
        }

        public boolean isCircular(ExpressionVisitee e) {
            element = e;
            components = null;
            boolean res = isCircular();
            element = null;
            components = null;
            trailMap.clear();
            trail.clear();
            return res;
        }

        private boolean isCircular() {
            //this loop is complicated by an optimisation: checking
            //non-composite elements does not require any memory
            //allocation.
            while(element.visit(this)) {
                if (components == null) {
                    while(true) {
                        if (trail.isEmpty()) return false;
                        element = (ExpressionVisitee)trail.getLast();
                        components = (LinkedList)trailMap.get(element);
                        if (!components.isEmpty()) break;
                        //pop trail element
                        trail.removeLast();
                        trailMap.remove(element);
                    }
                } else {
                    //push trail element
                    trailMap.put(element, components);
                    trail.addLast(element);
                }
                //pop component
                element = (ExpressionVisitee)components.removeFirst();
                components = null;
            }
            return true;
        }

        public boolean visit(ExpressionVisitee e) {
            if (e == null) return true;
            if (element.equals(e) || trailMap.containsKey(e))
                return false;
            if (components == null) components = new LinkedList();
            //push component
            components.addLast(e);
            return true;
        }
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

    public final Value doApply(Interpreter r)
        throws ContinuationException {
        final Value[] vlr = r.vlr;
        final int vls = vlr.length;
        
        SIZESWITCH: switch (vls) {
        case 0:
            switch (id) {
            case ADD: return Quantity.ZERO;
            case DIV:
            case NEQ: 
            case LT: 
            case GRT:
            case SUB: throwArgSizeException(); return VOID;

            case COMPACTSTRINGREP: return truth(SchemeString.compactRepresentation);
	    case CASESENSITIVE: return truth(r.dynenv.caseSensitive); 
            case CURRENTWIND: return r.dynenv.wind;
            case GENSYM: 
                long unv=r.tctx.nextUnique();
                return Symbol.intern(base64encode(unv));
            case INTERACTIONENVIRONMENT:
                return r.getCtx().toplevel_env.asValue();
            case MAXFLOATPRECISION: return Quantity.valueOf(maxFloatPrecision);
            case MINFLOATPRECISION: return Quantity.valueOf(minFloatPrecision);
            case MUL: return Quantity.ONE;
            case PERMITINTERRUPTS: return truth(permitInterrupts);
            case SISCINITIAL: 
                try {
                    return new MemorySymEnv(r.lookupContextEnv(Util.SISC_SPECIFIC));
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "nosiscspecificenv"));
                }
            case SYSTIME: return Quantity.valueOf(System.currentTimeMillis());
            case TIMEZONEOFFSET:
                Calendar cal = Calendar.getInstance();
                return Quantity.valueOf((cal.get(Calendar.ZONE_OFFSET) + cal.get(Calendar.DST_OFFSET)) / 1000); 
            case _VOID: return VOID;
            default:
                break SIZESWITCH;
            }
        case 1:
            switch (id) {
            case NULLQ: return truth(vlr[0]==EMPTYLIST);
            case CAR: return truePair( vlr[0]).car;
            case CDR: return truePair( vlr[0]).cdr;
            case PAIRQ:
                return truth(vlr[0] instanceof Pair &&
                             vlr[0]!=EMPTYLIST);
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
            case ADD: 
            case MUL: return num(vlr[0]);
            case SUB: return num(vlr[0]).negate();
            case DIV: return Quantity.ONE.div(num(vlr[0]));
            case LT: 
            case GRT:
            case NEQ: throwArgSizeException(); return VOID;
            case SIN: return num(vlr[0]).sin();
            case COS: return num(vlr[0]).cos();
            case TAN: return num(vlr[0]).tan();
            case ASIN: return num(vlr[0]).asin();
            case ACOS: return num(vlr[0]).acos();
            case ATAN: return num(vlr[0]).atan();
            case LOG: return num(vlr[0]).log();
            case EXP: return num(vlr[0]).exp();
            case SQRT: return num(vlr[0]).sqrt();
            case NUMBERQ: return truth(vlr[0] instanceof Quantity);
            case VECTORQ: return truth(vlr[0] instanceof SchemeVector);
            case SYMBOLQ: return truth(vlr[0] instanceof Symbol);
            case CHARACTERQ: return truth(vlr[0] instanceof SchemeCharacter);
            case STRINGQ: return truth(vlr[0] instanceof SchemeString);
            case BOOLEANQ: return truth(vlr[0] instanceof SchemeBoolean);
            case VOIDQ: return truth(vlr[0]==VOID);
            case ENVIRONMENTQ: return truth(vlr[0] instanceof SymbolicEnvironment);
            case PROCEDUREQ: return truth(vlr[0] instanceof Procedure);
            case INTEGERQ: return numQuery(vlr[0],Quantity.INTEGER);

            case COMPLEXQ: return numQuery(vlr[0],Quantity.IMAGINARY);
            case EXACTQ: return numQuery(vlr[0],Quantity.EXACT);
            case INEXACTQ: return numQuery(vlr[0],Quantity.INEXACT);
            case PARAMETERQ: return truth(vlr[0] instanceof Parameter);
            case SYMBOL2STRING:
                return new ImmutableString(symbol(vlr[0]).symval);
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
            case NUMBER2STRING: return new SchemeString(num(vlr[0])
                                                        .toString());
            case STRING2SYMBOL: return Symbol.intern(string(vlr[0]));
            case CHAR2INTEGER: return Quantity.valueOf(chr(vlr[0]).c);
            case LIST2VECTOR: return new SchemeVector(Util.pairToValues(pair(vlr[0])));
            case VECTOR2LIST:
                Value[] vals=vec(vlr[0]).vals;
                return valArrayToList(vals, 0, vals.length);
            case EXACT2INEXACT: return num(vlr[0]).toInexact();
            case INEXACT2EXACT: return num(vlr[0]).toExact();
            case FLOOR: return num(vlr[0]).floor();
            case CEILING: return num(vlr[0]).ceiling();
            case ROUND: return num(vlr[0]).round();
            case TRUNCATE: return num(vlr[0]).truncate();
            case INTEGER2CHAR: return new SchemeCharacter((char)num(vlr[0]).
                                                          indexValue());
            case VECTORFINDLASTUNIQUE: return Quantity.valueOf(vec(vlr[0]).findEnd());
            case EVALUATE:
                if (r.dynenv.parser.lexer.strictR5RS) 
                   throwArgSizeException();
                r.nxp=r.compile(vlr[0]);
                r.env=null;
                return VOID;
            case CALLCC:
                Value kproc=vlr[0];
                r.replaceVLR(1);
                r.vlr[0]=r.stk.capture(r);
                
                r.vlk=true;
                r.nxp = APPEVAL;
                return kproc;
            case CALLFC:
                Procedure proc=proc(vlr[0]);
                r.replaceVLR(1);
                r.setVLR(0,r.fk.capture(r));
                r.vlk=true;
                r.nxp = APPEVAL;
                return proc;
            case BOX: return new Box(vlr[0]);
            case UNBOX: return (Value)box(vlr[0]).val;
            case BOXQ: return truth(vlr[0] instanceof Box);
            case LENGTH:
                return Quantity.valueOf(length(pair(vlr[0])));
            case STRINGLENGTH:
                return Quantity.valueOf(str(vlr[0]).length());
            case VECTORLENGTH:
                return Quantity.valueOf(vec(vlr[0]).vals.length);
            case CIRCULARQ:
                return truth(new CircularityDetector().isCircular(vlr[0]));
            case MAKEPARAM:
                return new SchemeParameter(vlr[0]);
            case MAKENATIVEPARAM:
                return new NativeParameter(string(vlr[0]));
            case MAKESTRING:
                return new SchemeString(new char[num(vlr[0]).indexValue()]);
            case MAKEVECTOR:
                return new SchemeVector(num(vlr[0]).indexValue());
            case NUMERATOR: return num(vlr[0]).numerator();
            case DENOMINATOR: return num(vlr[0]).denominator();
            case REALPART: return num(vlr[0]).realpart();
            case IMAGPART: return num(vlr[0]).imagpart();
            case CURRENTWIND:
                r.dynenv.wind = vlr[0];
                return VOID;
            case STRING2UNINTERNEDSYMBOL:
                return Symbol.getUnique(string(vlr[0]));
            case CASESENSITIVE: 
		r.dynenv.caseSensitive = truth(vlr[0]);
		return VOID;
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
                    sisc.interpreter.Compiler.addSpecialForms(ae);
                    return ae;
                case 0:
                    return new MemorySymEnv();
                default:
                    throwPrimException(liMessage(SISCB, "unsupportedstandardver"));
                    return VOID;
                }
            case NLNAME:
                return Symbol.get(nlib(vlr[0]).getLibraryName());
            case NLVERSION:
                return Quantity.valueOf(nlib(vlr[0]).getLibraryVersion());
            case NLBINDINGNAMES:
                Value[] va=(Value[])nlib(vlr[0]).getLibraryBindingNames(r);
                return valArrayToList(va,0,va.length);
            case LOADNL:
                try {
                    Class clazz=Class.forName(string(vlr[0]), true, r.dynenv.getClassLoader());
                    return (NativeLibrary)clazz.newInstance();
                } catch (Exception e) {
                    throwPrimException(e.getMessage());
                }
            case SLEEP:
                try {
                    Thread.sleep(num(vlr[0]).longValue());
                } catch (InterruptedException ie) {}
                return VOID;
            case COMPACTSTRINGREP:
                SchemeString.compactRepresentation=truth(vlr[0]);
                return VOID;
            case GETPROP:
            	SymbolicEnvironment tlev=r.getCtx().toplevel_env;
                int loc=tlev.getLoc(symbol(vlr[0]));
                if (loc==-1) return FALSE;
                else return tlev.lookup(loc); 
            case INTERACTIONENVIRONMENT:
                Value env=r.getCtx().toplevel_env.asValue();
                r.getCtx().toplevel_env=Util.env(vlr[0]);
                return env;
            default:
                break SIZESWITCH;
            }
        case 2:
            switch (id) {
            case EQ: return truth(vlr[0] == vlr[1]);
            case EQV: return truth(vlr[0].eqv(vlr[1]));
            case CONS:
                return new Pair(vlr[0], vlr[1]);
            case EQUAL:
                return truth(vlr[0].valueEqual(vlr[1]));
            case SETCAR:
                truePair(vlr[0]).setCar(vlr[1]);
                return VOID;
            case SETCDR:
                truePair(vlr[0]).setCdr(vlr[1]);
                return VOID;
            case ADD: return num(vlr[0]).add(num(vlr[1]));
            case MUL: return num(vlr[0]).mul(num(vlr[1]));
            case SUB: return num(vlr[0]).sub(num(vlr[1]));
            case DIV: return num(vlr[0]).div(num(vlr[1]));
            case NEQ: return truth(num(vlr[0]).comp(num(vlr[1]),0));
            case REMAINDER:
                return num(vlr[0]).remainder(num(vlr[1]));
            case QUOTIENT:
                return num(vlr[0]).quotient(num(vlr[1]));
            case LCM:
                return num(vlr[0]).lcm(num(vlr[1]));
            case GCD:
                return num(vlr[0]).gcd(num(vlr[1]));
            case ATAN:
                return num(vlr[0]).atan(num(vlr[1]));
            case SETBOX:
                try {
                    box(vlr[0]).set(vlr[1]);
                } catch (ImmutableException e) {
                    throwPrimException(liMessage(SISCB, "isimmutable", "box",
                                                 vlr[0].synopsis()));
                }
                return VOID;
            case STRINGREF:
                int index=num(vlr[1]).indexValue();
                try {
                    return new SchemeCharacter(str(vlr[0]).charAt(index));
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     vlr[0].synopsis()}));
                }
            case VECTORREF:
                index=num(vlr[1]).indexValue();
                try {
                    return vec(vlr[0]).vals[index];
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     vlr[0].synopsis()}));
                }
            case MAKEVECTOR:
                return new SchemeVector(num(vlr[0]).indexValue(),
                                        vlr[1]);
            case STRINGFILL:
                SchemeString st=str(vlr[0]);
                char c=character(vlr[1]);
                for (int i=0; i<st.length(); i++)
                    st.set(i, c);
                return VOID;
            case MAKESTRING:
                char newStr[]=new char[num(vlr[0]).indexValue()];
                char fillchar=character(vlr[1]);
                for (int i=0; i<newStr.length; i++) {
                    newStr[i]=fillchar;
                }
                return new SchemeString(newStr);
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
            case STRINGAPPEND:
                return str(vlr[0]).append(str(vlr[1]));
            case MAKERECTANGULAR:
                return Quantity.valueOf(num(vlr[0]),
                                        num(vlr[1]));
            case ASHL: return Quantity.valueOf(num(vlr[0]).integer()
                                               .shiftLeft(num(vlr[1])
                                                          .indexValue()));
            case ASHR: return Quantity.valueOf(num(vlr[0]).integer()
                                               .shiftRight(num(vlr[1])
                                                           .indexValue()));
            case NLBINDING:
                return nlib(vlr[0]).getBindingValue(r, symbol(vlr[1]));
            case MAKECONFIGPARAM:
                return new ConfigParameter(string(vlr[0]), vlr[1]);
            case EVALUATE:
                r.nxp=r.compile(vlr[0], env(vlr[1]));
                r.env=null;
                return VOID;
            case WITHFC:
                Procedure proc=proc(vlr[1]);
                Procedure ehandler=proc(vlr[0]);
                r.fk=r.createFrame(new ApplyValuesContEval(ehandler),
                                   null, false, r.env, r.fk, r.stk, 
                                   null);
                r.replaceVLR(0);
                r.vlk=true;
                r.nxp = APPEVAL;
                return proc;
            case CALLWITHVALUES:
                Procedure producer=proc(vlr[0]);
                Procedure consumer=proc(vlr[1]);
                r.push(new ApplyValuesContEval(consumer));
                r.replaceVLR(0);
                r.vlk=true;
                r.nxp = APPEVAL;
                return producer;
            case GETPROP:
                Value ret = null;
                if (vlr[1] instanceof SymbolicEnvironment) {
                    ret = (Value)env(vlr[1]).lookup(symbol(vlr[0]));
                } else {
                    ret = (Value)r.getCtx().toplevel_env.getSidecarEnvironment(
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
            default:
                break SIZESWITCH;
            }
        case 3:
            switch(id) {
            case GETPROP:
                Value ret = null;
                if (vlr[1] instanceof SymbolicEnvironment) {
                    ret = (Value)env(vlr[1]).lookup(symbol(vlr[0]));
                } else {
                    ret = (Value)r.getCtx().toplevel_env.getSidecarEnvironment(
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
            case STRINGSET:
                int index=num(vlr[1]).indexValue();
                try {
                    str(vlr[0]).set(index, character(vlr[2]));
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     vlr[0].synopsis()}));
                }
                return VOID;
            case VECTORFILL:
                vec(vlr[0]).fill(vlr[1]);
                return VOID;
            case VECTORSET:
                index=num(vlr[1]).indexValue();
                try {
                    vec(vlr[0]).set(index,vlr[2]);
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     vlr[0].synopsis()}));
                }
                return VOID;
            }
        }
        
        Quantity quantity=null;
        switch (id) {
        case APPLY:
            Procedure proc=proc(vlr[0]);
            int l = vls-2;
            Pair args=pair(vlr[l+1]);
            
            r.replaceVLR(l + length(args));
            Value newvlr[] = r.vlr;
            
            int j;
            for (j=0; j < l; j++) {
                newvlr[j] = vlr[j+1];
            }
            for (; args != EMPTYLIST; args = (Pair)args.cdr) {
                newvlr[j++] = args.car;
            }
            r.vlk=true;
            r.nxp = APPEVAL;
            return proc;
        case LIST: return valArrayToList(vlr,0,vls);
        case ADD:
            int x=vls-1;
            quantity=num(vlr[x]);
            while (--x >= 0) 
                quantity=quantity.add(num(vlr[x]));
            return quantity;
        case MUL:
            x=vls-1;
            quantity=num(vlr[x]);
            while (--x >= 0) 
                quantity=quantity.mul(num(vlr[x]));
            return quantity;
        case SUB: 
            quantity=num(vlr[0]);
            for (int i=1; i<vls; i++) {
                quantity=quantity.sub(num(vlr[i]));
            }
            return quantity;
        case NEQ:
            quantity=num(vlr[0]);
            for (int i=vls-1; i>0; i--) {
                if (!quantity.comp(num(vlr[i]), 0)) return FALSE;
            }
            return TRUE;
        case LT:
            quantity=num(vlr[0]);
            for (int i=1; i<vls; i++) {
                Quantity q=num(vlr[i]);
                if (!quantity.comp(q, -1)) return FALSE;
                quantity=q;
            }
            return TRUE;
        case GRT:
            quantity=num(vlr[0]);
            for (int i=1; i<vls; i++) {
                Quantity q=num(vlr[i]);
                if (!quantity.comp(q, 1)) return FALSE;
                quantity=q;
            }
            return TRUE;
        case DIV: 
            x=vls-1;
            quantity=num(vlr[x]);
            while (--x >= 1) 
                quantity=quantity.mul(num(vlr[x]));
            return num(vlr[0]).div(quantity);
        default:
            throwArgSizeException();
        }
        return VOID;
    }

    //next: 125
    static final int
        ACOS = 23,
        ADD = 114,
        APPLY = 121,
        ASHL = 102,
        ASHR = 103,
        ASIN = 22,
        ATAN = 93,
        BOOLEANQ = 32,
        BOX = 56,
        BOXQ = 58,
        CALLCC = 54,
        CALLFC = 55,
        CALLWITHVALUES = 106,
        CAR = 15,
        CASESENSITIVE = 6,
        CDR = 16,
        CEILING = 49,
        CHAR2INTEGER = 43,
        CHARACTERQ = 30,
        CIRCULARQ = 62,
        COMPACTSTRINGREP = 7,
        COMPLEXQ = 37,
        CONS = 85,
        COS = 20,
        CURRENTWIND = 70,
        DENOMINATOR = 67,
        DIV = 115,
        ENVIRONMENTQ = 34,
        EQ = 83,
        EQUAL = 86,
        EQV = 84,
        EVALUATE = 81,
        EXACT2INEXACT = 46,
        EXACTQ = 38,
        EXP = 25,
        FLOOR = 48,
        GCD = 92,
        GENSYM = 0,
        GETSIDECAR = 124,
        GETENV = 123,
        GETENVIRONMENT = 18,
        GETPROP = 109,
        GRT = 118,
        IMAGPART = 69,
        INEXACT2EXACT = 47,
        INEXACTQ = 39,
        INTEGER2CHAR = 52,
        INTEGERQ = 36,
        INTERACTIONENVIRONMENT = 1,
        LCM = 91,
        LENGTH = 59,
        LIST = 120,
        LIST2VECTOR = 44,
        LOADNL = 77,
        LOG = 24,
        LT = 117,
        MAKEPARAM = 63,
        MAKENATIVEPARAM = 12,
        MAKECONFIGPARAM = 122,
        MAKERECTANGULAR = 101,
        MAKESTRING = 99,
        MAKEVECTOR = 65,
        MAXFLOATPRECISION = 9,
        MINFLOATPRECISION = 10,
        MUL = 11,
        NEQ = 116,
        NLBINDING = 104,
        NLBINDINGNAMES = 76,
        NLNAME = 74,
        NLVERSION = 75,
        NULLENVIRONMENT = 73,
        NULLQ = 14,
        NUMBER2STRING = 80,
        NUMBERQ = 27,
        NUMERATOR = 66,
        PAIRQ = 17,
        PARAMETERQ = 40,
        PERMITINTERRUPTS = 8,
        PROCEDUREQ = 35,
        PUTPROP = 110,
        QUOTIENT = 90,
        REALPART = 68,
        REMAINDER = 89,
        REMPROP = 107,
        REPORTENVIRONMENT = 72,
        ROUND = 50,
        SETBOX = 94,
        SETCAR = 87,
        SETCDR = 88,
        SETENVIRONMENT = 108,
        SIN = 19,
        SISCINITIAL = 2,
        SLEEP = 78,
        SQRT = 26,
        STRING2NUMBER = 79,
        STRING2SYMBOL = 42,
        STRING2UNINTERNEDSYMBOL = 71,
        STRINGAPPEND = 100,
        STRINGFILL = 98,
        STRINGLENGTH = 60,
        STRINGQ = 31,
        STRINGREF = 95,
        STRINGSET = 111,
        SUB = 119,
        SYMBOL2STRING = 41,
        SYMBOLQ = 29,
        SYSTIME = 3,
        TAN = 21,
        TIMEZONEOFFSET = 4,
        TRUNCATE = 51,
        UNBOX = 57,
        VECTOR2LIST = 45,
        VECTORFILL = 113,
        VECTORFINDLASTUNIQUE = 53,
        VECTORLENGTH = 61,
        VECTORQ = 28,
        VECTORREF = 96,
        VECTORSET = 112,
        VOIDQ = 33,
        WITHFC = 105,
        _VOID = 5;

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
