
package sisc.ser;

import sisc.data.*;
import sisc.SymbolicEnvironment;

public class DelegatingSymEnv extends NamedValue implements SymbolicEnvironment {
    private SymbolicEnvironment delegee;

    protected SymbolicEnvironment getEnv() {
        if (delegee == null) {
            try {
                delegee = (SymbolicEnvironment)LibraryManager.getInstance().getExpression(name);
            } catch(java.io.IOException e) {}
        }
        return delegee;
    }

    public DelegatingSymEnv() {}

    public DelegatingSymEnv(Symbol name) {
        this.name = name;
    }

    public String display() {
        return displayNamedOpaque("environment");
    }

    public void setParent(SymbolicEnvironment e) {
        getEnv().setParent(e);
    }

    public sisc.data.Value asValue() {
        return getEnv().asValue();
    }

    public java.util.Iterator keys() {
        return getEnv().keys();
    }

    public java.util.Set bindingKeys() {
        return getEnv().bindingKeys();
    }

    public java.util.Map getSymbolMap() {
        return getEnv().getSymbolMap();
    }

    public void set(int envLoc, Value v) {
        getEnv().set(envLoc, v);
    }

    public int define(Symbol s, Value v) {
        return getEnv().define(s, v);
    }

    public int getLoc(Symbol s) {
        return getEnv().getLoc(s);
    }

    public Value lookup(Symbol s) {
        return getEnv().lookup(s);
    }

    public Value lookup(int pi) {
        return getEnv().lookup(pi);
    }

    public void undefine(Symbol s) {
        getEnv().undefine(s);
    }

    public void serialize(sisc.ser.Serializer s)
        throws java.io.IOException {
 
       s.writeExpression(name);
    }

    public void deserialize(sisc.ser.Deserializer s)
        throws java.io.IOException {

        name = (Symbol)s.readExpression();
    }
}
