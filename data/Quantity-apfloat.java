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
package sisc.data;

import java.math.*;
import java.io.*;
import sisc.Serializer;

public class Quantity extends Value {
    public static int min_precision, max_precision;

    static {
        String x=System.getProperty("minprecision");
        String y=System.getProperty("maxprecision");
        min_precision=(x==null ? 16 : Integer.parseInt(x));
        max_precision=(y==null ? 32 : Integer.parseInt(y));
    }

    public static String reportLibraryType() {
        return "Quantity-lib: Arbitrary precision floating point";
    }

    public final static BigInteger
	_BI_NEGONE=BigInteger.valueOf(-1),
	_BI_ZERO = BigInteger.valueOf(0),
	_BI_ONE  = BigInteger.valueOf(1),
	_BI_TEN  = BigInteger.valueOf(10),
	_INT_MAX = BigInteger.valueOf(Integer.MAX_VALUE),
	_INT_MIN = BigInteger.valueOf(Integer.MIN_VALUE);

    public final static BigDecimal
	_BD_NEGONE = BigDecimal.valueOf(-1),
	_BD_ZERO   = BigDecimal.valueOf(0),
	_BD_ONE    = BigDecimal.valueOf(1),
	_BD_TWO    = BigDecimal.valueOf(2),
	_BD_TEN    = BigDecimal.valueOf(10),
	_BD_HUNDRED= BigDecimal.valueOf(100);

    public final static Quantity
	ZERO = new Quantity(0),
	ONE  = new Quantity(1),
	TWO  = new Quantity(2),
	I    = new Quantity(_BD_ZERO, _BD_ONE),
	TWO_I= new Quantity(_BD_ZERO, _BD_TWO),
	HALF_PI = new Quantity(Math.PI/2);
    
    public static final int
	FIXED=1, EXACT=2, INEXACT=4, RATIONAL=8,
	IMAGINARY=16, INTEGER=32, DECIMAL=64;

    public static final int
	FIXEDINT = EXACT | FIXED | INTEGER | RATIONAL,
	INTEG = EXACT | INTEGER | RATIONAL,
	RATIO = EXACT | RATIONAL,
	COMPLEX  = INEXACT | IMAGINARY,
	DECIM = INEXACT | DECIMAL;

    public static Quantity valueOf(long val) { return new Quantity(val); }
    public static Quantity valueOf(BigDecimal val) { return new Quantity(val); }
    public static Quantity valueOf(BigInteger val) { return new Quantity(val); }
    public static Quantity valueOf(BigInteger num, BigInteger den) { 
	return new Quantity(num, den);
    }

    public static Quantity valueOf(Quantity real, Quantity imag) {
	return new Quantity(real.toInexact().decimalValue(),
			    imag.toInexact().decimalValue());
    }

    public static Quantity valueOf(String v) {
	return valueOf(v, 10);
    }

    public static Quantity valueOf(String v, int radix) {
	return new Quantity(v, radix);
    }

    public int type;
    public int val;
    public BigDecimal d, im;
    public BigInteger i, de;
    public transient String out_cache;
    public transient byte out_cache_radix;

    public Quantity() {}

    public Quantity (int l) {
        val=l;
        type=FIXEDINT;
    }

    public Quantity (short s) {
        this((int)s);
    }

    public Quantity (float l) {
        this((double)l);
    }

    public Quantity (double l) {
        d=new BigDecimal(Double.toString(l));
        type=DECIM;
    }

    public Quantity(long v) {
        i=BigInteger.valueOf(v);
        type=INTEG;
    }

    public Quantity(String v) throws NumberFormatException {
        this(v, 10);
    }

    public Quantity(BigDecimal d) {
        type=DECIM;
        this.d=d;
        simplify();
    }

    public Quantity(BigInteger i) {
        type=INTEG;
        this.i=i;
        simplify();
    }

    public Quantity (BigInteger numerator, BigInteger denominator) {
        i=numerator;
        de=denominator;
        type=RATIO;
        simplify();
    }




    public Quantity (BigDecimal real, BigDecimal imag) {
        d=real;
        im=imag;
        type=COMPLEX;
        simplify();
    }

    protected static boolean parsePounds(char[] c) {
        boolean rv=false;
        for (int i=c.length-1; i>=0; i--) {
            if (c[i]=='#') {
                rv=true;
                c[i]='0';
            }
            else break;
        }
        return rv;
    }

    protected static BigDecimal parseDecimal(String dv, int radix) {
        return parseDecimal(dv, radix, false);
    }

