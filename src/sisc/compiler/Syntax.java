package sisc.compiler;

import sisc.util.Util;
import sisc.data.*;
import sisc.ser.*;
import sisc.interpreter.ContinuationException;
import sisc.interpreter.Interpreter;
import sisc.io.*;
import java.io.IOException;

public class Syntax extends Value implements NamedValue, Singleton {
    int synid;
    
    public Syntax(int synid) {
        this.synid=synid;
    }
    
    public void eval(Interpreter r) throws ContinuationException {
        error(r, Util.liMessage(SISCB, "invalidsyncontext", getName().toString()));
    }
    
    public void display(ValueWriter w) throws IOException {
        w.append("#%").append(getName());
    }
    
    public Syntax() {}
    
    public void deserialize(Deserializer s) throws IOException {
        synid=s.readInt();
        setName(Symbol.get(s.readUTF()));
    }
    
    public void serialize(Serializer s) throws IOException {
        s.writeInt(synid);
        s.writeUTF(((Symbol)getName()).symval);
    }
    
    public Value singletonValue() {
        return (Value)CompilerConstants.SYNTACTIC_TOKENS.get(((Symbol)getName()).symval);
    }
}

