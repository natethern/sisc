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
import sisc.Serializer;
import java.io.*;

public class Quantity extends Value {

    public static int min_precision, max_precision;

    static {
        String x=getSystemProperty("minprecision", null);
        String y=getSystemProperty("maxprecision", null);
        min_precision=(x==null ? 16 : Integer.parseInt(x));
        max_precision=(y==null ? 32 : Integer.parseInt(y));
    }

    public final static BigInteger
	_BI_NEGONE=BigInteger.valueOf(-1),
	_BI_ZERO = BigInteger.valueOf(0),
	_BI_ONE  = BigInteger.valueOf(1),
	_BI_TEN  = BigInteger.valueOf(10),
	_INT_MAX = BigInteger.valueOf(Integer.MAX_VALUE),
	_INT_MIN = BigInteger.valueOf(Integer.MIN_VALUE);

    public final static BigDecimal
	_BD_ZERO   = BigDecimal.valueOf(0);

    public static final Quantity 
	ZERO = Quantity.valueOf(0),
	ONE  = Quantity.valueOf(1),
	TWO  = Quantity.valueOf(2),
	I    = Quantity.valueOf(0.0, 1.0),
	TWO_I= Quantity.valueOf(0.0, 2.0),
	HALF_PI = Quantity.valueOf(Math.PI/2);

    public static final int
	FIXED=1, EXACT=2, INEXACT=4, RATIONAL=8,
	IMAGINARY=16, INTEGER=32, DECIMAL=64;

    public static final int
	FIXEDINT = EXACT | FIXED | INTEGER | RATIONAL,
	INTEG = EXACT | INTEGER | RATIONAL,
	RATIO = EXACT | RATIONAL,
	COMPLEX  = INEXACT | IMAGINARY,
	DECIM = INEXACT | DECIMAL;

    public static Quantity valueOf(int val) { return new Quantity(val); }
    public static Quantity valueOf(long val) { return new Quantity(val); }
    public static Quantity valueOf(double val) { return new Quantity(val); }
    public static Quantity valueOf(BigInteger val) { return new Quantity(val); }
    public static Quantity valueOf(BigDecimal val) { return new Quantity(val.doubleValue()); }
    public static Quantity valueOf(BigInteger num, BigInteger den) { 
	return new Quantity(num, den);
    }

    public static Quantity valueOf(Quantity real, Quantity imag) {
	return new Quantity(real.toInexact().doubleValue(),
			    imag.toInexact().doubleValue());
    }

    public static Quantity valueOf(double real, double imag) {
	return new Quantity(real, imag);
    }

    public static Quantity valueOf(String v) throws NumberFormatException {
	return valueOf(v, 10);
    }

    public static Quantity valueOf(String v, int radix) throws NumberFormatException {
        int x,y;
        if ((x=v.indexOf('/'))!=-1) {
	    Quantity 
		num=parseUinteger(v.substring(0,x), radix),
		den=parseUinteger(v.substring(x+1), radix);
	    if (num.is(INEXACT) || den.is(INEXACT)) 
		return num.div(den);
	    else 
		return new Quantity(num.integer(), den.integer());
        } else if ((x=v.indexOf('@'))!=-1) {
            //R5RS Lexical structure violation:
            double xd=parseDecimal(v.substring(0,x), radix, true);
	    double yd=parseDecimal(v.substring(x+1), radix, true);
	    return new Quantity(xd*Math.cos(yd), xd*Math.sin(yd));
        } else if ((x=v.indexOf('i'))!=-1) {
	    double d,im;
            if (x!=v.length()-1)
                throw new NumberFormatException("Invalid complex number format");
            x=v.lastIndexOf('+');
            if (x==-1) {
                x=v.lastIndexOf('-');
                if (x==-1) throw new NumberFormatException("invalid complex number format");
                if (x==0)
                    d=0.0;
                else
                    d=parseDecimal(v.substring(0,x), radix, true);
                im = ( (x+2)==v.length() ? -1.0 :
		       parseDecimal(v.substring(x, v.length()-1), radix, true));
            } else {
                if (x==0)
                    d=0.0;
                else
                    d=parseDecimal(v.substring(0,x), radix, true);
                im = ( (x+2)==v.length() ? 1.0 :
		       parseDecimal(v.substring(x+1, v.length()-1), radix, true));
            }
	    return new Quantity(d,im);
        } else if (radix==10 &&
                   (v.indexOf('.') != -1 ||
                    v.indexOf('e') != -1 ||
                    v.indexOf('s') != -1 ||
                    v.indexOf('f') != -1 ||
                    v.indexOf('d') != -1 ||
                    v.indexOf('l') != -1)) {
	    return new Quantity(parseDecimal(v, radix));
        } else 
	    return parseUinteger(v, radix);
    }