    protected static BigDecimal parseDecimal(String dv, int radix,
            boolean asDecimal) {
        if (radix==10) {
            int x;
            if ((x=dv.indexOf('e'))!=-1) {
                StringBuffer b=new StringBuffer();
                char[] c=dv.substring(0,x).toCharArray();
                parsePounds(c);
                b.append(c);
                b.append(dv.substring(x));
                dv=b.toString();
                Double.parseDouble(dv);
                return new BigDecimal(dv);
            } else if ((x=dv.indexOf('s'))!=-1 ||
                       (x=dv.indexOf('f'))!=-1 ||
                       (x=dv.indexOf('d'))!=-1 ||
                       (x=dv.indexOf('l'))!=-1) {
                StringBuffer b=new StringBuffer(dv.substring(0,x));
                b.append('e').append(dv.substring(x+1));
                dv=b.toString();
                Double.parseDouble(dv);
                return new BigDecimal(dv);
            } else if (dv.indexOf('.')!=-1)
                return new BigDecimal(dv);
            else if (dv.indexOf('#')!=-1) {
                char[] c=dv.toCharArray();
                parsePounds(c);
                return new BigDecimal(new String(c));
            } else if (asDecimal)
                return new BigDecimal(dv);
            else
                throw new NumberFormatException("not a decimal value");
        } else {
            int x;
            if ((x=dv.indexOf('.'))==-1)
                if (dv.indexOf('#')!=-1) {
                    char[] c=dv.toCharArray();
                    parsePounds(c);
                    return new BigDecimal(new String(c));
                } else if (asDecimal)
                    return new BigDecimal(dv);
                else
                    throw new NumberFormatException("not a decimal value");
            else {
                BigDecimal ipart;
                BigInteger fpart;
                ipart=new BigDecimal(new BigInteger(dv.substring(0, x),
                                                    radix));
                String fpartstr=dv.substring(x+1);
                fpart=new BigInteger(fpartstr, radix);
                return ipart
                       .add(div(new BigDecimal(fpart),
                                new BigDecimal(Math.pow(radix, fpartstr.length()))));
            }
        }
    }

    public Quantity(String v, int radix) throws NumberFormatException {
        int x,y;
        if ((x=v.indexOf('/'))!=-1) {
            i=new BigInteger(v.substring(0, x), radix);
            de=new BigInteger(v.substring(x+1), radix);
            type=RATIO;
        } else if ((x=v.indexOf('@'))!=-1) {
            double xd=parseDecimal(v.substring(0,x), radix, true).doubleValue();
            double yd=parseDecimal(v.substring(x+1), radix, true).doubleValue();
            d=new BigDecimal(xd * Math.cos(yd));
            im=new BigDecimal(xd * Math.sin(yd));
            type=COMPLEX;
        } else if ((x=v.indexOf('i'))!=-1) {
            if (x!=v.length()-1)
                throw new NumberFormatException("Invalid complex number format");
            x=v.lastIndexOf('+');
            if (x==-1) {
                x=v.lastIndexOf('-');
                if (x==-1) throw new NumberFormatException("invalid complex number format");
                if (x==0)
                    d=_BD_ZERO;
                else
                    d=parseDecimal(v.substring(0,x), radix, true);
                im = ( (x+2)==v.length() ?
                       _BD_NEGONE :
                       parseDecimal(v.substring(x, v.length()-1), radix, true));
            } else {
                if (x==0)
                    d=_BD_ZERO;
                else
                    d=parseDecimal(v.substring(0,x), radix, true);
                im = ( (x+2)==v.length() ?
                       _BD_ONE :
                       parseDecimal(v.substring(x+1, v.length()-1), radix, true));
            }
            type=COMPLEX;
        } else {
            try {
                d=parseDecimal(v, radix);
                type=DECIM;
            } catch (NumberFormatException n) {
                try {
                    val=Integer.parseInt(v, radix);
                    type=FIXEDINT;
                } catch (NumberFormatException e) {
                    i=new BigInteger(v, radix);
                    type=INTEG;
                }
            }
        }
        simplify();
    }

    protected void simplify() {
        if (type==RATIO) {
            if (de.equals(_BI_ZERO))
                throw new ArithmeticException("divide by zero");
            BigInteger gcd=i.gcd(de);
            if (!gcd.equals(_BI_ONE)) {
                i=i.divide(gcd);
                de=de.divide(gcd);
            }
            if (de.signum()==-1) {
                i=i.negate();
                de=de.negate();
            }
            if (de.equals(_BI_ONE)) {
                de=null;
                type=INTEG;
            }
        } else if (type==COMPLEX) {
            if (d.scale()>max_precision) {
                d=d.setScale(max_precision, BigDecimal.ROUND_HALF_EVEN);
            }
            if (im.compareTo(_BD_ZERO)==0) {
                im=null;
                type=DECIM;
            }
            if (im!=null && im.scale()>max_precision) {
                im=im.setScale(max_precision, BigDecimal.ROUND_HALF_EVEN);
            }
        } else if (type==DECIM) {
            if (d.scale()>max_precision) {
                d=d.setScale(max_precision, BigDecimal.ROUND_HALF_EVEN);
            }
        }
        if (type==INTEG) {
            if (i.compareTo(_INT_MAX)==-1 &&
                    i.compareTo(_INT_MIN)==1) {
                val=i.intValue();
                type=FIXEDINT;
            }
        }
    }

    public Quantity lsh(int num) throws NumberFormatException {
        switch (type) {
        case FIXEDINT: return new Quantity((long)val).lsh(num);
        case INTEG: return new Quantity(i.shiftLeft(num));
        default:
            throw new NumberFormatException("Can only shift integer types");
        }
    }

    public Quantity rsh(int num) throws NumberFormatException {
        switch (type) {
        case FIXEDINT: return new Quantity((long)val).rsh(num);
        case INTEG: return new Quantity(i.shiftRight(num));
        default:
            throw new NumberFormatException("Can only shift integer types");
        }
    }

