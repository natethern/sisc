package sisc.modules;

import java.util.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.*;
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

public class SimplePrimitives extends IndexedFixableProcedure implements Primitives {

    public static class Index extends IndexedLibraryAdapter {
        
        public Value construct(int id) {
            return new SimplePrimitives(id);
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
            define("ashl", ASHL);
            define("ashr", ASHR);
            define("asin", ASIN);
            define("atan", ATAN);
            define("boolean?", BOOLEANQ);
            define("box", BOX);
            define("box?", BOXQ);
            define("car", CAR);
            define("cdr", CDR);
            define("ceiling", CEILING);
            define("char->integer", CHAR2INTEGER);
            define("char?", CHARACTERQ);
            define("circular?", CIRCULARQ);
            define("compact-string-rep", COMPACTSTRINGREP);
            define("complex?", COMPLEXQ);
            define("cons", CONS);
            define("cos", COS);
            define("denominator", DENOMINATOR);
            define("environment?", ENVIRONMENTQ);
            define("eq?", EQ);
            define("eqv?", EQV);
            define("equal?", EQUAL);
            define("exact->inexact", EXACT2INEXACT);
            define("exact?", EXACTQ);
            define("exp", EXP);
            define("find-last-unique-vector-element", VECTORFINDLASTUNIQUE);
            define("floor", FLOOR);
            define("getenv", GETENV);
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
            define("set-box!", SETBOX);
            define("set-car!", SETCAR);
            define("set-cdr!", SETCDR);
            define("_signal-hook!", SIGHOOK);
            define("_signal-unhook!", SIGUNHOOK);
            define("sin", SIN);
            define("sqrt", SQRT);
            define("sleep", SLEEP);
            define("string->symbol", STRING2SYMBOL);
            define("string->uninterned-symbol", STRING2UNINTERNEDSYMBOL);
            define("string-fill!", STRINGFILL);
            define("string-length", STRINGLENGTH);
            define("string-ref", STRINGREF);
            define("string-set!", STRINGSET);
            define("string?", STRINGQ);
            define("symbol->string", SYMBOL2STRING);
            define("symbol?", SYMBOLQ);
            define("syntactic-token?", SYNTOKENQ);
            define("syntactic-token->string", SYNTOKEN2STRING);
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
        }
    }
    
    public SimplePrimitives() {}
    
