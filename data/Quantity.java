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

    /*
    public final static BigDecimal 
	_BD_NEGONE = BigDecimal.valueOf(-1),
	_BD_ZERO   = BigDecimal.valueOf(0),
	_BD_ONE    = BigDecimal.valueOf(1),
	_BD_TWO    = BigDecimal.valueOf(2),
	_BD_TEN    = BigDecimal.valueOf(10),
	_BD_HUNDRED= BigDecimal.valueOf(100);
    */

    public final static Quantity 
	ZERO = new Quantity(0),
	ONE  = new Quantity(1),
	TWO  = new Quantity(2),
	I    = new Quantity(0.0, 1.0),
	TWO_I= new Quantity(0.0, 2.0),
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

    public int type;
    public int val;
    public double d, im;
    public BigInteger i, de;
    public String out_cache;
    public byte out_cache_radix;

    public Quantity() {} 

    public Quantity (int l) {
	val=l;
	type=FIXEDINT;
    }

    public Quantity (double l) {
	d=l;
	type=DECIM;
    }

    public Quantity(long v) {
	i=BigInteger.valueOf(v);
	type=INTEG;
    }

    public Quantity(String v) throws NumberFormatException {
	this(v, 10);
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

     


    public Quantity (double real, double imag) {
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
	    }
	    else break;
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
		StringBuffer b=new StringBuffer();
		char[] c=dv.substring(0,x).toCharArray();
		parsePounds(c);
		b.append(c);
		b.append(dv.substring(x));
		dv=b.toString();
		return Double.parseDouble(dv);
	    } else if ((x=dv.indexOf('s'))!=-1 ||
		       (x=dv.indexOf('f'))!=-1 ||
		       (x=dv.indexOf('d'))!=-1 ||
		       (x=dv.indexOf('l'))!=-1) {
		StringBuffer b=new StringBuffer(dv.substring(0,x));
		b.append('e').append(dv.substring(x+1));
		dv=b.toString();
		return Double.parseDouble(dv);
	    } else if (dv.indexOf('.')!=-1) 
		return Double.parseDouble(dv);
	    else if (dv.indexOf('#')!=-1) {
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

    public Quantity(String v, int radix) throws NumberFormatException {
	int x,y;
	if ((x=v.indexOf('/'))!=-1) { 
	    i=new BigInteger(v.substring(0, x), radix);
	    de=new BigInteger(v.substring(x+1), radix);
	    type=RATIO;
	} else if ((x=v.indexOf('@'))!=-1) {
	    double xd=parseDecimal(v.substring(0,x), radix, true);
	    double yd=parseDecimal(v.substring(x+1), radix, true);
	    d=xd * Math.cos(yd);
	    im=xd * Math.sin(yd);
	    type=COMPLEX;
	} else if ((x=v.indexOf('i'))!=-1) {
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
		im = ( (x+2)==v.length() ?
		       1.0 :
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
		} catch (Exception e) {
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
		    return new Quantity(i.gcd(d2i(d))).decimalVal();
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
		return new Quantity(d2i(d)).lcm(o).decimalVal();
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
	    return (inexact? new Quantity(L).decimalVal():
		    new Quantity(L));
	}
	throw new ArithmeticException(this+" is not an integer.");
    }
	
    public Quantity round(int rtype) {
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
	    return decimalVal().round(rtype).exactVal();
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
		    return new Quantity(i.mod(d2i(d))).decimalVal();
	    }
	case DECIM:
	    if (Math.floor(d)==d) 
		return new Quantity(d2i(d)).modulo(o).decimalVal();
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
		    return new Quantity(i.divide(d2i(o.d))).decimalVal();
	    }
	case DECIM:
	    if (Math.floor(d)==d) 
		return new Quantity(d2i(d)).quotient(o).decimalVal();
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
		    return new Quantity(i.remainder(d2i(o.d))).decimalVal();
	    }
	case DECIM:
	    if (Math.floor(d)==d)
		return new Quantity(d2i(d)).remainder(o).decimalVal();
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
	    
    public Quantity sqrt() {
	switch (type) {
	case FIXEDINT:
	    if (val<0) 
		return new Quantity(0.0, Math.sqrt(-val));
	    break;
	case INTEGER:
	    if (i.compareTo(_BI_ZERO)==-1) 
		return new Quantity(0.0, Math.sqrt(-1*doubleValue()));
	    break;
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
		return new Quantity(d*o.i.doubleValue());
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

    protected static double div(double d1, double d2) {
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

    public Quantity exactVal() {
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


    public Quantity decimalVal() {
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
	    throw new NumberFormatException(toString()+" is not a rational number");
	case DECIM:
	    return exactVal().numerator();
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
	    return exactVal().denominator();
	case RATIO:
	    return new Quantity(de);
	default:
	    return ONE;
	}
    }

    protected double ratioToDecimal(BigInteger numerator,
					BigInteger denominator) {
	return numerator.doubleValue() / denominator.doubleValue();
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
		d=dis.readDouble();
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
		d=dis.readDouble();
		im=dis.readDouble();
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
		dos.writeDouble(d);
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
		dos.writeDouble(d);
		dos.writeDouble(im);
		break;
	    }
	}
    }
}