    public Quantity floor() {
        return round(BigDecimal.ROUND_FLOOR);
    }

    public Quantity ceiling() {
        return round(BigDecimal.ROUND_CEILING);
    }

    public Quantity truncate() {
        return round(BigDecimal.ROUND_DOWN);
    }

    public Quantity round() {
        return round(BigDecimal.ROUND_HALF_EVEN);
    }

    public Quantity gcd(Quantity o) {
        switch (type) {
        case FIXEDINT:
            return o.gcd(new Quantity((long)val));
        case DECIM:
            BigInteger o2=d.toBigInteger();
            if (new BigDecimal(o2).compareTo(d)==0)
                return new Quantity(o2).gcd(o);
        case INTEG:
            if (o.type==FIXEDINT)
                o=new Quantity((long)o.val);
            if (o.type==INTEG)
                return new Quantity(i.gcd(o.i));
            if (o.type==DECIM) {
                o2=o.d.toBigInteger();
                if (new BigDecimal(o2).compareTo(o.d)==0)
                    return new Quantity(i.gcd(o2)).toInexact();
            }
        }
        throw new ArithmeticException(this+" is not an integer.");
    }

    public Quantity lcm(Quantity o) {
        switch (type) {
        case FIXEDINT:
            return o.lcm(new Quantity((long)val));
        case DECIM:
            BigInteger o2=d.toBigInteger();
            if (new BigDecimal(o2).compareTo(d)==0)
                return new Quantity(o2).lcm(o).toInexact();
        case INTEG:
            o2=null;
            boolean inexact=false;
            if (o.type==FIXEDINT)
                o2=BigInteger.valueOf((long)o.val);
            if (o.type==INTEG)
                o2=o.i;
            if (o.type==DECIM) {
                o2=o.d.toBigInteger();
                if (new BigDecimal(o2).compareTo(o.d)!=0)
                    inexact=true;
            }
            BigInteger L=o2.abs(), g=_BI_ONE;
            BigInteger n=i.abs();
            g = n.gcd(L);
            L = ( g.compareTo(_BI_ZERO) == 0 ?
                  g : n.divide(g).multiply(L) );
            return (inexact? new Quantity(L).toInexact():
                    new Quantity(L));
        }
        throw new ArithmeticException(this+" is not an integer.");
    }

    public Quantity round(int rtype) {
        switch (type) {
        case DECIM:
            return new Quantity(d.setScale(0, rtype));
        case COMPLEX:
            throw new ArithmeticException(this+" is not a real number");
        case RATIO:
            return toInexact().round(rtype).toExact();
        default:
            return this;
        }
    }

    public Quantity modulo(Quantity o) {
        switch (type) {
        case FIXEDINT:
            if (o.type==FIXEDINT)
                return new Quantity(val%o.val);
            else return new Quantity((long)val).modulo(o);
        case INTEG:
            if (o.type==FIXEDINT)
                o=new Quantity((long)o.val);
            if (o.type==INTEG)
                return new Quantity(i.mod(o.i));
            if (o.type==DECIM) {
                BigInteger o2=o.d.toBigInteger();
                if (new BigDecimal(o2).compareTo(o.d)==0)
                    return new Quantity(i.mod(o2)).toInexact();
            }
        case DECIM:
            BigInteger o2=d.toBigInteger();
            if (new BigDecimal(o2).compareTo(d)==0)
                return new Quantity(o2).modulo(o).toInexact();
        default:
            throw new NumberFormatException("expected integral quantities");
        }
    }

    public Quantity quotient(Quantity o) {
        switch (type) {
        case FIXEDINT:
            if (o.type==FIXEDINT)
                return new Quantity(val/o.val);
            else return new Quantity((long)val).quotient(o);
        case INTEG:
            if (o.type==FIXEDINT)
                o=new Quantity((long)o.val);
            if (o.type==INTEG)
                return new Quantity(i.divide(o.i));
            if (o.type==DECIM) {
                BigInteger o2=o.d.toBigInteger();
                if (new BigDecimal(o2).compareTo(o.d)==0)
                    return new Quantity(i.divide(o2)).toInexact();
            }
        case DECIM:
            BigInteger o2=d.toBigInteger();
            if (new BigDecimal(o2).compareTo(d)==0)
                return new Quantity(o2).quotient(o).toInexact();
        default:
            throw new NumberFormatException("expected integral quantities");
        }
    }

    public Quantity remainder(Quantity o) {
        switch (type) {
        case FIXEDINT:
            return new Quantity((long)val).remainder(o);
        case INTEG:
            if (o.type==FIXEDINT)
                o=new Quantity((long)o.val);
            if (o.type==INTEG)
                return new Quantity(i.remainder(o.i));
            if (o.type==DECIM) {
                BigInteger o2=o.d.toBigInteger();
                if (new BigDecimal(o2).compareTo(o.d)==0)
                    return new Quantity(i.remainder(o2)).toInexact();
            }
        case DECIM:
            BigInteger o2=d.toBigInteger();
            if (new BigDecimal(o2).compareTo(d)==0)
                return new Quantity(o2).remainder(o).toInexact();
        default:
            throw new NumberFormatException("expected integral quantities");
        }
    }

    public static final double sinh(double x) {
        return (Math.exp(x)-Math.exp(-x))/2;
    }

