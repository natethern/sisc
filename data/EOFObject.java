package sisc.data;

public class EOFObject extends Value {
    public static EOFObject EOF=new EOFObject();

    protected EOFObject() {}

    public String display() {
	return "#!eof";
    }
}