    public int type;
    public int val;
    public double d, im;
    public BigInteger i, de;
    public String out_cache;
    public byte out_cache_radix;

    public Quantity() {}

    Quantity(int l) {
        val=l;
        type=FIXEDINT;
    }

    Quantity(double l) {
        d=l;
        type=DECIM;
    }

    Quantity(long v) {
        i=BigInteger.valueOf(v);
        type=INTEG;
    }

    Quantity(BigInteger i) {
        if (i.compareTo(_INT_MAX)==-1 &&
                i.compareTo(_INT_MIN)==1) {
            val=i.intValue();
            type=FIXEDINT;
        } else {
            type=INTEG;
            this.i=i;
        }
    }

    Quantity(BigInteger numerator, BigInteger denominator) {
        i=numerator;
        de=denominator;
        type=RATIO;
        simplify();
    }

    Quantity(double real, double imag) {
        d=real;
        im=imag;
        type=COMPLEX;
        simplify();
    }

    protected static int sign(double d) {
        if (d<0)
            return -1;
        else if (d>0)
            return 1;
        else return 0;
    }

    protected static boolean parsePounds(char[] c) {
        boolean rv=false;
        for (int i=c.length-1; i>=0; i--) {
            if (c[i]=='#') {
                rv=true;
                c[i]='0';
            } else break;
        }
        return rv;
    }

    protected static double parseDecimal(String dv, int radix) {
        return parseDecimal(dv, radix, false);
    }

    protected static double parseDecimal(String dv, int radix,
                                           boolean asDecimal) {
        if (radix==10) {
            int x;
            if ((x=dv.indexOf('e'))!=-1) {
                int e=x;
                StringBuffer b=new StringBuffer();
                String preExp=dv.substring(0,e);
                if ((x=preExp.indexOf('.'))!=-1) {
                    char[] c=preExp.substring(0,x).toCharArray();
                    boolean wholeHadPounds=parsePounds(c);
                    b.append(c);
                    c=preExp.substring(x+1).toCharArray();
                    if (wholeHadPounds)
                        for (int i=0; i<c.length; i++)
                            if (c[i]!='#')
                                throw new NumberFormatException("non-contiguous use of #s");
                    parsePounds(c);
                    b.append('.').append(c);
                } else {
                    char[] c=dv.substring(0,e).toCharArray();
                    parsePounds(c);
                    b.append(c);
                }
                b.append(dv.substring(e));
                dv=b.toString();
                return Double.parseDouble(dv);
            } else if ((x=dv.indexOf('s'))!=-1 ||
                       (x=dv.indexOf('f'))!=-1 ||
                       (x=dv.indexOf('d'))!=-1 ||
                       (x=dv.indexOf('l'))!=-1) {
                StringBuffer b=new StringBuffer(dv.substring(0,x));
                b.append('e').append(dv.substring(x+1));
                dv=b.toString();
                return parseDecimal(dv, radix, asDecimal);
            } else if ((x=dv.indexOf('.'))!=-1) {
                StringBuffer b=new StringBuffer();
                char c[]=dv.substring(0,x).toCharArray();
                if (parsePounds(c)) {
                    b.append(c);
                    c=dv.substring(x+1).toCharArray();
                    for (int i=0; i<c.length; i++)
                        if (c[i]!='#')
                            throw new NumberFormatException("non-contiguous use of #s");
                    parsePounds(c);
                } else {
                    b.append(c);
                    c=dv.substring(x+1).toCharArray();
                    parsePounds(c);
                }
                b.append('.').append(c);

                return Double.parseDouble(b.toString());
            } else if (dv.indexOf('#')!=-1) {
                char[] c=dv.toCharArray();
                parsePounds(c);
                return Double.parseDouble(new String(c));
            } else if (asDecimal)
                return Double.parseDouble(dv);
            else
                throw new NumberFormatException("not a decimal value");
        } else {
            int x;
            if ((x=dv.indexOf('.'))==-1)
                if (dv.indexOf('#')!=-1) {
                    char[] c=dv.toCharArray();
                    parsePounds(c);
                    return Double.parseDouble(new String(c));
                } else if (asDecimal)
                    return Double.parseDouble(dv);
                else
                    throw new NumberFormatException("not a decimal value");
            else {
                BigDecimal ipart;
                BigInteger fpart;
                ipart=new BigDecimal(new BigInteger(dv.substring(0, x), radix));

                String fpartstr=dv.substring(x+1);
                fpart=new BigInteger(fpartstr, radix);
                return ipart.add(new BigDecimal(Double.toString(fpart.doubleValue() /
			 Math.pow(radix, fpartstr.length())))).doubleValue();
            }
        }
    }

