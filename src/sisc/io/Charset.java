/*
 * $Id$
 */
package sisc.io;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.io.Writer;

/**
 * Wrapper class which names a Character Set
 * 
 * @author scgmille
 *
 */
public class Charset {

    private String name;

    public static Charset forName(String name) throws UnsupportedEncodingException {
        InputStreamReader rd=new InputStreamReader(new ByteArrayInputStream(new byte[0]), name);
        Charset cs=new Charset();
        cs.name=name;
        return cs;
    }
    
    public String getName() {
        return name;
    }

    public String displayName() {
        return name;
    }

    public InputStreamReader newInputStreamReader(InputStream in) {
        try {
            return new InputStreamReader(in, getName());
        } catch (UnsupportedEncodingException use) {
            //Can't happen
            return null;
        }
    }

    public OutputStreamWriter newOutputStreamWriter(OutputStream out) {
        try {
            return new OutputStreamWriter(out, getName());
        } catch (UnsupportedEncodingException use) {
            //Can't happen
            return null;
        }
    }

}
