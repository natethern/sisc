package sisc.data;

import sisc.*;
import java.io.*;

public abstract class Value extends Expression implements Immediate {

    public abstract String display();

    public String write() {
	return display();
    }

    public boolean equals(Object v) {
	return eq(v) || (v.getClass()==this.getClass() && 
			 valueEqual((Value)v));
    }

    public boolean eq(Object v) {
	return this==v;
    }

    public boolean valueEqual(Value v) {
	return eq(v);
    }

    public String toString() {
	return display();
    }

    public void eval(Interpreter r) throws ContinuationException {
	r.acc=this;
	r.nxp=null;
    }

    public Value getValue(Interpreter r) throws ContinuationException {
	return this;
    }

    public Value express() {
	return this;
    }
}