    public SimplePrimitives(int id) {
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

    public final Value apply() 
        throws ContinuationException {
        switch (id) {
        case ADD: return Quantity.ZERO;
        case DIV:
        case NEQ: 
        case LT: 
        case GRT:
        case SUB: throwArgSizeException(); return VOID;
            
        case COMPACTSTRINGREP: return truth(SchemeString.compactRepresentation);
        case MAXFLOATPRECISION: return Quantity.valueOf(maxFloatPrecision);
        case MINFLOATPRECISION: return Quantity.valueOf(minFloatPrecision);
        case MUL: return Quantity.ONE;
        case PERMITINTERRUPTS: return truth(permitInterrupts);
        case SYSTIME: return Quantity.valueOf(System.currentTimeMillis());
        case TIMEZONEOFFSET:
            Calendar cal = Calendar.getInstance();
            return Quantity.valueOf((cal.get(Calendar.ZONE_OFFSET) + cal.get(Calendar.DST_OFFSET)) / 1000); 
        case _VOID: return VOID;
        case LIST: return EMPTYLIST;
        case STRINGAPPEND:
            return new SchemeString("");
        default:
            throwArgSizeException();
            return VOID;
        }
    }

    public final Value apply(Value v1) 
        throws ContinuationException {      
        switch (id) {
        case NULLQ: return truth(v1==EMPTYLIST);
        case CAR: return truePair( v1).car;
        case CDR: return truePair( v1).cdr;
        case PAIRQ:
            return truth(v1 instanceof Pair &&
                         v1!=EMPTYLIST);
        case ADD: 
        case MUL: return num(v1);
        case SUB: return num(v1).negate();
        case DIV: return Quantity.ONE.div(num(v1));
        case LT: 
        case GRT:
        case NEQ: throwArgSizeException(); return VOID;
        case SIN: return num(v1).sin();
        case COS: return num(v1).cos();
        case TAN: return num(v1).tan();
        case ASIN: return num(v1).asin();
        case ACOS: return num(v1).acos();
        case ATAN: return num(v1).atan();
        case LOG: return num(v1).log();
        case EXP: return num(v1).exp();
        case SQRT: return num(v1).sqrt();
        case NUMBERQ: return truth(v1 instanceof Quantity);
        case VECTORQ: return truth(v1 instanceof SchemeVector);
        case SYMBOLQ: return truth(v1 instanceof Symbol);
        case SYNTOKENQ: return truth(v1 instanceof sisc.compiler.Syntax);
        case CHARACTERQ: return truth(v1 instanceof SchemeCharacter);
        case STRINGQ: return truth(v1 instanceof SchemeString);
        case BOOLEANQ: return truth(v1 instanceof SchemeBoolean);
        case VOIDQ: return truth(v1==VOID);
        case ENVIRONMENTQ: return truth(v1 instanceof SymbolicEnvironment);
        case PROCEDUREQ: return truth(v1 instanceof Procedure);
        case INTEGERQ: return numQuery(v1,Quantity.INTEGER);
            
        case COMPLEXQ: return numQuery(v1,Quantity.IMAGINARY);
        case EXACTQ: return numQuery(v1,Quantity.EXACT);
        case INEXACTQ: return numQuery(v1,Quantity.INEXACT);
        case PARAMETERQ: return truth(v1 instanceof Parameter);
        case SYMBOL2STRING:
            return new ImmutableString(symbol(v1).symval);
        case SYNTOKEN2STRING: 
            return new ImmutableString(((sisc.compiler.Syntax)v1).toString());

        case NUMBER2STRING: return new SchemeString(num(v1)
                                                    .toString());
        case STRING2SYMBOL: return Symbol.intern(string(v1));
        case CHAR2INTEGER: return Quantity.valueOf(chr(v1).c);
        case LIST2VECTOR: return new SchemeVector(Util.pairToValues(pair(v1)));
        case VECTOR2LIST:
            Value[] vals=vec(v1).vals;
            return valArrayToList(vals, 0, vals.length);
        case EXACT2INEXACT: return num(v1).toInexact();
        case INEXACT2EXACT: return num(v1).toExact();
        case FLOOR: return num(v1).floor();
        case CEILING: return num(v1).ceiling();
        case ROUND: return num(v1).round();
        case TRUNCATE: return num(v1).truncate();
        case INTEGER2CHAR: return new SchemeCharacter((char)num(v1).
                                                      indexValue());
        case VECTORFINDLASTUNIQUE: return Quantity.valueOf(vec(v1).findEnd());
        case BOX: return new Box(v1);
        case UNBOX: return (Value)box(v1).val;
        case BOXQ: return truth(v1 instanceof Box);
        case LENGTH:
            return Quantity.valueOf(length(pair(v1)));
        case STRINGLENGTH:
            return Quantity.valueOf(str(v1).length());
        case VECTORLENGTH:
            return Quantity.valueOf(vec(v1).vals.length);
        case CIRCULARQ:
            return truth(new CircularityDetector().isCircular(v1));
        case MAKEPARAM:
            return new SchemeParameter(v1);
        case MAKENATIVEPARAM:
            return new NativeParameter(string(v1));
        case MAKESTRING:
            return new SchemeString(new char[num(v1).indexValue()]);
        case MAKEVECTOR:
            return new SchemeVector(num(v1).indexValue());
        case NUMERATOR: return num(v1).numerator();
        case DENOMINATOR: return num(v1).denominator();
        case REALPART: return num(v1).realpart();
        case IMAGPART: return num(v1).imagpart();
        case STRING2UNINTERNEDSYMBOL:
            return Symbol.getUnique(string(v1));
        case NULLENVIRONMENT:
            switch (num(v1).indexValue()) {
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
        case NLNAME:
            return Symbol.get(nlib(v1).getLibraryName());
        case NLVERSION:
            return Quantity.valueOf(nlib(v1).getLibraryVersion());
        case SLEEP:
            try {
                Thread.sleep(num(v1).longValue());
            } catch (InterruptedException ie) {}
            return VOID;
        case COMPACTSTRINGREP:
            SchemeString.compactRepresentation=truth(v1);
            return VOID;
        case STRINGAPPEND:
            return str(v1);
        case LIST: return new Pair(v1, EMPTYLIST);
        default:
            throwArgSizeException();
            return VOID;
        }
    }

    public final Value apply(Value v1, Value v2) 
        throws ContinuationException {      
        switch (id) {
        case EQ: return truth(v1 == v2);
        case EQV: return truth(v1.eqv(v2));
        case CONS:
            return new Pair(v1, v2);
        case EQUAL:
            return truth(v1.valueEqual(v2));
        case SETCAR:
            truePair(v1).setCar(v2);
            return VOID;
        case SETCDR:
            truePair(v1).setCdr(v2);
            return VOID;
        case ADD: return num(v1).add(num(v2));
        case MUL: return num(v1).mul(num(v2));
        case SUB: return num(v1).sub(num(v2));
        case DIV: return num(v1).div(num(v2));
        case NEQ: return truth(num(v1).comp(num(v2),0));
        case REMAINDER:
            return num(v1).remainder(num(v2));
        case QUOTIENT:
            return num(v1).quotient(num(v2));
        case LCM:
            return num(v1).lcm(num(v2));
        case GCD:
            return num(v1).gcd(num(v2));
        case ATAN:
            return num(v1).atan(num(v2));
        case SETBOX:
            try {
                box(v1).set(v2);
            } catch (ImmutableException e) {
                throwPrimException(liMessage(SISCB, "isimmutable", "box",
                                             v1.synopsis()));
            }
            return VOID;
        case STRINGREF:
            int index=num(v2).indexValue();
            try {
                return new SchemeCharacter(str(v1).charAt(index));
            } catch (ArrayIndexOutOfBoundsException e) {
                throwPrimException(liMessage(SISCB, "indexoob", 
                                             new Object[] {
                                                 new Integer(index),
                                                 v1.synopsis()}));
            }
        case VECTORREF:
            index=num(v2).indexValue();
            try {
                return vec(v1).vals[index];
            } catch (ArrayIndexOutOfBoundsException e) {
                throwPrimException(liMessage(SISCB, "indexoob", 
                                             new Object[] {
                                                 new Integer(index),
                                                 v1.synopsis()}));
            }
        case MAKEVECTOR:
            return new SchemeVector(num(v1).indexValue(),
                                    v2);
        case STRINGFILL:
            SchemeString st=str(v1);
            char c=character(v2);
            for (int i=0; i<st.length(); i++)
                st.set(i, c);
            return VOID;
        case MAKESTRING:
            char newStr[]=new char[num(v1).indexValue()];
            char fillchar=character(v2);
            for (int i=0; i<newStr.length; i++) {
                newStr[i]=fillchar;
            }
            return new SchemeString(newStr);
        case STRINGAPPEND:
            return str(v1).append(str(v2));
        case MAKERECTANGULAR:
            return Quantity.valueOf(num(v1),
                                    num(v2));
        case ASHL: return Quantity.valueOf(num(v1).integer()
                                           .shiftLeft(num(v2)
                                                      .indexValue()));
        case ASHR: return Quantity.valueOf(num(v1).integer()
                                           .shiftRight(num(v2)
                                                       .indexValue()));
        case MAKECONFIGPARAM:
            return new ConfigParameter(string(v1), v2);
        case LIST: return list(v1, v2);
        case LT:
            return truth(num(v1).comp(num(v2),-1));
        case GRT:
            return truth(num(v1).comp(num(v2),1));
        case SIGHOOK:
            SignalHook.addHandler(string(v1), proc(v2));
            return VOID;
        case SIGUNHOOK:
            SignalHook.removeHandler(string(v1), proc(v2));
            return VOID;
        default:
            throwArgSizeException();
            return VOID;
        }
    }

    public final Value apply(Value v1, Value v2, Value v3) 
        throws ContinuationException {      
        switch(id) {
        case STRINGSET:
            int index=num(v2).indexValue();
            try {
                str(v1).set(index, character(v3));
            } catch (ArrayIndexOutOfBoundsException e) {
                throwPrimException(liMessage(SISCB, "indexoob", 
                                             new Object[] {
                                                 new Integer(index),
                                                 v1.synopsis()}));
            }
            return VOID;
        case VECTORFILL:
            vec(v1).fill(v2);
            return VOID;
        case VECTORSET:
            index=num(v2).indexValue();
            try {
                vec(v1).set(index,v3);
            } catch (ArrayIndexOutOfBoundsException e) {
                throwPrimException(liMessage(SISCB, "indexoob", 
                                             new Object[] {
                                                 new Integer(index),
                                                 v1.synopsis()}));
            }
            return VOID;
        case LIST: return list(v1, v2, v3);
        case ADD: return num(v1).add(num(v2)).add(num(v3));
        case MUL: return num(v1).mul(num(v2)).mul(num(v3));
        case SUB: return num(v1).sub(num(v2)).sub(num(v3));
        case NEQ: 
            Quantity q2=num(v2);
            return truth(!num(v1).comp(q2,0) &&
                         !q2.comp(num(v3),0));
        case LT:
            q2=num(v2);
            return truth(num(v1).comp(q2,-1) &&
                         q2.comp(num(v3),-1));
        case GRT:
            q2=num(v2);
            return truth(num(v1).comp(q2,1) &&
                         q2.comp(num(v3),1));
        case DIV: 
            return num(v1).div(num(v2).mul(num(v3)));
        default:
            throwArgSizeException();
            return VOID;
        }
    }

    public final Value apply(Value v[]) throws ContinuationException {
        int vls=v.length;
        Quantity quantity=null;
        switch (id) {
        case LIST: return valArrayToList(v,0,vls);
        case ADD:
            int x=vls-1;
            quantity=num(v[x]);
            while (--x >= 0) 
                quantity=quantity.add(num(v[x]));
            return quantity;
        case MUL:
            x=vls-1;
            quantity=num(v[x]);
            while (--x >= 0) 
                quantity=quantity.mul(num(v[x]));
            return quantity;
        case SUB: 
            quantity=num(v[0]);
            for (int i=1; i<vls; i++) {
                quantity=quantity.sub(num(v[i]));
            }
            return quantity;
        case NEQ:
            quantity=num(v[0]);
            for (int i=vls-1; i>0; i--) {
                if (!quantity.comp(num(v[i]), 0)) return FALSE;
            }
            return TRUE;
        case LT:
            quantity=num(v[0]);
            for (int i=1; i<vls; i++) {
                Quantity q=num(v[i]);
                if (!quantity.comp(q, -1)) return FALSE;
                quantity=q;
            }
            return TRUE;
        case GRT:
            quantity=num(v[0]);
            for (int i=1; i<vls; i++) {
                Quantity q=num(v[i]);
                if (!quantity.comp(q, 1)) return FALSE;
                quantity=q;
            }
            return TRUE;
        case DIV: 
            x=vls-1;
            quantity=num(v[x]);
            while (--x >= 1) 
                quantity=quantity.mul(num(v[x]));
            return num(v[0]).div(quantity);
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
