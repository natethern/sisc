package sisc.data;

public class SchemeBoolean extends Value {
    public static SchemeBoolean TRUE=new SchemeBoolean(true);
    public static SchemeBoolean FALSE=new SchemeBoolean(false);
    private boolean val;
    
    protected SchemeBoolean(boolean v) {
	val=v;
    }

    public String display() {
	return (val ? "#t" : "#f");
    }
}
