package sisc.data;

import java.io.IOException;
import java.io.OutputStream;

import sisc.io.OutputPort;
import sisc.io.ValueWriter;

public class SchemeBinaryOutputPort extends Value 
    implements OutputPort, NamedValue {

    protected OutputStream out;
    
    public SchemeBinaryOutputPort(OutputStream out) {
        this.out=out;
    }

    public OutputStream getOutputStream() {
        return out;
    }
    
    public void display(ValueWriter w) throws IOException {
        displayNamedOpaque(w, "binary-output-port");
    }

    public void close() throws IOException {
        out.close();
    }

    public void flush() throws IOException {
        out.flush();
    }
}