    protected static Quantity parseUinteger(String v, int radix) {
        char[] c=v.toCharArray();
        boolean hadPounds=parsePounds(c);
        if (c[0]=='+' && c.length>1) c[0]='0';
	if (hadPounds)
	    return new Quantity(Double.parseDouble(new String(c)));
	else
	    return new Quantity(new BigInteger(new String(c), radix));
    }

    protected double decimal() {
        switch(type) {
	case FIXEDINT:
	    return (double)val;
	case INTEG:
	    return i.doubleValue();
        case DECIM:
            return d;
	case RATIO:
	    return ratioToDecimal(i, de);
        default:
            throw new NumberFormatException(liMessage(SISCB, "isnotreal", toString()));
        }
    }

    public BigInteger integer() {
        switch(type) {
        case FIXEDINT:
            return BigInteger.valueOf(val);
        case INTEG:
            return i;
        default:
            throw new NumberFormatException("Value was not an integer");
        }
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
            if (im==0.0) {
                type=DECIM;
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

    protected static BigInteger d2i(double d) {
        return new BigDecimal(d).toBigInteger();
    }

    protected static double round(double d) {
        double f=Math.floor(d);
        if (Math.abs(f-d)==0.5)
            if (((int)f) % 2 == 0)
                return f;
            else return f+1;
        else
            return Math.round(d);
    }

    public Quantity gcd(Quantity o) {
        switch (type) {
        case FIXEDINT:
            return o.gcd(new Quantity((long)val));
        case DECIM:
            if (Math.floor(d)==d)
                return new Quantity(d2i(d)).gcd(o);
        case INTEG:
            if (o.type==FIXEDINT)
                o=new Quantity((long)o.val);
            if (o.type==INTEG)
                return new Quantity(i.gcd(o.i));
            if (o.type==DECIM) {
                if (Math.floor(d)==d)
                    return new Quantity(i.gcd(d2i(d))).toInexact();
            }
        }
        throw new ArithmeticException(this+" is not an integer.");
    }

    public Quantity lcm(Quantity o) {
        switch (type) {
        case FIXEDINT:
            return o.lcm(new Quantity((long)val));
        case DECIM:
            if (Math.floor(d)==d)
                return new Quantity(d2i(d)).lcm(o).toInexact();
        case INTEG:
            BigInteger o2=null;
            boolean inexact=false;
            if (o.type==FIXEDINT)
                o2=BigInteger.valueOf(o.val);
            if (o.type==INTEG)
                o2=o.i;
            if (o.type==DECIM) {
                if (Math.floor(o.d)==o.d)
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

    protected Quantity round(int rtype) {
        switch (type) {
        case DECIM:
            switch (rtype) {
            case BigDecimal.ROUND_FLOOR:
                return new Quantity((double)Math.floor(d));
            case BigDecimal.ROUND_CEILING:
                return new Quantity((double)Math.ceil(d));
            case BigDecimal.ROUND_HALF_EVEN:
                return new Quantity(round(d));
            case BigDecimal.ROUND_DOWN:
                return new Quantity(d2i(d).doubleValue());
            }
            return this;
        case COMPLEX:
            throw new ArithmeticException(this+" is not a real number");
        case RATIO:
            return ((Quantity)toInexact()).round(rtype).toExact();
        default:
            return this;
        }
    }

    public Quantity modulo(Quantity o) {
        switch (type) {
        case FIXEDINT:
            if (o.type==FIXEDINT) return new Quantity(val%o.val);
            else return new Quantity((long)val).modulo(o);
        case INTEG:
            if (o.type==FIXEDINT)
                o=new Quantity((long)o.val);
            if (o.type==INTEG)
                return new Quantity(i.mod(o.i));
            if (o.type==DECIM) {
                if (Math.floor(d)==d)
                    return new Quantity(i.mod(d2i(d))).toInexact();
            }
        case DECIM:
            if (Math.floor(d)==d)
                return new Quantity(d2i(d)).modulo(o).toInexact();
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
                if (Math.floor(o.d)==o.d)
                    return new Quantity(i.divide(d2i(o.d))).toInexact();
            }
        case DECIM:
            if (Math.floor(d)==d)
                return new Quantity(d2i(d)).quotient(o).toInexact();
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
                if (Math.floor(o.d)==o.d)
                    return new Quantity(i.remainder(d2i(o.d))).toInexact();
            }
        case DECIM:
            if (Math.floor(d)==d)
                return new Quantity(d2i(d)).remainder(o).toInexact();
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

    public Quantity atan(Quantity o) {
        if (type==COMPLEX)
            throw new ArithmeticException(this+" is not a real number.");
        if (o.type==COMPLEX)
            throw new ArithmeticException(o+" is not a real number.");
        return new Quantity(Math.atan2(doubleValue(), o.doubleValue()));
    }

    public Quantity exp() {
        if (type==COMPLEX) {
            //e^(x+I*y) = e^x (Cos[y]+I*Sin[y])
            //          = e^x*Cos[y] + I*e^x*Sin[y]
            double etox=Math.exp(d);
            double y=im;
            return new Quantity(etox*Math.cos(y),
                                etox*Math.sin(y));
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
            double a2=d*d;
            double b2=im*im;
            double arctan=Math.atan2(im,d);
            double x=Math.log(Math.sqrt(a2+b2));
            return new Quantity(x,arctan);
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
            return new Quantity(-d);
        case RATIO:
            return new Quantity(i.negate(), de.negate());
        case COMPLEX:
            return new Quantity(-d, -im);
        }
        return null;
    }

    public static BigDecimal[] sqrtrem(BigDecimal x) throws ArithmeticException {
	
	BigDecimal y = x.setScale (x.scale () * 2);
	int scale = scale(x.scale(), 32);
	
	BigInteger[] intResult = sqrtrem(y.movePointRight (scale).toBigInteger ());
	
	BigDecimal[] result = {
	    new BigDecimal (intResult[0], scale / 2),
	    new BigDecimal (intResult[1], scale)
	};
	
	return result;
    }

    public static BigInteger[] sqrtrem(BigInteger x) throws ArithmeticException {
	if (x.signum () == 0) {
	    BigInteger result[] = { x, x };
	    
	    return result;
	}

	int bits = (x.bitLength () - 1) >> 1;
	BigInteger root = _BI_ONE.shiftLeft (bits);
	
	x = x.subtract(root.shiftLeft (bits));
	while(bits-- > 0) {
	    BigInteger tmp = x.subtract (_BI_ONE.shiftLeft (bits + bits)).
		subtract (root.shiftLeft (bits + 1));
	    if (tmp.signum () >= 0) {
		root = root.add (_BI_ONE.shiftLeft (bits));
		x = tmp;
	    }
	}
	
	BigInteger result[] = { root, x };
	
	return result;
    }

    public Quantity sqrt() {
        switch (type) {
	case DECIM:
	    if (d<0)
		return new Quantity(0.0, Math.sqrt(d));
	    else return new Quantity(Math.sqrt(d));
	case FIXEDINT: case INTEG:
	    BigInteger orig=integer();
	    BigInteger i=orig.abs();
	    BigInteger[] rv=sqrtrem(i);
	    if (rv[1].equals(_BI_ZERO))
		if (orig.signum()>-1)
		    return new Quantity(rv[0]);
		else return new Quantity(0.0, rv[0].doubleValue());

	case RATIO:
	    BigDecimal[] rvd=sqrtrem(new BigDecimal(decimal()));
	    return new Quantity(rvd[0].doubleValue());
        case COMPLEX:
            // Take r=sqrt(a^2 + b^2)
            double a2=d*d;
            double b2=im*im;
            double r=Math.sqrt(a2 + b2);

            // The two square roots of a+bi are (x +yi) and -(x +yi) with
            //           y = sqrt((r - a)/2) and x = b/(2.y)
            double y=Math.sqrt((r-d)/2);
            double x=im/(2*y);
            if (x < 0) {
                return new Quantity(x,y).negate();
            } else
                return new Quantity(x, y);
        }
        return new Quantity(Math.sqrt(doubleValue()));
    }

    public Quantity add(Quantity o) {
        switch (type) {
        case FIXEDINT:
            if (o.type!=FIXEDINT) return o.add(this);
            else return intBound((long)o.val+val);
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d+o.val);
            case DECIM:
                return new Quantity(d+o.d);
            case INTEG:
                return new Quantity(d+o.i.doubleValue());
            case RATIO:
                return new Quantity(ratioToDecimal(o.i, o.de) + d);
            case COMPLEX:
                return o.add(this);
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i.add(BigInteger.valueOf(o.val)));
            case DECIM:
                return new Quantity(i.doubleValue()+o.d);
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
                return new Quantity(ratioToDecimal(i, de)+o.d);
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
                return new Quantity(d+o.val, im);
            case DECIM:
                return new Quantity(d+o.d, im);
            case INTEG:
                return new Quantity(d+o.i.doubleValue(),im);
            case RATIO:
                return new Quantity(d+ratioToDecimal(o.i, o.de), im);
            case COMPLEX:
                return new Quantity(d+o.d, im+o.im);
            }
        }
        return null;
    }

    public Quantity mul(Quantity o) {
        switch (type) {
        case FIXEDINT:
            if (o.type!=FIXEDINT) return o.mul(this);
            else return intBound((long)o.val*val);
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d*o.val);
            case DECIM:
                return new Quantity(d*o.d);
            case COMPLEX:
                return o.mul(this);
            default:
                return new Quantity(d*o.doubleValue());
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i.multiply(BigInteger.valueOf(o.val)));
            case DECIM:
                return new Quantity(i.doubleValue()*o.d);
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
                return new Quantity(ratioToDecimal(i, de)*o.d);
            case INTEG:
                new_n=i.multiply(o.i);
                return new Quantity(new_n, de);
            case RATIO:
                return new Quantity(i.multiply(o.i), de.multiply(o.de));
            case COMPLEX:
                return o.mul(this);
            }
        case COMPLEX:
            double g=0, h=0;
            switch (o.type) {
            case FIXEDINT:
                g=(double)o.val;
                break;
            case COMPLEX:
                g=o.d;
                h=o.im;
                break;
            case DECIM:
                g=o.d;
                break;
            case INTEG:
                g=o.i.doubleValue();
                break;
            case RATIO:
                g=ratioToDecimal(o.i, o.de);
                break;
            }
            double nd=(d*g)-(im*h);
            double nim=(d*h)+(im*g);
            return new Quantity(nd, nim);
        }
        return null;
    }

    public Quantity sub(Quantity o) {
        switch (type) {
        case FIXEDINT:
            switch (o.type) {
            case FIXEDINT:
                return intBound((long)val-o.val);
            case DECIM:
                return new Quantity(val-o.d);
            case COMPLEX:
                return new Quantity(val-o.d, -o.im);
            default:
                return new Quantity((long)val).sub(o);
            }
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d-o.val);
            case DECIM:
                return new Quantity(d-o.d);
            case INTEG:
                return new Quantity(d-o.i.doubleValue());
            case RATIO:
                return new Quantity(d-ratioToDecimal(o.i, o.de));
            case COMPLEX:
                return new Quantity(d-o.d, -o.im);
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i.subtract(BigInteger.valueOf(o.val)));
            case DECIM:
                return new Quantity(i.doubleValue()-o.d);
            case INTEG:
                return new Quantity(i.subtract(o.i));
            case RATIO:
                BigInteger ores=i.multiply(o.de);
                BigInteger new_n=ores.subtract(o.i);
                return new Quantity(new_n, o.de);
            case COMPLEX:
                return new Quantity(i.doubleValue()-o.d, -o.im);

            }
        case RATIO:
            switch (o.type) {
            case FIXEDINT:
                BigInteger ores=BigInteger.valueOf(o.val).multiply(de);
                BigInteger new_n=i.subtract(ores);
                return new Quantity(new_n, de);
            case DECIM:
                return new Quantity(ratioToDecimal(i, de)-o.d);
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
                return new Quantity(ratioToDecimal(i, de)-o.d, -o.im);
            }
        case COMPLEX:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d-o.val, im);
            case DECIM:
                return new Quantity(d-o.d, im);
            case INTEG:
                return new Quantity(d-o.i.doubleValue(), im);
            case RATIO:
                return new Quantity(d-ratioToDecimal(o.i, o.de), im);
            case COMPLEX:
                return new Quantity(d-o.d, im-o.im);
            }

        }
        return null;
    }

    protected final static double div(double d1, double d2) {
        return d1/d2;
    }

    public Quantity div(Quantity o) {
        switch (type) {
        case FIXEDINT:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(BigInteger.valueOf(val), 
				    BigInteger.valueOf(o.val));
            case DECIM:
                return new Quantity(val/o.d);
            case COMPLEX:
                Quantity q=new Quantity();
                q.d=d;
                q.im=0.0;
                q.type=COMPLEX;
                return q.div(o);
            default:
                return new Quantity((long)val).div(o);
            }
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d / o.val);
            case DECIM:
                return new Quantity(d/o.d);
            case INTEG:
                return new Quantity(d/o.i.doubleValue());
            case RATIO:
                return mul(new Quantity(o.de, o.i));
            case COMPLEX:
                Quantity q=new Quantity();
                q.d=d;
                q.im=0.0;
                q.type=COMPLEX;
                return q.div(o);
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i, BigInteger.valueOf(o.val));
            case DECIM:
                return new Quantity(i.doubleValue()/o.d);
            case INTEG:
                return new Quantity(i, o.i);
            case RATIO:
                BigInteger ores=o.de.multiply(i);
                return new Quantity(ores, o.i);
            case COMPLEX:
                Quantity q=new Quantity();
                q.d=i.doubleValue();
                q.im=0.0;
                q.type=COMPLEX;
                return q.div(o);
            }
        case RATIO:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i, de.multiply(BigInteger.valueOf(o.val)));
            case DECIM:
                double r=ratioToDecimal(i,de);
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
            double g=0.0, h=0.0;
            switch (o.type) {
            case FIXEDINT:
                double oval=(double)o.val;
                return new Quantity(div(d,oval), div(im,oval));
            case DECIM:
                return new Quantity(div(d,o.d), div(im,o.d));
            case INTEG:
                oval=o.i.doubleValue();
                return new Quantity(div(d,oval), div(im,oval));
            case RATIO:
                oval=ratioToDecimal(o.i, o.de);
                return new Quantity(div(d,oval), div(im,oval));
            case COMPLEX:
                g=o.d;
                h=o.im;
            }

            // (a+ib)/(c+id)=(ac+bd+i(bc-ad))/(c^2+d^2)

            double c2=g*g;
            double d2=h*h;
            Quantity c2_p_d2 = new Quantity(c2+d2);
            double bd=im*h;
            double ac=d*g;
            double bc=im*g;
            double ad=d*h;

            Quantity rc1=new Quantity(ac+bd);
            Quantity rc2=new Quantity(bc-ad);
            return rc1.add(I.mul(rc2)).div(c2_p_d2);
        }
        return null;
    }

    public boolean comp(Quantity o, int test) {
        switch (type) {
        case FIXEDINT:
            if (o.type==FIXEDINT) return test==(val > o.val ? 1 :
                                                    (val < o.val ? -1 : 0));
            else return new Quantity((long)val).comp(o,test);
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return sign(d-o.val)==test;
            case DECIM:
                return sign(d-o.d)==test;
            case INTEG:
                return sign(d-o.i.doubleValue())==test;
            case RATIO:
                return sign(d-ratioToDecimal(o.i, o.de))==test;
            case COMPLEX:
                if (test==0)
                    return (o.im==0) && d==o.d;
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return i.compareTo(BigInteger.valueOf(o.val))==test;
            case DECIM:
                return sign(i.doubleValue()-o.d)==test;
            case INTEG:
                return i.compareTo(o.i)==test;
            case RATIO:
                BigInteger cnum=i.multiply(o.de);
                return cnum.compareTo(o.i)==test;
            case COMPLEX:
                if (test==0)
                    return o.im==0 &&
                           comp(new Quantity(o.d), 0);
            }
            break;
        case RATIO:
            switch (o.type) {
            case FIXEDINT:
                BigInteger cnum=BigInteger.valueOf(o.val).multiply(de);
                return i.compareTo(cnum)==test;
            case DECIM:
                return sign(ratioToDecimal(i, de)-o.d)==test;
            case INTEG:
                cnum=o.i.multiply(de);
                return i.compareTo(cnum)==test;
            case RATIO:
                BigInteger common_n1=i.multiply(o.de);
                BigInteger common_n2=o.i.multiply(de);
                return common_n1.compareTo(common_n2)==test;
            case COMPLEX:
                if (test==0)
                    return o.im==0 &&
                           comp(new Quantity(o.d), 0);
            }
            break;
        case COMPLEX:
            if (o.type==COMPLEX) {
                int x=0;
                if ((x=sign(d-o.d))==0)
                    return sign(im-o.im)==test;
                else return x==test;
            } else {
                return o.comp(this, test);}
        }
        throw new NumberFormatException("cannot compare complex numbers for order");
    }

    public double doubleValue() {
        switch (type) {
        case FIXEDINT:
            return (double)val;
        case DECIM:
            return d;
        case INTEG:
            return (double)i.intValue();
        case RATIO:
            return ratioToDecimal(i,de);
        }
        return 0.0;
    }


    public long longValue() {
        switch (type) {
        case FIXEDINT:
            return val;
        case DECIM:
            return (long)d;
        case INTEG:
            return i.longValue();
        case RATIO:
            return i.divide(de).longValue();
        }
        return 0;
    }

    public int intValue() {
        switch (type) {
        case FIXEDINT:
            return val;
        case DECIM:
            return (int)d;
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
            return d2i(d);
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
            BigInteger ipart=d2i(d);
            BigDecimal fpart=new BigDecimal(Double.toString(d-ipart.doubleValue()));
            int scale=fpart.scale();
            fpart=fpart.movePointRight(scale);
            BigInteger denominator=_BI_TEN.pow(scale);
            BigInteger numerator=ipart.multiply(denominator).add(fpart.toBigInteger());;
            return new Quantity(numerator, denominator);
        case COMPLEX:
            return new Quantity(Math.round(d), Math.round(im));
        default:
            return this;
        }
    }

    public Quantity toInexact() {
        switch (type) {
        case FIXEDINT:
            return new Quantity((double)val);
        case INTEG:
            return new Quantity(i.doubleValue());
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
            throw new NumberFormatException(this+" is not a real number");
        case DECIM:
            return toExact().numerator().toInexact();
        case RATIO:
            return new Quantity(i);
        default:
            return this;
        }
    }

    public Quantity denominator() throws NumberFormatException {
        switch (type) {
        case COMPLEX:
            throw new NumberFormatException(this+" is not a real number");
        case DECIM:
            return toExact().denominator().toInexact();
        case RATIO:
            return new Quantity(de);
        default:
            return ONE;
        }
    }

    protected static final double ratioToDecimal(BigInteger numerator,
            BigInteger denominator) {
        return numerator.doubleValue() / denominator.doubleValue();
    }

    protected static final int scale(int scale1, int scale2) {
        return Math.min(Math.max(min_precision, Math.max(scale1, scale2)),
                        max_precision);
    }

    protected final static Quantity intBound(long v) {
        return (v>Integer.MAX_VALUE || v<Integer.MIN_VALUE) ?
               new Quantity(v) : new Quantity((int)v);
    }

    protected static String zeroTrim(String s) {
        int y=s.indexOf('.');
        char c;
        if (y!=-1 && s.indexOf('e')==-1) {
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
            String s=zeroTrim(Double.toString(d).toLowerCase());
            b.append(s);
            if (s.indexOf('.')==-1) b.append(".0");
        } else if (type==INTEG)
            b.append(i.toString(radix));
        else if (type==RATIO)
            b.append(i.toString(radix)).append('/').append(de.toString(radix));
        else if (type==COMPLEX) {
            b.append(zeroTrim(Double.toString(d).toLowerCase()));
            if (im>0) {
                b.append('+');
                if (im!=1.0)
                    b.append(Double.toString(im).toLowerCase());
            } else {
                if (im==-1.0)
                    b.append('-');
                else
                    b.append(zeroTrim(Double.toString(im).toLowerCase()));
            }
            b.append('i');
        }
        out_cache_radix=(byte)radix;
        return out_cache=b.toString();
    }

    public void deserialize(Serializer s,
                            DataInput dis) throws IOException {
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
		d=s.readFloat(dis).doubleValue();
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
                d=s.readFloat(dis).doubleValue();
                im=s.readFloat(dis).doubleValue();
                break;
            }
            simplify();
        }
    }

    protected BigInteger unscaledValue(BigDecimal d) {
        return d.setScale(0).toBigInteger();
    }

    public void serialize(Serializer s, DataOutput dos) throws IOException {
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
		s.writeFloat(d, dos);
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
		s.writeFloat(d, dos);
		s.writeFloat(im, dos);
                break;
            }
        }
    }

    public final boolean is(int mask) {
	return (type & mask) != 0;
    }

    public final boolean greater(Quantity o) {
        return comp(o, 1);
    }

    public final boolean less(Quantity o) {
        return comp(o, -1);
    }

    public boolean equals(Object v) {
        if (!(v instanceof Quantity)) return false;
        Quantity q=(Quantity)v;
	    return (q.type==type && comp(q, 0));
    }
	
    public boolean valueEqual(Value v) {
        return (this == v) ||
            ((v instanceof Quantity) && comp((Quantity)v, 0));
    }

    public int hashCode() {
	int hc=type;
	switch (type) {
	case FIXEDINT:
	    return hc^val;
	case DECIM:
	    long bits=Double.doubleToLongBits(d);
	    return hc^(int)(bits & 0xffffffff)^(int)((bits>>>32)&0xffffffff);
	case INTEG:
	    return hc^i.hashCode();
	case RATIO:
	    return hc^i.hashCode()^de.hashCode();
	case COMPLEX:
	    bits=Double.doubleToLongBits(d);
	    long bits2=Double.doubleToLongBits(im);
	    return hc^(int)(bits & 0xffffffff)^(int)((bits>>>32)&0xffffffff)^
		(int)(bits2 & 0xffffffff)^(int)((bits2>>>32)&0xffffffff);
	default:
	    return hc;
	}
    }

    public final String display() {
	return toString();
    }

    public final String toString() {
        return toString(10);
    }
}


