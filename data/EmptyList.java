package sisc.data;

public class EmptyList extends Pair {
    public static EmptyList EMPTYLIST=new EmptyList();

    static {
	EMPTYLIST.car=EMPTYLIST.cdr=EMPTYLIST;
    }

    protected EmptyList() {}

    public String display() {
	return "()";
    }

    public String write() {
	return display();
    }
}

