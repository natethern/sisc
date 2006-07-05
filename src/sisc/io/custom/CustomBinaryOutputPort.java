package sisc.io.custom;

import java.io.OutputStream;

import sisc.data.SchemeBinaryOutputPort;
import sisc.data.Value;

public class CustomBinaryOutputPort extends SchemeBinaryOutputPort implements CustomPort {

    protected SchemeOutputStream schemeOut;
    
    public CustomBinaryOutputPort(OutputStream out, SchemeOutputStream schemeOut) {
    	super(out);
        this.schemeOut=schemeOut;
        schemeOut.setHost(this);
    }

    protected Value portLocal=VOID;
    
    public void setPortLocal(Value local) {    	
    	portLocal=local;    	
    }
    
    public Value getPortLocal() {
    	return portLocal;
    }    
    
    public CustomPortProxy getProxy() {
    	return schemeOut;
    }
}
