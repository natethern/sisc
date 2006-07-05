package sisc.data;

import java.io.IOException;
import java.io.InputStream;

import sisc.io.InputPort;
import sisc.io.ValueWriter;

public class SchemeBinaryInputPort extends Value 
    implements InputPort, NamedValue {

    protected InputStream in;
    
    public SchemeBinaryInputPort(InputStream out) {
        this.in=out;
    }
    
    public InputStream getInputStream() {
        return in;
    }
    
    public void display(ValueWriter w) throws IOException {
        displayNamedOpaque(w, "binary-input-port");
    }

    public void close() throws IOException {
        in.close();
    }
    
    public boolean ready() throws IOException {
        return in.available()>0;
    }
}
