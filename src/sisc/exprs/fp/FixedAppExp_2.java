package sisc.exprs.fp;

import java.io.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.FixableProcedure;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;

public class FixedAppExp_2 extends FixedAppExp_1 {
    public Immediate op1;

    public FixedAppExp_2(FixableProcedure p, Immediate op0, Immediate op1) {
        super(p, op0);
        this.op1=op1;
    }

    public Value getValue(Interpreter r) throws ContinuationException {
        return proc.apply(op0.getValue(r), op1.getValue(r));
    }

    public Value express() {
        return new Pair(sym("FixedAppExp"), 
                        list(proc.express(), ((Expression)op0).express(),
                             ((Expression)op1).express()));            
    }

    public void serialize(Serializer s) throws IOException {
        super.serialize(s);
        s.writeExpression((Expression)op1);
    }

    public FixedAppExp_2() {}

    public void deserialize(Deserializer s) throws IOException {
        super.deserialize(s);
        op1=(Immediate)s.readExpression();
    }

    public boolean visit(ExpressionVisitor v) {
        return super.visit(v) && v.visit((Expression)op1);
    }
}
