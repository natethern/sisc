package sisc.modules;

import java.util.*;
import java.lang.reflect.*;
import java.io.IOException;
import java.io.StringReader;

import sisc.*;
import sisc.data.*;
import sisc.io.*;
import sisc.exprs.*;
import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.env.SymbolicEnvironment;
import sisc.env.MemorySymEnv;

public class Primitives extends ModuleAdapter {

    public Primitives() {
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
        define("compact-string-rep", COMPACTSTRINGREP);
        define("complex?", COMPLEXQ);
        define("cons", CONS);
        define("cos", COS);
        define("current-evaluator", CURRENTEVAL);
        define("current-wind", CURRENTWIND);
        define("denominator", DENOMINATOR);
        define("environment?", ENVIRONMENTQ);
        define("eq?", EQ);
        define("equal?", EQUAL);
        define("eval", EVAL);
        define("exact->inexact", EXACT2INEXACT);
        define("exact?", EXACTQ);
        define("exp", EXP);
        define("find-last-unique-vector-element", VECTORFINDLASTUNIQUE);
        define("floor", FLOOR);
        define("native-library-binding", NLBINDING);
        define("native-library-binding-names", NLBINDINGNAMES);
        define("native-library-name", NLNAME);
        define("native-library-version", NLVERSION);
        define("get-symbolic-environment", GETENVIRONMENT);
        define("set-symbolic-environment!", SETENVIRONMENT);
        define("getprop", GETPROP);
        define("imag-part", IMAGPART);
        define("inexact->exact", INEXACT2EXACT);
        define("inexact?", INEXACTQ);
        define("integer->char", INTEGER2CHAR);
        define("integer?", INTEGERQ);
        define("interaction-environment", INTERACTIONENVIRONMENT );
        define("length", LENGTH);
        define("list->vector", LIST2VECTOR);
        define("load-native-library", LOADNL);
        define("log", LOG);
        define("make-parameter", MAKEPARAM);
        define("make-rectangular", MAKERECTANGULAR);
        define("make-string", MAKESTRING);
        define("make-vector", MAKEVECTOR);
        define("max-precision", MAX_PRECISION);
        define("min-precision", MIN_PRECISION);
        define("null-environment", NULLENVIRONMENT);
        define("null?", NULLQ);
        define("number->string", NUMBER2STRING);
        define("number?", NUMBERQ);
        define("numerator", NUMERATOR);
        define("pair?", PAIRQ);
        define("parameter?", PARAMETERQ);
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

    public static SchemeBoolean numQuery(Value v, int mask)
        throws ContinuationException {
        return truth(v instanceof Quantity &&
                     (((Quantity)v).is(mask)));
    }

    public static class Parameter extends Procedure {

        private Value v;

        public Parameter() {}

        public Parameter(Value v) {
            this.v = v;
        }

        public void apply(Interpreter r)
            throws ContinuationException {
            r.nxp = null;
            Value res = null;
            switch (r.vlr.length) {
            case 0:
                res = (Value)r.dynenv.parameters.get(this);
                if (null == res) res = v;
                break;
            case 1:
                res = (Value)r.dynenv.parameters.put(this,r.vlr[0]);
                if (null == res) res = FALSE;
                break;
            default:
                throwArgSizeException();
            }
            r.acc = res;
        }

        public String display() {
            return displayNamedOpaque("parameter");
        }

        public void serialize(Serializer s) throws IOException {
            s.writeExpression(v);
        }

        public void deserialize(Deserializer s) throws IOException {
            v = (Value)s.readExpression();
        }
    }

    public Value eval(int primid, Interpreter f)
        throws ContinuationException {
        switch (f.vlr.length) {
        case 0:
            switch (primid) {
            case _VOID: return VOID;
            case COMPACTSTRINGREP: return truth(SchemeString.compactRepresentation);
            case CURRENTWIND: return f.dynenv.wind;
            case CURRENTEVAL: return (Value)f.ctx.evaluator;
            case INTERACTIONENVIRONMENT:
                return f.ctx.toplevel_env.asValue();
            case SYSTIME: return Quantity.valueOf(System.currentTimeMillis());
            case MAX_PRECISION: return Quantity.valueOf(Quantity.max_precision);
            case MIN_PRECISION: return Quantity.valueOf(Quantity.min_precision);
            case CASESENSITIVE: return truth(Symbol.caseSensitive);
            case SISCINITIAL: 
                try {
                    return new MemorySymEnv(f.lookupContextEnv(SISC_SPECIFIC));
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "nosiscspecificenv"));
                }
            case TIMEZONEOFFSET:
                Calendar cal = Calendar.getInstance();
                return Quantity.valueOf((cal.get(Calendar.ZONE_OFFSET) + cal.get(Calendar.DST_OFFSET)) / 1000);
            }
        case 1:
            switch (primid) {
            case NULLQ: return truth(f.vlr[0]==EMPTYLIST);
            case CAR: return truePair( f.vlr[0]).car;
            case CASESENSITIVE:
                Symbol.caseSensitive = truth(f.vlr[0]);
                return VOID;
            case CDR: return truePair( f.vlr[0]).cdr;
            case PAIRQ:
                return truth(f.vlr[0] instanceof Pair &&
                             f.vlr[0]!=EMPTYLIST);
            case GETENVIRONMENT:
                return f.ctx.lookupContextEnv(symbol(f.vlr[0])).asValue();
            case SIN: return num(f.vlr[0]).sin();
            case COS: return num(f.vlr[0]).cos();
            case TAN: return num(f.vlr[0]).tan();
            case ASIN: return num(f.vlr[0]).asin();
            case ACOS: return num(f.vlr[0]).acos();
            case ATAN: return num(f.vlr[0]).atan();
            case LOG: return num(f.vlr[0]).log();
            case EXP: return num(f.vlr[0]).exp();
            case SQRT: return num(f.vlr[0]).sqrt();
            case NUMBERQ: return truth(f.vlr[0] instanceof Quantity);
            case VECTORQ: return truth(f.vlr[0] instanceof SchemeVector);
            case SYMBOLQ: return truth(f.vlr[0] instanceof Symbol);
            case CHARACTERQ: return truth(f.vlr[0] instanceof SchemeCharacter);
            case STRINGQ: return truth(f.vlr[0] instanceof SchemeString);
            case BOOLEANQ: return truth(f.vlr[0] instanceof SchemeBoolean);
            case VOIDQ: return truth(f.vlr[0]==VOID);
            case ENVIRONMENTQ: return truth(f.vlr[0] instanceof SymbolicEnvironment);
            case PROCEDUREQ: return truth(f.vlr[0] instanceof Procedure);
            case INTEGERQ: return numQuery(f.vlr[0],Quantity.INTEGER);

            case COMPLEXQ: return numQuery(f.vlr[0],Quantity.IMAGINARY);
            case EXACTQ: return numQuery(f.vlr[0],Quantity.EXACT);
            case INEXACTQ: return numQuery(f.vlr[0],Quantity.INEXACT);
            case PARAMETERQ: return truth(f.vlr[0] instanceof Parameter);
            case SYMBOL2STRING:
                return new ImmutableString(symbol(f.vlr[0]).symval);
            case STRING2NUMBER:
                String st=string(f.vlr[0]);
                try {
                    return (Quantity)f.dynenv.parser.nextExpression(new ReaderInputPort(new StringReader(st)));
                } catch (ClassCastException cce) {
                    return FALSE;
                } catch (NumberFormatException nf) {
                    return FALSE;
                } catch (IOException e) {
                    return FALSE;
                }
            case NUMBER2STRING: return new SchemeString(num(f.vlr[0])
                                                        .toString());
            case STRING2SYMBOL: return Symbol.intern(string(f.vlr[0]));
            case CHAR2INTEGER: return Quantity.valueOf(chr(f.vlr[0]).c);
            case LIST2VECTOR: return new SchemeVector(pairToValues(pair(f.vlr[0])));
            case VECTOR2LIST:
                Value[] vals=vec(f.vlr[0]).vals;
                return valArrayToList(vals, 0, vals.length);
            case EXACT2INEXACT: return num(f.vlr[0]).toInexact();
            case INEXACT2EXACT: return num(f.vlr[0]).toExact();
            case FLOOR: return num(f.vlr[0]).floor();
            case CEILING: return num(f.vlr[0]).ceiling();
            case ROUND: return num(f.vlr[0]).round();
            case TRUNCATE: return num(f.vlr[0]).truncate();
            case INTEGER2CHAR: return new SchemeCharacter((char)num(f.vlr[0]).
                                                          intValue());
            case VECTORFINDLASTUNIQUE: return Quantity.valueOf(vec(f.vlr[0]).findEnd());
            case EVAL:
                f.nxp=f.compile(f.vlr[0]);
                f.returnVLR();
                return VOID;
            case CALLCC:
                Procedure kproc=(Procedure)f.vlr[0];
                f.replaceVLR(1);
                f.vlr[0]=f.stk.capture(f);
                f.nxp = APPEVAL;
                return kproc;
            case CALLFC:
                Procedure proc=proc(f.vlr[0]);
                f.replaceVLR(1);
                f.vlr[0]=f.fk.capture(f);
                f.nxp = APPEVAL;
                return proc;
            case BOX: return new Box(f.vlr[0]);
            case UNBOX: return (Value)box(f.vlr[0]).val;
            case BOXQ: return truth(f.vlr[0] instanceof Box);
            case LENGTH:
                return Quantity.valueOf(length(pair(f.vlr[0])));
            case STRINGLENGTH:
                return Quantity.valueOf(str(f.vlr[0]).length());
            case VECTORLENGTH:
                return Quantity.valueOf(vec(f.vlr[0]).vals.length);
            case MAKEPARAM:
                return new Parameter(f.vlr[0]);
            case MAKESTRING:
                return new SchemeString(new char[num(f.vlr[0]).intValue()]);
            case MAKEVECTOR:
                return new SchemeVector(num(f.vlr[0]).intValue());
            case NUMERATOR: return num(f.vlr[0]).numerator();
            case DENOMINATOR: return num(f.vlr[0]).denominator();
            case REALPART: return num(f.vlr[0]).realpart();
            case IMAGPART: return num(f.vlr[0]).imagpart();
            case CURRENTWIND:
                f.dynenv.wind = f.vlr[0];
                return VOID;
            case STRING2UNINTERNEDSYMBOL:
                return Symbol.getUnique(string(f.vlr[0]));
            case REPORTENVIRONMENT:
                if (FIVE.equals(num(f.vlr[0])))
                    try {
                        return new MemorySymEnv(f.lookupContextEnv(REPORT));
                    } catch (ArrayIndexOutOfBoundsException e) {
                        throwPrimException(liMessage(SISCB, "noreportenv"));
                    }
                else throwPrimException(liMessage(SISCB, "unsupportedstandardver"));
            case NULLENVIRONMENT:
                if (FIVE.equals(num(f.vlr[0]))) {
                    MemorySymEnv ae = new MemorySymEnv();
                    sisc.compiler.Compiler.addSpecialForms(ae);
                    return ae;
                } else throwPrimException(liMessage(SISCB, "unsupportedstandardver"));
            case CURRENTEVAL:
                f.ctx.evaluator=proc(f.vlr[0]);
                return VOID;
            case NLNAME:
                return Symbol.get(module(f.vlr[0]).getModuleName());
            case NLVERSION:
                return Quantity.valueOf(module(f.vlr[0]).getModuleVersion());
            case NLBINDINGNAMES:
                Value[] va=(Value[])module(f.vlr[0]).getModuleBindingNames(f);
                return valArrayToList(va,0,va.length);
            case LOADNL:
                try {
                    Class clazz=Class.forName(string(f.vlr[0]));
                    return (Module)clazz.newInstance();
                } catch (Exception e) {
                    throwPrimException(e.getMessage());
                }
            case MAX_PRECISION:
                Quantity.max_precision=num(f.vlr[0]).intValue();
                return VOID;
            case MIN_PRECISION:
                Quantity.min_precision=num(f.vlr[0]).intValue();
                return VOID;
            case SLEEP:
                try {
                    Thread.sleep(num(f.vlr[0]).longValue());
                } catch (InterruptedException ie) {}
                return VOID;
            case COMPACTSTRINGREP:
                SchemeString.compactRepresentation=truth(f.vlr[0]);
                return VOID;
            }
        case 2:
            switch (primid) {
            case EQ: return truth(f.vlr[0].eq(f.vlr[1]));
            case CONS:
                return new Pair(f.vlr[0], f.vlr[1]);
            case EQUAL:
                return truth(f.vlr[0].valueEqual(f.vlr[1]));
            case SETCAR:
                truePair(f.vlr[0]).setCar(f.vlr[1]);
                return VOID;
            case SETCDR:
                truePair(f.vlr[0]).setCdr(f.vlr[1]);
                return VOID;
            case REMAINDER:
                return num(f.vlr[0]).remainder(num(f.vlr[1]));
            case QUOTIENT:
                return num(f.vlr[0]).quotient(num(f.vlr[1]));
            case LCM:
                return num(f.vlr[0]).lcm(num(f.vlr[1]));
            case GCD:
                return num(f.vlr[0]).gcd(num(f.vlr[1]));
            case ATAN:
                return num(f.vlr[0]).atan(num(f.vlr[1]));
            case SETBOX:
                try {
                    box(f.vlr[0]).set(f.vlr[1]);
                } catch (ImmutableException e) {
                    throwPrimException(liMessage(SISCB, "isimmutable", "box",
                                                 f.vlr[0].write()));
                }
                return VOID;
            case STRINGREF:
                int index=num(f.vlr[1]).intValue();
                try {
                    return new SchemeCharacter(str(f.vlr[0]).charAt(index));
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     f.vlr[0].synopsis()}));
                }
            case VECTORREF:
                index=num(f.vlr[1]).intValue();
                try {
                    return vec(f.vlr[0]).vals[index];
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     f.vlr[0].synopsis()}));
                }
            case MAKEVECTOR:
                return new SchemeVector(num(f.vlr[0]).intValue(),
                                        f.vlr[1]);
            case STRINGFILL:
                SchemeString st=str(f.vlr[0]);
                char c=character(f.vlr[1]);
                for (int i=0; i<st.length(); i++)
                    st.set(i, c);
                return VOID;
            case MAKESTRING:
                char newStr[]=new char[num(f.vlr[0]).intValue()];
                char fillchar=character(f.vlr[1]);
                for (int i=0; i<newStr.length; i++) {
                    newStr[i]=fillchar;
                }
                return new SchemeString(newStr);
            case STRING2NUMBER:
                try {
                    return (Quantity)f.dynenv.parser.nextExpression(new ReaderInputPort(new StringReader(string(f.vlr[0]))), num(f.vlr[1]).intValue(), 0);
                } catch (NumberFormatException nf) {
                    return FALSE;
                } catch (IOException e) {
                    return FALSE;
                }
            case NUMBER2STRING:
                return new SchemeString(num(f.vlr[0])
                                        .toString(num(f.vlr[1]).intValue()));
            case STRINGAPPEND:
                return str(f.vlr[0]).append(str(f.vlr[1]));
            case MAKERECTANGULAR:
                return Quantity.valueOf(num(f.vlr[0]),
                                        num(f.vlr[1]));
            case ASHL: return Quantity.valueOf(num(f.vlr[0]).integer()
                                               .shiftLeft(num(f.vlr[1])
                                                          .intValue()));
            case ASHR: return Quantity.valueOf(num(f.vlr[0]).integer()
                                               .shiftRight(num(f.vlr[1])
                                                           .intValue()));
            case NLBINDING:
                return module(f.vlr[0]).getBindingValue(f, symbol(f.vlr[1]));
            case EVAL:
                f.nxp=f.compile(f.vlr[0], env(f.vlr[1]));
                f.returnVLR();
                return VOID;
            case WITHFC:
                Procedure proc=proc(f.vlr[1]);
                Procedure ehandler=proc(f.vlr[0]);
                f.fk=f.createFrame(new ApplyValuesContEval(ehandler),
                                   null, false, f.env, f.fk, f.stk);
                f.replaceVLR(0);
                f.nxp = APPEVAL;
                return proc;
            case CALLWITHVALUES:
                Procedure producer=proc(f.vlr[0]);
                Procedure consumer=proc(f.vlr[1]);
                f.push(new ApplyValuesContEval(consumer));
                f.replaceVLR(0);
                f.nxp = APPEVAL;
                return producer;
            case GETPROP:
                Value ret = null;
                if (f.vlr[1] instanceof SymbolicEnvironment) {
                    ret = (Value)env(f.vlr[1]).lookup(symbol(f.vlr[0]));
                } else {
                    ret = (Value)f.lookup(symbol(f.vlr[0]), symbol(f.vlr[1]));
                }
                return (ret == null) ? FALSE : ret;
            case REMPROP:
                f.undefine(symbol(f.vlr[0]), symbol(f.vlr[1]));
                return VOID;
            case SETENVIRONMENT:
                f.ctx.defineContextEnv(symbol(f.vlr[0]), env(f.vlr[1]));
                return VOID;
            }
        case 3:
            switch(primid) {
            case GETPROP:
                Value ret = null;
                if (f.vlr[1] instanceof SymbolicEnvironment) {
                    ret = (Value)env(f.vlr[1]).lookup(symbol(f.vlr[0]));
                } else {
                    ret = (Value)f.lookup(symbol(f.vlr[0]), symbol(f.vlr[1]));
                }
                return (ret == null) ? f.vlr[2] : ret;
            case PUTPROP:
                Symbol lhs=symbol(f.vlr[0]);
                Value rhs=f.vlr[2];
                SymbolicEnvironment env;
                if (f.vlr[1] instanceof SymbolicEnvironment) {
                    env=(SymbolicEnvironment)f.vlr[1];
                } else {
                    env=f.getContextEnv(symbol(f.vlr[1]));
                }
                updateName(rhs, lhs);
                env.define(lhs, rhs);
                return VOID;
            case STRINGSET:
                int index=num(f.vlr[1]).intValue();
                try {
                    str(f.vlr[0]).set(index, character(f.vlr[2]));
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     f.vlr[0].synopsis()}));
                }
                return VOID;
            case VECTORFILL:
                vec(f.vlr[0]).fill(f.vlr[1]);
                return VOID;
            case VECTORSET:
                index=num(f.vlr[1]).intValue();
                try {
                    vec(f.vlr[0]).set(index,f.vlr[2]);
                } catch (ArrayIndexOutOfBoundsException e) {
                    throwPrimException(liMessage(SISCB, "indexoob", 
                                                 new Object[] {
                                                     new Integer(index),
                                                     f.vlr[0].synopsis()}));
                }
                return VOID;
            }
        default:
            Quantity quantity=null;
            switch (primid) {
            case APPLY:
                Procedure proc=proc(f.vlr[0]);
                int l = f.vlr.length-2;
                Pair args=pair(f.vlr[l+1]);
                Value oldvlr[] = f.vlr;
                //this might get us back the just recycled f.vlr,
                //which is fine since we only shift its contents to
                //the left by one
                Value newvlr[] = f.replaceVLR(l + length(args));

                int j;
                for (j=0; j < l; j++) {
                    newvlr[j] = oldvlr[j+1];
                }
                for (; args != EMPTYLIST; args = (Pair)args.cdr) {
                    newvlr[j++] = args.car;
                }

                f.nxp = APPEVAL;
                return proc;
            case LIST: return valArrayToList(f.vlr,0,f.vlr.length);
            case ADD:
                quantity=Quantity.ZERO;
                for (int i=f.vlr.length-1; i>=0; i--) {
                    quantity=quantity.add(num(f.vlr[i]));
                }
                return quantity;
            case MUL:
                quantity=Quantity.ONE;
                for (int i=f.vlr.length-1; i>=0; i--) {
                    quantity=quantity.mul(num(f.vlr[i]));
                }
                return quantity;
            case SUB:
                quantity=num(f.vlr[0]);
                if (f.vlr.length==1) {
                    return Quantity.ZERO.sub(quantity);
                }
                for (int i=1; i<f.vlr.length; i++) {
                    quantity=quantity.sub(num(f.vlr[i]));
                }
                return quantity;

            case NEQ:
                if (f.vlr.length<2) throwArgSizeException();
                quantity=num(f.vlr[0]);
                for (int i=f.vlr.length-1; i>=0; i--) {
                    if (!quantity.comp(num(f.vlr[i]), 0)) return FALSE;
                }
                return TRUE;
            case LT:
                if (f.vlr.length<2) throwArgSizeException();
                quantity=num(f.vlr[0]);
                for (int i=1; i<f.vlr.length; i++) {
                    Quantity q=num(f.vlr[i]);
                    if (!quantity.comp(q, -1)) return FALSE;
                    quantity=q;
                }
                return TRUE;
            case GRT:
                if (f.vlr.length<2) throwArgSizeException();
                quantity=num(f.vlr[0]);
                for (int i=1; i<f.vlr.length; i++) {
                    Quantity q=num(f.vlr[i]);
                    if (!quantity.comp(q, 1)) return FALSE;
                    quantity=q;
                }
                return TRUE;
            case DIV:
                quantity=num(f.vlr[0]);
                if (f.vlr.length==1) {return Quantity.ONE.div(quantity); }
                for (int i=1; i<f.vlr.length; i++) {
                    quantity=quantity.div(num(f.vlr[i]));
                }
                return quantity;
            default:
                throwArgSizeException();
            }
        }
        return VOID;
    }

    static final int
        //0-10
        //13
        //16
        //26-30
        //33-34
        //37
        //44-46
        //59
        //69
        //72-75
        //78-82
        //110-111
        //136-139
        //154
        ACOS = 14,
        ADD = 152,
        APPLY = 50,
        ASHL = 104,
        ASHR = 105,
        ASIN = 15,
        ATAN = 106,
        BOOLEANQ = 17,
        BOX = 18,
        BOXQ = 19,
        CALLCC = 20,
        CALLFC = 107,
        CALLWITHVALUES = 108,
        CAR = 21,
        CASESENSITIVE = 151,
        CDR = 22,
        CEILING = 23,
        CHAR2INTEGER = 24,
        CHARACTERQ = 25,
        COMPACTSTRINGREP = 125,
        COMPLEXQ = 40,
        CONS = 109,
        COS = 31,
        CURRENTEVAL = 32,
        CURRENTWIND = 35,
        DENOMINATOR = 36,
        DIV = 144,
        ENVIRONMENTQ = 39,
        EQ = 112,
        EQUAL = 113,
        EVAL = 115,
        EXACT2INEXACT = 41,
        EXACTQ = 42,
        EXP = 43,
        FLOOR = 54,
        GCD = 116,
        GETENVIRONMENT = 64,
        GETPROP = 119,
        GRT = 153,
        NLBINDING = 117,
        NLBINDINGNAMES = 47,
        NLNAME = 48,
        NLVERSION = 49,
        IMAGPART = 51,
        INEXACT2EXACT = 52,
        INEXACTQ = 53,
        INTEGER2CHAR = 55,
        INTEGERQ = 56,
        INTERACTIONENVIRONMENT = 4,
        LCM = 118,
        LENGTH = 57,
        LIST = 146,
        LIST2VECTOR = 58,
        LOADNL = 60,
        LOG = 61,
        LT = 147,
        MAKEPARAM = 63,
        MAKERECTANGULAR = 121,
        MAKESTRING = 122,
        MAKEVECTOR = 123,
        MAX_PRECISION = 65,
        MIN_PRECISION = 66,
        MUL = 148,
        NEQ = 149,
        NULLENVIRONMENT = 67,
        NULLQ = 68,
        NUMBER2STRING = 124,
        NUMBERQ = 70,
        NUMERATOR = 71,
        PAIRQ = 76,
        PARAMETERQ = 77,
        PROCEDUREQ = 120,
        PUTPROP = 140,
        QUOTIENT = 126,
        REALPART = 83,
        REMAINDER = 127,
        REMPROP = 62,
        REPORTENVIRONMENT = 84,
        ROUND = 85,
        SETBOX = 128,
        SETCAR = 129,
        SETCDR = 130,
        SETENVIRONMENT = 38,
        SIN = 86,
        SISCINITIAL = 89,
        SLEEP = 87,
        SQRT = 88,
        STRING2NUMBER = 131,
        STRING2SYMBOL = 90,
        STRING2UNINTERNEDSYMBOL = 91,
        STRINGAPPEND = 132,
        STRINGFILL = 133,
        STRINGLENGTH = 92,
        STRINGQ = 93,
        STRINGREF = 134,
        STRINGSET = 141,
        SUB = 150,
        SYMBOL2STRING = 94,
        SYMBOLQ = 95,
        SYSTIME = 11,
        TAN = 96,
        TIMEZONEOFFSET = 114,
        TRUNCATE = 12,
        UNBOX = 97,
        VECTOR2LIST = 98,
        VECTORFINDLASTUNIQUE = 99,
        VECTORLENGTH = 100,
        VECTORQ = 101,
        VECTORREF = 135,
        VECTORSET = 142,
        VECTORFILL = 145,
        VOIDQ = 102,
        WITHFC = 103,
        _VOID = 12;


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