    public static final double cosh(double x) {
        return (Math.exp(x)+Math.exp(-x))/2;
    }

    public Quantity sin() {
        if (type==COMPLEX) {
            //  sin(x+iy) = sin(x)cosh(y) + i*cos(x)sinh(y)
            Quantity z=mul(I);
            z=z.exp().sub(z.negate().exp());
            return z.div(TWO_I);
        } else
            return new Quantity(Math.sin(doubleValue()));
    }

    public Quantity cos() {
        if (type==COMPLEX) {
            Quantity z=mul(I);
            z=z.exp().add(z.negate().exp());
            return z.div(TWO);
        } else
            return new Quantity(Math.cos(doubleValue()));
    }

    public Quantity tan() {
        if (type==COMPLEX) {
            Quantity z=mul(I);
            Quantity p=z.exp();
            Quantity n=z.negate().exp();
            return p.sub(n).div(I.mul(p.add(n)));
        } else
            return new Quantity(Math.tan(doubleValue()));
    }

    public Quantity asin() {
        Quantity z=ONE.sub(mul(this)).sqrt();
        z=mul(I).add(z).log();
        return I.mul(z).negate();
    }

    public Quantity acos() {
        return HALF_PI.sub(asin());
    }

    public Quantity atan() {
        Quantity z=mul(I);
        z=ONE.add(z).log().sub(ONE.sub(z).log());
        return z.div(TWO_I);
    }

    public Quantity atan(Quantity other) {
        if (type==COMPLEX)
            throw new ArithmeticException(this+" is not a real number");
        if (other.type==COMPLEX)
            throw new ArithmeticException(other+" is not a real number");
        return new Quantity(Math.atan2(doubleValue(), other.doubleValue()));
    }

    public Quantity exp() {
        if (type==COMPLEX) {
            //e^(x+I*y) = e^x (Cos[y]+I*Sin[y])
            //          = e^x*Cos[y] + I*e^x*Sin[y]
            double etox=Math.exp(d.doubleValue());
            double y=im.doubleValue();
            return new Quantity(new BigDecimal(etox*Math.cos(y)),
                                new BigDecimal(etox*Math.sin(y)));
        } else
            return new Quantity(Math.exp(doubleValue()));
    }

    public Quantity log() {
        if (type==COMPLEX) {
            // Arg[w] = ArcTan(b/a)
            // |w| = sqrt(a^2 + b^2)
            // Log[w] = Log[|w|]+I*(Arg[w]+2*Pi*k), for any integer k.
            // select k=0 for principal value, giving:
            // Log[w] = Log[|w|]+I*Arg[w]
            //        = Log[sqrt(a^2 + b^2)] + I * ArcTan(b/a)
            BigDecimal a2=d.multiply(d);
            BigDecimal b2=im.multiply(im);
            double arctan=Math.atan2(im.doubleValue(),d.doubleValue());
            BigDecimal x=new BigDecimal(Math.log(Math.sqrt(a2.add(b2).doubleValue())));
            BigDecimal y=new BigDecimal(arctan);
            return new Quantity(x,y);
        } else
            return new Quantity(Math.log(doubleValue()));
    }

    public Quantity negate() {
        switch(type) {
        case FIXEDINT:
            return new Quantity(val*-1);
        case INTEG:
            return new Quantity(i.negate());
        case DECIM:

            return new Quantity(d.negate());
        case RATIO:
            return new Quantity(i.negate(), de.negate());
        case COMPLEX:
            return new Quantity(d.negate(), im.negate());
        }
        return null;
    }

    public Quantity sqrt() {
        switch (type) {
        case FIXEDINT:
            if (val<0)
                return new Quantity(_BD_ZERO,
                                    new BigDecimal(Math.sqrt(-val)));
            break;
        case INTEGER:
            if (i.compareTo(_BI_ZERO)==-1)
                return new Quantity(_BD_ZERO,
                                    new BigDecimal(Math
                                                   .sqrt(-1*doubleValue())));
            break;
        case COMPLEX:
            // Take r=sqrt(a^2 + b^2)
            BigDecimal a2=d.multiply(d);
            BigDecimal b2=im.multiply(im);
            BigDecimal r=new BigDecimal(Math.sqrt(a2.add(b2).doubleValue()));

            // The two square roots of a+bi are (x +yi) and -(x +yi) with
            //           y = sqrt((r - a)/2) and x = b/(2.y)
            BigDecimal y=
                new BigDecimal(Math.sqrt(div(r.subtract(d),
                                             _BD_TWO).doubleValue()));
            BigDecimal x=div(im,_BD_TWO.multiply(y));
            if (x.signum()==-1) {
                return new Quantity(x,y).negate();
            } else
                return new Quantity(x, y);
        }
        return new Quantity(Math.sqrt(doubleValue()));
    }

