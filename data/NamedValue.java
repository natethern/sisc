package sisc.data;

public abstract class NamedValue extends Value {
    public Symbol name;

    public void setName(Symbol s) {
	name=s;
    }
}
