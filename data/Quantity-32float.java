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
    public static int min_precision;
    public static int max_precision;

    static {
        String x=System.getProperty("minprecision");
        String y=System.getProperty("maxprecision");
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
    
    public final static Quantity
	ZERO = Quantity.valueOf(0),
	ONE  = Quantity.valueOf(1),
	TWO  = Quantity.valueOf(2),
	I    = Quantity.valueOf(0.0f, 1.0f),
	TWO_I= Quantity.valueOf(0.0f, 2.0f),
	HALF_PI = Quantity.valueOf((float)Math.PI/2);
    
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
    public static Quantity valueOf(float val) { return new Quantity(val); }
    public static Quantity valueOf(BigInteger val) { return new Quantity(val); }
    public static Quantity valueOf(BigInteger num, BigInteger den) { 
	return new Quantity(num, den);
    }

    public static Quantity valueOf(Quantity real, Quantity imag) {
	return new Quantity(real.toInexact().floatValue(),
			    imag.toInexact().floatValue());
    }

    public static Quantity valueOf(float real, float imag) {
	return new Quantity(real, imag);
    }

    public static Quantity valueOf(String v) {
	return valueOf(v, 10);
    }

    public static Quantity valueOf(String v, int radix) {
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
            float xd=parseDecimal(v.substring(0,x), radix, true);
	    float yd=parseDecimal(v.substring(x+1), radix, true);
	    return new Quantity((float)(xd*Math.cos(yd)), 
				(float)(xd*Math.sin(yd)));
        } else if ((x=v.indexOf('i'))!=-1) {
	    float d,im;
            if (x!=v.length()-1)
                throw new NumberFormatException("Invalid complex number format");
            x=v.lastIndexOf('+');
            if (x==-1) {
                x=v.lastIndexOf('-');
                if (x==-1) throw new NumberFormatException("invalid complex number format");
                if (x==0)
                    d=0.0f;
                else
                    d=parseDecimal(v.substring(0,x), radix, true);
                im = ( (x+2)==v.length() ? -1.0f :
		       parseDecimal(v.substring(x, v.length()-1), radix, true));
            } else {
                if (x==0)
                    d=0.0f;
                else
                    d=parseDecimal(v.substring(0,x), radix, true);
                im = ( (x+2)==v.length() ? 1.0f :
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
    public float d, im;
    public BigInteger i, de;
    public String out_cache;
    public byte out_cache_radix;

    public Quantity() {}

    public Quantity (int l) {
        val=l;
        type=FIXEDINT;
    }

    public Quantity (float l) {
        d=l;
        type=DECIM;
    }

    public Quantity(long v) {
        i=BigInteger.valueOf(v);
        type=INTEG;
    }

    public Quantity(BigInteger i) {
        if (i.compareTo(_INT_MAX)==-1 &&
                i.compareTo(_INT_MIN)==1) {
            val=i.intValue();
            type=FIXEDINT;
        } else {
            type=INTEG;
            this.i=i;
        }
    }

    public Quantity (BigInteger numerator, BigInteger denominator) {
        i=numerator;
        de=denominator;
        type=RATIO;
        simplify();
    }




    public Quantity (float real, float imag) {
        d=real;
        im=imag;
        type=COMPLEX;
        simplify();
    }

    protected static int sign(float d) {
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
            }
            else break;
        }
        return rv;
    }

    protected static Quantity parseUinteger(String v, int radix) {
        char[] c=v.toCharArray();
        boolean hadPounds=parsePounds(c);
        if (c[0]=='+' && c.length>1) c[0]='0';
	if (hadPounds)
	    return new Quantity((float)Double.parseDouble(new String(c)));
	else
	    return new Quantity(new BigInteger(new String(c), radix));
    }

    protected static float parseDecimal(String dv, int radix) {
        return parseDecimal(dv, radix, false);
    }

    protected static float parseDecimal(String dv, int radix,
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
                return Float.parseFloat(dv);
            } else if ((x=dv.indexOf('s'))!=-1 ||
                       (x=dv.indexOf('f'))!=-1 ||
                       (x=dv.indexOf('d'))!=-1 ||
                       (x=dv.indexOf('l'))!=-1) {
                StringBuffer b=new StringBuffer(dv.substring(0,x));
                b.append('e').append(dv.substring(x+1));
                dv=b.toString();
                return Float.parseFloat(dv);
            } else if (dv.indexOf('.')!=-1)
                return Float.parseFloat(dv);
            else if (dv.indexOf('#')!=-1) {
                char[] c=dv.toCharArray();
                parsePounds(c);
                return Float.parseFloat(new String(c));
            } else if (asDecimal)
                return Float.parseFloat(dv);
            else
                throw new NumberFormatException("not a decimal value");
        } else {
            int x;
            if ((x=dv.indexOf('.'))==-1)
                if (dv.indexOf('#')!=-1) {
                    char[] c=dv.toCharArray();
                    parsePounds(c);
                    return Float.parseFloat(new String(c));
                } else if (asDecimal)
                    return Float.parseFloat(dv);
                else
                    throw new NumberFormatException("not a decimal value");
            else {
                BigDecimal ipart;
                BigInteger fpart;
                ipart=new BigDecimal(new BigInteger(dv.substring(0, x), radix));

                String fpartstr=dv.substring(x+1);
                fpart=new BigInteger(fpartstr, radix);
                return ipart.add(new BigDecimal(Float.toString((float)(fpart.floatValue() /
                                                Math.pow(radix, fpartstr.length()))))).floatValue();
            }
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
            if (im==0.0f) {
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

    protected static BigInteger d2i(float d) {
        return new BigDecimal(d).toBigInteger();
    }

    protected static float round(float d) {
        float f=(float)Math.floor(d);
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

    public Quantity round(int rtype) {
        switch (type) {
        case DECIM:
            switch (rtype) {
            case BigDecimal.ROUND_FLOOR:
                return new Quantity((float)Math.floor(d));
            case BigDecimal.ROUND_CEILING:
                return new Quantity((float)Math.ceil(d));
            case BigDecimal.ROUND_HALF_EVEN:
                return new Quantity(round(d));
            case BigDecimal.ROUND_DOWN:
                return new Quantity(d2i(d).floatValue());
            }
            return this;
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

    public static final float sinh(float x) {
        return (float)((float)Math.exp(x)-(float)Math.exp(-x))/2;
    }

    public static final float cosh(float x) {
        return (float)((float)Math.exp(x)+(float)Math.exp(-x))/2;
    }

    public Quantity sin() {
        if (type==COMPLEX) {
            //  sin(x+iy) = sin(x)cosh(y) + i*cos(x)sinh(y)
            Quantity z=mul(I);
            z=z.exp().sub(z.negate().exp());
            return z.div(TWO_I);
        } else
            return new Quantity((float)Math.sin(floatValue()));
    }

    public Quantity cos() {
        if (type==COMPLEX) {
            Quantity z=mul(I);
            z=z.exp().add(z.negate().exp());
            return z.div(TWO);
        } else
            return new Quantity((float)Math.cos(floatValue()));
    }

    public Quantity tan() {
        if (type==COMPLEX) {
            Quantity z=mul(I);
            Quantity p=z.exp();
            Quantity n=z.negate().exp();
            return p.sub(n).div(I.mul(p.add(n)));
        } else
            return new Quantity((float)Math.tan(floatValue()));
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
        return new Quantity((float)Math.atan2(floatValue(), other.floatValue()));
    }

    public Quantity exp() {
        if (type==COMPLEX) {
            //e^(x+I*y) = e^x (Cos[y]+I*Sin[y])
            //          = e^x*Cos[y] + I*e^x*Sin[y]
            float etox=(float)Math.exp(d);
            float y=im;
            return new Quantity((float)(etox*Math.cos(y)),
                                (float)(etox*Math.sin(y)));
        } else
            return new Quantity((float)Math.exp(floatValue()));
    }

    public Quantity log() {
        if (type==COMPLEX) {
            // Arg[w] = ArcTan(b/a)
            // |w| = sqrt(a^2 + b^2)
            // Log[w] = Log[|w|]+I*(Arg[w]+2*Pi*k), for any integer k.
            // select k=0 for principal value, giving:
            // Log[w] = Log[|w|]+I*Arg[w]
            //        = Log[sqrt(a^2 + b^2)] + I * ArcTan(b/a)
            float a2=d*d;
            float b2=im*im;
            float arctan=(float)Math.atan2(im,d);
            float x=(float)Math.log(Math.sqrt(a2+b2));
            return new Quantity(x,arctan);
        } else
            return new Quantity((float)Math.log(floatValue()));
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

    public Quantity sqrt() {
        switch (type) {
        case FIXEDINT:
            if (val<0)
                return new Quantity(0.0f, (float)Math.sqrt(-val));
            break;
        case INTEGER:
            if (i.compareTo(_BI_ZERO)==-1)
                return new Quantity(0.0f, (float)Math.sqrt(-1*floatValue()));
            break;
	case DECIM:
            if (d<0) return new Quantity(0.0f, (float)Math.sqrt(-d));
	    break;
	case RATIO:
	    float dv=floatValue();
            if (dv<0) return new Quantity(0.0f, (float)Math.sqrt(-dv));
	    else return new Quantity((float)Math.sqrt(dv));
        case COMPLEX:
            // Take r=sqrt(a^2 + b^2)
            float a2=d*d;
            float b2=im*im;
            float r=(float)Math.sqrt(a2 + b2);

            // The two square roots of a+bi are (x +yi) and -(x +yi) with
            //           y = sqrt((r - a)/2) and x = b/(2.y)
            float y=(float)Math.sqrt((r-d)/2);
            float x=im/(2*y);
            if (x < 0) {
                return new Quantity(x,y).negate();
            } else
                return new Quantity(x, y);
        }
        return new Quantity((float)Math.sqrt(floatValue()));
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
                return new Quantity(d+o.val);
            case DECIM:
                return new Quantity(d+o.d);
            case INTEG:
                return new Quantity(d+o.i.floatValue());
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
                return new Quantity(i.floatValue()+o.d);
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
                return new Quantity(d+o.i.floatValue(),im);
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
            if (o.type!=FIXEDINT) {
                return o.mul(new Quantity((long)val));
            } else return intBound((long)o.val*val);
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d*o.val);
            case DECIM:
                return new Quantity(d*o.d);
            case INTEG:
                return new Quantity(d*o.i.floatValue());
            case RATIO:
                return new Quantity(ratioToDecimal(o.i,o.de) * d);
            case COMPLEX:
                return o.mul(this);
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i.multiply(BigInteger.valueOf(o.val)));
            case DECIM:
                return new Quantity(i.floatValue()*o.d);
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
            float g=0, h=0;
            switch (o.type) {
            case FIXEDINT:
                g=(float)o.val;
                break;
            case COMPLEX:
                g=o.d;
                h=o.im;
                break;
            case DECIM:
                g=o.d;
                break;
            case INTEG:
                g=o.i.floatValue();
                break;
            case RATIO:
                g=ratioToDecimal(o.i, o.de);
                break;
            }
            float nd=(d*g)-(im*h);
            float nim=(d*h)+(im*g);
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
                return new Quantity(d-o.val);
            case DECIM:
                return new Quantity(d-o.d);
            case INTEG:
                return new Quantity(d-o.i.floatValue());
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
                return new Quantity(i.floatValue()-o.d);
            case INTEG:
                return new Quantity(i.subtract(o.i));
            case RATIO:
                BigInteger ores=i.multiply(o.de);
                BigInteger new_n=ores.subtract(o.i);
                return new Quantity(new_n, o.de);
            case COMPLEX:
                return new Quantity(i.floatValue()-o.d, -o.im);

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
                return new Quantity(d-o.i.floatValue(), im);
            case RATIO:
                return new Quantity(d-ratioToDecimal(o.i, o.de), im);
            case COMPLEX:
                return new Quantity(d-o.d, im-o.im);
            }

        }
        return null;
    }

    protected static float div(float d1, float d2) {
        return d1/d2;
    }

    public Quantity div(Quantity o) {
        switch (type) {
        case FIXEDINT:
            return new Quantity((long)val).div(o);
        case DECIM:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(d / o.val);
            case DECIM:
                return new Quantity(d/o.d);
            case INTEG:
                return new Quantity(d/o.i.floatValue());
            case RATIO:
                return mul(new Quantity(o.de, o.i));
            case COMPLEX:
                Quantity q=new Quantity();
                q.d=d;
                q.im=0.0f;
                q.type=COMPLEX;
                return q.div(o);
            }
        case INTEG:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i, BigInteger.valueOf(o.val));
            case DECIM:
                return new Quantity(i.floatValue()/o.d);
            case INTEG:
                return new Quantity(i, o.i);
            case RATIO:
                BigInteger ores=o.de.multiply(i);
                return new Quantity(ores, o.i);
            case COMPLEX:
                Quantity q=new Quantity();
                q.d=i.floatValue();
                q.im=0.0f;
                q.type=COMPLEX;
                return q.div(o);
            }
        case RATIO:
            switch (o.type) {
            case FIXEDINT:
                return new Quantity(i, de.multiply(BigInteger.valueOf(o.val)));
            case DECIM:
                float r=ratioToDecimal(i,de);
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
            float g=0.0f, h=0.0f;
            switch (o.type) {
            case FIXEDINT:
                float oval=(float)o.val;
                return new Quantity(div(d,oval), div(im,oval));
            case DECIM:
                return new Quantity(div(d,o.d), div(im,o.d));
            case INTEG:
                oval=o.i.floatValue();
                return new Quantity(div(d,oval), div(im,oval));
            case RATIO:
                oval=ratioToDecimal(o.i, o.de);
                return new Quantity(div(d,oval), div(im,oval));
            case COMPLEX:
                g=o.d;
                h=o.im;
            }

            // (a+ib)/(c+id)=(ac+bd+i(bc-ad))/(c^2+d^2)

            float c2=g*g;
            float d2=h*h;
            Quantity c2_p_d2 = new Quantity(c2+d2);
            float bd=im*h;
            float ac=d*g;
            float bc=im*g;
            float ad=d*h;

            Quantity rc1=new Quantity(ac+bd);
            Quantity rc2=new Quantity(bc-ad);
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
                return sign(d-o.val)==test;
            case DECIM:
                return sign(d-o.d)==test;
            case INTEG:
                return sign(d-o.i.floatValue())==test;
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
                return sign(i.floatValue()-o.d)==test;
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

    public float floatValue() {
        switch (type) {
        case FIXEDINT:
            return (float)val;
        case DECIM:
            return d;
        case INTEG:
            return (float)i.intValue();
        case RATIO:
            return ratioToDecimal(i,de);
        }
        return 0.0f;
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

    public BigInteger integer() {
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
            BigDecimal fpart=new BigDecimal(Float.toString((float)(d-ipart.floatValue())));
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
            return new Quantity((float)val);
        case INTEG:
            return new Quantity(i.floatValue());
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

    protected float ratioToDecimal(BigInteger numerator,
                                   BigInteger denominator) {
        return numerator.floatValue() / denominator.floatValue();
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
            String s=zeroTrim(Float.toString(d).toLowerCase());
            b.append(s);
            if (s.indexOf('.')==-1) b.append(".0");
        } else if (type==INTEG)
            b.append(i.toString(radix));
        else if (type==RATIO)
            b.append(i.toString(radix)).append('/').append(de.toString(radix));
        else if (type==COMPLEX) {
            b.append(zeroTrim(Float.toString(d).toLowerCase()));
            if (im>0) {
                b.append('+');
                if (im!=1.0f)
                    b.append(Float.toString(im).toLowerCase());
            } else {
                if (im==-1.0f)
                    b.append('-');
                else
                    b.append(zeroTrim(Float.toString(im).toLowerCase()));
            }
            b.append('i');
        }
        out_cache_radix=(byte)radix;
        return out_cache=b.toString();
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
                d=dis.readFloat();
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
                d=dis.readFloat();
                im=dis.readFloat();
                break;
            }
            simplify();
        }
    }

    protected BigInteger unscaledValue(BigDecimal d) {
        return d.setScale(0).toBigInteger();
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
                dos.writeFloat(d);
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
                dos.writeFloat(d);
                dos.writeFloat(im);
                break;
            }
        }
    }
}


