package sisc.modules;

interface Primitives {

    //next: 144
    int ACOS = 23,
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
        CALLEC = 126,
        CALLFC = 55,
        CALLWITHVALUES = 106,
        CAR = 15,
        CDR = 16,
        CEILING = 49,
        CHAR2INTEGER = 43,
        CHARACTERQ = 30,
        CHAREQUAL = 140,
        CIRCULARQ = 62,
        CLASSPATHEXTENSION = 142,
        CLASSPATHEXTENSIONAPPEND = 143,
        COMPACTSTRINGREP = 7,
        COMPLEXQ = 37,
        CONS = 85,
        CONSIMMUTABLE = 131,
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
        EXPTYPE = 129,
        FLOOR = 48,
        GCD = 92,
        GENSYM = 0,
        GENSYMP = 137,
        GETSIDECAR = 124,
        GETENV = 123,
        GETENVIRONMENT = 18,
        GETPROP = 109,
        GRT = 118,
        HASHCODE = 136,
        IMAGPART = 69,
        IMMUTABLEPAIRQ = 132,
        IMMUTABLEVECTORQ = 133,
        INEXACT2EXACT = 47,
        INEXACTQ = 39,
        INTEGER2CHAR = 52,
        INTEGERQ = 36,
        INTERACTIONENVIRONMENT = 1,
        INTERN = 138,
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
        MAKEIMMUTABLEVECTOR = 130,
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
        PORTQ = 141,
        PROCEDUREQ = 35,
        PUTPROP = 110,
        QUOTIENT = 90,
        REALPART = 68,
        REMAINDER = 89,
        REMPROP = 107,
        REPORTENVIRONMENT = 72,
        ROUND = 50,
        SEALIMMUTABLEPAIR = 134,
        SEALIMMUTABLEVECTOR = 135,
        SETBOX = 94,
        SETCAR = 87,
        SETCDR = 88,
        SETENVIRONMENT = 108,
        SIGHOOK = 127,
        SIGUNHOOK = 128,
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
        STRINGEQUAL = 139,
        STRINGREF = 95,
        STRINGSET = 111,
        SUB = 119,
        SYMBOL2STRING = 41,
        SYMBOLQ = 29,
        SYNTOKEN2STRING = 125,
        SYNTOKENQ = 6,
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
