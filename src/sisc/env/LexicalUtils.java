/*
 * Created on Nov 3, 2003
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package sisc.env;

import java.io.IOException;

import sisc.util.Util;
import sisc.data.Pair;
import sisc.data.Quantity;
import sisc.data.Value;
import sisc.interpreter.Interpreter;
import sisc.ser.Deserializer;
import sisc.ser.Serializer;

/**
 * @author scgmille
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public abstract class LexicalUtils {

    public static Value[] fixLexicals(Interpreter r, 
                                      int lcount, int[] locs, int[] lexs) {
        Value[] lexicals=r.createValues(lcount);
        int x=0;
        if (locs!=null)
            for (int i=locs.length-1; i>=0; i--) {
                int idx=locs[i];
                Value v=r.lcl[idx];
                lexicals[x++]=v;
            }
        if (lexs != null)
            for (int i=lexs.length-1; i>=0; i--) {
                int idx=lexs[i];
                Value v=r.env[idx];
                lexicals[x++]=v;
            }
        return lexicals;
    }

    public static Pair intArrayToList(int[] v) {
        if (v==null) return Util.EMPTYLIST;
        Pair rv=Util.EMPTYLIST;
        for (int i=0; i<v.length; i++) 
            rv=new Pair(Quantity.valueOf(v[i]), rv);
        return rv;
    }

    public static void writeIntArray(Serializer s, int[] v) throws IOException {
        if (v==null) s.writeInt(0);
        else {
            s.writeInt(v.length);
            for (int i=0; i<v.length; i++) {
                s.writeInt(v[i]);
            }
        }
    }

    public static int[] readIntArray(Deserializer s) throws IOException {
        int sz=s.readInt();
        if (sz>0) {
            int[] rv=new int[sz];
            for (int i=0; i<rv.length; i++) {
                rv[i]=s.readInt();
            }
            return rv;
        } else return null;
    }
}