    public Quantity add(Quantity o) {
        switch (type) {
        case FIXEDINT:
            if (o.type!=FIXEDINT)
                return new Quantity((long)val).add(o);
            else return intBound((long)o.val+val);
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d.add(BigDecimal.valueOf(o.val)));
            case DECIM:
                return new Quantity(d.add(o.d));
            case INTEG:
                return new Quantity(d.add(new BigDecimal(o.i)));
            case RATIO:
                return new Quantity(ratioToDecimal(o.i, o.de).add(d));
            case COMPLEX:
                return o.add(this);
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i.add(BigInteger.valueOf(o.val)));
            case DECIM:
                return new Quantity(new BigDecimal(i).add(o.d));
            case INTEG:
                return new Quantity(i.add(o.i));
            case RATIO:
                BigInteger ores=i.multiply(o.de);
                BigInteger new_n=ores.add(o.i);
                return new Quantity(new_n, o.de);
            case COMPLEX:
                return o.add(this);
            }
        case RATIO:
            switch (o.type) {
            case FIXEDINT:
                BigInteger ores=de.multiply(BigInteger.valueOf(o.val));
                return new Quantity(i.add(ores), de);
            case DECIM:
                return new Quantity(ratioToDecimal(i, de).add(o.d));
            case INTEG:
                ores=o.i.multiply(de);
                return new Quantity(i.add(ores), de);
            case RATIO:
                BigInteger common_n1=i.multiply(o.de);
                BigInteger common_n2=o.i.multiply(de);
                BigInteger common_d=de.multiply(o.de);
                BigInteger res_n=common_n1.add(common_n2);
                return new Quantity(res_n, common_d);
            case COMPLEX:
                return o.add(this);
            }
        case COMPLEX:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d.add(BigDecimal.valueOf(o.val)), im);
            case DECIM:
                return new Quantity(d.add(o.d), im);
            case INTEG:
                return new Quantity(d.add(new BigDecimal(o.i)), im);
            case RATIO:
                return new Quantity(d.add(ratioToDecimal(o.i, o.de)), im);
            case COMPLEX:
                return new Quantity(d.add(o.d), im.add(o.im));
            }
        }
        return null;
    }

    public Quantity mul(Quantity o) {
        switch (type) {
        case FIXEDINT:
            if (o.type!=FIXEDINT) {
                return o.mul(new Quantity((long)val));
            } else return intBound((long)o.val*val);
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d.multiply(BigDecimal.valueOf(o.val)));
            case DECIM:
                return new Quantity(d.multiply(o.d));
            case INTEG:
                return new Quantity(d.multiply(new BigDecimal(o.i)));
            case RATIO:
                return new Quantity(ratioToDecimal(o.i,o.de).multiply(d));
            case COMPLEX:
                return o.mul(this);
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i.multiply(BigInteger.valueOf(o.val)));
            case DECIM:
                return new Quantity(new BigDecimal(i).multiply(o.d));
            case INTEG:
                return new Quantity(i.multiply(o.i));
            case RATIO:
                BigInteger new_n=i.multiply(o.i);
                return new Quantity(new_n, o.de);
            case COMPLEX:
                return o.mul(this);
            }
        case RATIO:
            switch (o.type) {
            case FIXEDINT:
                BigInteger new_n=i.multiply(BigInteger.valueOf(o.val));
                return new Quantity(new_n, de);
            case DECIM:
                return new Quantity(ratioToDecimal(i, de).multiply(o.d));
            case INTEG:
                new_n=i.multiply(o.i);
                return new Quantity(new_n, de);
            case RATIO:
                return new Quantity(i.multiply(o.i), de.multiply(o.de));
            case COMPLEX:
                return o.mul(this);
            }
        case COMPLEX:
            BigDecimal g=null, h=_BD_ZERO;
            switch (o.type) {
            case FIXEDINT:
                g=BigDecimal.valueOf(o.val);
                break;
            case COMPLEX:
                g=o.d;
                h=o.im;
                break;
            case DECIM:
                g=o.d;
                break;
            case INTEG:
                g=new BigDecimal(o.i);
                break;
            case RATIO:
                g=ratioToDecimal(o.i, o.de);
                break;
            }
            BigDecimal nd=d.multiply(g).subtract(im.multiply(h));
            BigDecimal nim=d.multiply(h).add(im.multiply(g));
            return new Quantity(nd, nim);
        }
        return null;
    }

    public Quantity sub(Quantity o) {
        switch (type) {
        case FIXEDINT:
            if (o.type!=FIXEDINT)
                return new Quantity((long)val).sub(o);
            else return intBound((long)val-o.val);
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d.subtract(BigDecimal.valueOf(o.val)));
            case DECIM:
                return new Quantity(d.subtract(o.d));
            case INTEG:
                return new Quantity(d.subtract(new BigDecimal(o.i)));
            case RATIO:
                return new Quantity(d.subtract(ratioToDecimal(o.i, o.de)));
            case COMPLEX:
                return new Quantity(d.subtract(o.d), o.im.negate());
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i.subtract(BigInteger.valueOf(o.val)));
            case DECIM:
                return new Quantity(new BigDecimal(i).subtract(o.d));
            case INTEG:
                return new Quantity(i.subtract(o.i));
            case RATIO:
                BigInteger ores=i.multiply(o.de);
                BigInteger new_n=ores.subtract(o.i);
                return new Quantity(new_n, o.de);
            case COMPLEX:
                return new Quantity(new BigDecimal(i).subtract(o.d),
                                    o.im.negate());
            }
        case RATIO:
            switch (o.type) {
            case FIXEDINT:
                BigInteger ores=BigInteger.valueOf(o.val).multiply(de);
                BigInteger new_n=i.subtract(ores);
                return new Quantity(new_n, de);
            case DECIM:
                return new Quantity(ratioToDecimal(i, de).subtract(o.d));
            case INTEG:
                ores=o.i.multiply(de);
                new_n=i.subtract(ores);
                return new Quantity(new_n, de);
            case RATIO:
                BigInteger common_n1=i.multiply(o.de);
                BigInteger common_n2=o.i.multiply(de);
                BigInteger common_d=de.multiply(o.de);
                BigInteger res_n=common_n1.subtract(common_n2);
                return new Quantity(res_n, common_d);
            case COMPLEX:
                return new Quantity(ratioToDecimal(i, de).subtract(o.d),
                                    o.im.negate());
            }
        case COMPLEX:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d.subtract(BigDecimal.valueOf(o.val)),
                                    im);
            case DECIM:
                return new Quantity(d.subtract(o.d), im);
            case INTEG:
                return new Quantity(d.subtract(new BigDecimal(o.i)),
                                    im);
            case RATIO:
                return new Quantity(d.subtract(ratioToDecimal(o.i, o.de)),
                                    im);
            case COMPLEX:
                return new Quantity(d.subtract(o.d), im.subtract(o.im));
            }

        }
        return null;
    }

    protected static BigDecimal div(BigDecimal d1, BigDecimal d2) {
        return d1.divide(d2, scale(d1.scale(), d2.scale()),
                         BigDecimal.ROUND_HALF_UP);
    }

    public Quantity div(Quantity o) {
        switch (type) {
        case FIXEDINT:
            return new Quantity((long)val).div(o);
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(div(d, BigDecimal.valueOf(o.val)));
            case DECIM:
                return new Quantity(div(d, o.d));
            case INTEG:
                return new Quantity(div(d, new BigDecimal(o.i)));
            case RATIO:
                return mul(new Quantity(o.de, o.i));
            case COMPLEX:
                Quantity q=new Quantity();
                q.d=d;
                q.im=_BD_ZERO;
                q.type=COMPLEX;
                return q.div(o);
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i, BigInteger.valueOf(o.val));
            case DECIM:
                return new Quantity(div(new BigDecimal(i), o.d));
            case INTEG:
                return new Quantity(i, o.i);
            case RATIO:
                BigInteger ores=o.de.multiply(i);
                return new Quantity(ores, o.i);
            case COMPLEX:
                Quantity q=new Quantity();
                q.d=new BigDecimal(i);
                q.im=_BD_ZERO;
                q.type=COMPLEX;
                return q.div(o);
            }
        case RATIO:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i, de.multiply(BigInteger.valueOf(o.val)));
            case DECIM:
                BigDecimal r=ratioToDecimal(i,de);
                return new Quantity(div(r, o.d));
            case INTEG:
                BigInteger ores=de.multiply(o.i);
                return new Quantity(i, ores);
            case RATIO:
                BigInteger common_n1=i.multiply(o.de);
                BigInteger common_n2=o.i.multiply(de);
                return new Quantity(common_n1, common_n2);
            case COMPLEX:
                r=ratioToDecimal(i,de);
                return new Quantity(div(r, o.d), o.im);
            }
        case COMPLEX:
            BigDecimal g=null, h=_BD_ZERO;
            switch (o.type) {
            case FIXEDINT:
                BigDecimal oval=BigDecimal.valueOf(o.val);
                return new Quantity(div(d,oval), div(im,oval));
            case DECIM:
                return new Quantity(div(d,o.d), div(im,o.d));
            case INTEG:
                oval=new BigDecimal(o.i);
                return new Quantity(div(d,oval), div(im,oval));
            case RATIO:
                oval=ratioToDecimal(o.i, o.de);
                return new Quantity(div(d,oval), div(im,oval));
            case COMPLEX:
                g=o.d;
                h=o.im;
            }

            // (a+ib)/(c+id)=(ac+bd+i(bc-ad))/(c^2+d^2)

            BigDecimal c2=g.multiply(g);
            BigDecimal d2=h.multiply(h);
            Quantity c2_p_d2 = new Quantity(c2.add(d2));
            BigDecimal bd=im.multiply(h);
            BigDecimal ac=d.multiply(g);
            BigDecimal bc=im.multiply(g);
            BigDecimal ad=d.multiply(h);

            Quantity rc1=new Quantity(ac.add(bd));
            Quantity rc2=new Quantity(bc.subtract(ad));
            return rc1.add(I.mul(rc2)).div(c2_p_d2);
        }
        return null;
    }

    public boolean comp(Quantity o, int test) {
        switch (type) {
        case FIXEDINT:
            if (o.type!=FIXEDINT)
                return new Quantity((long)val).comp(o,test);
            else return test==(val>o.val ? 1 : (val < o.val ? -1 : 0));
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return d.compareTo(BigDecimal.valueOf(o.val))==test;
            case DECIM:
                return d.compareTo(o.d)==test;
            case INTEG:
                return d.compareTo(new BigDecimal(o.i))==test;
            case RATIO:
                return d.compareTo(ratioToDecimal(o.i, o.de))==test;
            case COMPLEX:
                if (test==0)
                    return o.im.compareTo(_BD_ZERO)==0 &&
                           o.d.compareTo(d)==0;
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return i.compareTo(BigInteger.valueOf(o.val))==test;
            case DECIM:
                return new BigDecimal(i).compareTo(o.d)==test;
            case INTEG:
                return i.compareTo(o.i)==test;
            case RATIO:
                BigInteger cnum=i.multiply(o.de);
                return cnum.compareTo(o.i)==test;
            case COMPLEX:
                if (test==0)
                    return o.im.compareTo(_BD_ZERO)==0 &&
                           comp(new Quantity(o.d), 0);
            }
            break;
        case RATIO:
            switch (o.type) {
            case FIXEDINT:
                BigInteger cnum=BigInteger.valueOf(o.val).multiply(de);
                return i.compareTo(cnum)==test;
            case DECIM:
                return ratioToDecimal(i, de).compareTo(o.d)==test;
            case INTEG:
                cnum=o.i.multiply(de);
                return i.compareTo(cnum)==test;
            case RATIO:
                BigInteger common_n1=i.multiply(o.de);
                BigInteger common_n2=o.i.multiply(de);
                return common_n1.compareTo(common_n2)==test;
            case COMPLEX:
                if (test==0)
                    return o.im.compareTo(_BD_ZERO)==0 &&
                           comp(new Quantity(o.d), 0);
            }
            break;
        case COMPLEX:
            if (o.type==COMPLEX) {
                int x=0;
                if ((x=d.compareTo(o.d))==0)
                    return im.compareTo(o.im)==test;
                else return x==test;
            } else {
                return o.comp(this, test);}
        }
        throw new NumberFormatException("cannot compare complex numbers for order");
    }

    public final boolean is(int mask) {
	return (type & mask) != 0;
    }

    public boolean greater(Quantity o) {
        return comp(o, 1);
    }

    public boolean less(Quantity o) {
        return comp(o, -1);
    }

    public boolean eq(Object v) {
        return v instanceof Quantity &&
               ((Quantity)v).type==type &&
               valueEqual((Value)v);
    }

    public boolean valueEqual(Value v) {
        return equals(v);
    }

    public boolean equals(Object ob) {
        if (!(ob instanceof Quantity)) return false;
        return comp((Quantity)ob, 0);
    }

    public double doubleValue() {
        switch (type) {
        case FIXEDINT:
            return (double)val;
        case DECIM:
            return d.doubleValue();
        case INTEG:
            return (double)i.intValue();
        case RATIO:
            return ratioToDecimal(i,de).doubleValue();
        }
        return 0.0;
    }

    public BigDecimal decimalValue() {
        switch (type) {
        case FIXEDINT:
            return new BigDecimal(val);
        case DECIM:
            return d;
        case INTEG:
            return new BigDecimal(i);
        case RATIO:
            return ratioToDecimal(i,de);
        }
        return new BigDecimal(0.0);
    }

    public int intValue() {
        switch (type) {
        case FIXEDINT:
            return val;
        case DECIM:
            return d.intValue();
        case INTEG:
            return i.intValue();
        case RATIO:
            return i.divide(de).intValue();
        }
        return 0;
    }

    public BigInteger integerVal() {
        switch (type) {
        case FIXEDINT:
            return BigInteger.valueOf(val);
        case DECIM:
            return d.toBigInteger();
        case INTEG:
            return i;
        case RATIO:
            return i.divide(de);
        }
        return null;
    }

    public Quantity toExact() {
        switch (type) {
        case DECIM:
            BigInteger ipart=d.toBigInteger();
            BigDecimal fpart=d.subtract(new BigDecimal(ipart));
            int scale=fpart.scale();
            fpart=fpart.movePointRight(scale);
            BigInteger denominator=_BI_TEN.pow(scale);
            BigInteger numerator=ipart.multiply(denominator).add(fpart.toBigInteger());;
            return new Quantity(numerator, denominator);
        case COMPLEX:
            return new Quantity(d.setScale(0, BigDecimal.ROUND_HALF_EVEN),
                                im.setScale(0, BigDecimal.ROUND_HALF_EVEN));
        default:
            return this;
        }
    }


    public Quantity toInexact() {
        switch (type) {
        case FIXEDINT:
            return new Quantity((double)val);
        case INTEG:
            return new Quantity(new BigDecimal(i.multiply(BigInteger.valueOf(10)), 1));
        case RATIO:
            return new Quantity(ratioToDecimal(i, de));
        default:
            return this;
        }
    }

    public Quantity realpart() {
        if (type==COMPLEX)
            return new Quantity(d);
        else return this;
    }

    public Quantity imagpart() {
        if (type==COMPLEX)
            return new Quantity(im);
        else return ZERO;
    }

    public Quantity numerator() throws NumberFormatException {
        switch (type) {
        case COMPLEX:
            throw new NumberFormatException(toString()+" is not a rational number");
        case DECIM:
            return toExact().numerator();
        case RATIO:
            return new Quantity(i);
        default:
            return this;
        }
    }

    public Quantity denominator() throws NumberFormatException {
        switch (type) {
        case COMPLEX:
            throw new NumberFormatException(toString()+" is not a rational number");
        case DECIM:
            return toExact().denominator();
        case RATIO:
            return new Quantity(de);
        default:
            return ONE;
        }
    }

    protected BigDecimal ratioToDecimal(BigInteger numerator,
                                        BigInteger denominator) {
        int precision=numerator.bitLength()+denominator.bitLength();
        BigDecimal d1=new BigDecimal(numerator);
        BigDecimal d2=new BigDecimal(denominator);
        return div(d1, d2);
    }

    protected static int scale(int scale1, int scale2) {
        return Math.min(Math.max(min_precision, Math.max(scale1, scale2)),
                        max_precision);
    }

    protected Quantity intBound(long v) {
        if (v>Integer.MAX_VALUE ||
                v<Integer.MIN_VALUE)
            return new Quantity(v);
        else
            return new Quantity((int)v);
    }

    public String display() {
        return write();
    }

    public String write() {
        return toString();
    }

    public String toString() {
        return toString(10);
    }

    protected static String zeroTrim(String s) {
        int y=s.indexOf('.');
        char c;
        if (y!=-1) {
            for (int x=s.length()-1; x>1; x--)
                if ((c=s.charAt(x))!='0')
                    return (c=='.' ? s.substring(0,x+2) : s.substring(0,x+1));
            return (s.length()>2 ? s.substring(0,3) : s);
        }
        return s;
    }

    public String toString(int radix) {
        if (out_cache!=null && out_cache_radix==radix) return out_cache;
        StringBuffer b=new StringBuffer();
        if (type==FIXEDINT)
            b.append(Integer.toString(val,radix));
        else if (type==DECIM) {
            String s=zeroTrim(d.toString());
            b.append(s);
            if (s.indexOf('.')==-1) b.append(".0");
        } else if (type==INTEG)
            b.append(i.toString(radix));
        else if (type==RATIO)
            b.append(i.toString(radix)).append('/').append(de.toString(radix));
        else if (type==COMPLEX) {
            b.append(zeroTrim(d.toString()));
            if (im.compareTo(_BD_ZERO)>=0) {
                b.append('+');
                if (im.compareTo(_BD_ONE)!=0)
                    b.append(im.toString());
            } else {
                if (im.compareTo(_BD_NEGONE)==0)
                    b.append('-');
                else
                    b.append(zeroTrim(im.toString()));
            }
            b.append('i');
        }
        out_cache_radix=(byte)radix;
        return out_cache=b.toString();
    }

    public Object javaValue() {
        switch(type) {
        case FIXEDINT:
            return new Integer(intValue());
        case INTEG:
            return i;
    case DECIM: case RATIO:
            return new Double(doubleValue());
        case COMPLEX:
            return this;
        }
        return null;
    }

    public void deserialize(Serializer s,
                            DataInputStream dis) throws IOException {
        if (SERIALIZATION) {
            type=s.readBer(dis);
            switch (type) {
            case FIXEDINT:
                val=s.readBer(dis);
                break;
            case INTEG:
                byte[] buffer=new byte[s.readBer(dis)];
                dis.readFully(buffer);
                i=new BigInteger(buffer);
                break;
            case DECIM:
                buffer=new byte[s.readBer(dis)];
                int scale=s.readBer(dis);
                dis.readFully(buffer);

                d=new BigDecimal(new BigInteger(buffer), scale);
                break;
            case RATIO:
                buffer=new byte[s.readBer(dis)];
                dis.readFully(buffer);
                i=new BigInteger(buffer);
                buffer=new byte[s.readBer(dis)];
                dis.readFully(buffer);
                de=new BigInteger(buffer);
                break;
            case COMPLEX:
                buffer=new byte[s.readBer(dis)];
                dis.readFully(buffer);
                scale=s.readBer(dis);
                d=new BigDecimal(new BigInteger(buffer), scale);
                buffer=new byte[s.readBer(dis)];
                dis.readFully(buffer);
                scale=s.readBer(dis);
                im=new BigDecimal(new BigInteger(buffer), scale);
                break;
            }
            simplify();
        }
    }

    protected BigInteger unscaledValue(BigDecimal d) {
        return d.setScale(0, BigDecimal.ROUND_HALF_EVEN).toBigInteger();
    }

    public void serialize(Serializer s, DataOutputStream dos) throws IOException {
        if (SERIALIZATION) {
            s.writeBer(type, dos);
            switch (type) {
            case FIXEDINT:
                s.writeBer(val, dos);
                break;
            case INTEG:
                byte[] buffer=i.toByteArray();
                s.writeBer(buffer.length, dos);
                dos.write(buffer);
                break;
            case DECIM:
                int scale=d.scale();
                buffer=unscaledValue(d).toByteArray();
                s.writeBer(buffer.length, dos);
                s.writeBer(scale, dos);
                dos.write(buffer);
                break;
            case RATIO:
                buffer=i.toByteArray();
                s.writeBer(buffer.length, dos);
                dos.write(buffer);
                buffer=de.toByteArray();
                s.writeBer(buffer.length, dos);
                dos.write(buffer);
                break;
            case COMPLEX:
                buffer=unscaledValue(d).toByteArray();
                scale=d.scale();
                s.writeBer(buffer.length, dos);
                s.writeBer(scale, dos);
                dos.write(buffer);

                buffer=unscaledValue(d).toByteArray();
                scale=im.scale();
                s.writeBer(buffer.length, dos);
                s.writeBer(scale, dos);
                dos.write(buffer);
                break;
            }
        }
    }
}



