package sisc.modules;

import java.io.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.*;

import sisc.io.ValueWriter;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;

public class STypes extends IndexedProcedure {

    protected static final Symbol TYPESDB =
        Symbol.intern("sisc.modules.Messages");

    protected static final int
        MAKETYPE = 0,
        TYPECOMP = 1,
        TYPEOF = 2,
        TYPEQ = 3;

    public static class Index extends IndexedLibraryAdapter {

        public Value construct(int id) {
            return new STypes(id);
        }

        public Index() {
            define("make-type", MAKETYPE);
            define("type<=", TYPECOMP);
            define("type-of", TYPEOF);
            define("type?", TYPEQ);
        }
    }
    
    public STypes(int id) {
        super(id);
    }

    public STypes() {}
    
    public static class SchemeType extends Value {

        private Class classObject;

        public SchemeType() {}

        public SchemeType(Class c) {
            classObject = c;
        }

        public Class getClassObject() { return classObject; }

        public void display(ValueWriter w) throws IOException {
            w.append("#<scheme ")
                .append(classObject.getName())
                .append('>');
        }

        public void serialize(Serializer s) throws IOException {
            s.writeUTF(classObject.getName());
        }

        public void deserialize(Deserializer s) throws IOException {
            try {
                Class.forName(s.readUTF(), true, currentClassLoader());
            } catch(ClassNotFoundException e) {
                throw new IOException(e.getMessage());
            }
        }

        public boolean visit(ExpressionVisitor v) {
            return super.visit(v);
        }


        public int hashCode() {
            return classObject.hashCode();
        }

        public boolean eqv(Object v) {
            return this == v ||
                (v != null
                 && classObject == ((SchemeType)v).getClassObject());
        }

    }

    public static final SchemeType stype(Value o) {
        try {
            return (SchemeType)o;
        } catch (ClassCastException e) { typeError(TYPESDB, 
                                                   "stype", o); }
        return null;
    }

    public Value doApply(Interpreter f) throws ContinuationException {
        switch(f.vlr.length) {
        case 0:
            throwArgSizeException();
        case 1:
            switch(id) {
            case TYPEQ:
                return truth(f.vlr[0] instanceof SchemeType);
            case MAKETYPE:
                try {
                    Class cl = Class.forName(symval(f.vlr[0]), true, f.dynenv.getClassLoader());
                    if (!Value.class.isAssignableFrom(cl))
                        throw new RuntimeException(liMessage(TYPESDB, "notaschemetype", symval(f.vlr[0])));
                    return new SchemeType(cl);
                } catch(ClassNotFoundException e) {
                    throw new RuntimeException(liMessage(TYPESDB, "classnotfound", symval(f.vlr[0])));
                }
            case TYPEOF:
                return new SchemeType(f.vlr[0].getClass());
            default:
                throwArgSizeException();
            }
        case 2:
            switch(id) {
            case TYPECOMP:
                return truth(stype(f.vlr[1]).getClassObject().isAssignableFrom(stype(f.vlr[0]).getClassObject()));
            default:
                throwArgSizeException();
            }
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
