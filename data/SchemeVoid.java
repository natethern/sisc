package sisc.data;

public class SchemeVoid extends Value {
    public static SchemeVoid VOID=new SchemeVoid();

    protected SchemeVoid() {}

    public String display() {
	return "#<void>";
    }
}
