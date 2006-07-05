package sisc.io.custom;

import java.io.InputStream;

import sisc.data.SchemeBinaryInputPort;
import sisc.data.Value;

public class CustomBinaryInputPort extends SchemeBinaryInputPort implements CustomPort { 

    protected SchemeInputStream schemeIn;
    
    public CustomBinaryInputPort(InputStream in, SchemeInputStream schemeIn) {
    	super(in);
        this.in=in;
        this.schemeIn=schemeIn;
    }

    protected Value portLocal=VOID;
    
    public void setPortLocal(Value local) {    	
    	portLocal=local;    	
    }
    
    public Value getPortLocal() {
    	return portLocal;
    }    
    
    public CustomPortProxy getProxy() {
    	return schemeIn;
    }
}
